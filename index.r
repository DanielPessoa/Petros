library(readxl)
library("jsonlite")
library(dplyr)
library(tidyr)

setwd("~/Documentos/R")

aba1 <- read_excel("Exercicio.xlsx", sheet = "Contas")
aba2 <- read_excel("Exercicio.xlsx", sheet = "DePara")

planilha <- aba2 %>%
  inner_join(aba1)
planilha <- rename(planilha, Contas = Conta)

planilha2 <- split(planilha, planilha$Cliente)

json <- toJSON(planilha2, dataframe = 'columns' , simplifyVector= TRUE, pretty=TRUE)

write(json, "test.json")


