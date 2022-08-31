QuickMatrix = function(textCorpus) {
  
  #Document Matrix
  DTM <<- DocumentTermMatrix(textCorpus)
  DTM <<- as.matrix(DTM)
  DTM <<- t(DTM)
  
}
