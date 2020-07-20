
#' Run the '01 hello' example application
#' @return no return value
#' @importFrom shiny runApp
#' @export
run_07_widgets <- function(){

  shinyTmpDir <- tempdir()
  
  setwd(shinyTmpDir)
  
  # copy server.R, ui.R, www etc.
  shinyUiDir <- system.file("examples", "07_widgets", package = "shiny")
  shinyUiFiles <- list.files(path = shinyUiDir, full.names = TRUE)
  sapply(shinyUiFiles, function(x){
        file.copy(from = x, to = file.path(shinyTmpDir, basename(x)),
            overwrite = TRUE, recursive = TRUE)}
  )
  runApp(appDir = shinyTmpDir)
}

#' Run the '06 tabsets' example application
#' @return no return value
#' @importFrom shiny runApp
#' @export
run_04_mpg <- function(){
  
  shinyTmpDir <- tempdir()
  
  setwd(shinyTmpDir)
  
  # copy server.R, ui.R, www etc.
  shinyUiDir <- system.file("examples", "04_mpg", package = "shiny")
  shinyUiFiles <- list.files(path = shinyUiDir, full.names = TRUE)
  sapply(shinyUiFiles, function(x){
        file.copy(from = x, to = file.path(shinyTmpDir, basename(x)),
            overwrite = TRUE, recursive = TRUE)}
  )
  runApp(appDir = shinyTmpDir)
}
