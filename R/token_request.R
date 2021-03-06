#' Token Request
#'
#' @description Request a token from the server to use the api service
#' @examples
#'\dontrun{
#' token <- token_request()
#' print(token)
#'}
#' @return list
#' @export
#' @import httr
#' @importFrom jsonlite fromJSON
#'

token_request <- function(){

  res <- GET(
    "api.daeconomist.com/service/sarbr/token_pls",
    authenticate(get("user"), get("passw")),
    add_headers(token = "token_request"),
    config(ssl_verifypeer = 0)
  )

  if(class(res) != "response")
    stop(res)

  res <- fromJSON(content(res, "text", encoding = "UTF-8"))
  message(res$msg)

  return(res)
}
