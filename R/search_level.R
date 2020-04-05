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
