#This code uses each local activation function to check of |f_v(x)-f_v(y)|<=1. It does not use vectors x and y when x=y. 
#Loop creates a table of all possible ordered pairs ove {0,1,2} for the number of inputs. For Example, if 
#local activation function has 3 inputs then a table of the form below will be created using expand.grid() function:
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

#Then a list of all ordered pairs of rows is written ignoring rows that are equal. 
#All rows (vectors) in the ordered list that are close are then used to compute abs(f(x)-f(y)). 
#Results are stored in the vector distance().
#For loop goes through all 24 local fucntions. To check if any of them returned a value of 2 one can use table(distance)

local_activation_function_1<-function(x2, x8, x3, x4, x23){min(max(x2,x8),min(min(NOT(x3),NOT(x4)),NOT(x23)))}
local_activation_function_2<-function(x5, x6, x19){max(max((x5^2)%%3,x6),x19)}
local_activation_function_3<-function(x5, x6, x7){min(min((2+2*x5^2)%%3,NOT(x6)),NOT(x7))}
local_activation_function_4<-function(x5,x6){min((2+2*x5^2)%%3,NOT(x6))}
local_activation_function_5<-function(x1){NOT(x1)}
local_activation_function_6<-function(x1,x19){max(NOT(x1),x19)}
local_activation_function_7<-function(x15){x15}
local_activation_function_8<-function(x10,x13){max(x10,x13)}
local_activation_function_9<-function(x10,x22){min(NOT(x10),x22)}
local_activation_function_10<-function(x8,x9){min(NOT(x8),x9)}
local_activation_function_11<-function(x1, x16, x21, x12){min(max(max(x1,x16),x21),NOT(x12))}
local_activation_function_12<-function(x13){x13}
local_activation_function_13<-function(x14, x16, x18){max(NOT(x14),max(x16,x18))}
local_activation_function_14<-function(x11,x13){min(NOT(x11),(1+x13+2*x13^2)%%3)}
local_activation_function_15<-function(x8,x11){max(NOT(x8),x11)}
local_activation_function_16<-function(x15, x17, x20){min(max(x15,x17),NOT(x20))}
local_activation_function_17<-function(x18,x21){max(NOT(x18),x21)}
local_activation_function_18<-function(x16){x16}
local_activation_function_19<-function(x18){x18}
local_activation_function_20<-function(x21){x21}
local_activation_function_21<-function(x11){x11}
local_activation_function_22<-function(x23, x10, x24){min(x23,min(NOT(x10),NOT(x24)))}
local_activation_function_23<-function(x22){NOT(x22)}
local_activation_function_24<-function(x22){x22}

NOT<-function(x){2-x}

distance<-c()

for(j in 1:24)
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

table(distance)
