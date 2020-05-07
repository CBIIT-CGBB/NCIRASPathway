rm(list=ls());

options(stringsAsFactors = F);
library(NCIRASPathway);

set.seed(1234);
## select genes
out1   <- get_genes();
genes  <- out1[sample(1:nrow(out1), 60),1];
out2   <- get_relations(genes=genes);
dat2.s <- data.frame(out2[,c(1,2)]);
out3   <- get_node_layout(genes=sample(genes, 20));

dat1.s <- data.frame(gene=genes, value=abs(rnorm(length(genes)))*5);

col1 <- rainbow(10, alpha=0.2);
col2 <- rainbow(10, alpha=0.8);

pdf("do_NCIRASPathway03_2.pdf", 12.8, 7.2);
par(mar=c(2, 2, 2, 2));
plot_pathway(data=dat2.s, type="links", col.node=col1[9], bg.neg=col2[1], bg.pos=col2[7]);
points(as.numeric(out3[,3])-6, as.numeric(out3[,4]), col=col1[9], pch=19, cex=runif(nrow(out3))*10);
dev.off();
