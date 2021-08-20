# Nonexpanding-networks

Simple R script to check if an n-ary discrete dynamical system is nonexpanding. 

The code checks each local activation function on its input nodes. For details, definitions and terminology see *will insert link to preprint on arXiv here*.

Current scripts are specific to ternary models but can be adjusted for any number of states (scripts indicate where the adjustments must be made).

As of right now the code runs exhaustively. If the function is defined on three inputs and the model is ternary, then 27 possible states will be generated: 000, 001, 002, to 222. After that all possible pairs of states are created (ignoring pairs such as (000, 000), (111,111), (021, 021) etc.), and the distance is computed for pairs that are close (see manuscript for definitions). 

Our example contains 24 local activation function over three states {0,1,2} and with 5 inputs as a maximum for one of the functions. The code runs under 7 sec. The model was published in [PLOS Computational Biology](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1005352). If each activation function has less than 15 inputs in ternary case, the code will run in reasonable time.  We did not investigate at this stage running times for larger state models. Scripts provided right now are still exploratory. 

## Model input
The model is written in plain text. Each line corresponds to one local activation function. For example, our model has 24 variables, thus line one contains equation for the local activation function f<sub>x1</sub> for the variable x1, line two the function f<sub>x2</sub>  for the variable x2, etc. If functions contain operators *max* and *min* then one can just type them as 
```max()``` and ```min()``` as they are part or R. If one also has an operator *not* the script *nonexpanding_check.R* will take care of that. To enter equations or parts that must be computed *modulo n* the following syntax can be used: ```<your equation>%%n```, where *n* can be any integer. 

## Running R scripts
There are two scripts. 

**script_to_write_r_functions_for_the_model.R** requires package *stringr*. It reads in the model (from Models folder) and generates an R script containing functions to be used by the second script.

**nonexpanding_check.R** checks if the model is nonexpanding. It prints out a simple table counting the number the distance was 0, 1 or 2 (for ternary case).  If output only produces the number of times distance was 0 or 1, then model is nonexpanding. 

### Simple way to run scripts

In R console first run

```r
source("./Rscript/script_to_write_r_functions_for_the_model.R")
```

followed by

```r
source("./Rscript/nonexpanding_check.R")
```




