\name{BlackAngler.wgtmatdat}
\alias{BlackAngler.wgtmatdat}
\docType{data}
\title{
Black Anglerfish Body Weight, Sex, Month, Maturity Stage Data
}
\description{
Black anglerfish individual-based data from the Bay of Bizcay sampled from the
catch of an industrial fishing fleet.
}
\usage{data("BlackAngler.wgtmatdat")}
\format{
  A data frame with 479 observations on the following 4 variables.
  \describe{
    \item{\code{pred}}{Numeric, fish body weight length in g}
    \item{\code{sex}}{Integer, 1 for males and 2 for females}
    \item{\code{month}}{Integer, the month of capture}
    \item{\code{stages}}{Integer, stages of maturity encompassing a gradual advance
                         from juvenile to sexually matur individual}
  }
}
\details{
Maturity stages have been fixed by biologists using macroscopic aspect of the fish gonads.
}
\source{
http:\\www.azti.es
}
\examples{
data(BlackAngler.wgtmatdat)
}
\keyword{datasets}
