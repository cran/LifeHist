\name{MatCount}
\alias{MatCount}
\title{
Build Databases for Sexual Maturity Modeling by Logistic Regression
}
\description{
From a data.frame of one continuous predictor (length, age, etc), and keys for
ordinal precictor sex, month, and maturity stage, this function will builds a list
of variable ready to be used in a 2- or 3-parameter logistic model
}
\usage{
MatCount(matdat, fem.key, mal.key, stage.key, season.key)
}
\arguments{
  \item{matdat}{
A data.frame where each row is an individual fish, and the columns are a
continuous predictor, and ordinal keys for sex, month, and maturity stage
}
  \item{fem.key}{
Integer, the ordinal key identifying females
}
  \item{mal.key}{
Integer, the ordinal key identifying males
}
  \item{stage.key}{
Integer, the ordinal key identifying the last maturity stage of juveniles. This
key will split the individual into immature (all having stage <= stage.key) and
mature.
}
  \item{season.key}{
Integer vector with two components, the first and last month of the reproductive
season
}
}
\details{
The year is divided into two seasons, the reproductive season and the
non-reproductive season
}
\value{
\item{mal.nrep }{A data.frame with the continuous predictor duplicated and sorted,
                 a binary for mature individuals, a binary for juveniles, and the
                 count of males in the non reproductive season}
\item{mal.rep }{A data.frame with the continuous predictor duplicated and sorted,
                a binary for mature individuals, a binary for juveniles, and the
                count of males in the reproductive season}
\item{fem.nrep }{A data.frame with the continuous predictor duplicated and sorted,
                 a binary for mature individuals, a binary for juveniles, and the
                 count of females in the non reproductive season}
\item{fem.rep }{A data.frame with the continuous predictor duplicated and sorted,
                a binary for mature individuals, a binary for juveniles, and the
                count of females in the reproductive season}
}
\references{
R. Roa, B. Ernst, F. Tapia. 1999. Estimation of size at sexual maturity: evaluation
of analytical and resampling procedures. Fishery Bulletin (US) 97:570-580.
}
\author{
Ruben H. Roa-Ureta
}
\examples{
data(BlackAngler.lenmatdat)
MatCount(matdat=BlackAngler.lenmatdat, fem.key=2, mal.key=1, stage.key=2,
         season.key=c(5,7))
}
\keyword{ manip }

