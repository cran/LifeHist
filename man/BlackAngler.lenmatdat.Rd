\name{BlackAngler.lenmatdat}
\alias{BlackAngler.lenmatdat}
\docType{data}
\title{
Black Anglerfish Length, Sex, Month, Maturity Stage Data
}
\description{
Black anglerfish individual-based data from the Bay of Bizcay sampled from the
catch of an industrial fishing fleet.
}
\usage{data("BlackAngler.lenmatdat")}
\format{
  A data frame with 1367 observations on the following 4 variables.
  \describe{
    \item{\code{pred}}{Numeric, total fish length in cm}
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
data(BlackAngler.lenmatdat)
}
\keyword{datasets}
