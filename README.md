# cbq: An R Package for Conditional Binary Quantile Models


The package `cbq` provides basic functionalities of conditional binary quantile models using Markov chain Monte Carlo methods. The estimation is conducted through pre-compiled stan codes.


## Installation

```r
# Make sure that the following packages have been installed in your local R environment
if(!require(rstan)) install.packages("rstan")

# Install cirque from github
if(!require(devtools)) install.packages("devtools")
devtools::install_github("xiao-lu-research/cbq")
```


## Usage

```r

# Load the package
library(cbq)

# Get help
?cbq

# Simulate the data
x <- rnorm(50)
y <- ifelse(x > 0, 1, 0)
dat <- as.data.frame(cbind(y, x))

# Estimate the CBQ model
model <- cbq(y ~ x, dat, 0.5)

# Show the results
print(model)
coef(model)
plot(model)

```

## References

Lu, X. (forthcoming) Discrete Choice Data with Unobserved Heterogeneity: A Conditional Binary Quantile Model. Political Analysis.
