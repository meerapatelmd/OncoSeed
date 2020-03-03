#' Get tumorTypes Tree
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @export

get_tumor_types_tree <-
        function() {
                baseURL <- "http://oncotree.mskcc.org"
                resp <- httr::GET(paste0(baseURL, "/api/tumorTypes/tree"))
                parsed <- jsonlite::fromJSON(httr::content(resp, "text"))
                return(parsed)
        }
