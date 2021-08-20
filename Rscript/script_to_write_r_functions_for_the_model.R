# Read dynamical system (in this case iron model) with 24 lines. 
# Each line corresponds to a local activation function
model<-readLines("./Models/iron_24_node.txt")

# create an empty vector that will be used to write an R function to be used later for distance computations.
model_out<-c()

# loop over all lines and write separate functions

for(i in 1:length(model))
{
	if(length(stringr::str_extract_all(string = model[i], pattern = "x[0-9]+")[[1]]%>%unique())>2)
	{
		model_out[i]<-paste("local_activation_function_",i,"<-function(",
		 knitr::combine_words(stringr::str_extract_all(string = model[i], pattern = "x[0-9]+")[[1]]%>%unique(),and=""),
		  "){",model[i],"}", sep="")
	}
	else
	{
		model_out[i]<-paste("local_activation_function_",i,"<-function(",
		 knitr::combine_words(stringr::str_extract_all(string = model[i], pattern = "x[0-9]+")[[1]]%>%unique(),and=","),
		  "){",model[i],"}", sep="")
	}
}

# save to table R functions
write.table(model_out, file="local_activation_functions.txt", quote=FALSE, row.names=FALSE, col.names=FALSE)
