\name{groageexp}
\alias{groageexp}
\title{
Exploratory Growth Modeling with Age and Length Data
}
\description{
For a data object of class 'GroAgeData' examine the goodness of initial guessed
values of model parameters by making predictions and calculating residuals.
}
\usage{
groageexp(x, m, unsex.action = NULL, par, distr)
}
\arguments{
  \item{x}{
An object of class 'GroAgeData'.
}
  \item{m}{
Character, the specific growth model to be examined, either 'vonBer' (von
Bertalanffy), 'schnute1', 'schnute2', or 'schnute3'
}
  \item{unsex.action}{
Character, optionally, when there are unsexed individual, what to do with these,
either 'split' (random assignment of half to males and half to females), 'males'
(complete assignment to males), 'females' (complete assignment to females), or
'ignore'.
}
  \item{par}{
Numeric, the logarithm of the vector of initial parameter values.
}
  \item{distr}{
Character, the distribution of the data, either 'apnormal' (adjusted profile
approximation to the normal likelihood), 'aplnormal' adjusted profile
approximation to the lognormal likelihood), 'normal', 'lognormal', or 'gamma'.
}
}
\details{
When the distribution of the data is 'normal', 'lognormal', or 'gamma', an
additional dispersion parameter has to be provided along with the growth model
parameters, and placed at the end of the parameter vector.
}
\value{
A list with class attribute 'GroAgeExp' with the following components:
\item{Properties}{Properties of the data, passed from 'x'}
\item{Data}{A data.frame with age, observed length, predicted length, and
            'deviance' residuals}
\item{Data}{Optionally, the same as previous component but for the other sex}
}
\references{

Arkhipkin, A., Roa-Ureta, R. 2005. Identification of growth models for squids.
Marine and Freshwater Research 56:371-386.

Roa-Ureta, R. 2010. A likelihood-based model of fish growth with multiple length
frequency data. Journal of Agricultural, Biological and Environmental Statistics
15:416-429

}
\author{
Ruben H. Roa-Ureta
}
\note{
Model types 'schnute1', 'schnute2', 'schnute3' have 5, 3, and 2 parameters
respectively. 'schnute1' is described in Arkhipkin and Roa-Ureta (2005) whereas
'schnute2' and 'schnute3' are described in Roa-Ureta (2010).
}
\examples{
#Schnute - Normal
data(ksbream)
KSBream.AgeLen <- as.GroAgeData(x=ksbream,
                                sex="Total",
                                maleskey=1,
                                femaleskey=2,
                                coldate=1,
                                colsex=9,
                                colage=11,
                                collen=2,
                                colbw=5,
                                colliver=7,
                                colgonad=8,
                                lentype="Total",
                                unitsage="Years",
                                unitslen="mm",
                                unitsbw="g",
                                unitsliver="g",
                                unitsgonad="g",
                                spec="KSBream")
#par ini
l1.f  <- 175
a1.f  <- 1
mu.f  <- 250
g1.f  <- 0.15
g2.f  <- 0.1
l1.m  <- 175
a1.m  <- 1
mu.m  <- 210
g1.m  <- 0.25
g2.m  <- 0.1
psi.f <- 0.5
psi.m <- 0.45
par.ini <- log(c(l1.f,a1.f,mu.f,g1.f,g2.f,l1.m,a1.m,mu.m,g1.m,g2.m,psi.f,psi.m))
KSBream.AgeLen.exp <- groageexp(x=KSBream.AgeLen,
                                unsex.action="split",
                                m="schnute1",
                                par=par.ini,
                                distr="normal")
plot(KSBream.AgeLen.exp)
}
\keyword{ ~models }

