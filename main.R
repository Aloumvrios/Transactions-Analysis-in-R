my.name = readline(prompt="Enter name: ")
my.tableName = readline(prompt="Enter table name: ")
print(paste("Hi,", my.name, "you chose to import", my.tableName))

#create data frame with the given data
df = read.table(my.tableName, sep = ";",header = TRUE)
#ignore dots and replace commas with dots. treat this as numeric
df$���� <- as.numeric(gsub(",", ".", gsub("\\.", "", df$����)))
#get subset of Amount where prefix is X and replace with the negative value
df$����[df$�������.����� == "�"] <- -df$����[df$�������.����� == "�"]
df[order(as.Date(df$��.���,format = "%d/%m/%y")),]
View(df)
attach(df)
plot(df$��.���,cumsum(df$����),type = "o", col="blue")
sapply(df,mode)

#dealing with chars
#df$����[df$�������.����� == "�"] <- paste("-",df$����[df$�������.����� == "�"],sep = "")
#check modes
#sapply(df,mode)
#options()