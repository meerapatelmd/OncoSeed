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
