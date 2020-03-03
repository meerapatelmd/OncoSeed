#' Get tumorTypes
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @export

get_tumor_types <-
        function() {
                baseURL <- "http://oncotree.mskcc.org"
                resp <- httr::GET(paste0(baseURL, "/api/tumorTypes"))
                parsed <- jsonlite::fromJSON(httr::content(resp, "text"))
                return(parsed)
        }
