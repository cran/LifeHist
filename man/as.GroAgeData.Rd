\name{as.GroAgeData}
\alias{as.GroAgeData}
\title{
Create a Data Object to Fit Individual Growth Models with Age-Length Observations
}
\description{
From a data.frame identify columns with data on length and age from a single sex
category, two sexes, or two sexes plus unsexed individuals, and optionally include
date, body weight, liver weight, and gonad weight, to create a data object with
a class attribute.
}
\usage{
as.GroAgeData(x, sex, maleskey = NULL, femaleskey = NULL, colsex = NULL,
              colage, collen, colbw = NULL, colliver = NULL, colgonad = NULL,
              coldate = NULL, lentype, unitsage, unitslen, unitsbw = NULL,
              unitsliver = NULL, unitsgonad = NULL, spec)
}
\arguments{
  \item{x}{
Data.frame containing the data, where each line is an individual.
}
  \item{sex}{
Character, either "Females", "Males", "Pooled", "Both", or "Total".
}
  \item{maleskey}{
Usually a numeric key indicating whether the individual is male.
}
  \item{femaleskey}{
Usually a numeric key indicating whether the individual is female.
}
  \item{colsex}{
Integer. The column in 'x' with the sex key.
}
  \item{colage}{
Integer. The column in 'x' with the age data.
}
  \item{collen}{
Integer. The column in 'x' with the length data.
}
  \item{colbw}{
Integer. Optionally, the column in 'x' with the body weight data.
}
  \item{colliver}{
Integer. Optionally, the column in 'x' with the liver weight data.
}
  \item{colgonad}{
Integer. Optionally, the column in 'x' with the gonad weight data.
}
  \item{coldate}{
Integer. Optionally, the column in 'x' with the collection date data.
}
  \item{lentype}{
Character. In the case of fish, this indicates whether the length is total, fork,
or standard.
}
  \item{unitsage}{
Character. The units of age.
}
  \item{unitslen}{
Character. The units of length.
}
  \item{unitsbw}{
Character. Optionally, the units of body weight.
}
  \item{unitsliver}{
Character. Optionally, the units of liver weight.
}
  \item{unitsgonad}{
Character. Optionally, the units of gonad weight.
}
  \item{spec}{
Character. A species identification key.
}
}
\details{
When 'sex' is "Females" or "Males", the data.frame 'x' contains data for a single sex.
When 'sex' is "Pooled" the sex has not been determined and both sexes might be mixed.
When 'sex' is "Both" all individuals have been sexed.
Finally, when 'sex' is 'Total' some individuals have been sexed but some have been not
so there is a third sex category which implicitly corresponds to unsexed individuals.
For instance this could happen with very young individuals for which their sex could
not be determined.
}
\value{
A list with class attribute 'GroAgeData' with the following components:
\item{Properties }{A data.frame with properties of the data, such as the species key,
               the type of sex, units of age, units of length, and the other optional
               properties}
\item{Sex 1 }{A data.frame with an individual key, the age, the length, and optionally
               other individual data}
\item{Sex 2 }{Optionally, the same as the previous component but for the other sex}
\item{Sex 3 }{Optionally, the same as the previous components but for the unsexed individuals}
}
\author{
Ruben H. Roa-Ureta
}
\note{
NAs are allowed in all data column and later ignored in the modeling functions.
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
plot(KSBream.AgeLen)
}
\keyword{ ~manip }

