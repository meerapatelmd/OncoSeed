#' Search level
#' @param level vector of length 1
#' @param exact_match If it sets to true, it will only return one element array.
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @export

search_level <-
        function(level, exact_match = TRUE) {
                search_tumor_types(type = "level",
                                   search = level,
                                   exact_match = exact_match)

        }





#' Search mainType
#' @param search character vector of length one of the query
#' @param exact_match If it sets to true, it will only return one element array.
#' @param levels vector of integers ranging from 1:5
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @export

search_main_type <-
        function(search, exact_match = TRUE, levels = 1:5) {
                search_tumor_types(type = "mainType",
                                   search = search,
                                   exact_match = exact_match,
                                   levels = levels)

        }





#' Search Name
#' @param search character vector of length one of the query
#' @param exact_match If it sets to true, it will only return one element array.
#' @param levels vector of integers ranging from 1:5
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @export

search_name <-
        function(search, exact_match = TRUE, levels = 1:5) {
                search_tumor_types(type = "name",
                                   search = search,
                                   exact_match = exact_match,
                                   levels = levels)

        }





#' Search NCI
#' @param search character vector of length one of the query
#' @param exact_match If it sets to true, it will only return one element array.
#' @param levels vector of integers ranging from 1:5
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @export

search_nci <-
        function(search, exact_match = TRUE, levels = 1:5) {
                search_tumor_types(type = "nci",
                                   search = search,
                                   exact_match = exact_match,
                                   levels = levels)

        }





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

                search <- stringr::str_replace_all(search, pattern = " ", "%20")

                baseURL <- "http://oncotree.mskcc.org"
                resp <- httr::GET(paste0(baseURL, "/api/tumorTypes/search/", type, "/", search),
                                  query = list(exactMatch = exact_match,
                                               levels = levels))
                parsed <- jsonlite::fromJSON(httr::content(resp, "text"))
                return(parsed)
        }





#' Search UMLS
#' @param search character vector of length one of the query
#' @param exact_match If it sets to true, it will only return one element array.
#' @param levels vector of integers ranging from 1:5
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @export

search_umls <-
        function(search, exact_match = TRUE, levels = 1:5) {
                search_tumor_types(type = "umls",
                                   search = search,
                                   exact_match = exact_match,
                                   levels = levels)

        }





