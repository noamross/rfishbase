#' species_info
#' 
#' Provide wrapper to work with species lists. 
#' @param species_list A vector of scientific names (each element as "genus species"). 
#' @param limit The maximum number of matches from a single API call (e.g. per species). Function
#'   will warn if this needs to be increased, otherwise can be left as is. 
#' @param server base URL to the FishBase API, should leave as default.
#' @param fields a character vector specifying which fields (columns) should be returned. By default,
#'  all available columns recognized by the parser are returned. This option can be used to the amount
#'  of data transfered over the network if only certain columns are needed.  
#' @param ... additional arguments to httr::GET
#' @return a data.frame with rows for species and columns for the fields returned by the query (FishBase 'species' table)
#' @details 
#' The Species table is the heart of FishBase. This function provides a convenient way to 
#' query, tidy, and assemble data from that table given an entire list of species.
#' For details, see: http://www.fishbase.org/manual/english/fishbasethe_species_table.htm
#' 
#' Species scientific names are defined according to fishbase taxonomy and nomenclature.
#' 
#' @aliases species species_info
#' @examples
#' \donttest{
#' 
#' species_info(c("Labroides bicolor", "Bolbometopon muricatum")) 
#' species_info(c("Labroides bicolor", "Bolbometopon muricatum"), fields = species_fields$habitat) 
#' 
#' }
#' @import httr tidyr dplyr
#' @export species species_info
species <- endpoint("species", tidy_table = tidy_species_table)

species_info <- species


## helper routine for tidying species data
tidy_species_table <- function(df) {
  # Convert columns to the appropriate class
  for(n in names(df)){
    class <- as.character(species_meta[[n, "class"]])
    if(class=="Date"){
      df[[n]] <- as.Date(df[[n]])
    } else if(class=="logical"){
      df[[n]] <- as(as.numeric(as.character(df[[n]])), class)
    } else {
      df[[n]] <- as(as.character(df[[n]]), class) # Will warn when class=integer & value is NA
    }
  }
  ## Drop useless columns. 
  # keep <- species_meta$field[species_meta$keep]
  # keep_id <- match(keep, names(df))
  # keep_id <- keep_id[!is.na(keep_id)]
  # df <- df[,keep_id]
  
  ## Rename columns (pick names to indicate units on numeric values?)
  
  ## Arrange columns
  
  df
}
## Metadata used by tidy_species_table
meta <- system.file("metadata", "species.csv", package="rfishbase")
species_meta <- read.csv(meta)
row.names(species_meta) <- species_meta$field



#' A list of the species_fields available
#'
#' @name species_fields
#' @docType data
#' @author Carl Boettiger \email{carl@@ropensci.org}
#' @references \url{FishBase.org}
#' @keywords data
NULL



