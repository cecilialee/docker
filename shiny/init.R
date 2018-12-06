
rfile <- commandArgs(trailingOnly = TRUE)[1]

repos <- yaml::yaml.load_file(rfile)

# Download all repos and config .Renviron--------------------------------------
for (app in names(repos)) {
  config <- repos[[app]]
  # Clone repo
  branch <- config$branch
  if (is.null(branch)) branch <- "master"
  clone_cmd <- sprintf(
    "git clone -b %s %s %s", branch, config$src, app 
  )
  system(clone_cmd)
  # Create .Renviron for the app
  envs <- config$envs
  envs <- mapply(function(x, y) paste(x, y, sep = "="),
    names(envs), unlist(envs))
  envs <- paste(envs, collapse = "\n")
  write(envs, file = sprintf("%s/.Renviron", app))
}

