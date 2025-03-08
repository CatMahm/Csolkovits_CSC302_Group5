getwd()
setwd("C:/Users/Ari/Desktop/Rscripts")
getwd()
read.csv("metabolite.csv", header = T)
dfMETA <- read.csv("metabolite.csv",)

META_rows = nrow(dfMETA)
META_cols = ncol(dfMETA)
print(META_rows)
print(META_cols)
colnames(dfMETA)
head(dfMETA)

summary(dfMETA)

#(a) Find how many Alzheimers patients there are in the data set.
#Number of Alzheimers patients is 35 according to print(alz_num)
alz_num <- sum(dfMETA$Label == "Alzheimer")
print(alz_num)

#(b) Determine the number of missing values for each column. (Hint: is.na( ) )
# Total number of missing na values in this data is 432
missing_no <- colSums(is.na(dfMETA))
print(missing_no)
total_missing <- sum(missing_no)
print(total_missing)

#(c) Remove the rows which has missing value for the Dopamine column and assign the result to a new data frame.
#(Hint: is.na( ) )
dfDopa_less <- dfMETA[!is.na(dfMETA$Dopamine), ]
print(dfDopa_less)

#(d) In the new data frame, replace the missing values in the c4-OH-Pro column with the median value of the same
#column. (Hint: there is median( ) function.)
med_c4OH <- median(dfDopa_less$c4.OH.Pro, na.rm = T)
print(med_c4OH) #median is 0.199
dfDopa_less$c4.OH.Pro[is.na(dfDopa_less$c4.OH.Pro)] <- med_c4OH
print(summary(dfDopa_less$c4.OH.Pro)) #printed summary indicates no NA values
print(sum(is.na(dfDopa_less$c4.OH.Pro))) #printed 0


#(e) (Optional) Drop columns which have more than 25% missing values. (Hint: when you slice your data frame, you
#can use -c(.., ..., ...) where ... represent one column name)
missing_values <- colMeans(is.na(dfDopa_less)) * 100
dropped_cols <- names(dfDopa_less)[missing_values > 25]
df_no_na <- dfDopa_less[, -which(names(dfDopa_less) %in% dropped_cols)]
print(dim(dfDopa_less))
print(dim(df_no_na))
