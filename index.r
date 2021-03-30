library(readxl)

path <- "~/Documentos/R/Exercicio.xlsx"

excel <- read_excel(path)

library(data.table)

dt <- as.data.table(excel)

dt_split <- split(dt)

library("jsonlite")

json <- toJSON(dt_split, matrix = "rowmajor", pretty=TRUE)

write(json, "~/Documentos/R/test.json")

?toJSON
