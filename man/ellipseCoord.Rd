% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/F_ellipseCoord.R
\name{ellipseCoord}
\alias{ellipseCoord}
\title{A function that returns the coordinates of an ellipse}
\usage{
ellipseCoord(a, b, c, quadDrop = 0.95, nPoints = 100)
}
\arguments{
\item{a, b, c}{parameters of the quadratic function a^2x+bx+c}

\item{quadDrop}{A scalar, fraction of peak height at which to draw
the ellipse}

\item{nPoints}{an integer, number of points to use to draw the ellipse}
}
\value{
a matrix with x and y coordinates of the ellipse
}
\description{
A function that returns the coordinates of an ellipse
}
