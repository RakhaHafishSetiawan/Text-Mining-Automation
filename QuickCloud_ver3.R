QuickCloud3 = function(Location) {
  
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
  
  #User input
  value <<- readline(prompt = "Enter Number of Top Occurences ")
  value <<- as.integer(value)
  
  height <<- readline(prompt = "Enter Plot Height ")
  height <<- as.integer(height)
  
  width <<- readline(prompt = "Enter Plot Width ")
  width <<- as.integer(width)
  
  #Wordcloud Plot
  wordcloud(head(names(occurences), value), head(occurences, value), scale = c(height, width))
  
}
