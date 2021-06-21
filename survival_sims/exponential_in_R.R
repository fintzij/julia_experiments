# reinvent exponential cdf
exp_cdf <- function(x, lambda){
  1 - exp(-lambda * x)
}

# double check to make sure our reinvention is correct
exp_cdf(x=2, lambda=2)
pexp(q=2, rate=2)

# this is what the exponential cdf looks like
plot(seq(0,3,.1), exp_cdf(seq(0,3,.1), lambda=2))

# transform exponential cdf to make more numerically stable
exp_l_cdf <- function(x, lambda){
  log1p( - exp(-lambda * x))
}

# now integrate the density numerically
exp_l_cdf2 <- function(x1, lambda1) {
  
  # return the log cdf
  log(integrate(dexp, rate = lambda1, lower = 0, upper = x1)$value)
}

# now make function to simulate draws from exponential distribution
simtime <- function(par, method = "analytic"){
  # sample between 0 and 1
  usamp <- runif(n=1, 0, 1)
  
  # objective function
  if(method == "analytic") {
    x_obj_fun <- function(x, u=usamp, lambda=par){
      exp_l_cdf(x, lambda) - log(u)
    }
  } else {
    x_obj_fun <- function(x, u=usamp, lambda=par){
      exp_l_cdf2(x, lambda) - log(u)
    }
  }
  
  # SOLVE!
  uniroot(f=x_obj_fun, interval=c(0,10))$root
}


# sanity check
simulated_data <- replicate(10000, simtime(par=2, method = "numeric"))

hist(simulated_data, freq = FALSE, breaks=50)

lines(seq(0,4,0.01), dexp(seq(0,4,0.01), rate = 2), col="red")


# another sanity check
simulated_correct_data <- rexp(10000, rate=2)
hist(simulated_correct_data, freq = FALSE, breaks=seq(0,10,0.1), col="red", add=TRUE)



