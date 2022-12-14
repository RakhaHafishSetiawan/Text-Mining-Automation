ToChart  = function(DTF){
  
  if (!require("magrittr")) 
    install.packages("magrittr")
  library(magrittr, quietly = TRUE)
  
  if (!require("ggplot2")) 
    install.packages("ggplot2")
  library(ggplot2, quietly = TRUE)
  
  amount <<- readline(prompt = "Enter Amount of Top Occurences ")
  amount <<- as.integer(amount)
  
  DTF %>%
    select(everything()) %>%
    head(amount) %>%
    ggplot(aes(names.occurences., occurences)) +
    geom_col(fill = "#0039a6") +
    labs(x = "Terms", 
         y = "Frequencies") +
    theme_classic()
  
}