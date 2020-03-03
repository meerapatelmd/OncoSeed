#'Lookup an OncoTree Code
#'@param oncotree_code vector of length 1
#'@importFrom readr read_csv
#'@importFrom rubix mutate_all_na_to_blank
#'@importFrom dplyr filter
#'@export

lookup_oncotree_code_locally <-
        function(oncotree_code) {

                if (file.exists("~/GitHub/MSK/biblio-tech/CATALOGUE/OncoTree/oncotree_tumor_types_gathered.csv")) {
                        x <- readr::read_csv("~/GitHub/MSK/biblio-tech/CATALOGUE/OncoTree/oncotree_tumor_types_gathered.csv", col_types = cols(.default = "c")) %>%
                                dplyr::filter(ONCOTREE_CODE == oncotree_code)
                } else {
                        temp_file <- tempfile(fileext = ".csv")
                        download.file("https://github.mskcc.org/KnowledgeManagement/biblio-tech/raw/master/CATALOGUE/OncoTree/oncotree_tumor_types_gathered.csv", destfile = temp_file, quiet = TRUE)
                        x <- readr::read_csv(temp_file, col_types = cols(.default = "c")) %>%
                                rubix::mutate_all_na_to_blank() %>%
                                dplyr::filter(ONCOTREE_CODE == oncotree_code)
                        unlink(temp_file)
                }

                return(x)
        }
