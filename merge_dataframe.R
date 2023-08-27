install.packages("readxl")
install.packages("dplyr")
library(dplyr)
library(readxl)

# Ajustar os nomes dos arquivos
lobby <- lobby %>% 
  mutate(Nome_Arquivo = gsub("\\..*|_attachment_1", "", Nome_Arquivo))

# Caminho do arquivo Excel
caminho_excel <- "C:/Users/paula/Desktop/Desktop/FGV/Tipo_org.xlsx"  # Substitua pelo caminho correto do arquivo Excel

# Nome da planilha no Excel
nome_planilha <- "Envios"  # Substitua pelo nome correto da planilha

# Ler os dados da planilha do Excel
dados_excel <- read_excel(caminho_excel, sheet = nome_planilha)

# Mesclar os dados do Excel com o dataframe existente
lobby <- merge(lobby, dados_excel, by = "Nome_Arquivo", all.x = TRUE)


