baseURL <- "http://oncotree.mskcc.org"


#' Get mainTypes (the latest stable version)
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @export
#' @return a [tibble][tibble::tibble-package]
#' @family get functions
#' @rdname get_main_types

get_main_types <-
  function(version = "oncotree_latest_stable") {
    # baseURL <- "http://oncotree.mskcc.org"
    resp <- httr::GET(sprintf("%s/api/mainTypes", baseURL),
      query = list(version = version)
    )
    parsed <- jsonlite::fromJSON(httr::content(resp, "text"))
    return(parsed)
  }





#' Get OncoTree Versions
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @export
#' @return a [tibble][tibble::tibble-package]
#' @family get functions
#' @rdname get_oncotree_versions

get_oncotree_versions <-
  function() {

    resp <- httr::GET(sprintf("%s/api/versions", baseURL))
    parsed <- jsonlite::fromJSON(httr::content(resp, "text"))
    return(parsed)
  }





#' Get tumorTypes Tree
#' @description
#' Return all available tumor types.
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @export
#' @return a [tibble][tibble::tibble-package]
#' @family get functions
#' @rdname get_tumor_types_tree

get_tumor_types_tree <-
  function(version = "oncotree_latest_stable") {

    resp <- httr::GET(sprintf("%s/api/tumorTypes/tree", baseURL), query = list(version = version))
    parsed <- jsonlite::fromJSON(httr::content(resp, "text"))
    return(parsed)
  }


#' Get tumorTypes
#' @description
#' Return all available tumor types as a list.
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @export
#' @return a [tibble][tibble::tibble-package]
#' @family get functions
#' @rdname get_tumor_types


get_tumor_types <-
  function(version = "oncotree_latest_stable") {

    resp <- httr::GET(sprintf("%s/api/tumorTypes", baseURL), query = list(version = version))
    parsed <- jsonlite::fromJSON(httr::content(resp, "text"))
    return(parsed)
  }


#' Get tumorTypes Text
#' @description
#' Return tumor types in plain text format
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @export
#' @return a [tibble][tibble::tibble-package]
#' @family get functions
#' @rdname get_tumor_types_txt

get_tumor_types_txt <-
  function(version = "oncotree_latest_stable") {

    resp <- httr::GET(sprintf("%s/api/tumor_types.txt", baseURL), query = list(version = version))
    parsed <- httr::content(resp)
    return(parsed)
  }
