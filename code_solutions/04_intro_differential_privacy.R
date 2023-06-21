library(tidyverse)
library(urbnthemes)

# --- Setup ----
# package for laplace distribution
library(smoothmest)

# function to draw Laplace noise for one statistic 
laplace_mechanism <- function(sensitivity, epsilon){
  
  # lambda (distribution width) is sensitivity/privacy loss budget
  l <- sensitivity/epsilon 
  
  # draw from Laplace distribution
  noise <- rdoublex(n = 1, # draw one observation (adding noise to one statistic)
                    mu = 0, # centered at 0
                    lambda = l) # scale based on l calculated above
  
  return(noise)
}

# set seed for reproducibility
set.seed(26042022)

# calculate noise
laplace_mechanism(sensitivity = 8, epsilon = 1)

# calculate noise
laplace_mechanism(sensitivity = 1, epsilon = 8)

# --- Exercise 2 ---------

## Question 1
laplace_mechanism(sensitivity = 10,
                    epsilon = 1)

laplace_mechanism(sensitivity = 100,
                  epsilon = 1)


laplace_mechanism(sensitivity = 1000,
                  epsilon = 1)

# So higher sensitivity = higher laplace values = more noise added!


## Question 2
laplace_mechanism(sensitivity = 1,
                  epsilon = 10)

laplace_mechanism(sensitivity = 1,
                  epsilon = 100)


laplace_mechanism(sensitivity = 1,
                  epsilon = 1000)

# So higher epsilon = lower laplace values = less noise added!
