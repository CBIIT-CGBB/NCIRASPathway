
get_genes <- function(genes=NULL){
  if (exists("RASdata", mode="any")){
    dat <- RASdata;
  } else {
    datfile  <- paste0("RASdata.RData");
    dfile    <- system.file("data", datfile, package="NCIRASPathway");
    dat      <- get(load(dfile));
  }
  gene.names <- dat$gene.names;
  if (length(genes)==0){
    return(gene.names);
  } else {
    g.i <- which(gene.names[,1] %in% genes);
    if (length(g.i)==0){
      stop("No gene found in the NCI RAS pathway.")
    } else {
      return(gene.names[g.i,])
    }
  }
}
