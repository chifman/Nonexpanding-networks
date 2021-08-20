#This code uses each local activation function to check if |f_v(x)-f_v(y)|<=1.
#Loop creates a table of all possible ordered pairs over {0,1,2} for the number of inputs.
#For Example, if a local activation function has 3 inputs then a table of the form below will be created using expand.grid() function:
#Var1 Var2 Var3
# 1     0    0    0
# 2     1    0    0
# 3     2    0    0
# 4     0    1    0
# 5     1    1    0
# 6     2    1    0
# 7     0    2    0
# 8     1    2    0
# 9     2    2    0
# 10    0    0    1
# 11    1    0    1
# 12    2    0    1
# 13    0    1    1
# 14    1    1    1
# 15    2    1    1
# 16    0    2    1
# 17    1    2    1
# 18    2    2    1
# 19    0    0    2
# 20    1    0    2
# 21    2    0    2
# 22    0    1    2
# 23    1    1    2
# 24    2    1    2
# 25    0    2    2
# 26    1    2    2
# 27    2    2    2

#Then a list of all ordered pairs of rows is written ignoring rows that are equal, since
#f_v(x)-f_v(x)=0
#All rows (vectors) in the ordered list that are close are then used to compute abs(f(x)-f(y)). 
#Results are stored in the vector distance().
#For loop goes through all local functions contained in the file local_activation_functions.R. 
#To check if any of them returned a value of 2 one can use table(distance)


#Load fucntion produced by R script script_to_write_r_functions_for_the_model.R
source("./Rscript/local_activation_functions.R")

#Get the number of functions in the file
number_of_functions<-length(readLines("./Rscript/local_activation_functions.R"))

#Define one additional fucntion for the NOT operator. Operators MAX and MIN are part of R. 
#Replace 2 with appropriate state, e.g. if model is 5-ary then use {4-x}.

not<-function(x){2-x}

#Define an empty vector to hold results

distance<-c()

#In the for loop replace list(0:2) with appropriate state, e.g. if model is 5-ary then use list(0:4)

for(j in 1:number_of_functions)
{
list<-rep(list(0:2),length(formals(noquote(paste("local_activation_function_",j,sep="")))))
all_v<-expand.grid(list)
all_c<-combn(nrow(all_v),2)
colnames(all_v)<-c()
	for(i in 1:ncol(all_c))
	{
	if(max(abs(as.numeric(all_v[all_c[,i][[1]],])-as.numeric(all_v[all_c[,i][[2]],])))<2)
		{
		
				distance[i]<-abs(
				do.call(noquote(paste("local_activation_function_",j,sep="")),all_v[all_c[,i][[1]],])
				-do.call(noquote(paste("local_activation_function_",j,sep="")),all_v[all_c[,i][[2]],]))

		}
	}
}

print(table(distance))
