#!/usr/bin/env Rscript



data = "/home/Cloud_Platform/Cloud_Platform/public/text_upload_file/c680dad2-1911-4702-92d6-4b786c0122c0.txt"
metadata = "NULL"
top_n = 1
keep_filtered_as_others = FALSE
statistical_value_type = "mad"
color_variable = "NULL"
manual_color_vector = "Pastel1"
yvariable = ""
xvariable = ""
melted = FALSE
title = "NULL"
x_label = "NULL"
y_label = "NULL"
color_variable_order = "NULL"
xvariable_order = "NULL"
y_add = 0
group_variable = "NULL"
add_point = FALSE
yaxis_scale_mode = "NULL"
facet_variable = "NULL"
facet_variable_order = "NULL"
stat = "identity"
bar_mode = "stack"
facet_nrow = NULL
facet_ncol = NULL
error_bar_variable = "NULL"
base_font_size = 11
legend.position = "right"
xtics = TRUE
xtics_angle = 60
ytics = TRUE
facet_scales = "free"
coordinate_flip = FALSE
add_text = FALSE
add_bar_link = FALSE
font_path = "NULL"
width = 10
height = 9
outputprefix = "/home/Cloud_Platform/Cloud_Platform/public/user/_visitors/result_output/Bar_plot132023_06_13_19_21_02_841051/d2614460-e246-4cd9-87f6-ce8cdc447f54"
outputpictype = "pdf"
saveppt = FALSE
savehtml = FALSE

# For all users
# devtools::install_github("Tong-Chen/ImageGP")
# For chinese users
# devtools::install_git("https://gitee.com/ct5869/ImageGP.git")
library(ImageGP)
library(dplyr)
library(ggplot2)
library(RColorBrewer)
library(ggbeeswarm)
library(tidyr)
library(htmlwidgets)
library(plotly)
if (data == "") {
  script = sub(".*=", "", commandArgs()[4])
  #print(script)
  system(paste(script, "-h"))
  stop("At least -f is required!")
}



if (outputprefix == "") {
  outputprefix = data
}

filename = paste0(outputprefix, '.bar.', outputpictype)

color_variable_order = sp_string2vector(color_variable_order)
xvariable_order = sp_string2vector(xvariable_order)
facet_variable_order = sp_string2vector(facet_variable_order)
manual_color_vector = sp_string2vector(manual_color_vector)

cat(sp_current_time(), "Starting...\n")

sp_barplot(
  data = data,
  metadata = metadata,
  color_variable = color_variable,
  yvariable = yvariable,
  xvariable = xvariable,
  melted = melted,
  title = title,
  x_label = x_label,
  y_label = y_label,
  top_n = top_n,
  statistical_value_type = statistical_value_type,
  keep_filtered_as_others = keep_filtered_as_others,
  color_variable_order = color_variable_order,
  xvariable_order = xvariable_order,
  y_add = y_add,
  group_variable = group_variable,
  add_point = add_point,
  yaxis_scale_mode = yaxis_scale_mode,
  facet_variable = facet_variable,
  stat = stat,
  bar_mode = bar_mode,
  facet_variable_order = facet_variable_order,
  facet_nrow = facet_nrow,
  facet_ncol = facet_ncol,
  error_bar_variable = error_bar_variable,
  base_font_size = base_font_size,
  legend.position = legend.position,
  xtics = xtics,
  xtics_angle = xtics_angle,
  ytics = ytics,
  manual_color_vector = manual_color_vector,
  facet_scales = facet_scales,
  coordinate_flip = coordinate_flip,
  add_text = add_text,
  add_bar_link = add_bar_link,
  font_path = font_path,
  height = height,
  width = width,
  filename = filename,
  saveppt = saveppt,
  savehtml = savehtml
)
