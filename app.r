my.name = readline(prompt="Enter name: ")
my.tableName = readline(prompt="Enter table name: ")
print(paste("Hi,", my.name, "you chose to import", my.tableName))

#create data frame with the given data
df = read.table(my.tableName, sep = ";",header = TRUE)
#ignore dots and replace commas with dots. treat this as numeric
df$Ποσό <- as.numeric(gsub(",", ".", gsub("\\.", "", df$Ποσό)))
#get subset of Amount where prefix is X and replace with the negative value
df$Ποσό[df$Πρόσημο.ποσού == "Χ"] <- -df$Ποσό[df$Πρόσημο.ποσού == "Χ"]
reorder(df$Ημ.νία, df$Ποσό)
df<-df[order(as.Date(df$Ημ.νία,format = "%d/%m/%Y")),,drop=FALSE]
View(df)
attach(df)
plot(df$Ημ.νία,cumsum(df$Ποσό),type = "o", col="blue")
plot(reorder(df$Ημ.νία, df$Ποσό),cumsum(df$Ποσό),type = "o", col="blue")
sapply(df,mode)