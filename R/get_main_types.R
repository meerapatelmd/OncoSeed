#' Get mainTypes (the latest stable version)
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @export

get_main_types <-
        function() {
                baseURL <- "http://oncotree.mskcc.org"
                resp <- httr::GET(paste0(baseURL, "/api/mainTypes"),
                                  query = list(version="oncotree_latest_stable"))
                parsed <- jsonlite::fromJSON(httr::content(resp, "text"))
                return(parsed)
        }
