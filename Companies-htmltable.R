rm(list = ls())
library(htmltools)
###
###---------------- Summary of Sources 
###
df <- data.frame(Names = paste(LETTERS[round(runif(20, 1, 20))], 
                               LETTERS[round(runif(20, 1, 20))], 
                               LETTERS[round(runif(20, 1, 20))], 
                               LETTERS[round(runif(20, 1, 20))], 
                               LETTERS[round(runif(20, 1, 20))], " Sdn Bhd", sep = ""),
                 ID = paste(LETTERS[round(runif(20, 1, 20))], round(runif(20, 1000, 2000)), sep = ""),
                 Grade = round(runif(20, 10, 90)),
                 Rank = rep(c("Q1", "Q2", "Q3", "Q4"), each = 5),
                 Guards = round(runif(20, 500, 1500)))
df <- data.frame(No = 1:nrow(df), df)
tb <- "<input type='text' id='cfilter' onkeyup='CFunction()' placeholder='Search Name or ID'>
<table id='ctable'>
  <tr class='rowcellt' style='background: #0278ae; color: #ffffff;'>
    <th class='colhead1'>No.<button class='sortable' onclick='sortTable1()'>&#8595;</button></th>
    <th class='colhead2'>Name<button class='sortable' onclick='sortTable2()'>&#8595;</button></th>
    <th class='colhead3'>ID<button class='sortable' onclick='sortTable3()'>&#8595;</button></th>
    <th class='colhead4'>Grade<button class='sortable' onclick='sortTable4()'>&#8595;</button></th>
    <th class='colhead4'>Rank<button class='sortable' onclick='sortTable5()'>&#8595;</button></th>
    <th class='colhead5'>Guards<button class='sortable' onclick='sortTable6()'>&#8595;</button></th>
  </tr>"
