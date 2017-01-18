# Team: Kraftfahrzeug-Haftpflichtversicherung
# Authors: Felten, Bettina; Stuhler, Sophie C.
# Date: 17-01-2017

# Assignment on Lesson 8
# Predicting tree cover from Landsat data of one moment in time

# Check for directories, create 
if (dir.exists('data')==F) {
  dir.create('data')
}
if (dir.exists('output')==F) {
  dir.create('output')
}
if (dir.exists('R')==F) {
  dir.create('R')
}

# Import packages
library(randomForest)
library(rgdal)
library(sp)
library(raster)

# Load datasets (We manually download the files from the repository)
load("data/GewataB1.rda")
load("data/GewataB2.rda")
load("data/GewataB3.rda")
load("data/GewataB4.rda")
load("data/GewataB5.rda")
load("data/GewataB7.rda")
load("data/vcfGewata.rda")

# Source functions:
source('R/predictforestcover.R')
source('R/removeoutliers.R')

# Actual commands
result <- predictforestcover(GewataB1, GewataB2, GewataB3, GewataB4, GewataB5, GewataB7, vcfGewata)
