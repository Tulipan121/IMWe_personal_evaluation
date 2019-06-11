library("stringr")
library("googlesheets")
library("dplyr")
library("knitr")

preberi_tabelo <- gs_url("https://docs.google.com/spreadsheets/d/1bD-dNmeMfOCTzCigJZdEAqiT9sTSp2y84PI1f7WS-WY/edit#gid=1035681780")

data <- gs_read(gs_title("Personal evaluation (Responses)"), 1)

question <- "What would you like to say to "

personal_eval <- str_which(names(data), question)

teamer <- function(k)  {names(data)[k] %>%
   str_replace(question, "") %>%
   str_replace("[[:punct:]]", "")}

which_additional_question <- str_which(names(data), ":")

additional_questions <- as.vector(names(data)[which_additional_question])

about_oneself <- as.integer(str_which(names(data), "Thoughts about yourself"))

together <- c()

for(x in personal_eval) {
      
      together <- c(together,"", paste("# ", teamer(x)), "")
      
      together <- c(together, "", paste("``` {r out.width = '350px', echo = FALSE}
knitr::include_graphics('", teamer(x), ".png')", " 
```", sep = ""))
      
      the_rest <- personal_eval[personal_eval != x]
      
      which_form <- which(data$`Please select yourself` == teamer(x))
      
      together <- c(together, "", "### Thoughts about yourself", "", as.character(data[which_form, x]))
      
      for (y in the_rest) {
         new_commentator <- which(data$`Please select yourself` == teamer(y))            
         
         together <- c(together, "", paste("### From ", teamer(y)))
         
         new_comment <- data[new_commentator, x]
         
         together <- c(together, "", new_comment)
         
      }
      
      personal_question <- str_which(names(data), paste(teamer(x), ":", sep = ""))
      
      for(z in personal_question) {
         together <- c(together, "", paste("### ", str_replace(names(data)[z], paste(teamer(x), ": ", sep = ""), "")))
         
         responder <- which(!is.na(as.vector(data[, z])))
         
         for(w in responder){
            
            together <- c(together, "", paste("**", data$`Please select yourself`[w],"**: ", data[w, z], sep = "")) 
            
         }
         
         
         
      }
            
}

together <- {c("---
output:
   word_document:
      reference_docx: 'Personal evaluation IMWe.docx'
---",
      "", together)}

writeLines(as.character(together), "evaluation.Rmd", useBytes = TRUE)
