##PART 3
corr = function(directory, threshold = 0){
  library("stats")
  library("data.table")
  df_cor = data.table()
  
  all.files = list.files(path = directory, pattern = "*.csv")
  file_list = lapply(file.path(directory, all.files), data.table::fread)
  df_cor = rbindlist(file_list)
  
  df_cor = df_cor[complete.cases(df_cor), ]
  
  df_cor <- df_cor[, .(corr = cor(x = sulfate, y = nitrate)), by = ID][.N > threshold]
  
  return(df_cor[, corr])
}