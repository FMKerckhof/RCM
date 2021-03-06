% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/F_deviances.R
\name{deviances}
\alias{deviances}
\title{A function to extract deviances for all dimension,
including after filtering on confounders}
\usage{
deviances(rcm, squaredSum = FALSE)
}
\arguments{
\item{rcm}{an object of the RCM class}

\item{squaredSum}{a boolean, should total deviance be returned?

Total deviances can be deceptive and not correspond to the differences in
log-likelihood. As the dispersion is different for each model.
 To compare models it is better to compare likelihoods.}
}
\value{
If Sum is FALSE, a named array of deviance residuals of the
 independence model and all models with dimension 1 to k, including after
 filtering on confounders. Otherwise a table with total deviances (the sum of
 squared deviance residuals), deviance explained and cumulative deviance
 explained.
}
\description{
A function to extract deviances for all dimension,
including after filtering on confounders
}
