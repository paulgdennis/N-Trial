### 1. Data input and subsetting

# Load packages and custom functions for the R session
source('Functions.R')

# Get the data into memory

data.all <- read.table('../Data/N_trial_data.csv', header = TRUE, sep=',')
microresp <- read.table('../Data/microresp.csv', header = TRUE, sep=',')
microresp_cor <- read.table('../Data/microresp_for_correlation_analysis.csv', header = TRUE, sep=',', row.names = 1)

# 16S
otu.16S.all <- read.table('../Data/otu_16S_tax_10k.csv', header = TRUE, sep=',', row.names = 1)
env.16S.all <- read.table('../Data/env_16S.csv', header = TRUE, sep=',', row.names = 1)

taxonomy.16S <- data.frame(OTU = row.names(otu.16S.all), Taxonomy = otu.16S.all[,90])
otu.16S <- t(otu.16S.all[,-90]/10000)

hm.16S.tmp <- read.csv('../Data/16S/16S_heatmap_1.5%.csv', header=TRUE, sep=',', row.names = 1)
hm.16S <- as.matrix(hm.16S.tmp/10000)

w.unifrac.16S.all.tmp <- read.table('../Data/16S/weighted_unifrac.csv', header = TRUE, sep=',', row.names = 1)
w.unifrac.16s.all <- as.matrix(w.unifrac.16S.all.tmp)

# ITS
otu.ITS.all <- read.table('../Data/otu_ITS_tax_6700.csv', header = TRUE, sep=',', row.names = 1)
env.ITS.all <- read.table('../Data/env_ITS.csv', header = TRUE, sep=',', row.names = 1)

taxonomy.ITS <- data.frame(OTU = row.names(otu.ITS.all), Taxonomy = otu.ITS.all[,91])
otu.ITS <- t(otu.ITS.all[,-91]/6700)

ITS.hm.tmp <- read.table('../Data/ITS/ITS_6700_heatmap_2.5.csv', header=TRUE, sep=',', row.names =1)
ITS.hm <- as.matrix(ITS.hm.tmp/6700)

## Subset various datasets

names(data.all)

enzymes <- data.all[,c("B.gluc", "Chit", "Sulf", "Phos", "a.gluc", "Xyl")]

nem.taxa <- data.all[,c("Heli.d", "Roty.r", "Cric", "Tyl", "Aph", "Rhabd", "Pang", "Ceph", "Plect", "Monhy", "Trip", "Mono", "Doryl")]

nem.fun1 <- data.all[,c("Fu2", "Ba1", "Ba2", "Ba3", "Ca3", "Ca4", "Om4", "Ecto", "Endo")]#composition

nem.indices <- data.all[,c("Div.H", "MI", "PPI", "EI", "SI", "CI", "BF", "Det", "Pred.1", "Roots")]#univariate

nem.troph <- data.all[,c("Para", "Fung", "Bact", "Pred", "Omn")]#composition

soil.chem.all <- data.all[-9,c(4,56:93)] # Ran out of soil for sample in row 9 hence all NAs

soil.chem <- data.all[-9,c("pH.h2o","EC","CEC","TC","TN","CN","OrgC","Lab.C","NO3.N","Al.KCl","Ca.amm.ace",
                         "Cl","Cu","Fe","K.amm.ace","Mg.amm.ace","Mn","Na.amm.ace","P.colwell","S","Zn")] # Ran out of soil for sample in row 9 hence all NAs

otu.16S.soil <- otu.16S[env.16S.all$Compartment == "Soil",]
otu.16S.endo <- otu.16S[env.16S.all$Compartment == "Endo",]
otu.16S.ecto <- otu.16S[env.16S.all$Compartment == "Ecto",]

env.16S.soil <- env.16S.all[env.16S.all$Compartment == "Soil",]
env.16S.endo <- env.16S.all[env.16S.all$Compartment == "Endo",]
env.16S.ecto <- env.16S.all[env.16S.all$Compartment == "Ecto",]

otu.ITS.soil <- otu.ITS[env.ITS.all$Compartment == "Soil",]
otu.ITS.endo <- otu.ITS[env.ITS.all$Compartment == "Endo",]
otu.ITS.ecto <- otu.ITS[env.ITS.all$Compartment == "Ecto",]

env.ITS.soil <- env.ITS.all[env.ITS.all$Compartment == "Soil",]
env.ITS.endo <- env.ITS.all[env.ITS.all$Compartment == "Endo",]
env.ITS.ecto <- env.ITS.all[env.ITS.all$Compartment == "Ecto",]

