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

# calculate noise
laplace_mechanism(sensitivity = #_____,
                  epsilon = #_____)

