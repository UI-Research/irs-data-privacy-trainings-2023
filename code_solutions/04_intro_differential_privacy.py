import pandas as pd
import numpy as np

# --- Setup ---------
# Define function to add laplace noise
def laplace_mechanism(sensitivity, epsilon, n = 1):
  
  # lambda (distribution width) is sensitivity/privacy loss budget
  l = sensitivity / epsilon 
  
  result = np.random.laplace(scale = l, size = n)

  return(result)


# --- Exercise 2 ----------

## Question 1 
# calculate noise
laplace_mechanism(sensitivity = 1,
                  epsilon = 1)

laplace_mechanism(sensitivity = 10,
                  epsilon = 1)
                  
laplace_mechanism(sensitivity = 100,
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

                  
