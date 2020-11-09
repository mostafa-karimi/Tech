library(htmltools)
###
###---------------- Summary of Sources 
###
SummarySources <- function(df) {
  summarytable <- withTags(
    table(HTML(
      "<style>
      table {
        font-family: Open Sans;
        font-size: 12px;
        border-collapse: collapse;
      } 
      .colhead1 {
        width: 100%;
        border-bottom: 1.5px solid black;
        text-align: left;
        padding-left: 10px;
      } 
      .colhead2 {
        width: 100%;
        border-bottom: 1.5px solid black;
        text-align: right;
        padding-right: 10px;
      }
      .colcell1 {
        text-align: left;
        padding-left: 10px;
      }
      .colcell2 {
        text-align: right;
        padding-right: 10px;
      }
      .rowcell {
        height: 25px;
      }
      </style>"),
      tr(class="rowcell", style="background: #0278ae; color: #ffffff;",
         th(class="colhead1", "Source"),
         th(class="colhead2", "Counts")
      ),
      tr(class="rowcell",
         td(class="colcell1", df[1, 1]),
         td(class="colcell2", df[1, 2])
      ),
      tr(class="rowcell", style="background: #DFEEF5;",
         td(class="colcell1", df[2, 1]),
         td(class="colcell2", df[2, 2])
      ),
      tr(class="rowcell",
         td(class="colcell1", df[3, 1]),
         td(class="colcell2", df[3, 2])
      ),
      tr(class="rowcell", style="background: #DFEEF5;",
         td(class="colcell1", df[4, 1]),
         td(class="colcell2", df[4, 2])
      ),
      tr(class="rowcell",
         td(class="colcell1", df[5, 1]),
         td(class="colcell2", df[5, 2])
      ),
      tr(class="rowcell", style="background: #DFEEF5;",
         td(class="colcell1", df[6, 1]),
         td(class="colcell2", df[6, 2])
      )
    ))
  save_html(summarytable, file = "summarysources.html")
}
###
###---------------- Summary of Guards 
###
SummaryGuards <- function(df) {
  summarytable <- withTags(
    table(HTML(
      "<style>
      table {
        font-family: Open Sans;
        font-size: 12px;
        border-collapse: collapse;
      } 
      .colhead1 {
        width: 100%;
        border-bottom: 1.5px solid black;
        text-align: left;
        padding-left: 10px;
      } 
      .colhead2 {
        width: 100%;
        border-bottom: 1.5px solid black;
        text-align: right;
        padding-right: 10px;
      }
      .colcell1 {
        text-align: left;
        padding-left: 10px;
      }
      .colcell2 {
        text-align: right;
        padding-right: 10px;
      }
      .rowcell {
        height: 25px;
      }
      </style>"),
      tr(class="rowcell", style="background: #0278ae; color: #ffffff;",
         th(class="colhead1", "Guards"),
         th(class="colhead2", "Counts")
      ),
      tr(class="rowcell",
         td(class="colcell1", df[1, 1]),
         td(class="colcell2", df[1, 2])
      ),
      tr(class="rowcell", style="background: #DFEEF5;",
         td(class="colcell1", df[2, 1]),
         td(class="colcell2", df[2, 2])
      ),
      tr(class="rowcell",
         td(class="colcell1", df[3, 1]),
         td(class="colcell2", df[3, 2])
      ),
      tr(class="rowcell", style="background: #DFEEF5;",
         td(class="colcell1", df[4, 1]),
         td(class="colcell2", df[4, 2])
      ),
      tr(class="rowcell",
         td(class="colcell1", df[5, 1]),
         td(class="colcell2", df[5, 2])
      ),
      tr(class="rowcell", style="background: #DFEEF5;",
         td(class="colcell1", df[6, 1]),
         td(class="colcell2", df[6, 2])
      )
    ))
  save_html(summarytable, file = "summaryguards.html")
}