QuickConvert = function(Location) {
  
  #Check Library
  if (!require("tm")) 
    install.packages("tm")
  
  if (!require("pdftools")) 
    install.packages("pdftools")
  
  #Activate Library
  library(tm)
  library(pdftools)
  
  #Insert Location
  text <- pdf_text(Location)
  
  #Create Corpus
  textCorpus <<- Corpus(VectorSource(text))

}




