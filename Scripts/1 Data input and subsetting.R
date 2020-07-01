### 1. Data input and subsetting

# For Paul
#setwd("C:/Users/uqpdenni/Dropbox/Staff and Students/Masters/Alpha Gulanes/Field experiment/R/N-Trial")
#setwd("C:/Users/cfors/Dropbox/Alpha/Field experiment/R/N-Trial")

# Get the data into memory

data.all <- read.table('Data/N_trial_data.csv', header = TRUE, sep=',')
microresp <- read.table('Data/microresp.csv', header = TRUE, sep=',')

## Subset various datasets

names(data.all)

enzymes <- data.all[,c("B.gluc", "Chit", "Sulf", "Phos", "a.gluc", "Xyl")]

nem.taxa <- data.all[,c("Heli.d", "Roty.r", "Cric", "Tyl", "Aph", "Rhabd", "Pang", "Ceph", "Plect", "Monhy", "Trip", "Mono", "Doryl")]

nem.fun1 <- data.all[,c("Fu2", "Ba1", "Ba2", "Ba3", "Ca3", "Ca4", "Om4", "Ecto", "Endo")]

nem.indices <- data.all[,c("Div.H", "MI", "PPI", "EI", "SI", "CI", "BF", "Det", "Pred.1", "Roots")]

nem.troph <- data.all[,c("Para", "Fung", "Bact", "Pred", "Omn")]

soil.chem <- data.all[,56:93]
