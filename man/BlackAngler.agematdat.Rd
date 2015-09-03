\name{BlackAngler.agematdat}
\alias{BlackAngler.agematdat}
\docType{data}
\title{
Black Anglerfish Age, Sex, Month, Maturity Stage Data
}
\description{
Black anglerfish individual-based data from the Bay of Bizcay sampled from the
catch of an industrial fishing fleet.
}
\usage{data("BlackAngler.agematdat")}
\format{
  A data frame with 711 observations on the following 4 variables.
  \describe{
    \item{\code{pred}}{Integer, age in years}
    \item{\code{sex}}{Integer, 1 for males and 2 for females}
    \item{\code{month}}{Integer, the month of capture}
    \item{\code{stages}}{Integer, stages of maturity encompassing a gradual advance
                         from juvenile to sexually matur individual}
  }
}
\details{
Age has been fixed by biologists examining rings in otoliths. Maturity stages have been
fixed by biologists using macroscopic aspect of the fish gonads.
}
\source{
http:\\www.azti.es
}
\examples{
data(BlackAngler.agematdat)
}
\keyword{datasets}
