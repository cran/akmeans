\name{quick.norm}
\alias{quick.norm}
\title{
normalization function
}
\description{
it is normalizing each row to have L2 norm as 1 or sum as 1
}
\usage{
quick.norm(A, mod = 2)
}
\arguments{
  \item{A}{
Input matrix, n by p
}
  \item{mod}{
1: make each row has L2 norm as 1
2: make each row has sum as 1
}
}
\value{
A normalized n by p matrix will be returned
}
\author{
Jungsuk Kwac
}
\examples{
quick.norm(matrix(rnorm(9),3,3))
quick.norm(matrix(rnorm(9),3,3),mod=1)
}
