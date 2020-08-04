

plot_pathway <- function(data=NULL, type="no", col.node="blue", col.neg="blue", col.pos="red", 
                         bg.neg="blue", bg.pos="red", col.text="black", ...){

  if (exists("RASdata", mode="any")){
    dat <- RASdata;
  } else {
    datfile  <- paste0("RASdata.RData");
    dfile    <- system.file("data", datfile, package="NCIRASPathway");
    dat      <- get(load(dfile));
  }
  dat1 <- dat$gene.po;
  dat2 <- dat$line.po;
  dat3 <- dat$inter.po;

  plot(c(0,1280), c(0, 720), type="n", axes=F, ...);
  for (i in 1:nrow(dat1)){
    x <- as.numeric(dat1[i,3]);
    y <- as.numeric(dat1[i,4]);
    text(x, y, dat1[i,1], cex=0.6, font=2, pos=4, col=col.text);
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
      segments(x1, y1, x2, y2, col=bg.pos, lwd=2);
    }
    if (dat2[i,5]=="line.n"){
      segments(x1, y1, x2, y2, col=bg.neg, lwd=2);
    }
    if (dat2[i,5]=="pos"){
      segments(x1, y1, x2, y2, col=bg.pos, lwd=2);
      if (x1 == x2){
        segments(x2-6, y2+6, x2, y2, col=bg.pos, lwd=2);
        segments(x2+6, y2+6, x2, y2, col=bg.pos, lwd=2);
      } else {
        if (x1 < x2){
          segments(x2-6, y2-6, x2, y2, col=bg.pos, lwd=2);
          segments(x2-6, y2+6, x2, y2, col=bg.pos, lwd=2);
        } else {
          segments(x2+6, y2-6, x2, y2, col=bg.pos, lwd=2);
          segments(x2+6, y2+6, x2, y2, col=bg.pos, lwd=2); 
        }
      }
    }
    if (dat2[i,5]=="neg"){
      segments(x1, y1, x2, y2, col=bg.neg, lwd=2);
      if (x1 == x2){
        segments(x2-10, y2, x2+10, y2, col=bg.neg, lwd=2);
      } else {
        segments(x2, y2-10, x2, y2+10, col=bg.neg, lwd=2);
      }
    }
  }
  ### NODES
  if (type=="nodes"){
    g.dat <- NULL;
    for (i in 1:nrow(dat1)){
      gene <- unlist(strsplit(dat1[i,2], " "));
      if (length(gene) > 1){
        for (j in 1:length(gene)){
          g.dat <- rbind(g.dat, c(dat1[i,1], gene[j], dat1[i,3],dat1[i,4]));
        }
      }
    }
    n.dat <- data;
    for (i in 1:nrow(n.dat)){
      gene <- n.dat[i,1];
      j    <- which(g.dat[,2]==gene);
      if (length(j)==0){
        next;
      }
      x <- as.numeric(g.dat[j,3]);
      y <- as.numeric(g.dat[j,4]);
      cex <- as.numeric(n.dat[i,2]);
      points(x+30, y, pch=19, cex=cex, col=col.node);
    }
  }
  ### LINKS
  if (type=="links"){
    dat.s  <- data;
    for (i in 1:nrow(dat.s)){
      g1 <- paste0("\\b", dat.s[i,1], "\\b");
      g2 <- paste0("\\b", dat.s[i,2], "\\b");
      for (d1 in 1:nrow(dat3)){
        if (is.na(dat3[d1,4])){
          next;
        }
        f1   <- strsplit(dat3[d1,1], " ")[[1]];
        f2   <- strsplit(dat3[d1,2], " ")[[1]];
        n1.i <- grep(g1, f1);
        n2.i <- grep(g2, f2);
        if (length(n1.i) < 1 | length(n2.i) < 1){
          n1.i <- grep(g1, f2);
          n2.i <- grep(g2, f1);
          if (length(n1.i) < 1 | length(n2.i) < 1){
            next; 
          }
        }
        out <- strsplit(dat3[d1,4], ",")[[1]];
        for (j in 1:length(out)){
          i  <- which(dat2[,6]==out[j]);
          x1 <- as.numeric(dat2[i,1]);
          y1 <- as.numeric(dat2[i,2]);
          x2 <- as.numeric(dat2[i,3]);
          y2 <- as.numeric(dat2[i,4]);
          x.m <- (x1+x2)/2;
          y.m <- (y1+y2)/2;
          #text(x.m, y.m, dat2[i,6], cex=0.6);
          if (dat2[i,5]=="line.p"){
            segments(x1, y1, x2, y2, col=col.pos, lwd=4);
          }
          if (dat2[i,5]=="line.n"){
            segments(x1, y1, x2, y2, col=col.neg, lwd=4);
          }
          if (dat2[i,5]=="pos"){
            segments(x1, y1, x2, y2, col=col.pos, lwd=4);
            if (x1 == x2){
              segments(x2-6, y2+6, x2, y2, col=col.pos, lwd=4);
              segments(x2+6, y2+6, x2, y2, col=col.pos, lwd=4);
            } else {
              if (x1 < x2){
                segments(x2-6, y2-6, x2, y2, col=col.pos, lwd=4);
                segments(x2-6, y2+6, x2, y2, col=col.pos, lwd=4);
              } else {
                segments(x2+6, y2-6, x2, y2, col=col.pos, lwd=4);
                segments(x2+6, y2+6, x2, y2, col=col.pos, lwd=4); 
              }
            }
          }
          if (dat2[i,5]=="neg"){
            segments(x1, y1, x2, y2, col=col.neg, lwd=4);
            if (x1 == x2){
              segments(x2-10, y2, x2+10, y2, col=col.neg, lwd=4);
            } else {
              segments(x2, y2-10, x2, y2+10, col=col.neg, lwd=4);
            }
          }
        }
      }
    }
  }
}
