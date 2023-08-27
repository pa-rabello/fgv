#Instalar pacotes
install.packages("officer")
install.packages("tidyverse")

# Carregar as bibliotecas
library(officer)
library(tidyverse)

# Definir o diretório que contém os arquivos Word
directory <- "C:/Users/paula/Desktop/Desktop/FGV/Dataset/Todos_arquivos/docx"

# Função para extrair o texto de um arquivo Word
extract_text_from_docx <- function(file_path) {
  doc <- read_docx(file_path)
  text <- docx_summary(doc)$text
  return(text)
}

# Obter a lista de arquivos Word no diretório
file_list <- list.files(directory, pattern = "\\.docx$", full.names = TRUE)

# Create a tibble with columns Nome_Arquivo and Conteudo_Texto
lobby <- tibble(Nome_Arquivo = character(), Conteudo_Texto = character())

# Iterate over the file list and extract text content
for (file_path in file_list) {
  file_name <- basename(file_path)
  file_content <- extract_text_from_docx(file_path)
  content <- paste(file_content, collapse = " ")  # Concatenar o texto em uma única string
  row <- tibble(Nome_Arquivo = file_name, Conteudo_Texto = content)
  lobby <- bind_rows(lobby, row)
}

