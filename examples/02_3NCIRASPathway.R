rm(list=ls());

options(stringsAsFactors = F);
library(NCIRASPathway);

out1  <- get_genes();
genes <- out1[sample(1:nrow(out1), 60), 1];
out4  <- get_relations(genes=genes);

dat2.s <- data.frame(out4[,c(1,2)]);

col1 <- rainbow(10, alpha=0.2);
col2 <- rainbow(10, alpha=0.8);

pdf("do_NCIRASPathway04.pdf", 12.8, 7.2);
par(mar=c(2, 2, 2, 2));
plot_pathway(data=dat2.s, type="links", col.neg=col2[1], col.pos=col2[7], bg.neg=col1[1], bg.pos=col1[7]);
dev.off();
