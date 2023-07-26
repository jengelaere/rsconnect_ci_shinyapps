message("--- Add packages ---\n")

install.packages("rsconnect")
install.packages("shiny")
install.packages("remotes")
remotes::install_github("MaelTheuliere/COGiter", auth_token = Sys.getenv("PAT"))

message("--- Add server ---\n")

rsconnect::setAccountInfo(
  name = Sys.getenv("SHINYAPPS_NAME"),
  token = Sys.getenv("SHINYAPPS_TOKEN"),
  secret = Sys.getenv("SHINYAPPS_SECRET")
)

message("--- Deploying app ---\n")
appFiles <- "app.R"

# options(rsconnect.packrat = TRUE)
# options(rsconnect.http.trace = TRUE)
# options(rsconnect.check.certificate = FALSE)

rsconnect::deployApp(
  appDir = ".",
  account = Sys.getenv("SHINYAPPS_NAME"),
  appFiles = appFiles,
  appName = Sys.getenv("NAME_OF_APP"),
  lint = FALSE,
  forceUpdate = TRUE
)
