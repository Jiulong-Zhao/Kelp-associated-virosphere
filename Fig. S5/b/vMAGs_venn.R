#!/usr/bin/env Rscript




data = "/home/Cloud_Platform/Cloud_Platform/public/text_upload_file/347804a9-bb6f-4974-8bd4-1c4aff6ab5a7.txt"
supplyNumbers = FALSE
title = "NULL"
header = TRUE
item_variable = "vMAGs"
set_variable = "sample"
set_variable_order = "K,KSD,KSW-CF,KSW-VF"
width = 4
height = 4
numVector = "NULL"
labelVector = "NULL"
manual_color_vector = "dodgerblue, goldenrod1, darkorange1, seagreen3, orchid3"
alpha = 0.4
label_size = NULL
margin = NULL
outputprefix = "/home/Cloud_Platform/Cloud_Platform/public/user/406_JiulongZhao/result_output/VennDiagram_plot92023_12_13_09_36_48_738275/4a1f5c65-c754-40a0-bcbf-f473fd53d733"
outputpictype = "pdf"
saveppt = FALSE


library(VennDiagram)

# For all users
# devtools::install_github("Tong-Chen/ImageGP")
# For chinese users
# devtools::install_git("https://gitee.com/ct5869/ImageGP.git")
library(ImageGP)



if (outputprefix == "") {
  outputprefix = data
}

filename = paste0(outputprefix, '.vennDiagram.', outputpictype)

if (!sp.is.null(numVector)) {
  numVector = as.numeric(sp_string2vector (numVector))
}
labelVector = sp_string2vector (labelVector)
set_variable_order = sp_string2vector(set_variable_order)
manual_color_vector = sp_string2vector (manual_color_vector)

cat(sp_current_time(), "Starting...\n")

sp_vennDiagram2(
  data = data,
  supplyNumbers = supplyNumbers,
  header = header,
  title = title,
  manual_color_vector = manual_color_vector,
  item_variable = item_variable,
  set_variable = set_variable,
  set_variable_order = set_variable_order,
  numVector = numVector,
  labelVector = labelVector,
  alpha = alpha,
  label_size = label_size,
  margin = margin,
  filename = filename,
  width = width,
  height = height,
  saveppt = saveppt
)

cat(sp_current_time(), "Success.\n")
