# any line beginning with a hash character is ignored by 
# the console it is read as a comment

# install libraries - need only do once
# install.packages("sciplot")
# install.packages("vegan")
# load the library
library(sciplot)
library(vegan)

# First thing is the read in the data
data <- read.table('N-trial-data.csv', header = TRUE, sep=',')

# this allows you to look at the data in a familiar excel like way
View(data)

# this gives the column names
names(data)

# This runs an anova
anova(lm(data$Tot.Nem ~ data$Rate))

# This makes a plot
bargraph.CI(data$Rate, data$Tot.Nem, main = "Total nematodes")

# This shows what type of object data is
class(data) # its a dataframe

# to get rows and columns from a dataframe you index with [row, col]
# so to get rows 1 - 6 and cols 1-6
data[1:6,1:6]

# so to get the row names
row.names(data)

# so to get the column names
colnames(data)

# so we can then write a loop to repeat an operation
for(i in colnames(data[,11:55])){
  print(i)
  print(anova(lm(data[,i] ~ data$Rate)))
  }

# let's subset the actual taxa
nem.otu <- data[,43:55]

# now let's consider the nematode community as a multivariate dataset

# PERMANOVA - this shows that the composition of nem comm differs with rate
adonis(sqrt(nem.otu) ~ data$Rate, method='euc')

# now let's look at the differences
# PCA
nem.otu.pca <- rda(sqrt(nem.otu))
plot(nem.otu.pca, scaling=3)

plot(nem.otu.pca, type='n', scaling=3)  points(nem.otu.pca, dis='sites', pch=21, cex=2, bg=factor(data$Rate), scaling=3)
  

  nem.otu.rda <- rda(sqrt(nem.otu) ~ data$Rate)
  plot(nem.otu.rda, scaling=3)
  