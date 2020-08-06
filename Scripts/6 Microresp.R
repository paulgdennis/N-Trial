#Microresp data, Not in a loop so individual ones can be quickly checked

sink("Microresp.txt", type = "output")
Ala<-microresp[1:30,]
summary(aov(Ala$CO2 ~ Ala$N.Rate)) #Overall Test
TukeyHSD(aov(Ala$CO2  ~ factor(Ala$N.Rate))) #Pairwise

Arab<-microresp[31:60,]
summary(aov(Arab$CO2 ~ Arab$N.Rate))
TukeyHSD(aov(Arab$CO2  ~ factor(Arab$N.Rate)))

Arg<-microresp[61:90,]
summary(aov(Arg$CO2 ~ Arg$N.Rate))
TukeyHSD(aov(Arg$CO2  ~ factor(Arg$N.Rate)))

Asp<-microresp[91:120,]
summary(aov(Asp$CO2 ~ Asp$N.Rate))
TukeyHSD(aov(Asp$CO2  ~ factor(Asp$N.Rate)))

Cit<-microresp[121:150,]
summary(aov(Cit$CO2 ~ Cit$N.Rate))
TukeyHSD(aov(Cit$CO2  ~ factor(Cit$N.Rate)))

Fruc<-microresp[151:180,]
summary(aov(Fruc$CO2 ~ Fruc$N.Rate))
TukeyHSD(aov(Fruc$CO2  ~ factor(Fruc$N.Rate)))

Fum<-microresp[181:210,]
summary(aov(Fum$CO2 ~ Fum$N.Rate))
TukeyHSD(aov(Fum$CO2  ~ factor(Fum$N.Rate)))

GABA<-microresp[211:240,]
summary(aov(GABA$CO2 ~ GABA$N.Rate))
TukeyHSD(aov(GABA$CO2  ~ factor(GABA$N.Rate)))

Gala<-microresp[241:270,]
summary(aov(Gala$CO2 ~ Gala$N.Rate))
TukeyHSD(aov(Gala$CO2  ~ factor(Gala$N.Rate)))

Gluc<-microresp[271:300,]
summary(aov(Gluc$CO2 ~ Gluc$N.Rate))
TukeyHSD(aov(Gluc$CO2  ~ factor(Gluc$N.Rate)))

Lys<-microresp[301:330,]
summary(aov(Lys$CO2 ~ Lys$N.Rate))
TukeyHSD(aov(Lys$CO2  ~ factor(Lys$N.Rate)))

Mal<-microresp[331:360,]
summary(aov(Mal$CO2 ~ Mal$N.Rate))
TukeyHSD(aov(Mal$CO2  ~ factor(Mal$N.Rate)))

NADG<-microresp[361:390,]
summary(aov(NADG$CO2 ~ NADG$N.Rate))
TukeyHSD(aov(NADG$CO2  ~ factor(NADG$N.Rate)))

Oxa<-microresp[391:420,]
summary(aov(Oxa$CO2 ~ Oxa$N.Rate))
TukeyHSD(aov(Oxa$CO2  ~ factor(Oxa$N.Rate)))

Prot<-microresp[421:450,]
summary(aov(Prot$CO2 ~ Prot$N.Rate))
TukeyHSD(aov(Prot$CO2  ~ factor(Prot$N.Rate)))

Water<-microresp[451:480,]
summary(aov(Water$CO2 ~ Water$N.Rate))
TukeyHSD(aov(Water$CO2  ~ factor(Water$N.Rate)))

sink()



#PCoA
source('Functions/Functions.R')
corM <- cor(microresp_cor, method="pearson")

correlation.pcoa <- pcoa(corM) 

custom.plot.pcoa(ord = correlation.pcoa, group = factor(microresp$Substrate), title = "", plottype = "t")
