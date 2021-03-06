% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cbq.R
\name{cbq}
\alias{cbq}
\title{Fitting conditional binary quantile models}
\usage{
cbq(
  formula,
  data,
  q = NULL,
  vi = FALSE,
  nsim = 1000,
  grad_samples = 1,
  elbo_samples = 100,
  tol_rel_obj = 0.01,
  output_samples = 2000,
  burnin = NULL,
  thin = 1,
  CIsize = 0.95,
  nchain = 1,
  seeds = 12345,
  inverse_distr = FALSE,
  offset = 1e-20,
  mc_core = TRUE
)
}
\arguments{
\item{formula}{An object of class "Formula" (or one that can be coerced to that class): a symbolic description of the model to be fitted.}

\item{data}{A data frame containing the variables in the model.}

\item{q}{The quantile value.}

\item{vi}{Indicating whether variantional inference should be used instead of MCMC sampling procedure.}

\item{nsim}{The number of iterations.}

\item{grad_samples}{Passed to \code{\link[rstan]{vb}} (positive integer), the number of samples for Monte Carlo estimate of gradients, defaulting to 1.}

\item{elbo_samples}{Passed to \code{\link[rstan]{vb}} (positive integer), the number of samples for Monte Carlo estimate of ELBO (objective function), defaulting to 100. (ELBO stands for "the evidence lower bound".)}

\item{tol_rel_obj}{Passed to \code{\link[rstan]{vb}} (positive double), the convergence tolerance on the relative norm of the objective, defaulting to 0.01.}

\item{output_samples}{Passed to \code{\link[rstan]{vb}} (positive integer), number of posterior samples to draw and save, defaults to 1000.}

\item{burnin}{The number of burnin iterations.}

\item{thin}{Thinning parameter.}

\item{CIsize}{The size of confidence interval.}

\item{nchain}{The number of parallel chains.}

\item{seeds}{Random seeds to replicate the results.}

\item{inverse_distr}{If FALSE, the ALD will not be reversed. The default is FALSE.}

\item{offset}{Offset values to enhance sampling stability. The default value is 1e-20.}

\item{mc_core}{Indicating whether the estimation will be run in multiple parallel chains. The default is TRUE.}
}
\value{
A \code{cbq} object, which can be further analyzed with its associated \code{\link{plot.cbq}}, \code{\link{coef.cbq}} and \code{\link{print.cbq}} functions.

An object of class \code{cbq} contains the following elements

  \describe{

  \item{\code{Call}}{The matched call.}
  \item{\code{formula}}{Symbolic representation of the model.}
  \item{\code{q}}{The quantile value.}
  \item{\code{nsim}}{The number of MCMC iterations.}
  \item{\code{burnin}}{The number of burnin periods.}
  \item{\code{thin}}{Thinning.}
  \item{\code{seeds}}{Random seeds.}
  \item{\code{CIsize}}{The size of confidence interval.}
  \item{\code{data}}{Data used.}
  \item{\code{x}}{Covaraites used.}
  \item{\code{y}}{The dependent variable.}
  \item{\code{xnames}}{Names of the covariates.}
  \item{\code{stanfit}}{Outputs from stan.}
  \item{\code{sampledf}}{A matrix of posterior samples.}
  \item{\code{summaryout}}{A summary based on posterior samples.}
  \item{\code{npars}}{Number of covariates.}
  \item{\code{ulbs}}{Lower and upper confidence bounds.}
  \item{\code{means}}{Estimates at the mean.}
  \item{\code{vi}}{Indicating whether variational inference has been performed.}
  \item{\code{output_samples}}{Sample outputs.}
  \item{\code{fixed_var}}{Variables estimated using fixed effects.}
  \item{\code{random_var}}{Variables estimated using random effects.}
  \item{\code{xq}}{Variables indicating the choice sets.}


}
}
\description{
The main function for running the conditional binary quantile model. The function returns a cbq \code{cbq} object that can be further investigated using standard functions such as \code{plot}, \code{print}, \code{coef}, and \code{predict}.
}
\details{
The model can be passed either as a combination of a \code{formula} and a data frame \code{data}, as in \code{lm()}.

Convergence diagnotics can be performed using either \code{print(object, "mcmc")} or \code{plot(object, "mcmc")}.
}
\examples{
# Simulate the data
x <- rnorm(50)
y <- ifelse(x > 0, 1, 0)
dat <- as.data.frame(cbind(y, x))

# Estimate the CBQ model
model <- cbq(y ~ x, dat, 0.5, nchain = 1, mc_core = FALSE)

# Show the results
print(model)
coef(model)
plot(model)


}
\references{
Lu, Xiao. (2020). Discrete Choice Data with Unobserved Heterogeneity: A Conditional Binary Quantile Model. Political Analysis, 28(2), 147-167. https://doi.org/10.1017/pan.2019.29
}
\author{
Xiao Lu
}
