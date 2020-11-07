setwd("C:\\Users\\Akild\\OneDrive\\Desktop\\DS\\Data Mining\\Exam Solutions")
data = read.csv("apriori_data.csv", header = TRUE);
View(data)
data$TID <- NULL
library(arules)

write.csv(data, "ITEMSLIST.csv", quote = FALSE, row.names = TRUE)
tranxns = read.transactions("ITEMSLIST.csv", sep=',', rm.duplicates = TRUE)
inspect(tranxns)

frequent_itemsets <- apriori(tranxns, parameter = list(sup = 0.03, conf = 0.5,target="frequent itemsets"))

inspect(sort(frequent_itemsets)[1:15])

itemFrequencyPlot(tranxns, topN = 5 , col="blue")