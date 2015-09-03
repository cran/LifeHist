\name{MatFit}
\alias{MatFit}
\title{
Wrapper Function to Estimate a 2- or 3-Parameters Logistic Regression of Sexual
Maturity
}
\description{
Define the logistic model, pass the initial parameter values, the data, and
the numerical optimization method(s) to estimate the model and to organize results
in a list.
}
\usage{
MatFit(p, par, matdat, method, control = ls(), itnmax)
}
\arguments{
  \item{p}{
Integer, either 2 or 3, determining if the asymptotic proportion is assumed
known at 1 or estimated.
}
  \item{par}{
Numeric vector of 2 or 3 components with initial paramater values.
}
  \item{matdat}{
A data.frame where each row is an individual fish, and the columnds are a
continuous predictor, and ordinal keys for sex, month, and maturity stage.
}
  \item{method}{
Character or character vector, defining the list of numerical methods to use.
See help pages for function optimx().
}
  \item{control}{
List, optimization control parameters to be passed to optimx. See help for
function optimx().
}
  \item{itnmax}{
Integer, maximum number of iterations, to be passed to optimx().
}
}
\details{
The function controls the estimation process. From a valid value of p, it will
define the proper process model, either 2-parameters or 3-parameters logistic
regression. The 3-parameter model might be useful outside the reproductive season
when not all adult individuals are ready to reproduce, whereas the 2-parameter
model assumes that above certain value of the continuous predictor all individuals
are reproducing.

The function will re-organize optimx()'s output by adding some items (AIC,
standard errors, correlation matrix) and ignoring other items. The output is a
list of results in a list of optimization methods.

}
\value{
\item{model }{Type of model, matlik.2p or matlik.3p}
\item{method }{Name of numerical optimization method}
\item{converg }{Convergence message}
\item{kkt }{The Karush-Kuhn-Tucker optimality conditions}
\item{AIC }{The Akaike Information Criterion}
\item{pars }{Maximum likelihood estimates of model parameters}
\item{num.grads }{Numerical gradients at the maximum likelihood estimates}
\item{stdev }{Estimated standard deviations of maximum likelihood estimates of model parameters}
\item{Cor }{The estimated correlation matrix of maximum likelihood estimates of model parameters}
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
plot(BA.matlen[[2]],
     pred.50=35,
     pred.95=55,
     pred.unit="Length (cm)",
     top.text="Males Rep Season",
     lwd=2, xlab="", ylab="")
par(mfrow=c(2,2), mar=c(4,4,1,1), oma=c(4,4,1,1))
plot(BA.matlen[[1]],pred.50=35,pred.95=55,pred.unit="Length (cm)",
     top.text="Males NoRep Season", lwd=2, xlab="", ylab="")
plot(BA.matlen[[2]],pred.50=35,pred.95=55,pred.unit="Length (cm)",
     top.text="Males Rep Season", lwd=2, xlab="", ylab="")
plot(BA.matlen[[3]],pred.50=85,pred.95=110,pred.unit="Length (cm)",
     top.text="Females NoRep Season", lwd=2, xlab="", ylab="")
plot(BA.matlen[[4]],pred.50=55,pred.95=75,pred.unit="Length (cm)",
     top.text="Females Rep Season", lwd=2, xlab="", ylab="")
require(optimx)
BA.matlen.mal <- MatFit(p=2,
                        par=c(35,55),
                        matdat=BA.matlen[[2]],
                        method=c("spg", "CG", "Nelder-Mead"),
                        itnmax=100)
#
plot(BA.matlen[[2]],
     pred.50=BA.matlen.mal[[1]]$par.mle[1],
     pred.95=BA.matlen.mal[[1]]$par.mle[2],
     pred.unit="Length (cm)",
     top.text="Males Reproductive Season",
     lwd=2,
     xlab="Length (cm)",
     ylab="Proportion Mature")
}
\keyword{ optimize }
\keyword{ models }

