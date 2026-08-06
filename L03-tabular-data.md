# Tabular Data

<!-- https://hjalli.medium.com/data-tables-from-sumer-to-visicalc-7b4d7b5a2150 -->
<!-- https://www.amazon.com/gp/product/0198508417/ -->

Tabular data is the most common type of data. The ability to organize information systematically into rows and columns has been a cornerstone of data-driven decision-making for centuries. From handwritten ledgers to digital spreadsheets, tabular data has served as the foundation for understanding, managing, and extracting insights from a wide range of datasets.

Since tabular data is easy to understand and easy to handle, there are approaches to transform non-tabular data like text data into a tabular format. In the R realm this has been termed the **tidy data principle**. Each variable must have its own column. Each observation must have its own row. Each value must have its own cell.^[Read more about [tidy data](https://cran.r-project.org/web/packages/tidyr/vignettes/tidy-data.html).]

In this chapter, we embark on a journey through the world of tabular data, exploring its diverse facets and applications. We will delve into the art of manipulating, analyzing, and visualizing data in this familiar format, unlocking the potential it holds for uncovering hidden patterns and informing critical decisions. But our exploration goes further, as we introduce you to a special and dynamic subset of tabular data that adds an extra layer of complexity and depth to your analytical toolkit — panel data.

:::: {.defbox}
::: {.titeldefbox}
<h2> Definition </h2>
:::
**Tidy data** principles are: 

- Every column is a variable.
- Every row is an observation.
- Every cell is a single value.
::::

## Types of Tabular Data 

How can there be different types of tabular data when a table always consists of rows and columns? 

### Cross-section

Look at the following example. This data is collected in 2026. Each row represents a different person (or unit), i.e. there are 6 women at different age and their respective income.

**Cross-sectional data** is a type of data collected by observing many subjects (such as individuals, firms, countries, or regions) at the one point or period of time. It can answer questions about *levels*: "How many people are poor in 2023 in Germany?" and questions about *differences*: "How are men and women affected by poverty?".


```{=html}
<div id="usbbtaevfz" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#usbbtaevfz table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#usbbtaevfz thead, #usbbtaevfz tbody, #usbbtaevfz tfoot, #usbbtaevfz tr, #usbbtaevfz td, #usbbtaevfz th {
  border-style: none;
}

#usbbtaevfz p {
  margin: 0;
  padding: 0;
}

#usbbtaevfz .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#usbbtaevfz .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#usbbtaevfz .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#usbbtaevfz .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#usbbtaevfz .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#usbbtaevfz .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#usbbtaevfz .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#usbbtaevfz .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#usbbtaevfz .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#usbbtaevfz .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#usbbtaevfz .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#usbbtaevfz .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#usbbtaevfz .gt_spanner_row {
  border-bottom-style: hidden;
}

#usbbtaevfz .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#usbbtaevfz .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#usbbtaevfz .gt_from_md > :first-child {
  margin-top: 0;
}

#usbbtaevfz .gt_from_md > :last-child {
  margin-bottom: 0;
}

#usbbtaevfz .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#usbbtaevfz .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#usbbtaevfz .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#usbbtaevfz .gt_row_group_first td {
  border-top-width: 2px;
}

#usbbtaevfz .gt_row_group_first th {
  border-top-width: 2px;
}

#usbbtaevfz .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#usbbtaevfz .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#usbbtaevfz .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#usbbtaevfz .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#usbbtaevfz .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#usbbtaevfz .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#usbbtaevfz .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#usbbtaevfz .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#usbbtaevfz .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#usbbtaevfz .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#usbbtaevfz .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#usbbtaevfz .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#usbbtaevfz .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#usbbtaevfz .gt_left {
  text-align: left;
}

#usbbtaevfz .gt_center {
  text-align: center;
}

#usbbtaevfz .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#usbbtaevfz .gt_font_normal {
  font-weight: normal;
}

#usbbtaevfz .gt_font_bold {
  font-weight: bold;
}

#usbbtaevfz .gt_font_italic {
  font-style: italic;
}

#usbbtaevfz .gt_super {
  font-size: 65%;
}

#usbbtaevfz .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#usbbtaevfz .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#usbbtaevfz .gt_indent_1 {
  text-indent: 5px;
}

#usbbtaevfz .gt_indent_2 {
  text-indent: 10px;
}

#usbbtaevfz .gt_indent_3 {
  text-indent: 15px;
}

#usbbtaevfz .gt_indent_4 {
  text-indent: 20px;
}

#usbbtaevfz .gt_indent_5 {
  text-indent: 25px;
}

#usbbtaevfz .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}

#usbbtaevfz div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="6" class="gt_heading gt_title gt_font_normal" style>Cross-sectional socio-economic data.</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>Different units. Same time.</td>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Id">Id</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Year">Year</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Gender">Sex</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Age">Age of Individual</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Education">Number of Years of Education</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Income">Gross Income from Main Job/Year</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="Id" class="gt_row gt_right" style="background-color: #C1CDCD; color: #000000;">1</td>
<td headers="Year" class="gt_row gt_right" style="background-color: #C1CDCD; color: #000000;">2026</td>
<td headers="Gender" class="gt_row gt_center">[1] female</td>
<td headers="Age" class="gt_row gt_right">59</td>
<td headers="Education" class="gt_row gt_center">10.5</td>
<td headers="Income" class="gt_row gt_center">28678.94</td></tr>
    <tr><td headers="Id" class="gt_row gt_right" style="background-color: #D4BFB3; color: #000000;">2</td>
<td headers="Year" class="gt_row gt_right" style="background-color: #C1CDCD; color: #000000;">2026</td>
<td headers="Gender" class="gt_row gt_center">[1] female</td>
<td headers="Age" class="gt_row gt_right">60</td>
<td headers="Education" class="gt_row gt_center">10.5</td>
<td headers="Income" class="gt_row gt_center">19962.29</td></tr>
    <tr><td headers="Id" class="gt_row gt_right" style="background-color: #E3B09A; color: #000000;">3</td>
<td headers="Year" class="gt_row gt_right" style="background-color: #C1CDCD; color: #000000;">2026</td>
<td headers="Gender" class="gt_row gt_center">[1] female</td>
<td headers="Age" class="gt_row gt_right">61</td>
<td headers="Education" class="gt_row gt_center">10.5</td>
<td headers="Income" class="gt_row gt_center">22227.68</td></tr>
    <tr><td headers="Id" class="gt_row gt_right" style="background-color: #EFA081; color: #000000;">4</td>
<td headers="Year" class="gt_row gt_right" style="background-color: #C1CDCD; color: #000000;">2026</td>
<td headers="Gender" class="gt_row gt_center">[1] female</td>
<td headers="Age" class="gt_row gt_right">62</td>
<td headers="Education" class="gt_row gt_center">10.5</td>
<td headers="Income" class="gt_row gt_center">22100.38</td></tr>
    <tr><td headers="Id" class="gt_row gt_right" style="background-color: #F89069; color: #000000;">5</td>
<td headers="Year" class="gt_row gt_right" style="background-color: #C1CDCD; color: #000000;">2026</td>
<td headers="Gender" class="gt_row gt_center">[1] female</td>
<td headers="Age" class="gt_row gt_right">63</td>
<td headers="Education" class="gt_row gt_center">10.5</td>
<td headers="Income" class="gt_row gt_center">23157.92</td></tr>
    <tr><td headers="Id" class="gt_row gt_right" style="background-color: #FF7F50; color: #000000;">6</td>
<td headers="Year" class="gt_row gt_right" style="background-color: #C1CDCD; color: #000000;">2026</td>
<td headers="Gender" class="gt_row gt_center">[1] female</td>
<td headers="Age" class="gt_row gt_right">74</td>
<td headers="Education" class="gt_row gt_center">10.0</td>
<td headers="Income" class="gt_row gt_center">    0.00</td></tr>
  </tbody>
  
</table>
</div>
```

### Repeated cross-section

Cross-sectional survey data are data for a single point in time. Repeated cross-sectional data are created where a survey (or measurement) is administered to a new sample of interviewees at successive time points. For an annual survey, this means that respondents in one year will be different people to those in a prior year. Such data can either be analysed cross-sectionally, by looking at one survey year, or combined for analysis over time.

This type of data can answer questions about *trends*: "Has poverty increased or decreased?".


```{=html}
<div id="lgnmsvbhdg" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#lgnmsvbhdg table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#lgnmsvbhdg thead, #lgnmsvbhdg tbody, #lgnmsvbhdg tfoot, #lgnmsvbhdg tr, #lgnmsvbhdg td, #lgnmsvbhdg th {
  border-style: none;
}

#lgnmsvbhdg p {
  margin: 0;
  padding: 0;
}

#lgnmsvbhdg .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#lgnmsvbhdg .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#lgnmsvbhdg .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#lgnmsvbhdg .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#lgnmsvbhdg .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#lgnmsvbhdg .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#lgnmsvbhdg .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#lgnmsvbhdg .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#lgnmsvbhdg .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#lgnmsvbhdg .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#lgnmsvbhdg .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#lgnmsvbhdg .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#lgnmsvbhdg .gt_spanner_row {
  border-bottom-style: hidden;
}

#lgnmsvbhdg .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#lgnmsvbhdg .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#lgnmsvbhdg .gt_from_md > :first-child {
  margin-top: 0;
}

#lgnmsvbhdg .gt_from_md > :last-child {
  margin-bottom: 0;
}

#lgnmsvbhdg .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#lgnmsvbhdg .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#lgnmsvbhdg .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#lgnmsvbhdg .gt_row_group_first td {
  border-top-width: 2px;
}

#lgnmsvbhdg .gt_row_group_first th {
  border-top-width: 2px;
}

#lgnmsvbhdg .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#lgnmsvbhdg .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#lgnmsvbhdg .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#lgnmsvbhdg .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#lgnmsvbhdg .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#lgnmsvbhdg .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#lgnmsvbhdg .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#lgnmsvbhdg .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#lgnmsvbhdg .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#lgnmsvbhdg .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#lgnmsvbhdg .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#lgnmsvbhdg .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#lgnmsvbhdg .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#lgnmsvbhdg .gt_left {
  text-align: left;
}

#lgnmsvbhdg .gt_center {
  text-align: center;
}

#lgnmsvbhdg .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#lgnmsvbhdg .gt_font_normal {
  font-weight: normal;
}

#lgnmsvbhdg .gt_font_bold {
  font-weight: bold;
}

#lgnmsvbhdg .gt_font_italic {
  font-style: italic;
}

#lgnmsvbhdg .gt_super {
  font-size: 65%;
}

#lgnmsvbhdg .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#lgnmsvbhdg .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#lgnmsvbhdg .gt_indent_1 {
  text-indent: 5px;
}

#lgnmsvbhdg .gt_indent_2 {
  text-indent: 10px;
}

#lgnmsvbhdg .gt_indent_3 {
  text-indent: 15px;
}

#lgnmsvbhdg .gt_indent_4 {
  text-indent: 20px;
}

#lgnmsvbhdg .gt_indent_5 {
  text-indent: 25px;
}

#lgnmsvbhdg .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}

#lgnmsvbhdg div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="6" class="gt_heading gt_title gt_font_normal" style>Repeated cross-sectional data.</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>Different units. Different time.</td>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Id">Id</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Year">Year</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Gender">Sex</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Age">Age of Individual</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Education">Number of Years of Education</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Income">Gross Income from Main Job/Year</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="Id" class="gt_row gt_right" style="background-color: #C1CDCD; color: #000000;">1</td>
<td headers="Year" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">2025</td>
<td headers="Gender" class="gt_row gt_center">[1] female</td>
<td headers="Age" class="gt_row gt_right">59</td>
<td headers="Education" class="gt_row gt_center">10.5</td>
<td headers="Income" class="gt_row gt_center">28678.94</td></tr>
    <tr><td headers="Id" class="gt_row gt_right" style="background-color: #D4BFB3; color: #000000;">2</td>
<td headers="Year" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">2025</td>
<td headers="Gender" class="gt_row gt_center">[1] female</td>
<td headers="Age" class="gt_row gt_right">60</td>
<td headers="Education" class="gt_row gt_center">10.5</td>
<td headers="Income" class="gt_row gt_center">19962.29</td></tr>
    <tr><td headers="Id" class="gt_row gt_right" style="background-color: #E3B09A; color: #000000;">3</td>
<td headers="Year" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">2025</td>
<td headers="Gender" class="gt_row gt_center">[1] female</td>
<td headers="Age" class="gt_row gt_right">61</td>
<td headers="Education" class="gt_row gt_center">10.5</td>
<td headers="Income" class="gt_row gt_center">22227.68</td></tr>
    <tr><td headers="Id" class="gt_row gt_right" style="background-color: #EFA081; color: #000000;">4</td>
<td headers="Year" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">2026</td>
<td headers="Gender" class="gt_row gt_center">[1] female</td>
<td headers="Age" class="gt_row gt_right">62</td>
<td headers="Education" class="gt_row gt_center">10.5</td>
<td headers="Income" class="gt_row gt_center">22100.38</td></tr>
    <tr><td headers="Id" class="gt_row gt_right" style="background-color: #F89069; color: #000000;">5</td>
<td headers="Year" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">2026</td>
<td headers="Gender" class="gt_row gt_center">[1] female</td>
<td headers="Age" class="gt_row gt_right">63</td>
<td headers="Education" class="gt_row gt_center">10.5</td>
<td headers="Income" class="gt_row gt_center">23157.92</td></tr>
    <tr><td headers="Id" class="gt_row gt_right" style="background-color: #FF7F50; color: #000000;">6</td>
<td headers="Year" class="gt_row gt_right" style="background-color: #808080; color: #FFFFFF;">2026</td>
<td headers="Gender" class="gt_row gt_center">[1] female</td>
<td headers="Age" class="gt_row gt_right">74</td>
<td headers="Education" class="gt_row gt_center">10.0</td>
<td headers="Income" class="gt_row gt_center">    0.00</td></tr>
  </tbody>
  
</table>
</div>
```

### Time series 
<!-- An example of a temporal line chart is total number of students per year at Viadrina in the [next chapter][The long run trend].    -->

Time series is data on a single subject at multiple points in time. Most commonly, data is collected at successive equally spaced points in time e.g. daily, annually. If data is collected annually, it's likely to be a survey study. If data is collected more frequently, e.g. daily, it's likely to be meteorology or finance. A time series is very frequently plotted via a *run chart* (which is a temporal line chart). 

Time series data can answer questions about *trends*: "Is there a seasonal component in unemployment?".


```{=html}
<div id="zufxrghfus" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#zufxrghfus table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#zufxrghfus thead, #zufxrghfus tbody, #zufxrghfus tfoot, #zufxrghfus tr, #zufxrghfus td, #zufxrghfus th {
  border-style: none;
}

#zufxrghfus p {
  margin: 0;
  padding: 0;
}

#zufxrghfus .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#zufxrghfus .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#zufxrghfus .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#zufxrghfus .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#zufxrghfus .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#zufxrghfus .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#zufxrghfus .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#zufxrghfus .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#zufxrghfus .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#zufxrghfus .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#zufxrghfus .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#zufxrghfus .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#zufxrghfus .gt_spanner_row {
  border-bottom-style: hidden;
}

#zufxrghfus .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#zufxrghfus .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#zufxrghfus .gt_from_md > :first-child {
  margin-top: 0;
}

#zufxrghfus .gt_from_md > :last-child {
  margin-bottom: 0;
}

#zufxrghfus .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#zufxrghfus .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#zufxrghfus .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#zufxrghfus .gt_row_group_first td {
  border-top-width: 2px;
}

#zufxrghfus .gt_row_group_first th {
  border-top-width: 2px;
}

#zufxrghfus .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#zufxrghfus .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#zufxrghfus .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#zufxrghfus .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#zufxrghfus .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#zufxrghfus .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#zufxrghfus .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#zufxrghfus .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#zufxrghfus .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#zufxrghfus .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#zufxrghfus .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#zufxrghfus .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#zufxrghfus .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#zufxrghfus .gt_left {
  text-align: left;
}

#zufxrghfus .gt_center {
  text-align: center;
}

#zufxrghfus .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#zufxrghfus .gt_font_normal {
  font-weight: normal;
}

#zufxrghfus .gt_font_bold {
  font-weight: bold;
}

#zufxrghfus .gt_font_italic {
  font-style: italic;
}

#zufxrghfus .gt_super {
  font-size: 65%;
}

#zufxrghfus .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#zufxrghfus .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#zufxrghfus .gt_indent_1 {
  text-indent: 5px;
}

#zufxrghfus .gt_indent_2 {
  text-indent: 10px;
}

#zufxrghfus .gt_indent_3 {
  text-indent: 15px;
}

#zufxrghfus .gt_indent_4 {
  text-indent: 20px;
}

#zufxrghfus .gt_indent_5 {
  text-indent: 25px;
}

#zufxrghfus .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}

#zufxrghfus div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="3" class="gt_heading gt_title gt_font_normal" style>Time series data.</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="3" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>Same units. Different time.</td>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Id">Id</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Time">Time</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Income">Gross Income from Main Job/Year</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="Id" class="gt_row gt_right">1</td>
<td headers="Time" class="gt_row gt_left" style="background-color: #FEEDDE; color: #000000;">2023 Q1</td>
<td headers="Income" class="gt_row gt_center">28678.94</td></tr>
    <tr><td headers="Id" class="gt_row gt_right">1</td>
<td headers="Time" class="gt_row gt_left" style="background-color: #FDD0A2; color: #000000;">2023 Q2</td>
<td headers="Income" class="gt_row gt_center">19962.29</td></tr>
    <tr><td headers="Id" class="gt_row gt_right">1</td>
<td headers="Time" class="gt_row gt_left" style="background-color: #FDAE6B; color: #000000;">2023 Q3</td>
<td headers="Income" class="gt_row gt_center">22227.68</td></tr>
    <tr><td headers="Id" class="gt_row gt_right">1</td>
<td headers="Time" class="gt_row gt_left" style="background-color: #FD8D3C; color: #000000;">2023 Q4</td>
<td headers="Income" class="gt_row gt_center">22100.38</td></tr>
    <tr><td headers="Id" class="gt_row gt_right">1</td>
<td headers="Time" class="gt_row gt_left" style="background-color: #E6550D; color: #FFFFFF;">2024 Q1</td>
<td headers="Income" class="gt_row gt_center">23157.92</td></tr>
    <tr><td headers="Id" class="gt_row gt_right">1</td>
<td headers="Time" class="gt_row gt_left" style="background-color: #A63603; color: #FFFFFF;">2024 Q2</td>
<td headers="Income" class="gt_row gt_center">    0.00</td></tr>
  </tbody>
  
</table>
</div>
```

### Panel data

**Panel data** are observations for the same subjects over time. Subjects can be people, households, firms or countries. Panel data are a subset of longitudinal data. Key components are the panel identifier: person (id) and time (year). Every row is a person-year combination (so called *long format*).

<center>
<iframe width="560" height="315" src="https://www.youtube.com/embed/JNd4p6dRrPI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

With panel data we know the time-ordering of events. Panel data allow to identify causal effects under weaker assumptions (compared to cross-sectional data). Panel data can answer questions about *change*: "How many people went in and out of poverty?".


```{=html}
<div id="fummtbvqjn" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#fummtbvqjn table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#fummtbvqjn thead, #fummtbvqjn tbody, #fummtbvqjn tfoot, #fummtbvqjn tr, #fummtbvqjn td, #fummtbvqjn th {
  border-style: none;
}

#fummtbvqjn p {
  margin: 0;
  padding: 0;
}

#fummtbvqjn .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#fummtbvqjn .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#fummtbvqjn .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#fummtbvqjn .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#fummtbvqjn .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#fummtbvqjn .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#fummtbvqjn .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#fummtbvqjn .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#fummtbvqjn .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#fummtbvqjn .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#fummtbvqjn .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#fummtbvqjn .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#fummtbvqjn .gt_spanner_row {
  border-bottom-style: hidden;
}

#fummtbvqjn .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#fummtbvqjn .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#fummtbvqjn .gt_from_md > :first-child {
  margin-top: 0;
}

#fummtbvqjn .gt_from_md > :last-child {
  margin-bottom: 0;
}

#fummtbvqjn .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#fummtbvqjn .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#fummtbvqjn .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#fummtbvqjn .gt_row_group_first td {
  border-top-width: 2px;
}

#fummtbvqjn .gt_row_group_first th {
  border-top-width: 2px;
}

#fummtbvqjn .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#fummtbvqjn .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#fummtbvqjn .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#fummtbvqjn .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#fummtbvqjn .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#fummtbvqjn .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#fummtbvqjn .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#fummtbvqjn .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#fummtbvqjn .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#fummtbvqjn .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#fummtbvqjn .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#fummtbvqjn .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#fummtbvqjn .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#fummtbvqjn .gt_left {
  text-align: left;
}

#fummtbvqjn .gt_center {
  text-align: center;
}

#fummtbvqjn .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#fummtbvqjn .gt_font_normal {
  font-weight: normal;
}

#fummtbvqjn .gt_font_bold {
  font-weight: bold;
}

#fummtbvqjn .gt_font_italic {
  font-style: italic;
}

#fummtbvqjn .gt_super {
  font-size: 65%;
}

#fummtbvqjn .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#fummtbvqjn .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#fummtbvqjn .gt_indent_1 {
  text-indent: 5px;
}

#fummtbvqjn .gt_indent_2 {
  text-indent: 10px;
}

#fummtbvqjn .gt_indent_3 {
  text-indent: 15px;
}

#fummtbvqjn .gt_indent_4 {
  text-indent: 20px;
}

#fummtbvqjn .gt_indent_5 {
  text-indent: 25px;
}

#fummtbvqjn .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}

#fummtbvqjn div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="6" class="gt_heading gt_title gt_font_normal" style>Panel data.</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>Different units. Different time.</td>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Id">Id</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Year">Year</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Gender">Sex</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Age">Age of Individual</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Education">Number of Years of Education</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Income">Gross Income from Main Job/Year</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="Id" class="gt_row gt_right" style="background-color: #C1CDCD; color: #000000;">1</td>
<td headers="Year" class="gt_row gt_right" style="background-color: #C1CDCD; color: #000000;">2021</td>
<td headers="Gender" class="gt_row gt_center">[1] female</td>
<td headers="Age" class="gt_row gt_right">59</td>
<td headers="Education" class="gt_row gt_center">10.5</td>
<td headers="Income" class="gt_row gt_center">28678.94</td></tr>
    <tr><td headers="Id" class="gt_row gt_right" style="background-color: #C1CDCD; color: #000000;">1</td>
<td headers="Year" class="gt_row gt_right" style="background-color: #E9A88E; color: #000000;">2022</td>
<td headers="Gender" class="gt_row gt_center">[1] female</td>
<td headers="Age" class="gt_row gt_right">60</td>
<td headers="Education" class="gt_row gt_center">10.5</td>
<td headers="Income" class="gt_row gt_center">19962.29</td></tr>
    <tr><td headers="Id" class="gt_row gt_right" style="background-color: #C1CDCD; color: #000000;">1</td>
<td headers="Year" class="gt_row gt_right" style="background-color: #FF7F50; color: #000000;">2023</td>
<td headers="Gender" class="gt_row gt_center">[1] female</td>
<td headers="Age" class="gt_row gt_right">61</td>
<td headers="Education" class="gt_row gt_center">10.5</td>
<td headers="Income" class="gt_row gt_center">22227.68</td></tr>
    <tr><td headers="Id" class="gt_row gt_right" style="background-color: #FF7F50; color: #000000;">2</td>
<td headers="Year" class="gt_row gt_right" style="background-color: #C1CDCD; color: #000000;">2021</td>
<td headers="Gender" class="gt_row gt_center">[1] female</td>
<td headers="Age" class="gt_row gt_right">62</td>
<td headers="Education" class="gt_row gt_center">10.5</td>
<td headers="Income" class="gt_row gt_center">22100.38</td></tr>
    <tr><td headers="Id" class="gt_row gt_right" style="background-color: #FF7F50; color: #000000;">2</td>
<td headers="Year" class="gt_row gt_right" style="background-color: #E9A88E; color: #000000;">2022</td>
<td headers="Gender" class="gt_row gt_center">[1] female</td>
<td headers="Age" class="gt_row gt_right">63</td>
<td headers="Education" class="gt_row gt_center">10.5</td>
<td headers="Income" class="gt_row gt_center">23157.92</td></tr>
    <tr><td headers="Id" class="gt_row gt_right" style="background-color: #FF7F50; color: #000000;">2</td>
<td headers="Year" class="gt_row gt_right" style="background-color: #FF7F50; color: #000000;">2023</td>
<td headers="Gender" class="gt_row gt_center">[1] female</td>
<td headers="Age" class="gt_row gt_right">74</td>
<td headers="Education" class="gt_row gt_center">10.0</td>
<td headers="Income" class="gt_row gt_center">    0.00</td></tr>
  </tbody>
  
</table>
</div>
```

<!-- Different types of data can answer different types of questions: -->
<!-- -   Levels: How many people are poor in 2016 in Germany? -->
<!-- -   Trends: Has poverty increased or decreased? -->
<!-- -   Change: How many people went in and out of poverty? -->
