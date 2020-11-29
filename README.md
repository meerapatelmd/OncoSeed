# OncoSeed 

This package makes calls to and parses responses from Memorial Sloan Kettering's OncoTree API (mskcc.oncotree.org).   


# Installation  

```  
library(devtools)  
install_github("meerapatelmd/OncoTree")  
```  

# Related Packages  

OncoTree maps to both the UMLS Metathesaurus CUI and the NCI Thesaurus Code. Other packages available to crosswalk to the UMLS MTH:  
* [setupMetathesaurus](https://github.com/meerapatelmd/setupMetathesaurus): instantiate a UMLS MySQL or Postgres database    
    - [metaoriteSQL](https://github.com/meerapatelmd/metaoriteSQL): MySQL methods   
    - [metaorite](https://github.com/meerapatelmd/metaorite): Postgres methods   
* [CallMeMaybe](https://github.com/meerapatelmd/CallMeMaybe): R interface with the UMLS API   

## Code of Conduct
  
  Please note that the OncoSeed project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.

