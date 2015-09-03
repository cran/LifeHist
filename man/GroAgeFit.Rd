\name{GroAgeFit}
\alias{GroAgeFit}
\title{
Fit Growth Model with Age and Length Data by Maximum Likelihood
}
\description{
A wrapper and post-processing tool that calls optimx() (from package optimx) with
any of four possible versions of the growth models and any of 5 possible versions
of likelihood models (as internal functions), in addition to possible multiple
numerical methods for optimization and then it post-processes optimx() results and
join all results in a list of lists.

}
\usage{
GroAgeFit(x, m, unsex.action = NULL, par, distr, method, control = list(),
          hessian = TRUE, itnmax)
}
\arguments{
  \item{x}{
An object of class GroAgeData. See as.GroAgeData.
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
  \item{method}{
Character. Any method accepted by optimx() can be used, but some may return
warnings or errors.
}
  \item{control}{
A list of control arguments to be passed to optimx().
}
  \item{hessian}{
Logical. Defaults to TRUE. If set to FALSE all numerical methods tried will fail.
}
  \item{itnmax}{
Numeric. Maximum number of iterations, to pass to optimx().
}
}
\details{
When 'x' has been set with 'sex' equal to "Both" or "Total" then GroAgeFit will
automatically fit separate models for females, males, and for both sexes pooled.

Care should be taken in selecting good initial values to pass in the par
argument. To accomplish this LifeHist includes the GroAgeExp class, and the groageexp()
and the plot.GroAgeExp() functions to graphically fine tune the initial values for
model parameters.

Initial parameter values must be passed log-transformed by the user. GroAgeFit() will
backtransform the maximum likelihood estimates and its numerical Hessian matrix
without user intervention using the delta method.

The difference between "normal" and "apnormal", "lognormal" and "aplnormal" is that
in the former the dispersion parameters is included in the likelihood function and
it is a free parameter to be estimated along with the parameters of the generalized
depletion model (and therefore an initial value for the dispersion has to be
provided) whereas in the latter the dispersion is eliminated by using the adjusted
profile likelihood approximation.
}
\value{
A list of length four with a class attribute 'groage'.
\item{Data}{The original data and its properties}
\item{Initial}{Initial parameter values in their original scale}
\item{Methods}{The numerical methods passed to optimx()}
\item{Model}{A list of length equal to one when 'sex' is 'Females', 'Males', or
'Pooled' or of length equal to three when 'sex' is 'Both' or 'Total'.
Each component is a list of length equal to the number of numerical
methods. The list for each numerical method is in turn a list with
the type of growth model, the chosen distribution for the data, the
integer code describing the success or not of covergence returned by
the method, the Karush Kuhn Tucker conditions, hopefully TRUE and TRUE,
the value of the Akaike Information Criterion, not comparable between
different distributions, the back-transformed (from log) maximum
likelihood estimates, the numerical gradients at each maximum likelihood
estimate, the standard errors of backtransformed (from log) maximum
likelihood estimates, and the correlation matrix of the back-transformed
(from log) maximum likelihood estimates.}
}
\author{
Ruben H. Roa-Ureta
}
\note{
Some effort has been made to avoid being kicked out of numerical optimization by
just one numerical method that fails, so that optimization continues with other
methods, but there may remain some cases when the whole optimization process is
aborted by failure in just one method. Try taking out some suspicious methods and
optimize again.
}
\examples{
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
KSBream.AgeLen.fit.n <- GroAgeFit(x=KSBream.AgeLen,
                                  m="schnute1",
                                  unsex.action="split",
                                  par=par.ini,
                                  distr="normal",
                                  method=c("CG","spg", "Nelder-Mead"),
                                  itnmax=100)
KSBream.AgeLen.pred.n.spg <- groagemod(x=KSBream.AgeLen.fit.n,method="spg")
plot(KSBream.AgeLen.pred.n.spg)
}
\keyword{ ~datasets }
\keyword{ ~manip }
\keyword{ ~optimize }
\keyword{ ~iplot }
\keyword{ ~distribution }
\keyword{ ~models }