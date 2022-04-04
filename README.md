
# Azure machine learning projetos
 


Nesse projetos são aplicação de modelos machine learning no R e python scripts rodar em Azure ML esse projetos práticos da formação cientista de dados da Data Science Academy.

- Modelos classificação, regressão



[![MIT License](https://img.shields.io/apm/l/atomic-design-ui.svg?)](https://github.com/tterb/atomic-design-ui/blob/master/LICENSEs)
[![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)](https://opensource.org/licenses/)
[![AGPL License](https://img.shields.io/badge/license-AGPL-blue.svg)](http://www.gnu.org/licenses/agpl-3.0)
[![author](https://img.shields.io/badge/author-RafaelGallo-red.svg)](https://github.com/RafaelGallo?tab=repositories) 
[![](https://img.shields.io/badge/python-3.7+-blue.svg)](https://www.python.org/downloads/release/python-374/) 
[![](https://img.shields.io/badge/R-3.6.0-red.svg)](https://www.r-project.org/)
[![](https://img.shields.io/badge/ggplot2-white.svg)](https://ggplot2.tidyverse.org/)
[![](https://img.shields.io/badge/dplyr-blue.svg)](https://dplyr.tidyverse.org/)
[![](https://img.shields.io/badge/readr-green.svg)](https://readr.tidyverse.org/)
[![](https://img.shields.io/badge/ggvis-black.svg)](https://ggvis.tidyverse.org/)
[![](https://img.shields.io/badge/Shiny-red.svg)](https://shiny.tidyverse.org/)
[![](https://img.shields.io/badge/plotly-green.svg)](https://plotly.com/)
[![](https://img.shields.io/badge/XGBoost-red.svg)](https://xgboost.readthedocs.io/en/stable/#)
[![](https://img.shields.io/badge/Caret-orange.svg)](https://caret.tidyverse.org/)
[![](https://img.shields.io/badge/Pandas-blue.svg)](https://pandas.pydata.org/) 
[![](https://img.shields.io/badge/Matplotlib-blue.svg)](https://matplotlib.org/)
[![](https://img.shields.io/badge/Seaborn-green.svg)](https://seaborn.pydata.org/)
[![](https://img.shields.io/badge/Matplotlib-orange.svg)](https://scikit-learn.org/stable/) 
[![](https://img.shields.io/badge/Scikit_Learn-green.svg)](https://scikit-learn.org/stable/)
[![](https://img.shields.io/badge/Numpy-white.svg)](https://numpy.org/)
[![](https://img.shields.io/badge/PowerBI-red.svg)](https://powerbi.microsoft.com/pt-br/)
![Logo](https://logowik.com/content/uploads/images/t_azure-machine-learning-service1395.jpg)

## Autores

- [@RafaelGallo](https://github.com/RafaelGallo)
# Ferramentas
 
- Python
- R
- Azure
- Azure machine learning
## Projeto

| Projeto               | Link                                                |
| ----------------- | ---------------------------------------------------------------- |
| Modelo machine learning - Classificação Iris |  |
| Modelo machine learning - Regressão Bike|  |



## Demo modelo machine learning - Azure machine learning

```bash
# Demo modelo machine learning

# Variável que controla a execução do script
Azure <- FALSE

# Execução de acordo com o valor da variável Azure
if(Azure){
  source("src/Tools.R")
  Bikes <- maml.mapInputPort(1)
  Bikes$dteday <- set.asPOSIXct(Bikes)
}else{
  source("Tools.R")
  Bikes <- read.csv("datasets/bikes.csv", sep = ",", header = T, stringsAsFactors = F )
  Bikes$dteday <- char.toPOSIXct(Bikes)
}

# Pacote dplyr
require(dplyr)
print("Dimensões do dataframe antes das operações de transformação:")
print(dim(Bikes))

# Filtrando o dataframe
Bikes <- Bikes %>% filter(cnt > 100)

print("Dimensões do dataframe após as operações de transformação:")
print(dim(Bikes))

# Biblioteca ggplot2
require(ggplot2)
qplot(dteday, cnt, data = subset(Bikes, hr == 9), geom = "line")

# Resultado
if(Azure) maml.mapOutputPort("Bikes")


```
## Documentação

[Documentação - Azure machine learning](https://docs.microsoft.com/pt-br/azure/machine-learning/)


## Screenshots

![App Screenshot](https://online.datasciencedojo.com/pluginfile.php/1/blog/post/61/Evaluationofmodel.gif)


## Suporte

Para suporte, mande um email para rafaelhenriquegallo@gmail.com ou entre em nosso canal do Slack.


## Curso formação cientista de dados

- DSA - Data science academy

