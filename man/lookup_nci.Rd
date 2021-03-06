% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lookup.R
\name{lookup_nci}
\alias{lookup_nci}
\title{Lookup NCI Code}
\usage{
lookup_nci(nci_code, exact_match = TRUE, level = 1:5)
}
\arguments{
\item{nci_code}{NCI Code to lookup.}

\item{exact_match}{If it sets to true, it will only return one element array.}
}
\value{
a [tibble][tibble::tibble-package]
}
\description{
Lookup NCI Code
}
\seealso{
Other lookup functions: 
\code{\link{lookup_umls}()}
}
\concept{lookup functions}
