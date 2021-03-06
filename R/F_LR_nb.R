#' Get the value of the log-likelihood ratio of alpha
#'
#' @param Alpha a vector of length d, the environmental gradient
#' @param X the n-by-p count matrix
#' @param CC the n-by-d covariate matrix
#' @param responseFun a character string indicating
#' the type of response function
#' @param muMarg an n-by-p offset matrix
#' @param psi a scalar, an importance parameter
#' @param nleqslv.control the control list for the nleqslv() function
#' @param n number of samples
#' @param NB_params Starting values for the NB_params
#' @param NB_params_noLab Starting values for the NB_params without label
#' @param thetaMat a matrix of size n-by-p with estimated dispersion parameters
#' @param ncols a scalar, the number of columns of X
#' @param nonParamRespFun A list, the result of the estNPresp() function
#' @param envGradEst a character string,
#' indicating how the environmental gradient should be fitted.
#' 'LR' using the likelihood-ratio criterion,
#' or 'ML' a full maximum likelihood solution
#' @param ... Further arguments passed on to other functions
#'
#' DON'T USE 'p' as variable name,
#'  partial matching in the grad-function in the numDeriv package
#'
#' @return: a scalar, the evaluation of the log-likelihood ratio
#'  at the given alpha
LR_nb <- function(Alpha, X, CC, responseFun = c("linear",
    "quadratic", "nonparametric", "dynamic"),
    muMarg, psi, nleqslv.control = list(trace = FALSE),
    n, NB_params, NB_params_noLab, thetaMat,
    ncols, nonParamRespFun, envGradEst, ...) {

    sampleScore = CC %*% Alpha
    if (responseFun %in% c("linear", "quadratic",
        "dynamic")) {
        design = buildDesign(sampleScore,
            responseFun)
        muT = muMarg * c(exp(design %*% NB_params *
            psi))
        if (envGradEst == "LR")
            mu0 = muMarg * c(exp(design %*%
                NB_params_noLab * psi))
    } else {
        # Non-parametric response function
        muT = exp(nonParamRespFun$rowMat) *
            muMarg
        if (envGradEst == "LR")
            mu0 = c(exp(nonParamRespFun$rowVecOverall)) *
                muMarg
    }
    logDensj = dnbinom(X, mu = muT, size = thetaMat,
        log = TRUE)
    # Likelihoods under species specific
    # model Immediately return log
    # likelihoods

    if (envGradEst == "LR")
        logDens0 = dnbinom(X, mu = mu0, size = thetaMat,
            log = TRUE)  #Likelihoods of null model

    lr <- sum(switch(envGradEst, "LR" = logDensj -
        logDens0, "ML" = logDensj), na.rm = TRUE)
    # The likelihood ratio
    return(-lr)  # opposite sign for the minimization procedure
}
