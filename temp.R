rm(list = ls())
###----------------
library(htmltools)
library(ggplot2)
library(plotly)
library(DT)
###----------------
df <- datatable(iris[1:5, 1:2], 
                options = list(pageLength = NULL,
                               searchable = FALSE,
                               lengthMenu = NULL),
                rownames = NULL,
                filter = "none",
                width = "10%",
                selection = "none")
df
p <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) +
  geom_bar(position = "dodge")
g <- ggplotly(p)
# df
# g
tbl <- div(id="df", df)
html_print(tbl)
# save_html(tbl, file = "table.html")
###----------------
dt <- round(rnorm(10), 2)
doc0 <- div(
  "Text!",
  strong("Tags!"),
  HTML("Verbatim <span>HTML!</span>"),
  NULL,
  tagList(
    "Lists!"
  ),
  withTags(
    ul(
      li("Item one"),
      # for (i in 1:3) {
      #   li(paste("Item two", dt[i]))
      # },
      li("Item two")
    )
  ),
  div(paste(dt, collapse = ", ")),
  div(id="df", df),
  g,
  br(),
  br(),
  tag("input type='button' value='Submit'", ""),
  div(HTML("I like <u>turtles</u>"))
)
# html_print(doc0)
# index <- browsable(doc0)
# is.browsable(index)
# print(index, browse = is.browsable(index))
# print(index)
# browseURL("index.html")

