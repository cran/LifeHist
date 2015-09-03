\name{plot.MatData}
\alias{plot.MatData}
\title{
Exploratory Analisys of a Logistic Model on a Graphical Display
}
\description{
A one panel plot with data on proportion of sexual maturity and a line built
with initial parameter values or with maximum likelihood estimates
}
\usage{
\method{plot}{MatData}(x, pred.50, pred.95, top.text, ...)
}
\arguments{
  \item{x}{
An object of class MatData.
}
  \item{pred.50}{
Numeric, the predictor value at 0.5 proportion mature.
}
  \item{pred.95}{
Numeric, the predictor value at 0.95 proportion mature.
}
  \item{top.text}{
Character, to be used as main for plot.
}
  \item{\dots}{
Pass additional parameters to plot().
}
}
\value{
A plot of data and model
}
\author{
Ruben H. Roa-Ureta
}
\examples{
data(BlackAngler.lenmatdat)
BA.matlen     <- MatCount(matdat=BlackAngler.lenmatdat,
                          fem.key=2,
                          mal.key=1,
                          stage.key=2,
                          season.key=c(5,7))
plot(BA.matlen[[2]],pred.50=35,pred.95=55,top.text="Males Rep Season")
}
\keyword{ optimize }
\keyword{ models }
\keyword{ & &nonlinear  }
