
get_node_layout <- function(genes=NULL){
  datfile  <- paste0("RASdata.RData");
  dfile    <- system.file("data", datfile, package="NCIRASPathway");
  dat      <- get(load(dfile));
  dat1     <- dat$gene.po;
  
  g.dat <- NULL;
  for (i in 1:nrow(dat1)){
    gene <- unlist(strsplit(dat1[i,2], " "));
    if (length(gene) > 0){
      df.s  <- data.frame(sym=dat1[i,1], gene=gene, x=as.numeric(dat1[i,3])+30, y=dat1[i,4]);
      g.dat <- rbind(g.dat, df.s);
    }
  }
  colnames(g.dat) <- c("sym", "gene", "x", "y");
  g.dat[,3] <- as.numeric(g.dat[,3]) + 30;
  g.dat[,4] <- as.numeric(g.dat[,4]);
  if (length(genes)==0){
    return(g.dat);
  } else {
    g.i <- which(g.dat[,2] %in% genes);
    if (length(g.i)==0){
      stop("No gene found in the NCI RAS pathway.")
    } else {
      return(g.dat[g.i,])
    }
  }
}