# DDCO-Lab-Project
A combinational circuit to count the number of 1's in a 16 bit binary number.

# Abstract
* The logic circuit adds the bits of the 16 bit binary number and the sum returned is the total number of 1’s in the circuit (as 0’s do not contribute to the sum, so adding the 1s will give you it's count).

* The 16 bit number is divided into 5 groups of 3 bits each, 4 of which are added using Full Adders. The output of the Full adders are added using 2 2 bit adders and its sum is computed using a single 3 bit adder circuit. The output of the 3 bit adder is added with the 5th Full Adder output using a 4 bit adder. Finally the 16th bit that was ignored till now is added with the output of the previous 4 bit adder using yet another 4 bit adder to produce a 4 bit output which is the count of the number of 1's in the 16 binary number, represented in binary. The circuit takes the form of a cascaded adder circuit as shown in the logic diagram as shown below.

* A typical sequential circuit consisting of shift registers and Full Adders will take 16 clock cycles to compute the output whereas this combinational circuit will take about 2 clock cycles and uses much lesser Adders to compute the output, thus making it a much more efficient option to compute the count.


# Logic Diagram
![picture alt](https://github.com/Ojjie/DDCO-Lab-Project/blob/master/block_diagram.png)


# Modules used
* add2 - Comprises of 1 Half Adder and 1 Full Adder circuit.
* add3 - Comprises of 1 Half Adder and 2 Full Adder circuits.
* add4 - Comprises of 1 Half Adder and 3 Full Adder circuits.
* unit - Comprises of 2 2bit adders, 1 3 bit adder and 2 4 bit adder circuits to calculate the sum.


# Output Waveform
![picture alt](https://github.com/Ojjie/DDCO-Lab-Project/blob/master/output.png)


# Instructions to run the files -
* You need to have Icarus Verilog and GTKWave installed in order to run these files.
* Run the following commands in your terminal -
```
> iverilog -o combinational lib.v combinational.v tb_comb.v
> vvp combinational
> gtkwave tb_comb.vcd

```
