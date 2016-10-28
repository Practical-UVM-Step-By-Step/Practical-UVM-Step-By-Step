
**** IMPORTANT  - PLEASE READ **********************

PLEASE FORK this repository rather than downloading a zip. I just want to be able to notify
if anybody makes  any updates or finds issues that are fixed. 

All of the examples are Tested on UVM-1.2 and VCS 2016.06-SP1. 
I have provided a in each RUN Directory to show example is running properly.

compilation log: vcs.log
run log : simv.log

Since the UVM 1.2 is latest version, the examples are shown to be UVM-1.2 compliant.
I have used the +UVM_NO_DEPRECATED define during compile. 

Some examples therefore may NOT Compile on uvm-1.1d. If you want such a variant, let me know, and I will do my best to address it.

If any thing is NOT clear, or missing details, please file a bug/let me know and I will do my best to fix it.

****
# Book_Examples
These are the examples for the book Practical UVM Step By Step written by Srivatsa Vasudevan


Each of these examples are designed to be SELF Contained. 
They contain code that is REPEATED from the other examples. 

There are typically only 1-2 files in each example that are different
from the other examples. 

DO NOT GO AND PORE THROUGH EACH FILE. YOU would be wasting your time that way. 
Just look at the section below in each README to look at specific files

*********FILES CHANGED IN THIS EXAMPLE *****


<list of files changed WRT the Part 2 example> 



*************   


The rest of the files are there so that you can just copy the directory over 
and just compile without doing too much work.


All the directories  for the most part are organized using the approach below in all the examples for the testbenches.


env  --> This contains all the environment container files. Any Register Abstraction RALF files are here.
hdl  --> Usually contains the top level testbench
include --> List of include files
README --> This file
run --> All runtime files are kept here. The Makefile is here.
src --> Sources  for the example. If it is a wishbone, there may be files in a common directory one level up depending on the example.
tests --> All UVM tests are stored here


