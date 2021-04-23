Grace Tian and Will Long

This is a custom processor for implementing a SHA256 hashing assembly program.

To compile locally, Icarus Verilog must be installed.
Use the following command in terminal to compile: iverilog -o proc -c FileList.txt -s Wrapper_tb -P Wrapper_tb.FILE=\"hash_helloworld\"
Use the following command to run the program: vvp proc

To run custom programs with different inputs, the ECE350 Assembler (https://www.ece350.com/) can assemble assembly code into a .mem (memory) file. The ISA configuration for this SHA256 processor must be uploaded as well. This file is sha256ISA.xml and is located in the main directory.

The waveform of the output is in Test Files/Output Files/hash_helloworld.vcd. GTKWave must be installed to view the waveform.
