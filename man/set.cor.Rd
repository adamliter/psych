\name{set.cor}
\alias{set.cor}
\alias{mat.regress}
\title{Set Correlation and Multiple Regression from raw or matrix input}
\description{
 Finds Cohen's Set Correlation between a predictor set of variables (x) and a criterion set (y).  Also finds multiple correlations between x variables and each of the y variables. Will work with either raw data or a correlation matrix.  A set of covariates (z) can be partialled from the x and y sets. 
}
\usage{
set.cor(y, x,data, z=NULL,n.obs=NULL,use="pairwise")
mat.regress(y, x,data, z=NULL,n.obs=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{a matrix or data.frame of correlations or, if not square, of raw data}
  \item{y}{ either  the column numbers of the y set  (e.g., c(2,4,6) or the column names of the y set (e.g., c("Flags","Addition")}
  \item{x}{ either the column numbers of the x set (e.g., c(1,3,5) or the column names of the x set (e.g. c("Cubes","PaperFormBoard") }
  \item{n.obs}{If specified, then confidence intervals, etc. are calculated, not needed if raw data are given}
  \item{z}{the column names or numbers of the set of covariates}
  \item{use}{find the correlations "pairwise" (default) or just use "complete" cases (to match the lm function)}
  
}
\details{
 Cohen (1982) introduced the set correlation, a multivariate generalization of the multiple correlation to measure the overall relationship between two sets of variables. It is an application of canoncial correlation (Hotelling, 1936) and \eqn{1 - \prod(1-\rho_i^2)} where \eqn{\rho_i^2} is the squared canonical correlation.  Set correlation is the amount of shared variance (R2) between two sets of variables.  With the addition of a third, covariate set, set correlation will find multivariate R2, as well as partial and semi partial R2.  (The semi and bipartial options are not yet implemented.) Details on set correlation may be found in Cohen (1982) Cohen, Cohen, Aiken and West (2003).  
 
 Unfortunately, the R2 is sensitive to one of the canonical correlations being very high.  An alternative, T2, is the proportion of additive variance and is the average of the squared canonicals.  (Cohen et al., 2003), see also Cramer and Nicewander (1979).  This average, because it includes some very small canonical correlations, will tend to be too small.  Cohen et al. admonition is appropriate: "In the final analysis, however, analysts must be guided by their substantive and methodological conceptions of the problem at hand in their choice of a measure of association." ( p613). 
 
  Although it is more common to calculate multiple regression and canonical correlations from the raw data, it is,  of course, possible to do so from a set of correlations.  In this case, the input to the function is a square covariance or correlation matrix, as well as the column numbers (or names) of the x (predictor) and  y (criterion) variables. The program will find the correlations if given raw data.
  
  The output is a set of multiple correlations, one for each dependent variable in the y set, as well as the set of canonical correlations.
  
  An additional output is the R2 found using Cohen's set correlation (Cohen, 1982).  This is a measure of how much variance and the x and y set share.  
  
  A typical use in the SAPA project is to form item composites by clustering or factoring (see \code{\link{ICLUST}}, \code{\link{principal}}), extract the clusters from these results (\code{\link{factor2cluster}}), and then form the composite correlation matrix using \code{\link{cluster.cor}}.  The variables in this reduced matrix may then be used in multiple R procedures using mat.regress.

 Although the overall matrix can have missing correlations, the correlations in the subset of the matrix used for prediction must exist.
 
 If the number of observations is entered, then the conventional confidence intervals, statistical significance, and shrinkage estimates are  reported.
 
 If the input is rectangular, correlations are found from the data.
 
 The print function reports t and p values for the beta weights, the summary function just reports the beta weights.
}
\value{
  
  \item{beta }{the beta weights for each variable in X for each variable in Y}
  \item{R}{The multiple R for each equation (the amount of change a unit in the predictor set leads to in the criterion set). }
  \item{R2 }{The multiple R2 (\% variance acounted for) for each equation}
  \item{setR2}{The multiple R2 of the set correlation between the x and y sets}.

}

\author{William Revelle \cr
       
Maintainer: William Revelle <revelle@northwestern.edu> }
\references{
J. Cohen (1982)  Set correlation as a general mulitivariate data-analytic method. Multivariate Behavioral Research, 17(3):301-341.


J. Cohen, P. Cohen, S.G. West, and L.S. Aiken. (2003) Applied multiple regression/correlation analysis for the behavioral sciences. L. Erlbaum Associates, Mahwah, N.J., 3rd ed edition.

H. Hotelling. (1936) Relations between two sets of variates. Biometrika 28(3/4):321-377.


E.Cramer and W A. Nicewander (1979) Some symmetric, invariant measures of multivariate association. Psychometrika, 44:43-54.



}

\note{As of April 30, 2011, the order of x and y was swapped in the call to be consistent with the general y ~ x  syntax of the lm and aov functions. In addition, the primary name of the function was switched to set.cor from mat.regress to reflect the estimation of the set correlation. 

The denominator degrees of freedom for the set correlation does not match that reported by Cohen et al., 2003 in the example on page 621 but does match the formula on page 615, except for the typo in the estimation of F (see Cohen 1982).   The difference seems to be that they are adding in a correction factor of df 2 = df2 + df1.  

}

\seealso{\code{\link{cluster.cor}}, \code{\link{factor2cluster}},\code{\link{principal}},\code{\link{ICLUST}}, \code{link{cancor}} and cca in the yacca package.  }
\examples{

#the Kelly data from Hoteling
kelly <- structure(list(speed = c(1, 0.4248, 0.042, 0.0215, 0.0573), power = c(0.4248, 
1, 0.1487, 0.2489, 0.2843), words = c(0.042, 0.1487, 1, 0.6693, 
0.4662), symbols = c(0.0215, 0.2489, 0.6693, 1, 0.6915), meaningless = c(0.0573, 
0.2843, 0.4662, 0.6915, 1)), .Names = c("speed", "power", "words", 
"symbols", "meaningless"), class = "data.frame", row.names = c(NA, 
-5L))

kelly

set.cor(1:2,3:5,kelly)

set.cor(y=c(7:9),x=c(1:6),data=Thurstone,n.obs=213)
#now try partialling out some variables
set.cor(y=c(7:9),x=c(1:3),z=c(4:6),data=Thurstone) #compare with the previous

set.cor(x=c("gender","education"),y=c("SATV","SATQ"),data=sat.act) # regression from raw data
}
\keyword{ models }% at least one, from doc/KEYWORDS
\keyword{multivariate }% __ONLY ONE__ keyword per line