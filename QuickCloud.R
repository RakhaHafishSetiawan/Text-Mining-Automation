QuickCloud = function(Location) {
  
  #Check Library
  if (!require("tm")) 
    install.packages("tm")
  
  if (!require("pdftools")) 
    install.packages("pdftools")
  
  if (!require("wordcloud"))
    install.packages("wordcloud")
  
  #Activate Library
  library(tm)
  library(pdftools)
  library(wordcloud)
  
  #Insert Location
  text <- pdf_text(Location)
  
  #Create Corpus
  textCorpus <<- Corpus(VectorSource(text))
  
  #Corpus Cleaning
  textCorpus <<- tm_map(textCorpus, tolower)
  textCorpus <<- tm_map(textCorpus, removePunctuation)
  textCorpus <<- tm_map(textCorpus, stripWhitespace)
  textCorpus <<- tm_map(textCorpus, removeWords, stopwords("en"))
  
  #Document Matrix
  DTM <<- DocumentTermMatrix(textCorpus)
  DTM <<- as.matrix(DTM)
  DTM <<- t(DTM)
  
  #Matrix Sortation
  occurences <<- rowSums(DTM)
  occurences <<- sort(occurences, decreasing = TRUE)
    
  #Wordcloud Plot
  wordcloud(head(names(occurences), 25), head(occurences,25), scale = c(2,1))
  
  
}