#' Get OncoTree Versions
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @export

get_oncotree_versions <-
        function() {
                baseURL <- "http://oncotree.mskcc.org"
                resp <- httr::GET(paste0(baseURL, "/api/versions"))
                parsed <- jsonlite::fromJSON(httr::content(resp, "text"))
                return(parsed)
        }
