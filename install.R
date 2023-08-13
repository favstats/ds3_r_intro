## install these packages
if(!"pacman" %in% installed.packages()){
  install.packages("pacman")
}
pacman::p_load(tidyverse, janitor, rmarkdown, knitr)
