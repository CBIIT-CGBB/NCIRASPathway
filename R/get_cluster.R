

get_cluster <- function(genes=NULL, plot.out=F){
  if (exists("RASdata", mode="any")){
    dat <- RASdata;
  } else {
    datfile  <- paste0("RASdata.RData");
    dfile    <- system.file("data", datfile, package="NCIRASPathway");
    dat      <- get(load(dfile));
  }
  dat      <- dat$relations;
  dat.i <- which(dat[,3]=="inter");
  dat   <- dat[-dat.i,];
  neg.i <- which(dat[,3]=="neg");
  
  if (length(genes)>0){
    g1.i <- which(dat[,1] %in% genes);
    g2.i <- which(dat[,2] %in% genes);
    g.i  <- intersect(g1.i, g2.i);
    dat  <- dat[g.i,];
  }

  g     <- graph.data.frame(dat[,c(1,2)], directed=T); 
  g.l   <- layout.fruchterman.reingold(g);
  g.l   <- layout.norm(g.l, -1, 1, -1, 1);
  out.l <- data.frame(gene=V(g)$name, x=g.l[,1], y=g.l[,2]);
  
  clu     <- walktrap.community(g);
  clu.out <- NULL;
  for (l in 1:length(clu)){
    tmp     <- data.frame(gene=clu[[l]], cluster=rep(l, length(clu[[l]])));
    clu.out <- rbind(clu.out, tmp);
  }

  if (plot.out){
    col3 <- rainbow(length(clu), alpha=0.2);
    cols  <- rainbow(10, alpha=0.8);
    v.col <- rep(cols[7], nrow(dat));
    v.col[neg.i] <- cols[1];
    plot.igraph(g, mark.groups=clu, mark.col=col3, mark.border=col3, mark.shape=1, 
                vertex.size=2, vertex.color=cols[2], vertex.frame.color=cols[2], edge.color=v.col,
                vertex.label="", vertex.label.color=cols[7], vertex.label.cex=1.2, layout=g.l, main="", 
                edge.arrow.size=0.2);
    textplot(g.l[,1], g.l[,2], V(g)$name, cex=0.6, new=F, font=1);
  }
  return(list(gene.layout=out.l, out.dat=dat, cluster.out=clu.out));
}
