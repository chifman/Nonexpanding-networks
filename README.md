# Nonexpanding-networks

Simple R script to check if an n-ary discrete dynamical system is nonexpanding. The code checks each local activation function on its input nodes (see details and terminology in the manuscript *will insert here link to arXiv*. )

As of right now the code runs exhaustively.  If the function is defined on three inputs and the model is ternary, then 27 possible states will be generated starting with 000, 001, 002, to, 222. After that all possible pairs of states are created (ignoring pairs such as (000, 000), (111,111), (021, 021) etc., and the distance is computed for pairs that are close (see manuscript for definitions). If each activation function has less than 15 inputs, the code will run in reasonable time. 

Our example contains 24 local activation function over three states {0,1,2} and with 5 inputs as a maximum for one of the functions. The code runs under 30sec. 


