rm(list=ls());

options(stringsAsFactors = F);
library(NCIRASPathway);

set.seed(1234);
out1  <- get_genes();
genes <- out1[sample(1:nrow(out1), 100),1];

pdf("02_5ras-pathway-v2.pdf", 5, 5);
par(mar=c(2, 2, 2, 2));
out <- get_cluster(genes=genes, plot.out=T);
dev.off();