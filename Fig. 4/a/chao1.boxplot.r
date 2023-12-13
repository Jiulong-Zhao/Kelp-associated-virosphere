#!/usr/bin/env Rscript



data = "text_upload_file/883478b3-499b-4511-80b1-aad1736cafd3.txt"
melted = TRUE
xvariable = "Group"
yvariable = "Chao1"
legend_variable = "NULL"
xtics_angle = 0
legend_variable_order = "NULL"
legend_variable_cut = "NULL"
xvariable_order = "S3S9_0_3,Others"
xvariable_cut = "NULL"
y_add = 0
ylim = "NULL"
yaxis_scale_mode = "NULL"
notch = FALSE
outlier = FALSE
out_scale = 1.05
legend.position = "right"
manual_color_vector = "#FCE724,#440153"
violin = FALSE
violin_nb = FALSE
scale_violin = "width"
ID_var = ""
jitter = FALSE
jitter_bp = TRUE
dotplot = FALSE
dotplot_bp = FALSE
group_variable_for_line = "NULL"
group_variable_order_for_line = "NULL"
coordinate_flip = FALSE
facet_variable = "NULL"
facet_variable_order = "NULL"
x_label = "NULL"
y_label = "NULL"
title = "NULL"
facet_nrow = NULL
facet_ncol = NULL
facet_scales = "fixed"
facet_singlecell_style = FALSE
gene = "NULL"
metadata = "NULL"
filename = "NULL"
statistics = TRUE
statistical_threshold_for_letters = 0.05
width = 8
height = 9
debug = FALSE
outputprefix = "user/_visitors/result_output/boxplot2023-01-08_21:04:23/291b972c-7dce-47a0-97c3-81883c9cd94b"
outputpictype = "pdf"

if (data == "") {
  script = sub(".*=", "", commandArgs()[4])
  #print(script)
  system(paste(script, "-h"))
  stop("At least -f is required!")
}


# For all users
# devtools::install_github("Tong-Chen/ImageGP")
# For chinese users
# devtools::install_git("https://gitee.com/ct5869/ImageGP.git")
library(ImageGP)
library(ggplot2)
library(reshape2)
library(scales)
library(ggbeeswarm)
library(multcompView)
library(dplyr)
library(htmlwidgets)
library(plotly)
if (outputprefix == "") {
  outputprefix = data
}

filename = paste0(outputprefix,  ".boxplot.", outputpictype)

legend_variable_order = sp_string2vector(legend_variable_order)
group_variable_order_for_line = sp_string2vector(group_variable_order_for_line)
legend_variable_cut = sp_string2vector(legend_variable_cut)
xvariable_order = sp_string2vector(xvariable_order)
xvariable_cut = sp_string2vector(xvariable_cut)
ID_var= sp_string2vector(ID_var)
facet_variable_order = sp_string2vector(facet_variable_order)
manual_color_vector = sp_string2vector(manual_color_vector)
if (!sp.is.null(ylim)){
  ylim = as.numeric(sp_string2vector(ylim))
}
if (grepl(",",legend.position)) {
	  legend.position = as.numeric(sp_string2vector(legend.position))
}

saveppt = FALSE
savehtml = FALSE
cat(sp_current_time(), "Starting...\n")

sp_boxplot(
  data = data,
  melted = melted,
  xvariable = xvariable,
  yvariable = yvariable,
  legend_variable = legend_variable,
  statistics = statistics,
  statistical_threshold_for_letters = statistical_threshold_for_letters,
  xtics_angle = xtics_angle,
  legend_variable_order = legend_variable_order,
  legend_variable_cut = legend_variable_cut,
  xvariable_order = xvariable_order,
  xvariable_cut = xvariable_cut,
  y_add = y_add,
  yaxis_scale_mode = yaxis_scale_mode,
  notch = notch,
  par = par,
  outlier = outlier,
  out_scale = out_scale,
  legend.position = legend.position,
  manual_color_vector = manual_color_vector,
  violin = violin,
  violin_nb = violin_nb,
  scale_violin = scale_violin,
  ID_var = ID_var,
  jitter = jitter,
  jitter_bp = jitter_bp,
  dotplot = dotplot,
  dotplot_bp = dotplot_bp,
  group_variable_for_line = group_variable_for_line,
  group_variable_order_for_line = group_variable_order_for_line,
  colormodel = colormodel,
  coordinate_flip = coordinate_flip,
  facet_variable = facet_variable,
  facet_variable_order = facet_variable_order,
  facet_singlecell_style = facet_singlecell_style,
  x_label = x_label,
  y_label = y_label,
  title = title,
  ylim = ylim,
  facet_nrow = facet_nrow,
  facet_ncol = facet_ncol,
  facet_scales = facet_scales,
  metadata = metadata,
  filename = filename,
  width = width,
  height = height,
  saveppt = saveppt,
  savehtml = savehtml
)
cat(sp_current_time(), "Success.\n")

