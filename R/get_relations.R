
get_relations <- function(genes=NULL){
  if (exists("RASdata", mode="any")){
    dat <- RASdata;
  } else {
    datfile  <- paste0("RASdata.RData");
    dfile    <- system.file("data", datfile, package="NCIRASPathway");
    dat      <- get(load(dfile));
  }
  relations <- dat$relations;
  if (length(genes)==0){
    return(relations);
  } else {
    l1.i <- which(relations[,1] %in% genes);
    l2.i <- which(relations[,2] %in% genes);
    l.i  <- intersect(l1.i, l2.i);
    return(relations[l.i,]);
  }
}
