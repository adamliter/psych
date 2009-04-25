\name{headtail}
\alias{headtail}
\title{Combine calls to head and tail}
\description{A quick way to show the first and last n lines of a data.frame, matrix, or a textt object.  Just a pretty call to \code{\link{head}} and \code{\link{tail}}
}
\usage{
headtail(x,hlength=4,tlength=4,digits=2)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ A matrix or data frame or free text}
  \item{hlength}{The number of lines at the beginning to show}
  \item{tlength}{The number of lines at the end to show}
  \item{digits}{Round off the data to digits}
}

\value{The first hlength and last tlength lines of a matrix or data frame with an ellipsis in between. If the input is neither a matrix nor data frame, the output will be the first hlength and last tlength lines. 
  
}


\seealso{ \code{\link{head}} and \code{\link{tail}}}

\examples{
x <- matrix(sample(10,1000,TRUE),ncol=5)
headtail(x,4,8)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ multivariate }
