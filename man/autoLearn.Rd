% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/autoLearn.R
\name{autoLearn}
\alias{autoLearn}
\title{Automated machine learning training of models}
\usage{
autoLearn(train, test = NULL, target = NULL, codeFrame = NULL,
  edaFrame = NULL, problemType = NULL, maxLevels = 100,
  testSplit = 0.1, validationSplit = 0.3, trainMode = "all",
  tuneIters = 10, tuneType = "random", perfMetric = "auto",
  performResampling = FALSE, resampleMethod = "CV",
  resampleIters = 5, topFeatures = 30, models = "all",
  clusters = NULL, cores = NULL, maxObs = 40000, verbose = TRUE,
  seed = 1991)
}
\arguments{
\item{train}{[data.frame | Required] Training set}

\item{test}{[data.frame | Optional] Optional testing set to validate models on. If none is provided, one will be created internally. Default of NULL}

\item{target}{[character | Optional] If a target is provided classification or regression models will be trained, if left as NULL unsupervised models will be trained. Default of NULL}

\item{codeFrame}{[data.frame | Optional] If the code data.frame object returned from autoPreProcess is provided along with the EDA data.frame "dataSummary" then each model will modify the code to be model specific and is returned in the model object}

\item{edaFrame}{[data.frame | Optional] [data.frame | Optional] If the code data.frame object returned from autoPreProcess is provided along with the EDA data.frame "dataSummary" then each model will modify the code to be model specific and is returned in the model object}

\item{problemType}{[character | Optional] Machine learning problem type, options are: binary, multi, regression and cluster. If left as NULL but target feature provided, problem type is automatically detected. Default of NULL}

\item{maxLevels}{[integer | Optional] Number of unique values in target feature before the problem type is seen as a regression problem. Default of 100}

\item{testSplit}{[numeric | Optional] Percentage of data to allocate to the test set. Stratified sampling is done. Default of 0.1}

\item{validationSplit}{[numeric | Optional] Percentage of data to allocate to the validation set. Stratified sampling is done. Default of 0.3}

\item{trainMode}{[character | Optional] Specifies how to train models, options are: all, full, reduced, balanced, reducedBalanced. all will use all of the other options when suitable. full trains models on all features. reduced trains models on top n features selected by a random forest. balanced trains models on all features but with oversampling the target to 50/50 proportion when the target is binary. reducedBalanced uses the top features as well as balancing the target when the target is binary. Either one or many options can be specified}

\item{tuneIters}{[integer | Optional] Number of tuning iterations to search for optimal hyper parameters. Default of 10}

\item{tuneType}{[character | Optional] Tune method applied, options are: random and frace. random uses random tuning and frace uses iterated f-racing algorithm for the best solution. Default of random}

\item{perfMetric}{[character | Optional] Optimization metric on which to train and validate the model. Default of NULL wuill automatically select a metric, else for avaialble metrics use the function availableMetrcs}

\item{performResampling}{[logical | Optional] Should resampling be performed after tuning of the model have taken place. Default of FALSE}

\item{resampleMethod}{[character | Optional] Should resampling be performed, specifies the resampling method, options are: CV, Bootstrap}

\item{resampleIters}{[integer | Optional] Number of folds or bootstrap iterations to validate the model on}

\item{topFeatures}{[integer | Optional] Top performing features as identified by the random forest model and used in the reduced training methods. Default of 30, if the training set has less than 30 features 50% of the top features will be used}

\item{models}{[character | Optional] Which models to train. Default of all. Available models can be seen by calling availableLearners. Either one or many options can be specified}

\item{clusters}{[integer | Optional] For unsupervised problems, the number of clusters to optimize for. Default of NULL which will search for the best optimized number of clusters}

\item{cores}{[integer | Optional] Number of CPU cores available for computation. Default of NULL which uses all but one core}

\item{maxObs}{[integer | Optional] Number of observations in the experiment training set on which models are trained, tuned and resampled on. Default of 40000. If the training set has less than 40k observations all will be used}

\item{verbose}{[logical | Optional] Chatty function or not. Default of TRUE}

\item{seed}{[integer | Optional] Random number seed for reproducible results}
}
\value{
List of trained models each containing unque information relating to the machine learning problem type
}
\description{
Automated training, tuning and validation of machine learning models. Models are  tuned and resampling validated on an experiment set and trained on the full set and validated and testing on external sets. Classification models tune the probability threshold automatically and returns the results. Each model contains information of performance, the trained model as well as some plots.
}
\examples{
mod <- autoLearn(train = iris, target = "Species")
}
\author{
Xander Horn
}
