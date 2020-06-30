if (!require("newsanchor")) {
  install.packages("newsanchor")
  library(newsanchor)
}
getwd()
setwd("./data/") 
api <- "d50e5ad739064e7aa6742025b2d9f265"
gv.api = function () {
  assign("my_key", api, envir = .GlobalEnv)
}
gv.api()
data = get_everything("republican+democrat", sources = NULL, domains = NULL,
                      exclude_domains = NULL, from = NULL, to = NULL, language = "en",
                      sort_by = "publishedAt", page = 1, page_size = 100, api_key = my_key)
data = data$results_df

for(i in c(1:5)) {
  Sys.sleep((60*60)*24)
  data = rbind(data.frame(data), data.frame(get_everything("republican+democrat", sources = NULL, domains = NULL,
                                                                                       exclude_domains = NULL, from = NULL, to = NULL, language = "en",
                                                                                       sort_by = "publishedAt", page = 1, page_size = 100, api_key = my_key)$results_df))
  write.csv(data, 'data.csv')
}

str(data)
