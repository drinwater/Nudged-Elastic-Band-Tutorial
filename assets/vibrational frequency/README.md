# Vibrational frequency calculations

We need to confirm that our TS is indeed a TS. For this, we make use of its unique property - it has exactly 1 imaginary frequency.

We run a standard vibrational frequency calculation in VASP for the TS image. We set ```ISIF=2``` to lock the change in cell geometry. We set ```IBRION=5``` for vibrational frequency calculations and ```POTIM = 0.002```.

After a regular VASP run,

```$ mpirun vasp_std```

the OUTCAR file contains the vibrational frequencies. Extract them using the command:

```$ grep 'THz' OUTCAR```

The output should look like this for image 2 for our example:

>1 f  =   53.991689 THz   339.239786 2PiTHz 1800.968828 cm-1   223.291757 meV  
2 f  =   16.683347 THz   104.824561 2PiTHz  556.496538 cm-1    68.996802 meV  
3 f  =   10.237329 THz    64.323033 2PiTHz  341.480515 cm-1    42.338203 meV  
4 f  =    9.620520 THz    60.447509 2PiTHz  320.905990 cm-1    39.787286 meV  
5 f  =    8.223321 THz    51.668651 2PiTHz  274.300462 cm-1    34.008935 meV  
6 f  =    3.840300 THz    24.129314 2PiTHz  128.098601 cm-1    15.882208 meV  
7 f  =    3.266313 THz    20.522848 2PiTHz  108.952461 cm-1    13.508388 meV  
8 f/i=    0.357185 THz     2.244261 2PiTHz   11.914417 cm-1     1.477200 meV  
9 f/i=   16.513405 THz   103.756781 2PiTHz  550.827867 cm-1    68.293976 meV

and for image 4:

>1 f  =   68.720092 THz   431.781073 2PiTHz 2292.255466 cm-1   284.203559 meV  
2 f  =   13.824517 THz    86.862000 2PiTHz  461.136224 cm-1    57.173626 meV  
3 f  =    9.675893 THz    60.795426 2PiTHz  322.753023 cm-1    40.016289 meV  
4 f  =    7.028329 THz    44.160296 2PiTHz  234.439825 cm-1    29.066844 meV  
5 f  =    6.511766 THz    40.914632 2PiTHz  217.209124 cm-1    26.930509 meV  
6 f  =    6.368093 THz    40.011907 2PiTHz  212.416706 cm-1    26.336324 meV  
7 f  =    6.118939 THz    38.446427 2PiTHz  204.105828 cm-1    25.305907 meV  
8 f  =    1.760213 THz    11.059746 2PiTHz   58.714395 cm-1     7.279660 meV  
9 f  =    1.470038 THz     9.236524 2PiTHz   49.035201 cm-1     6.079592 meV

In image 2, there appear to be 2 imaginary frequencies. However since frequency 8 is significantly smaller in magnitude than the others, it can be omitted. Hence image 2 has exactly one imaginary frequency and is the TS.
