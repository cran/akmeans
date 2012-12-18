\name{norm.sim.ksc}
\alias{norm.sim.ksc}
\title{
K-means algorithm based on cosine distance
}
\description{
On the assumption that the two samples are already normalized to have
 L2 norm as 1, cosine distance is defined as 1 - inner product of 
the two samples.
}
\usage{
norm.sim.ksc(A, k, init.cen = NULL, init.mem = NULL, iter.max = 100)
}
\arguments{
  \item{A}{
n by p matrix, each row is a sample
}
  \item{k}{
the number of clusters
}
  \item{init.cen}{
initial cluster centers
}
  \item{init.mem}{
initial cluster member assignment
}
  \item{iter.max}{
the maximum number of iteration
}
}
\value{
A list will be returned with components :
cluster: A vector of integers indicating the cluster to which each point is allocated.
centers: A matrix of cluster centres
size: The number of points in each cluster
}
\author{
Jungsuk Kwac
}
\examples{
###############
## test code
## 4 classes: a1,a2,a3,a4
## for each class, 20 samples
###############
n = 20; p = 32
a1 = 10*sin(0.1*(1:p))
a2 = 10*cos(0.1*(1:p))+10
a3 = c(1:(p/2),(p/2):1)
a4 = c((p/2):1,1:(p/2))
A = c()
for (i in 1:n){
  A = rbind(A,a1+rnorm(p),a2+rnorm(p),a3+rnorm(p),a4+rnorm(p))
}
res = norm.sim.ksc(quick.norm(A,1),4)
}
