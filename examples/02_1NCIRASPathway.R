rm(list=ls());

options(stringsAsFactors = F);
library(NCIRASPathway);

out1  <- get_node_layout();
out1  <- out1[sample(1:nrow(out1), 60),]

col1 <- rainbow(10, alpha=0.6);
col2 <- rainbow(10, alpha=0.8);

pdf("do_NCIRASPathway05.pdf", 12.8, 7.2);
par(mar=c(2, 2, 2, 2));
plot_pathway(data=NULL, type="no", col.neg=col2[1], col.pos=col2[7], bg.neg=col1[1], bg.pos=col1[7]);
points(as.numeric(out1[,3]), as.numeric(out1[,4]), pch=1:21, col=col1, cex=5);
dev.off();
