\name{groagemod}
\alias{groagemod}
\title{
Predictions from an Object of Class GroAgeMod
}
\description{
For a data object of class 'GroAgeMod' examine the results of model fit by making
predictions and calculating residuals.
}
\usage{
groagemod(x, method)
}
\arguments{
  \item{x}{
An object of class 'GroAgeMod'.
}
  \item{method}{
Character, one of the numerical methods used to fit the model with GroAgeFit.
}
}
\details{
If the sex is 'Both' or 'Total' predictions will be calculated for females, males
and both sexes pooled, and if the numerical has failed to fit any of these three
arrangements of the data then predictions will be calculated only for the
successful fits.
}
\value{
A list of length 3.
\item{Properties}{The properties of the data, information carried over from the
                   creation of the data object with as.GroAgeData.}
\item{Model}{The type of growth model, the distribution for the data, and the
              numerical method.}
\item{Predictions}{A list of length one, two of three, with each component a
                   data.frame with the age and length data, predicted lenght
                   by the model, and the 'deviance' residuals.}
}
\author{
Ruben H. Roa-Ureta
}
\examples{
#See examples in help pages of function GroAgeFit()
}
\keyword{ ~models }