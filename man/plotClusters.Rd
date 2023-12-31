% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotClusters.R
\name{plotClusters}
\alias{plotClusters}
\title{Highlight cell-to-cluster assignments across a 2-dimensional reduction / embedding.}
\usage{
plotClusters(
  indata,
  clusterVector = NULL,
  reducedDim = "UMAP",
  dimColnames = c("UMAP1", "UMAP2"),
  clusterColname = "Cluster",
  pointSize = 0.5,
  legendPosition = "none",
  legendLabSize = 12,
  xlim = NULL,
  ylim = NULL,
  label = TRUE,
  labSize = 5,
  drawConnectors = TRUE,
  widthConnectors = 0.5,
  colConnectors = "black",
  xlab = dimColnames[1],
  xlabAngle = 0,
  xlabhjust = 0.5,
  xlabvjust = 0.5,
  ylab = dimColnames[2],
  ylabAngle = 0,
  ylabhjust = 0.5,
  ylabvjust = 0.5,
  axisLabSize = 16,
  title = "k-nearest neighbour (k-NN) clusters",
  subtitle = "",
  caption = ifelse(is(indata, "SingleCellExperiment"), paste0("Total cells, ",
    nrow(as.data.frame(reducedDim(indata, reducedDim)))), paste0("Total cells, ",
    length(clusterVector))),
  titleLabSize = 16,
  subtitleLabSize = 12,
  captionLabSize = 12,
  hline = NULL,
  hlineType = "longdash",
  hlineCol = "black",
  hlineWidth = 0.4,
  vline = NULL,
  vlineType = "longdash",
  vlineCol = "black",
  vlineWidth = 0.4,
  gridlines.major = TRUE,
  gridlines.minor = TRUE,
  borderWidth = 0.8,
  borderColour = "black",
  verbose = TRUE
)
}
\arguments{
\item{indata}{A data-frame or matrix, or \code{SingleCellExperiment} object. If a
data-frame or matrix, columns named in \code{dimColnames} will be extracted
from the data and used to generate the plot. If a SingleCellExperiment
object, a reduction named by \code{reducedDim} will be taken from your object
and used to generate the plot, again using columns whose names are
specified in \code{dimColnames}.}

\item{clusterVector}{If \code{indata} is a non-\code{SingleCellExperiment} object,
\code{clusterVector} must be non-NULL and relate to a cell-to-cluster
assignment whose length matches \code{nrow(indata)}.}

\item{reducedDim}{A reduced dimensional embedding stored within 'indata',
e.g., PCA or UMAP.}

\item{dimColnames}{The column names of the dimensions to use.}

\item{clusterColname}{The column name in the metadata of \code{indata} that
contains the cell-to-cluster assignment, assuming \code{indata} is a
\code{SingleCellExperiment} object.}

\item{pointSize}{Size of plotted points.}

\item{legendPosition}{Position of legend \code{('top', 'bottom', 'left', 'right',
'none')}.}

\item{legendLabSize}{Size of plot legend text.}

\item{xlim}{Limits of the x-axis.}

\item{ylim}{Limits of the y-axis.}

\item{label}{Logical, indicating whether or not to label the clusters.}

\item{labSize}{Size of labels.}

\item{drawConnectors}{Logical, indicating whether or not to connect plot
labels to their corresponding cluster islands by line connectors.}

\item{widthConnectors}{Line width of connectors.}

\item{colConnectors}{Line colour of connectors.}

\item{xlab}{Label for x-axis.}

\item{xlabAngle}{Rotation angle of x-axis labels.}

\item{xlabhjust}{Horizontal adjustment of x-axis labels.}

\item{xlabvjust}{Vertical adjustment of x-axis labels.}

\item{ylab}{Label for y-axis.}

\item{ylabAngle}{Rotation angle of y-axis labels.}

\item{ylabhjust}{Horizontal adjustment of y-axis labels.}

\item{ylabvjust}{Vertical adjustment of y-axis labels.}

\item{axisLabSize}{Size of x- and y-axis labels.}

\item{title}{Plot title.}

\item{subtitle}{Plot subtitle.}

\item{caption}{Plot caption.}

\item{titleLabSize}{Size of plot title.}

\item{subtitleLabSize}{Size of plot subtitle.}

\item{captionLabSize}{Size of plot caption.}

\item{hline}{Draw one or more horizontal lines passing through this/these
values on y-axis. For single values, only a single numerical value is
necessary. For multiple lines, pass these as a vector, e.g., c(60,90).}

\item{hlineType}{Line type for hline \code{('blank', 'solid', 'dashed', 'dotted',
'dotdash', 'longdash', 'twodash')}.}

\item{hlineCol}{Colour of hline.}

\item{hlineWidth}{Width of hline.}

\item{vline}{Draw one or more vertical lines passing through this/these
values on x-axis. For single values, only a single numerical value is
necessary. For multiple lines, pass these as a vector, e.g., c(60,90).}

\item{vlineType}{Line type for vline \code{('blank', 'solid', 'dashed', 'dotted',
'dotdash', 'longdash', 'twodash')}.}

\item{vlineCol}{Colour of vline.}

\item{vlineWidth}{Width of vline.}

\item{gridlines.major}{Logical, indicating whether or not to draw major
gridlines.}

\item{gridlines.minor}{Logical, indicating whether or not to draw minor
gridlines.}

\item{borderWidth}{Width of the border on the x and y axes.}

\item{borderColour}{Colour of the border on the x and y axes.}

\item{verbose}{Boolean (TRUE / FALSE) to print messages to console or not.}
}
\value{
A \code{ggplot2} object.
}
\description{
Highlight cell-to-cluster assignments across a 2-dimensional reduction / embedding.
}
\details{
Highlight cell-to-cluster assignments across a 2-dimensional reduction / embedding.
}
\examples{
# create random data that follows a negative binomial
mat <- jitter(matrix(
  MASS::rnegbin(rexp(1000, rate=.1), theta = 4.5),
  ncol = 20))
colnames(mat) <- paste0('CD', 1:ncol(mat))
rownames(mat) <- paste0('cell', 1:nrow(mat))

u <- umap::umap(mat)
clusvec <- clusKNN(u$layout)
plotClusters(u$layout, clusvec)

}
\author{
Kevin Blighe <kevin@clinicalbioinformatics.co.uk>
}
