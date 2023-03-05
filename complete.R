##PART 1
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



##PART 2
complete = function(directory, id=1:332){
  df_complete = data.frame()
  file_list = list.files(directory, full.names = TRUE)
  
  for(i in id){
    x = read.csv(file_list[i])
    x_sub = subset(x, !is.na(sulfate)&!is.na(nitrate))
    new_row = c(i, nrow(x_sub))
    df_complete = rbind(df_complete, new_row)
  }
  
  colnames(df_complete) = c('id', 'nobs')
  return(df_complete)
}