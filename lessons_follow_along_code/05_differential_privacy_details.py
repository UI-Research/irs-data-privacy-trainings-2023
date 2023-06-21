import pandas as pd
import numpy as np

# --- Setup ----

# Define function to add laplace noise
def laplace_sanitizer(sensitivity, epsilon, n = 1):
  
  # lambda (distribution width) is sensitivity/privacy loss budget
  l = sensitivity / epsilon 
  
  result = np.random.laplace(scale = l, size = n)

  return(result)


# Read in small_businesses data
small_businesses = pd.read_csv("data/lesson_05_small_businesses.csv")


# --- Exercise 3 --------------

## Question 1

sb_counts = small_businesses.value_counts("state")
ex3_count = pd.DataFrame({'state':sb_counts.index, 'n':sb_counts.values})

ex3_count[["n_dp"]] = ex3_count["n"] + laplace_sanitizer(
    sensitivity = ### ______, 
    epsilon = ### ______, 
    n = 2
  )

# which state has a bigger absolute error?
# which has a bigger relative error?


# --- Exercise 4 ------------
## Question 1

ex4_conf = pd.DataFrame({"employees": ex3_count[["n"]].sum()})


ex4_conf[["employees_dp"]] = ex4_conf["employees"] + laplace_sanitizer(
    sensitivity = ### ______, 
    epsilon = ### ______, 
    n = 1
  )
