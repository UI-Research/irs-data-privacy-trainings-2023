library(tidyverse)

# --- Setup -----

set.seed(20220509)

# function to draw Laplace noise for one statistic 
laplace_sanitizer <- function(sensitivity, epsilon, n = 1) {
  
  # lambda (distribution width) is sensitivity/privacy loss budget
  l <- sensitivity / epsilon 
  
  # draw from Laplace distribution
  noise <- smoothmest::rdoublex(n = n, # draw one observation (adding noise to one statistic)
                                mu = 0, # centered at 0
                                lambda = l) # scale based on l calculated above
  
  return(noise)
  
}

# Set up data for exercises
small_businesses <- bind_rows(
  Texas = tibble(
    employees = rpois(n = 100010, lambda = 10),
    income = rlnorm(n = 100010, meanlog = 10, sdlog = 2)
  ),
  Vermont = tibble(
    employees = rpois(n = 403, lambda = 10),
    income = rlnorm(n = 403, meanlog = 10, sdlog = 2)
  ),
  .id = "state"
) %>%
  mutate(employees = if_else(employees > 20, 20L, employees))


# --- Exercise 3 -----

ex3_conf <- count(small_businesses, state)

ex3_conf

set.seed(46)
bind_cols(
  ex3_conf,
  ex3_conf$n + laplace_sanitizer(
      sensitivity = 1, 
      epsilon = 0.1 , 
      n = 2
  )
)


# which state has a bigger absolute error?
# which has a bigger relative error?
# The absolute error is larger for Texas, but the relative error is much bigger for Vermont.



# --- Exercise 4 -----

ex4_conf <- small_businesses %>%
  summarize(employees = sum(employees))

set.seed(47)
bind_cols(
  ex4_conf,
  employees_dp = ex4_conf$employees + laplace_sanitizer(
      sensitivity = 20, 
      epsilon = 0.1 , 
      n = 1
  )
)


