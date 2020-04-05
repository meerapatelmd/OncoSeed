#' Search Tumor Types
#' @param type one of "code", "name", "mainType", "level", "nci", "umls", or "color"
#' @param search character vector of length one of the query
#' @param exact_match If it sets to true, it will only return one element array.
#' @param levels vector of integers ranging from 1:5
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @export

search_tumor_types <-
        function(type, search, exact_match = TRUE, levels = 1:5) {
                ##Massaging parameters
                levels <- paste(levels, collapse = ",")
                baseURL <- "http://oncotree.mskcc.org"
                resp <- httr::GET(paste0(baseURL, "/api/tumorTypes/search/", type, "/", search),
                                  query = list(exactMatch = exact_match,
                                               levels = levels))
                parsed <- jsonlite::fromJSON(httr::content(resp, "text"))
                return(parsed)
        }
