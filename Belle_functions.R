## plot soil PCA - plots a pregenerated PCA ordination with groups for ellipses	

belle.plot.pca <- function(ord,group,title,plottype){
  plot(ord, type=plottype, scaling=3, 
       #xlim=c(-0.3,0.35), ylim=c(-0.4,0.4),
       xlab=paste("PC1 (",axis.percent(
         ord)[[1]],"%)",sep=""),
       ylab=paste("PC2 (",axis.percent(
         ord)[[2]],"%)",sep=""),
       main=title)
  #ordispider(ord, col='darkgrey',lty=3, scaling=3)
  ordiellipse(ord, group,col=group,lty=3, kind='sd', scaling=3)
 # points(ord,dis='sp',pch=4,col='grey',cex=0.6,scaling=-3)
  points(ord, dis='sites',pch=21,bg=group,cex=3,scaling=3)
  legend("topright",legend=unique(factor(group)),pch=19,col=unique(factor(group)))
}

# END


belle.plot.rda <- function(ord,group,title,plottype,sd.val,scaling.val){
  plot(ord, type=plottype, scaling=scaling.val, 
       #xlim=c(-0.4,0.5), ylim=c(-0.4,0.4),
       xlab=paste("RDA1 (",axis.percent(
         ord)[[1]],"%)",sep=""),
       ylab=paste("RDA2 (",axis.percent(
         ord)[[2]],"%)",sep=""),
       main=title)
  #ordispider(ord, col=group,lty=3, scaling=scaling.val)
  ordiellipse(ord, group, col=group, lty=3, kind='sd', scaling=scaling.val)
 # points(ord,dis='sp',pch=4,col='grey',cex=0.6,scaling=scaling.val)
 # points(scores(ord,scaling=scaling.val)$sp[which(scores(ord)$sp[,1] > sd.val * sd(scores(ord)$sp[,1])),],pch=4,col='blue',cex=1)	
 # points(scores(ord,scaling=scaling.val)$sp[which(scores(ord)$sp[,1] < 0 - (sd.val * sd(scores(ord)$sp[,1]))),],pch=4,col='blue',cex=1) 
 # points(scores(ord,scaling=scaling.val)$sp[which(scores(ord)$sp[,2] > sd.val * sd(scores(ord)$sp[,2])),],pch=4,col='blue',cex=1)
 # points(scores(ord,scaling=scaling.val)$sp[which(scores(ord)$sp[,2] < 0 - (sd.val * sd(scores(ord)$sp[,2]))),],pch=4,col='blue',cex=1) 
  #text(scores(ord,scaling=scaling.val)$sp[names(which(scores(ord)$sp[,1] > sd.val * sd(scores(ord)$sp[,1]))),],cex=0.8)
  #text(scores(ord,scaling=scaling.val)$sp[names(which(scores(ord)$sp[,1] < 0 - (sd.val * sd(scores(ord)$sp[,1])))),],cex=0.8) 
  #text(scores(ord,scaling=scaling.val)$sp[names(which(scores(ord)$sp[,2] > sd.val * sd(scores(ord)$sp[,2]))),],cex=0.8)
  #text(scores(ord,scaling=scaling.val)$sp[names(which(scores(ord)$sp[,2] < 0 - (sd.val * sd(scores(ord)$sp[,2])))),],cex=0.8) 
  points(ord, dis='sites',pch=21,bg=group,cex=3,scaling=scaling.val)
  legend("topright",legend=unique(factor(group)),pch=19,col=unique(factor(group)))
}

# END
