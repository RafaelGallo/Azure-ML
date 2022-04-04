# Este scrit contém diversas funções utilitárias usadas em diversos scripts R.
# Este arquivo deve ser compactado em um arquivo zip e importado no Azure ML.
# Para usar as funçõs deste script, utilizamos a função source() para carregar este script.

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# getwd()

set.asPOSIXct <- function(inFrame) { 
  dteday <- as.POSIXct(
    as.integer(inFrame$dteday), 
    origin = "1970-01-01")
  
  as.POSIXct(strptime(
    paste(as.character(dteday), 
          " ", 
          as.character(inFrame$hr),
          ":00:00", 
          sep = ""), 
    "%Y-%m-%d %H:%M:%S"))
}

char.toPOSIXct <-   function(inFrame) {
  as.POSIXct(strptime(
    paste(inFrame$dteday, " ", 
          as.character(inFrame$hr),
          ":00:00", 
          sep = ""), 
    "%Y-%m-%d %H:%M:%S")) }


set.asPOSIXct2 <- function(inFrame) { 
  dteday <- as.POSIXct(
    as.integer(inFrame$dteday), 
    origin = "1970-01-01")
}


fact.conv <- function(inVec){
  outVec <- as.factor(inVec)
  levels(outVec) <- c("Segunda", "Terca", "Quarta", 
                      "Quinta", "Sexta", "Sabado", 
                      "Domingo")
  outVec
}

get.date <- function(Date){
  temp <- strftime(Date, format = "%Y-%m-%d %H:%M:%S")
  substr(unlist(temp), 1, 10)
}


POSIX.date <- function(Date,Hour){
  as.POSIXct(strptime(paste(Date, " ", as.character(Hour), 
                            ":00:00", sep = ""), 
                      "%Y-%m-%d %H:%M:%S"))
}

var.log <- function(inFrame, col){
  outVec <- ifelse(inFrame[, col] < 0.1, 1, inFrame[, col])
  log(outVec)
}

month.count <- function(inFrame){
  Dteday <- strftime(inFrame$dteday, format = "%Y-%m-%dT%H:%M:%S")
  yearCount <- as.numeric(unlist(lapply(strsplit(
    Dteday, "-"), 
    function(x){x[1]}))) - 2011 
  inFrame$monthCount <- 12 * yearCount + inFrame$mnth
  inFrame
}

serList <- function(serlist){

  messages  <- c("O input nao eh uma lista ou tem comprimento maior que 0",
                 "Elementos nulos",
                 "A serializacao falhou")
  
  if(!is.list(serlist) | is.null(serlist) | 
     length(serlist) < 1) {
    warning(messages[2])
    return(data.frame(as.integer(serialize(
      list(numElements = 0, payload = NA), 
      connection = NULL))))}
  
  nObj  <-  length(serlist)
  
  tryCatch(outframe <- data.frame(payload = as.integer(
    serialize(list(numElements = nObj, 
                   payload = serlist), 
              connection=NULL))),
    error = function(e){warning(messages[3])
      outframe <- data.frame(
        payload = as.integer(serialize(list(
          numElements = 0, payload = NA), 
          connection=NULL)))}
  )
  outframe
}


unserList <- function(inlist){
  
  messages <- c("A coluna payload esta missing ou com tipo incorreto de dado",
                "Erro ao executar esta funcao",
                "A funcao gerou uma lista vazia")
  
  if(!is.integer(inlist$payload) | dim(inlist)[1] < 2 | 
     is.null(inlist$payload)){
    warning(messages[1]) 
    return(NA)
  }
  
  tryCatch(outList <- unserialize(as.raw(inlist$payload)),
           error = function(e){warning(messages[2]); return(NA)})
  
  if(outList$numElements < 1 ) {warning(messages[3]); 
    return(NA)}
  
  outList$payload
}