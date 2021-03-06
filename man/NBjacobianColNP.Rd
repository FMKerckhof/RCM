% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/F_NBjacobianColNP.R
\name{NBjacobianColNP}
\alias{NBjacobianColNP}
\title{Jacobian function for the estimation of a third degree GLM}
\usage{
NBjacobianColNP(beta, X, reg, theta, muMarg)
}
\arguments{
\item{beta}{vector of any length}

\item{X}{the data vector of length n}

\item{reg}{a nxlength(beta) regressor matrix}

\item{theta}{a scalar, the overdispersion}

\item{muMarg}{the offset of length n}
}
\value{
A matrix of dimension 8-by-8
}
\description{
Jacobian function for the estimation of a third degree GLM
}
