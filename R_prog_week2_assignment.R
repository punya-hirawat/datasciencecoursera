pollutantmean = function(directory, pollutant, id=1:332){
  file_list=list.files(directory, full.names=TRUE)
  
  df_all = data.frame()
  
  for(i in id){
    x = read.csv(file_list[i])
    df = rbind(df, x)
  }
  
  df_pollutant = df[, pollutant]
  
  mean(df_pollutant, na.rm=TRUE)
}


complete = function(directory, id=1:332){
  df = data.frame()
  file_list = list.files(directory, full.names = TRUE)
  ids = list()
  no_of_nona = list()
  
  for(i in id){
    x = read.csv(file_list[i])
    x_sub = subset(x, !is.na(sulfate)&!is.na(nitrate))
    new_row = c(i, nrow(x_sub))
    df = rbind(df, new_row)
  }
  
  colnames(df) = c('id', 'nobs')
  return(df)
}

