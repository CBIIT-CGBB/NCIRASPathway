rm(list=ls());

options(stringsAsFactors = F);
library(NCIRASPathway);

## select genes
out1  <- get_genes();
genes <- out1[sample(1:nrow(out1), 60),1];


dat1.s <- data.frame(gene=genes, value=abs(rnorm(length(genes)))*5);

col1 <- rainbow(10, alpha=0.2);
col2 <- rainbow(10, alpha=0.8);

pdf("do_NCIRASPathway03.pdf", 12.8, 7.2);
par(mar=c(2, 2, 2, 2));
plot_pathway(data=dat1.s, type="nodes", col.node=col1[9], bg.neg=col2[1], bg.pos=col2[7]);
dev.off();