for(i in 1:nrow(df)) {
  tb <- paste(tb, "<tr class='rowcell'>",
   "<td class='colcell1'>", df[i, 1], "</td>
    <td class='colcell2'><a href='index.html' target='iframe_a'>", df[i, 2], "</a></td>
    <td class='colcell3'>", df[i, 3], "</td>
    <td class='colcell4'>", df[i, 4], "</td>
    <td class='colcell5'>", df[i, 5], "</td>
    <td class='colcell6'>", df[i, 6], "</td>
  </tr>", sep = "")
}
tb <- paste(tb, "</table>", sep = "")
js <- "<script>
function CFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById('cfilter');
  filter = input.value.toUpperCase();
  table = document.getElementById('ctable');
  tr = table.getElementsByTagName('tr');
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName('td')[1];
    td2 = tr[i].getElementsByTagName('td')[2];
    if (td || td2) {
      txtValue = td.textContent || td.innerText;
      txtValue2 = td2.textContent || td2.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1 || txtValue2.toUpperCase().indexOf(filter) > -1 ) {
        tr[i].style.display = '';
      } else {
        tr[i].style.display = 'none';
      }
    }
  }
}
function sortTable1() {
  var table, rows, switching, i, x, y, shouldSwitch;
  table = document.getElementById('ctable');
  switching = true;
  while (switching) {
    switching = false;
    rows = table.rows;
    for (i = 1; i < (rows.length - 1); i++) {
      shouldSwitch = false;
      x = rows[i].getElementsByTagName('td')[0];
      y = rows[i + 1].getElementsByTagName('td')[0];
      if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
        shouldSwitch = true;
        break;
      }
    }
    if (shouldSwitch) {
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
    }
  }
}
function sortTable2() {
  var table, rows, switching, i, x, y, shouldSwitch;
  table = document.getElementById('ctable');
  switching = true;
  while (switching) {
    switching = false;
    rows = table.rows;
    for (i = 1; i < (rows.length - 1); i++) {
      shouldSwitch = false;
      x = rows[i].getElementsByTagName('td')[1];
      y = rows[i + 1].getElementsByTagName('td')[1];
      if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
        shouldSwitch = true;
        break;
      }
    }
    if (shouldSwitch) {
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
    }
  }
}
function sortTable3() {
  var table, rows, switching, i, x, y, shouldSwitch;
  table = document.getElementById('ctable');
  switching = true;
  while (switching) {
    switching = false;
    rows = table.rows;
    for (i = 1; i < (rows.length - 1); i++) {
      shouldSwitch = false;
      x = rows[i].getElementsByTagName('td')[2];
      y = rows[i + 1].getElementsByTagName('td')[2];
      if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
        shouldSwitch = true;
        break;
      }
    }
    if (shouldSwitch) {
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
    }
  }
}
function sortTable4() {
  var table, rows, switching, i, x, y, shouldSwitch;
  table = document.getElementById('ctable');
  switching = true;
  while (switching) {
    switching = false;
    rows = table.rows;
    for (i = 1; i < (rows.length - 1); i++) {
      shouldSwitch = false;
      x = rows[i].getElementsByTagName('td')[3];
      y = rows[i + 1].getElementsByTagName('td')[3];
      if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
        shouldSwitch = true;
        break;
      }
    }
    if (shouldSwitch) {
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
    }
  }
}
function sortTable5() {
  var table, rows, switching, i, x, y, shouldSwitch;
  table = document.getElementById('ctable');
  switching = true;
  while (switching) {
    switching = false;
    rows = table.rows;
    for (i = 1; i < (rows.length - 1); i++) {
      shouldSwitch = false;
      x = rows[i].getElementsByTagName('td')[4];
      y = rows[i + 1].getElementsByTagName('td')[4];
      if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
        shouldSwitch = true;
        break;
      }
    }
    if (shouldSwitch) {
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
    }
  }
}
function sortTable6() {
  var table, rows, switching, i, x, y, shouldSwitch;
  table = document.getElementById('ctable');
  switching = true;
  while (switching) {
    switching = false;
    rows = table.rows;
    for (i = 1; i < (rows.length - 1); i++) {
      shouldSwitch = false;
      x = rows[i].getElementsByTagName('td')[5];
      y = rows[i + 1].getElementsByTagName('td')[5];
      if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
        shouldSwitch = true;
        break;
      }
    }
    if (shouldSwitch) {
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
    }
  }
}
</script>"
css <- "<style>
  #cfilter {
    display: flex;
    flex-flow: row wrap;
    align-items: center;
    width: 96%;
    height: 25px;
    font-size: 12px;
    padding-left: 10px;
    padding-right: 10px;
    border: 1px solid #ddd;
    margin-bottom: 10px;
  }
  table {
    width: 100%;
    font-family: Open Sans;
    font-size: 12px;
    border-collapse: collapse;
  }
  .sortable {
    background-color: #0278ae; 
    color: #ffffff;
    border: none;
    outline:none;
    text-align: center;
    padding: -2px;
    text-decoration: none;
    display: inline-block;
    font-size: 11px;
  }
  tr:nth-child(odd) {
    background-color: #DFEEF5;
  }
  .colhead1 {
    width: 8%;
    border-bottom: 1.5px solid black;
    text-align: right;
    padding-left: 2px;
    padding-right: 2px;
  }
  .colhead2 {
    border-bottom: 1.5px solid black;
    text-align: left;
    padding-left: 10px;
    padding-right: 10px;
  }
  .colhead3 {
    width: 10%;
    border-bottom: 1.5px solid black;
    padding-left: 5px;
    padding-right: 5px;
  }
  .colhead4 {
    width: 15%;
    border-bottom: 1.5px solid black;
    padding-left: 5px;
    padding-right: 5px;
  }
  .colhead5 {
    width: 15%;
    border-bottom: 1.5px solid black;
    text-align: right;
    padding-left: 5px;
    padding-right: 5px;
  }
  .colhead6 {
    width: 15%;
    border-bottom: 1.5px solid black;
    text-align: right;
    padding-left: 5px;
    padding-right: 5px;
  }
  .colcell1 {
    text-align: right;
    padding-left: 2px;
    padding-right: 10px;
  }
  .colcell2 {
    text-align: left;
    padding-left: 10px;
    padding-right: 10px;
  }
  .colcell3 {
    text-align: center;
    padding-left: 10px;
    padding-right: 10px;
  }
  .colcell4 {
    text-align: center;
    padding-left: 10px;
    padding-right: 10px;
  }
  .colcell5 {
    text-align: center;
    padding-left: 10px;
    padding-right: 10px;
  }
  .colcell6 {
    text-align: right;
    padding-left: 10px;
    padding-right: 10px;
  }
  .rowcellt {
    height: 25px;
  }
  .rowcell {
    height: 25px;
  }
  .rowcell:hover {
    background-color: #dddddd;
  }
  a:link {
  color: black;
  text-decoration: none;
  }
  a:visited {
    color: black;
    text-decoration: none;
  }
  a:hover {
    color: #0278ae;
    text-decoration: none;
  }
  a:active {
    color: #0278ae;
    text-decoration: none;
  }
</style>"
companytable <- HTML(paste(js, css, tb, sep = ""))
html_print(companytable)
###-----------------------------------------------
# SummarySources <- function(df) {
  # summarytable <- withTags(
  #   table(HTML(
      
    # ))
  save_html(companytable, file = "companytable.html")
# }