Note: 
There were some typos in the code for the uvm_utilities in the BOOK print COPY.
These were actually  fixed in the code. The wrong files got picked up.


------------------------------------

The examples for Part 1 of the book are in the subdirectories below this directory.
There are 3 makefiles in the run directory. One for each simulator. 

Please note that I have not provided log files for the other two simulators in the run directory for a number of reasons. 
The makefiles for the Questa and IUS simulators were provided by Srinivasan Venkataraman of CVC Bangalore.  srini@cvcblr.com
I am grateful to him for making the contribution. 

The make files for  the VCS simulator have been validated and provided in the run directory along with log files. 

I appeal to the community at large to run these examples, make any necessary tweaks for the other simulators and share thier log files.
The contribution of the log files will be gratefully appreciated.



Please note: 
For IUS and Questa:
You may need to set the environment variable UVM_HOME to an area where you have the UVM tarball downloaded.  That is NOT in the makefile
The simulator may provide a setting and I invite you to check on that in the documentation. 
If you are not sure, you can download the tarball from: http://www.accellera.org/images/downloads/standards/uvm/uvm-1.2.tar.gz
explode it and set UVM_HOME to the location of the src/ subdirectory.

For the VCS simulator, it is set to the inbuilt copy of UVM bundled with VCS. 

Please let me know of any problems with these files so that I can correct them.
if anything is wrong with these instructions for Questa and IUS, and you figure it out, please let me know what the changes are and I will incorporate them
into the main repository.

Thanks!
Srivatsa 
July 2018




