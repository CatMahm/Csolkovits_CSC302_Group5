#This part of the code creates the data frame called 'df1'
# This data frame has 12 rows and 3 columns: Name, State, Sales.

df1 <- data.frame(
               Name = c('James','Paul','Richards','Marico','Samantha','Ravi','Raghu',
                      'Richards','George','Ema','Samantha','Catherine'),
               State = c('Alaska','California','Texas','North Carolina','California','Texas',
                       'Alaska','Texas','North Carolina','Alaska','California','Texas'),
               Sales = c(14,24,31,12,13,7,9,31,18,16,18,14))

#We can see the table in Console by using print(df1)
print(df1)

#Aggregate took the sum of the sales by state
aggregate(df1$Sales, by=list(df1$State), FUN=sum)

#Loaded dplyr Package
library(dplyr)

#Indicates the same information as using aggregate but also the size of the 
#aggregated information 4x2 states with a summation of their sales.
df1 %>% group_by(State) %>% summarise(sum_sales = sum(Sales))
