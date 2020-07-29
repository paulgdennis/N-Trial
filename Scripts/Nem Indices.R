getwd()

Nematodes <- read.table("Data/N_trial_data.csv", header = TRUE, sep=',')
# Column names
names(Nematodes)

# analyze the different indices
Nematodes [23:32,23:32]

for(i in colnames(Nematodes[,23:32])){
  print(i)
  print(anova(lm(Nematodes[,i]~Nematodes$Rate)))
}



