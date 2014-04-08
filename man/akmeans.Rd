\name{akmeans}
\alias{akmeans}
\title{
Adaptive K-means algorithm with threshold setting
}
\description{
Adaptive K-means algorithm is quite simple
## 1. Set min.k and max.k.
## 2. Run K-means with K = min.k
## 3. For each cluster, check the threshold condition.
## 4. If all clusters satisfy the threshold condition => Done, return the result
## 5. Check K>max.k => If yes, stop. If no, go to step 5.
## 6. For any cluster violating the threshold condition, run K'-means with K'=2 on those cluster members, 
## which means K will increase by the number of violating clusters.
## 7. Run K-means setting the present cluster centers as the initial centers and go to step 4.
}
\usage{
akmeans(x, ths1 = 0.2, ths2 = 0.2, ths3 = 0.7, ths4 = 0.2, min.k = 5, max.k = 100, 
        iter.max = 100, nstart = 1, mode = 1, d.metric = 1, verbose = TRUE)}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
data matrix n by p: all elements should be numeric
}
  \item{ths1}{
threshold to decide whether to increase k or not: check sum((sample-assigned center)^2) < ths1*sum(assigned center^2)
}
  \item{ths2}{
threshold to decide whether to increase k or not: check all components of |sample-assigned center| < ths2
}
  \item{ths3}{
threshold to decide whether to increase k or not: check inner product of (sample,assigned center) > ths3 , this is only for cosine distance metric
}
  \item{ths4}{
threshold to decide whether to increase k or not: check all components of sum(abs(sample-assigned center)) < ths4
}
  \item{min.k}{
minimum number of clusters, starting k
}
  \item{max.k}{
maximum number of clusters
}
  \item{iter.max}{
will be delivered to kmeans function
}
  \item{nstart}{
will be delivered to kmeans function
}
  \item{mode}{
1: use ths1, 2: use ths2, 3: use ths3
}
  \item{d.metric}{
1: use euclidean distance metric, otherwise use cosine distance metric
}
  \item{verbose}{
print the messages or not
}
}
\details{
## ths1: threshold to decide whether to increase k or not: check sum((sample-assigned center)^2) < ths1*sum(assigned center^2)
## ths2: threshold to decide whether to increase k or not: check all components of |sample-assigned center| < ths2
## ths3: threshold to decide whether to increase k or not: check inner product of (sample,assigned center) > ths3 , this is only for cosine distance metric
## ths4: threshold to decide whether to increase k or not: check all components of sum(abs(sample-assigned center)) < ths4
}
\value{
if d.metric=1, it will return the same result as 'kmeans' function.
if d.metric is not 1, a list will be returned with components :
cluster: A vector of integers indicating the cluster to which each point is allocated.
centers: A matrix of cluster centres
size: The number of points in each cluster
}
\author{
Jungsuk Kwac
}
\examples{
x = matrix(rnorm(1000),100,10)
akmeans(x) ## euclidean distance based

akmeans(x,d.metric=2,ths3=0.8,mode=3) ## cosine distance based
}
\keyword{ adaptive kmeans }
