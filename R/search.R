#' Search level
#' @description
#' Return OncoTree by Level
#' @inheritParams pkg_args
#' @export
#' @importFrom dplyr bind_rows
#' @return a [tibble][tibble::tibble-package]
#' @rdname search_level
#' @family search functions

search_level <-
  function(level) {

          output <- list()
          for (i in seq_along(level)) {

                  output[[i]] <-
                            search_tumor_types(
                              type = "level",
                              search = level[i],
                              exact_match = TRUE
                            )

          }

          output %>%
                  dplyr::bind_rows()
  }





#' Search mainType
#'
#' @description
#' Search mainType. To return all possible mainTypes, see \code{\link{get_main_types}}.
#'
#' @inheritParams pkg_args
#'
#' @export
#' @return a [tibble][tibble::tibble-package]
#' @rdname search_main_type
#' @family search functions

search_main_type <-
  function(search, exact_match = TRUE, level = 1:5) {
    search_tumor_types(
      type = "mainType",
      search = search,
      exact_match = exact_match,
      level = level
    )
  }





#' Search Name
#'
#' @inheritParams pkg_args
#'
#' @export
#' @return a [tibble][tibble::tibble-package]
#' @rdname search_name
#' @family search functions

search_name <-
  function(search, exact_match = TRUE, level = 1:5) {
    search_tumor_types(
      type = "name",
      search = search,
      exact_match = exact_match,
      level = level
    )
  }


#' Search Tumor Types
#' @description
#' Primitive for all `search_*` and `lookup_*` functions in this package.
#' @inheritParams pkg_args
#' @seealso
#'  \code{\link[urltools]{url_decode}}
#'  \code{\link[httr]{GET}},\code{\link[httr]{content}},\code{\link[httr]{http_error}}
#'  \code{\link[jsonlite]{toJSON, fromJSON}}
#' @rdname search_tumor_types
#' @export
#' @importFrom urltools url_encode
#' @importFrom httr GET content http_error
#' @importFrom jsonlite fromJSON
#' @return a [tibble][tibble::tibble-package]

search_tumor_types <-
  function(type, search, exact_match = TRUE, version = "oncotree_latest_stable", level = 1:5) {

          # type <- "name"
          # search <- "breast carcinoma"
          # exact_match <- TRUE
          # level <- 1:5

    ## Massaging parameters
    level <- paste(level, collapse = ",")
    search <- urltools::url_encode(search)

    resp <- httr::GET(sprintf("%s/api/tumorTypes/search/%s/%s", baseURL, type, search),
      query = list(
        exactMatch = exact_match,
        version = version,
        level = level
      )
    )


    parsed <- jsonlite::fromJSON(httr::content(resp, "text"))


    if (httr::http_error(resp)) {

            stop(
                    sprintf(
                            "OncoTree API request <%s> failed \n[%s] %s: %s",
                            resp$request$url,
                            parsed$status,
                            parsed$error,
                            parsed$message
                    ),
                    call. = FALSE
            )
    }

    return(parsed)
  }
