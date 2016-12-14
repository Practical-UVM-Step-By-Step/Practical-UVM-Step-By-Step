#!/usr/bin/python
import sys
import os
from time import sleep
from subprocess import *

# -o file.txt : output information to a file rather than stderr
# -d          : debug mode


out = sys.stderr
DEBUG = False

child_args = []
i = 1
while i < len(sys.argv):
    if sys.argv[i] == '-o':
        i += 1
        out = open(sys.argv[i], 'w')
    elif sys.argv[i] == '-d':
        DEBUG = True
    else:
        child_args.append(sys.argv[i])
    i += 1

# child_command should be a single argument as if to "/bin/sh -c 'child_command'"
# when shell=True is enabled
child_command = ' '.join(child_args)

def log(msg):
    if DEBUG:
        print >>sys.stderr, "memusg: {}".format(msg)

def get_vsize(sid):
    vsize = 0
    # Example: /bin/ps -o vsize= --sid 23928
    proc = Popen(['ps', '-o', 'vsize=', '--sid', str(sid)], stdout=PIPE, stderr=None, shell=False)
    (stdout, _stderr) = proc.communicate()
    # Iterate over each process within the process tree of our process session
    # (this ensures that we include processes launched by a child bash script, etc.)
    for line in stdout.split():
        vsize += int(line.strip())
    return vsize

# Create a new process session for this process so that we can
# easily calculate the memory usage of the whole process tree using ps
#
# Since we need a new session using os.setsid(), we must first fork()
pid = os.getpid()
sid = os.getsid(pid)
pgid = os.getpgid(pid)
log("Pre-fork: PID is {} ; PGID is {} ; SID is {}".format(pid, pgid, sid))

fork_pid = os.fork()
if fork_pid == 0:
    # We *are* the new fork (not the original process)
    pid = os.getpid()
    sid = os.getsid(pid)
    pgid = os.getpgid(pid)
    log("Post-fork: PID is {} ; PGID is {} ; SID is {}".format(pid, pgid, sid))

    log("Trying to init our own session".format(pid, pgid))
    os.setsid()
    sid = os.getsid(pid)
    pgid = os.getpgid(pid)
    log("Post-session init: PID is {} ; PGID is {} ; SID is {}".format(pid, pgid, sid))
        
    log("Starting child: {}".format(child_command))
    # "None" means "inherit from parent"
    proc = Popen(child_command, stdin=None, stdout=None, stderr=None, env=None, shell=True)

    vmpeak = -1
    while proc.returncode == None:
        vmpeak = max(get_vsize(sid), vmpeak)
        log("Waiting for child to exit. vmpeak={}".format(vmpeak))
        proc.poll()
        sleep(0.1) # Time in seconds (float)
    
    out.write("memusg: vmpeak: {} kb\n".format(vmpeak))

    status = proc.returncode
    log("Child process returned {}".format(status))
    sys.exit(status)

else:
    # This is the branch of fork that continues the original process
    (_fork_pid, full_status) = os.waitpid(fork_pid, 0)
    status = full_status >> 8
    log("Fork returned {}".format(status))
    out.close()
    sys.exit(status)

