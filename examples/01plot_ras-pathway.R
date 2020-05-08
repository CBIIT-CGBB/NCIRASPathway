rm(list=ls());

options(stringsAsFactors = FALSE);
dat1 <- read.table("ras_coorder.txt", header=T, sep="\t")
dat2 <- read.table("ras_coorder_line.txt", header=T, sep="\t")

cols <- rainbow(10, alpha=0.8);

pdf("ras-pathway-v4.pdf", 12.8, 7.2);
par(mar=c(2, 2, 2, 2));
plot(c(0,1280), c(0, 720), type="n", axes=F, xlab="", ylab="");
for (i in 1:nrow(dat1)){
  x <- as.numeric(dat1[i,3]);
  y <- as.numeric(dat1[i,4]);
  text(x, y, dat1[i,1], cex=0.6, font=2, pos=4);
}
for (i in 1:nrow(dat2)){
  x1 <- as.numeric(dat2[i,1]);
  y1 <- as.numeric(dat2[i,2]);
  x2 <- as.numeric(dat2[i,3]);
  y2 <- as.numeric(dat2[i,4]);
  x.m <- (x1+x2)/2;
  y.m <- (y1+y2)/2;
  #text(x.m, y.m, dat2[i,6], cex=0.6);
  if (dat2[i,5]=="line.p"){
    segments(x1, y1, x2, y2, col=cols[7], lwd=2);
  }
  if (dat2[i,5]=="line.n"){
    segments(x1, y1, x2, y2, col=cols[1], lwd=2);
  }
  if (dat2[i,5]=="pos"){
    segments(x1, y1, x2, y2, col=cols[7], lwd=2);
    if (x1 == x2){
      segments(x2-6, y2+6, x2, y2, col=cols[7], lwd=2);
      segments(x2+6, y2+6, x2, y2, col=cols[7], lwd=2);
    } else {
      if (x1 < x2){
        segments(x2-6, y2-6, x2, y2, col=cols[7], lwd=2);
        segments(x2-6, y2+6, x2, y2, col=cols[7], lwd=2);
      } else {
        segments(x2+6, y2-6, x2, y2, col=cols[7], lwd=2);
        segments(x2+6, y2+6, x2, y2, col=cols[7], lwd=2); 
      }
    }
  }
  if (dat2[i,5]=="neg"){
    segments(x1, y1, x2, y2, col=cols[1], lwd=2);
    if (x1 == x2){
      segments(x2-10, y2, x2+10, y2, col=cols[1], lwd=2);
    } else {
      segments(x2, y2-10, x2, y2+10, col=cols[1], lwd=2);
    }
  }
}

dev.off();