#!/usr/bin/env Rscript



data = "text_upload_file/b7cd91c7-2757-4b25-9137-723a1b956f9e.txt"
library(plyr)
library(ggplot2)
library(grid)
library(ggbeeswarm)
library(ggrepel)
library(htmlwidgets)
library(plotly)

# For all users
# devtools::install_github("Tong-Chen/ImageGP")
# For chinese users
# devtools::install_git("https://gitee.com/ct5869/ImageGP.git")
library(ImageGP)


xvariable = "site"
yvariable = "depth"
label_variable = "NULL"
xvariable_order = "S3,S9,S12"
yvariable_order = "21_24,12_15,0_3"
color_variable_order = "NULL"
shape_variable_order = "NULL"
manual_color_vector = "NULL"
log_variables = "NULL"
log_transform = "log2"
size_variable = "Shannon"
shape_variable = "NULL"
color_variable = "NULL"
alpha = 1
saveppt = FALSE
savehtml = FALSE
smooth_method = "no smooth"
line_size = 1
jitter = FALSE
jitter_text = FALSE
scale_size_min = NULL
scale_size_max = NULL
coordinate_flip = FALSE
legend.position = "right"
xtics_angle = 0
title = "NULL"
x_label = "NULL"
y_label = "NULL"
label_font_size = 3
facet = "NULL"
nrow = NULL
ncol = NULL
scales = "fixed"
scale_y_way = ""
zoom_split = FALSE
zoom_xlim = "NULL"
zoom_ylim = "NULL"
width = 15
height = 9
outputprefix = "user/_visitors/result_output/scatter_plot2023-01-08_19:48:41/6dd6dcf2-5ef5-4f53-af92-4b5aefcbd450"
outputpictype = "pdf"

if (!sp.is.null(zoom_xlim) || !sp.is.null(zoom_ylim)){
  library(ggforce)
}

if(!sp.is.null(zoom_xlim)){
	zoom_xlim = as.numeric(sp_string2vector(zoom_xlim))
} else {
  zoom_xlim = NULL
}

if(!sp.is.null(zoom_ylim)){
	zoom_ylim = as.numeric(sp_string2vector(zoom_ylim))
} else {
  zoom_ylim = NULL
}

if (outputprefix == "") {
  outputprefix = data
}

filename = paste0(outputprefix, '.scatter.', outputpictype)

xvariable_order =sp_string2vector(xvariable_order)
yvariable_order =sp_string2vector(yvariable_order)
color_variable_order =sp_string2vector(color_variable_order)
shape_variable_order =sp_string2vector(shape_variable_order)
manual_color_vector =sp_string2vector(manual_color_vector)

cat(sp_current_time(), "Starting...\n")

sp_scatterplot(
  data = data,
  xvariable = xvariable,
  yvariable = yvariable,
  label_variable = label_variable,
  xvariable_order = xvariable_order,
  yvariable_order = yvariable_order,
  color_variable_order = color_variable_order,
  shape_variable_order = shape_variable_order,
  manual_color_vector = manual_color_vector,
  log_variables = log_variables,
  log_transform = log_transform,
  size_variable = size_variable,
  geom_text_repel = geom_text_repel,
  shape_variable = shape_variable,
  color_variable = color_variable,
  point_hjust = point_hjust,
  smooth_method = smooth_method,
  line_size = line_size,
  alpha = alpha,
  jitter = jitter,
  jitter_text = jitter_text,
  scale_size_min = scale_size_min,
  scale_size_max = scale_size_max,
  coordinate_flip = coordinate_flip,
  legend.position = legend.position,
  xtics_angle = xtics_angle,
  title = title,
  x_label = x_label,
  y_label = y_label,
  label_font_size = label_font_size,
  facet = facet,
  nrow = nrow,
  ncol = ncol,
  scales = scales,
  scale_y_way = scale_y_way,
  zoom_split = zoom_split,
  zoom_xlim = zoom_xlim,
  zoom_ylim = zoom_ylim,
  height = height,
  width = width,
  filename = filename,
  saveppt = saveppt,
  savehtml = savehtml
)
cat(sp_current_time(), "Success.\n")

