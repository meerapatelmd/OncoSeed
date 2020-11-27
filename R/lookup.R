#' Lookup NCI Code
#'
#' @inheritParams pkg_args
#' @param nci_code  NCI Code to lookup.
#'
#' @rdname lookup_nci
#' @family lookup functions
#' @export
#' @return a [tibble][tibble::tibble-package]

lookup_nci <-
        function(nci_code, exact_match = TRUE, level = 1:5) {
                search_tumor_types(
                        type = "nci",
                        search = nci_code,
                        exact_match = exact_match,
                        level = level
                )
        }

#' Lookup UMLS CUI
#'
#' @inheritParams pkg_args
#' @param umls_cui  UMLS CUI from the UMLS Metathesaurus to look up.
#'
#' @rdname lookup_umls
#' @family lookup functions
#' @export
#' @return a [tibble][tibble::tibble-package]

lookup_umls <-
        function(umls_cui, exact_match = TRUE, level = 1:5) {
                search_tumor_types(
                        type = "umls",
                        search = umls_cui,
                        exact_match = exact_match,
                        level = level
                )
        }
