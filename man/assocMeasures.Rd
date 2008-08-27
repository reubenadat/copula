\name{AssocMeasures}
% \docType{methods}
\alias{kendallsTau}
\alias{spearmansRho}
\alias{tailIndex}
\alias{calibKendallsTau}
\alias{calibSpearmansRho}
  
\alias{kendallsTau-methods}
\alias{kendallsTau,ANY-method}
\alias{kendallsTau,copula-method}
\alias{kendallsTau,archmCopula-method}
\alias{kendallsTau,amhCopula-method}
\alias{kendallsTau,claytonCopula-method}
\alias{kendallsTau,frankCopula-method}
\alias{kendallsTau,gumbelCopula-method}
\alias{kendallsTau,normalCopula-method}
\alias{kendallsTau,tCopula-method}
\alias{kendallsTau,fgmCopula-method}
\alias{kendallsTau,plackettCopula-method}

\alias{spearmansRho-methods}
\alias{spearmansRho,ANY-method}
\alias{spearmansRho,copula-method}
\alias{spearmansRho,normalCopula-method}
\alias{spearmansRho,tCopula-method}
\alias{spearmansRho,claytonCopula-method}
\alias{spearmansRho,gumbelCopula-method}
\alias{spearmansRho,frankCopula-method}
\alias{spearmansRho,fgmCopula-method}
\alias{spearmansRho,plackettCopula-method}

\alias{tailIndex-methods}
\alias{tailIndex,ANY-method}
\alias{tailIndex,copula-method}
\alias{tailIndex,evCopula-method}
\alias{tailIndex,claytonCopula-method}
\alias{tailIndex,frankCopula-method}
\alias{tailIndex,gumbelCopula-method}
\alias{tailIndex,normalCopula-method}
\alias{tailIndex,tCopula-method}

\alias{calibKendallsTau-methods}
\alias{calibKendallsTau,ANY-method}
\alias{calibKendallsTau,copula-method}
\alias{calibKendallsTau,ellipCopula-method}
\alias{calibKendallsTau,normalCopula-method}
\alias{calibKendallsTau,tCopula-method}
\alias{calibKendallsTau,claytonCopula-method}
\alias{calibKendallsTau,gumbelCopula-method}
\alias{calibKendallsTau,plackettCopula-method}

\alias{calibSpearmansRho-methods}
\alias{calibSpearmansRho,ANY-method}
\alias{calibSpearmansRho,copula-method}
\alias{calibSpearmansRho,ellipCopula-method}
\alias{calibSpearmansRho,normalCopula-method}
\alias{calibSpearmansRho,tCopula-method}
\alias{calibSpearmansRho,claytonCopula-method}
\alias{calibSpearmansRho,gumbelCopula-method}


\title{Dependence measures for copulas}
\description{
  These functions compute Kendall's Tau, Spearman's Rho, and the tail
  dependence index for bivariate copulas. Calibration is the inverse function: it
  calibrates the copula parameter given the value of Kendall's Tau or Spearman's Rho.
}
\usage{
kendallsTau(copula, ...)
spearmansRho(copula, ...)
tailIndex(copula, ...)
calibKendallsTau(copula, tau)
calibSpearmansRho(copula, rho)
}
\arguments{
  \item{copula}{ a \code{"copula"} object. }
  \item{tau}{ a numerical value of Kendall's Tau in [-1, 1]. }
  \item{rho}{ a numerical value of Spearman's Rho in [-1, 1]. }
  \item{\dots}{ currently nothing. }
}
\details{
  When there is no closed-form expression for Tau or Rho, numerical
  integration from the \code{adapt} package is used. For closed-form
  expressions, see Frees and Valdez (1998).

  The calibration function in fact returns a moment estimate of the
  parameter for single-parameter copulas.
}
\references{
  E.W. Frees and E.A. Valdez (1998).Understanding relationships using
  copulas.  \emph{North American Actuarial Journal}, 2:1--25.
}
\examples{
gumbel.cop <- gumbelCopula(3)
kendallsTau(gumbel.cop)
spearmansRho(gumbel.cop)
tailIndex(gumbel.cop)

## let us compute the sample versions
x <- rcopula(gumbel.cop, 200)
cor(x, method = "kendall")
cor(x, method = "spearman")
## compare with the true parameter value 3
calibKendallsTau(gumbel.cop, cor(x, method="kendall")[1,2])
calibSpearmansRho(gumbel.cop, cor(x, method="spearman")[1,2])
}
\keyword{multivariate}