% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/population_dynamics.R
\name{popchar}
\alias{popchar}
\title{popchar}
\usage{
popchar(species_list, fields = NULL, limit = 200, server = SERVER, ...)
}
\arguments{
\item{species_list}{A vector of scientific names (each element as "genus species").}

\item{fields}{a character vector specifying which fields (columns) should be returned. By default,
all available columns recognized by the parser are returned. This option can be used to the amount
of data transfered over the network if only certain columns are needed.}

\item{limit}{The maximum number of matches from a single API call (e.g. per species). Function
will warn if this needs to be increased, otherwise can be left as is.}

\item{server}{base URL to the FishBase API, should leave as default.}

\item{...}{additional arguments to httr::GET}
}
\description{
Table of maximum length (Lmax), weight (Wmax) and age (tmax)
}
\details{
See references for official documentation.  From FishBase.org:
This table presents information on maximum length (Lmax),
weight (Wmax) and age (tmax) from various localities where a species
occurs. The largest values from this table are also entered in the
SPECIES table. The POPCHAR table also indicates whether the Lmax,
Wmax and tmax values or various combinations thereof refer to the
same individual fish.
}
\examples{
\donttest{
popchar("Oreochromis niloticus")
}
}
\references{
http://www.fishbase.org/manual/english/fishbasethe_popchar_table.htm
}

