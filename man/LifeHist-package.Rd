\name{LifeHist-package}
\alias{LifeHist-package}
\alias{LifeHist}
\docType{package}
\title{
\packageTitle{LifeHist}
}
\description{
\packageDescription{LifeHist}
}
\details{

The DESCRIPTION file:
\packageDESCRIPTION{LifeHist}
\packageIndices{LifeHist}
Create data objects for maturity and growth modeling with MatCount() and
as.GroAgeData(), respectively.
Fit sexual maturity models with MatFit() for two types of models and any
numerical method accepted by optimx() from package optimx.
Explore raw growth data with generic function plot() applied on an object of
class 'GroAgeData' created by as.GroAgeData().
Create predictions with initial parameter values for growth models using groageexp()
and examine how good these initial values are with generic function plot() applied
on an object of class 'GroAgeExp' created by groageexp().
Fit any of four type of models with any of five likelihood models and any
numerical method accpted by optimx() from package optimx, using GroAgeFit().
Graphically examines results with generic function plot() applied on an object of
class 'GroAgeMod' created by GroAgeFit().
}
\author{
\packageAuthor{LifeHist}

Maintainer: \packageMaintainer{LifeHist}
}
\references{

R. Roa, B. Ernst, F. Tapia. 1999. Estimation of size at sexual maturity:
evaluation of analytical and resampling procedures. Fishery Bulletin (US) 97:570-580.

Arkhipkin, A., Roa-Ureta, R. 2005. Identification of growth models for squids.
Marine and Freshwater Research 56:371-386.

Roa-Ureta, R. 2010. A Likelihood-based Model of Fish Growth with Multiple Length
Frequency Data. Journal of Agricultural, Biological and Environmental Statistics 15:416-429.

}
\examples{
#See examples for functions MatFit() and GroAgeFit()
}
\keyword{ package }
