\name{plot_pathway}
\alias{plot_pathway}

\title{
 plot NCI RAS Pathway with or without annotation(s)
}

\description{
 plot NCI RAS Pathway with or without annotation(s)
}

\usage{
  plot_pathway(data=NULL, type="no", col.node="blue", 
  col.neg="blue", col.pos="red", bg.neg="blue", bg.pos="red", col.text="black", ...);
}

\arguments{
   \item{data}{annotation data (matrix or data.frame), 
   column 1: gene symbols and column 2: values}
   \item{type}{type: no or links or nodes}
   \item{col.node}{node color}
   \item{col.neg}{negtive line color}
   \item{col.pos}{positive line color}
   \item{bg.neg}{background negtive line color}
   \item{bg.pos}{background positive line color}
   \item{col.text}{gene color}
   \item{...}{plot options}
}

\author{
 Ying Hu <yhu@mail.nih.gov>
}

\references{
##
}

\examples{
##
}

