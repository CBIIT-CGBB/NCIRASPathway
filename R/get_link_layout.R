
get_link_layout <- function(genes=NULL){
  datfile  <- paste0("RASdata.RData");
  dfile    <- system.file("data", datfile, package="NCIRASPathway");
  dat      <- get(load(dfile));
  dat2     <- dat$line.po;
  dat3     <- dat$inter.po;
  l.dat <- NULL;
  for (d1 in 1:nrow(dat3)){
    f1   <- strsplit(dat3[d1,1], " ")[[1]];
    f2   <- strsplit(dat3[d1,2], " ")[[1]];
    f3   <- strsplit(dat3[d1,4], ",")[[1]];
    for (i1 in 1:length(f1)){
      for (i2 in 1:length(f2)){
        for (i3 in 1:length(f3)){
          i  <- which(dat2[,6]==f3[i3]);
          x1 <- as.numeric(dat2[i,1]);
          y1 <- as.numeric(dat2[i,2]);
          x2 <- as.numeric(dat2[i,3]);
          y2 <- as.numeric(dat2[i,4]);
          tmp <- c(f1[i1], f2[i2], x1, y1, x2, y2, dat3[d1,3]);
          if (length(tmp)!=7){
            next;
          }
          l.dat <- rbind(l.dat, tmp);
        }
      }
    }
  }
  colnames(l.dat) <- c("gene1", "gene2", "x1", "y1", "x2", "y2", "type");
  if (length(genes)==0){
    return(l.dat);
  } else {
    g1.i <- which(l.dat[,1] %in% genes);
    g2.i <- which(l.dat[,2] %in% genes);
    g.i  <- intersect(g1.i, g2.i);
    if (length(g.i)==0){
      stop("No gene found in the NCI RAS pathway.")
    } else {
      return(l.dat[g.i,])
    }
  }
}