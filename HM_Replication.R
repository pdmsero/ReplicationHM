# Load necessary libraries
library(tidyverse)
library(foreign)
library(haven)
library(ggplot2)
library(haven)

#dataCOU <- read_dta(file = 'C:\\Users\\dunca\\Downloads\\dataCOU.dta')
#dataTTWA <- read_dta(file = 'C:\\Users\\dunca\\Downloads\\dataTTWA.dta')
#dataLPA <- read_dta(file = 'C:\\Users\\dunca\\Downloads\\dataLPA.dta')
#dataFUR <- read_dta(file = 'C:\\Users\\dunca\\Downloads\\dataFUR.dta')

# This file was created in April 2018
# It incorporates the changes requested by AEJ Macro

# Set options if needed
# options(memory.limit = 1000) # Set memory limit

# Load data
auto_data <- read_dta(file = 'G:\\My Drive\\Work\\Programming\\ReplicationHM\\data\\data3.dta') # Make sure to replace "path/to/auto.dta" with the correct path

# Wages conditional on workers characteristics
auto_data$controlling_for_X <- "yes"
# auto_data$controlling_for_X <- "no"

# Set the model parameters
# alpha and eta are the technology parameters
# US Labor share: in 2009 is .61 (The Global Decline of the Labor Share Karabarbounis and Neiman QJE 2014;see also piketty)
# in 1975 is .65 (same sources)
# US capital share = .25
# beta is the share of housing
# rate is the real interest rate (it does not matter much because we only use it to define TFP in levels)
# theta governs idiosyncratic preferences from location
# a) Diamond estimate is .57 for coll grads and .27 for hs grads; population-weighted mean = .43
# (note: 1/beta_wage, where her beta wage parameter for college is 1.77 see her Table 3)
# However, Diamond conditions on state of birth and therefore absorbs a lot of variation
# b) Serrano and Zidar, 2013 (Table 5) estimate is between .47 (baseline in panel A) and .76 (baseline in Panel B)

alpha <- 0.65
eta <- 0.25
beta <- 0.40
rate <- 0.05
inv_theta <- 0.3

# Define Brain Hubs, Rust Belt, and South
# Barin hubs
auto_data$brain <- 0
auto_data$brain[auto_data$msa %in% c(5600, 7400, 7360)] <- 1

# Rust Belt
auto_data$rust <- 0
auto_data$rust[auto_data$msa %in% c(2640, 7610, 5280, 4800, 9320, 1320, 4040, 6960, 6840, 3680, 3200, 1280, 4320, 8680, 2360, 960, 2000, 8400, 870, 80, 7040, 8160, 3720, 8320, 3000, 9140, 3920, 1680, 2040, 2160, 6280, 280, 3740, 7800, 1280, 3620, 6880, 2760, 8160)] <- 1

# South
auto_data$south <- 0
auto_data$south[auto_data$division %in% c(5, 6, 7)] <- 1

# Other large cities
# These are 19 cities with employment above 600,000
auto_data$other <- 0
auto_data$other[auto_data$emp2009 >= 600000 & auto_data$brain == 0 & auto_data$rust == 0 & auto_data$south == 0] <- 1
