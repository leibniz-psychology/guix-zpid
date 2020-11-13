(define-module (zpid packages cran)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (guix build utils)
  #:use-module (guix build-system r)
  #:use-module (gnu packages)
  #:use-module (gnu packages statistics)
  #:use-module (gnu packages graph)
  #:use-module (gnu packages cran))

(define-public r-prereg
  (package
    (name "r-prereg")
    (version "0.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "prereg" version))
        (sha256
          (base32
            "1jhlgp7ajq6mx7gn4kf3b7wqzs3v0678pa1r6p4mgvvynic8rnqj"))))
    (properties `((upstream-name . "prereg")))
    (build-system r-build-system)
    (propagated-inputs
      `(("r-rmarkdown" ,r-rmarkdown)))
    (home-page "https://github.com/crsh/prereg")
    (synopsis
      "R Markdown Templates to Preregister Scientific Studies")
    (description
     "This package provides a collection of templates to author
preregistration documents for scientific studies in PDF format.")
    (license license:gpl3)))

(define-public r-metafor
  (package
    (name "r-metafor")
    (version "2.4-0")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "metafor" version))
        (sha256
          (base32
            "1b599fxk7s0brkchmx698fr5k4g1kzkia2rnlvhg349ffs5nfjmn"))))
    (properties `((upstream-name . "metafor")))
    (build-system r-build-system)
    (propagated-inputs
      `(("r-matrix" ,r-matrix) ("r-nlme" ,r-nlme)))
    (home-page
      "https://cran.r-project.org/web/packages/metafor")
    (synopsis "Meta-Analysis Package for R")
    (description
     "This package provides a comprehensive collection of functions for
conducting meta-analyses in R.  The package includes functions to calculate
various effect sizes or outcome measures, fit fixed-, random-, and
mixed-effects models to such data, carry out moderator and meta-regression
analyses, and create various types of meta-analytical plots (e.g., forest,
funnel, radial, L'Abbe, Baujat, GOSH plots).  For meta-analyses of binomial and
person-time data, the package also provides functions that implement
specialized methods, including the Mantel-Haenszel method, Peto's method, and a
variety of suitable generalized linear (mixed-effects) models (i.e.,
mixed-effects logistic and Poisson regression models).  Finally, the package
provides functionality for fitting meta-analytic multivariate/multilevel models
that account for non-independent sampling errors and/or true effects (e.g., due
to the inclusion of multiple treatment studies, multiple endpoints, or other
forms of clustering).  Network meta-analyses and meta-analyses accounting for
known correlation structures (e.g., due to phylogenetic relatedness) can also
be conducted.")
    (license license:gpl2+)))

(define-public r-ez
  (package
    (name "r-ez")
    (version "4.4-0")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "ez" version))
        (sha256
          (base32
            "0a58s94x576dfz7wcbivrr2hmdh5x1vy16zwkqp9fmdzqx38pagq"))))
    (properties `((upstream-name . "ez")))
    (build-system r-build-system)
    (propagated-inputs
      `(("r-car" ,r-car)
        ("r-ggplot2" ,r-ggplot2)
        ("r-lme4" ,r-lme4)
        ("r-mass" ,r-mass)
        ("r-matrix" ,r-matrix)
        ("r-mgcv" ,r-mgcv)
        ("r-plyr" ,r-plyr)
        ("r-reshape2" ,r-reshape2)
        ("r-scales" ,r-scales)
        ("r-stringr" ,r-stringr)))
    (home-page "https://github.com/mike-lawrence/ez")
    (synopsis "Easy Analysis and Visualization of Factorial Experiments")
    (description
     "Facilitates easy analysis of factorial experiments, including purely
within-Ss designs (a.k.a. \"repeated measures\"), purely between-Ss designs,
and mixed within-and-between-Ss designs.  The functions in this package aim to
provide simple, intuitive and consistent specification of data analysis and
visualization.  Visualization functions also include design visualization for
pre-analysis data auditing, and correlation matrix visualization.  Finally,
this package includes functions for non-parametric analysis, including
permutation tests and bootstrap resampling.  The bootstrap function obtains
predictions either by cell means or by more advanced/powerful mixed effects
models, yielding predictions and confidence intervals that may be easily
visualized at any level of the experiment's design.")
    (license license:gpl2+)))

(define-public r-quantpsyc
  (package
    (name "r-quantpsyc")
    (version "1.5")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "QuantPsyc" version))
        (sha256
          (base32
            "1i9bh88r8zxndzjqsj14qw64gnvm5a9kvhjhzk3qsrvl3qzjgh93"))))
    (properties `((upstream-name . "QuantPsyc")))
    (build-system r-build-system)
    (propagated-inputs
      `(("r-boot" ,r-boot) ("r-mass" ,r-mass)))
    (home-page "https://cran.r-project.org/web/packages/QuantPsyc/")
    (synopsis "Quantitative Psychology Tools")
    (description
      "Contains functions useful for data screening, testing moderation,
mediation and estimating power.")
    (license license:gpl2+)))

(define-public r-visnetwork
  (package
    (name "r-visnetwork")
    (version "2.0.9")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "visNetwork" version))
        (sha256
          (base32
            "0854r9znpjd9iy6j5bgrn20vj13dhp606gs3b6iy0rhym71ks2sy"))))
    (properties `((upstream-name . "visNetwork")))
    (build-system r-build-system)
    (propagated-inputs
      `(("r-htmltools" ,r-htmltools)
        ("r-htmlwidgets" ,r-htmlwidgets)
        ("r-jsonlite" ,r-jsonlite)
        ("r-magrittr" ,r-magrittr)))
    (native-inputs `(("r-knitr" ,r-knitr)))
    (home-page "http://datastorm-open.github.io/visNetwork/")
    (synopsis "Network Visualization using vis.js Library")
    (description
      "This package provides an R interface to the vis.js JavaScript charting
library.  It allows an interactive visualization of networks.")
    (license license:expat)))

(define-public r-diagrammer
  (package
    (name "r-diagrammer")
    (version "1.0.6.1")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "DiagrammeR" version))
        (sha256
          (base32
            "0gb7ccdrh7jlyqafdk8zs465ygczxxd25s05whn914in1994qkmy"))))
    (properties `((upstream-name . "DiagrammeR")))
    (build-system r-build-system)
    (propagated-inputs
      `(("r-downloader" ,r-downloader)
        ("r-dplyr" ,r-dplyr)
        ("r-glue" ,r-glue)
        ("r-htmltools" ,r-htmltools)
        ("r-htmlwidgets" ,r-htmlwidgets)
        ("r-igraph" ,r-igraph)
        ("r-influencer" ,r-influencer)
        ("r-magrittr" ,r-magrittr)
        ("r-purrr" ,r-purrr)
        ("r-rcolorbrewer" ,r-rcolorbrewer)
        ("r-readr" ,r-readr)
        ("r-rlang" ,r-rlang)
        ("r-rstudioapi" ,r-rstudioapi)
        ("r-scales" ,r-scales)
        ("r-stringr" ,r-stringr)
        ("r-tibble" ,r-tibble)
        ("r-tidyr" ,r-tidyr)
        ("r-viridis" ,r-viridis)
        ("r-visnetwork" ,r-visnetwork)))
    (native-inputs `(("r-knitr" ,r-knitr)))
    (home-page "https://github.com/rich-iannone/DiagrammeR")
    (synopsis "Graph/Network Visualization")
    (description
      "Build graph/network structures using functions for stepwise addition
and deletion of nodes and edges.  Work with data available in tables for bulk
addition of nodes, edges, and associated metadata.  Use graph selections and
traversals to apply changes to specific nodes or edges.  A wide selection of
graph algorithms allow for the analysis of graphs.  Visualize the graphs and
take advantage of any aesthetic properties assigned to nodes and edges.")
    (license license:expat)))

(define-public r-lavaanplot
  (package
    (name "r-lavaanplot")
    (version "0.5.1")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "lavaanPlot" version))
        (sha256
          (base32
            "01bx1snd3zhc8dmq0f407qhw2d00f6d38qpr791qc1mq5kr3d8qj"))))
    (properties `((upstream-name . "lavaanPlot")))
    (build-system r-build-system)
    (propagated-inputs
      `(("r-diagrammer" ,r-diagrammer)
        ("r-lavaan" ,r-lavaan)
        ("r-stringr" ,r-stringr)))
    (native-inputs `(("r-knitr" ,r-knitr)))
    (home-page "https://github.com/alishinski/lavaanPlot")
    (synopsis "Path Diagrams for Lavaan Models via DiagrammeR")
    (description
      "Plots path diagrams from models in lavaan using the plotting
functionality from the DiagrammeR package.  DiagrammeR provides nice path
diagrams via Graphviz, and these functions make it easy to generate these
diagrams from a lavaan path model without having to write the DOT language
graph specification.")
    (license license:gpl2+)))

(define-public r-clubsandwich
  (package
    (name "r-clubsandwich")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "clubSandwich" version))
       (sha256
        (base32
         "1q4kidxcarlazh9zaav6vdc7ixb3hdg3zh5kr6mwkm087gi05nw5"))))
    (properties `((upstream-name . "clubSandwich")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-sandwich" ,r-sandwich)))
    (native-inputs `(("r-knitr" ,r-knitr)))
    (home-page "https://github.com/jepusto/clubSandwich")
    (synopsis "Cluster-Robust (Sandwich) Variance Estimators with Small-Sample
Corrections")
    (description
     "Provides several cluster-robust variance estimators (i.e.,
sandwich estimators) for ordinary and weighted least squares linear regression
models, including the bias-reduced linearization estimator introduced by Bell
and McCaffrey (2002)
<http://www.statcan.gc.ca/pub/12-001-x/2002002/article/9058-eng.pdf> and
developed further by Pustejovsky and Tipton (2017)
<DOI:10.1080/07350015.2016.1247004>.  The package includes functions for estimating
the variance- covariance matrix and for testing single- and multiple-
contrast hypotheses based on Wald test statistics.  Tests of single regression
coefficients use Satterthwaite or saddle-point corrections.  Tests of multiple-
contrast hypotheses use an approximation to Hotelling's T-squared distribution.
Methods are provided for a variety of fitted models, including lm() and mlm
objects, glm(), ivreg (from package 'AER'), plm() (from package 'plm'), gls()
and lme() (from 'nlme'), robu() (from 'robumeta'), and rma.uni() and rma.mv()
(from 'metafor').")
    (license license:gpl3)))

(define-public r-puniform
  (package
    (name "r-puniform")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "puniform" version))
       (sha256
        (base32
         "1y47y6s76pjvp10m8rvdh7y1iidjw96a4wrr920w0js3rn4fi1fz"))))
    (properties `((upstream-name . "puniform")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-adgoftest" ,r-adgoftest)
       ("r-metafor" ,r-metafor)
       ("r-rcpp" ,r-rcpp)
       ("r-rcpparmadillo" ,r-rcpparmadillo)))
    (home-page
     "https://cran.r-project.org/web/packages/puniform")
    (synopsis
     "Meta-Analysis Methods Correcting for Publication Bias")
    (description
     "This package provides meta-analysis methods that correct for publication
bias and outcome reporting bias.  Four methods and a visual tool are currently
included in the package.  The p-uniform method as described in van Assen, van
Aert, and Wicherts (2015) <doi:10.1037/met0000025> can be used for estimating
the average effect size, testing the null hypothesis of no effect, and testing
for publication bias using only the statistically significant effect sizes of
primary studies.  The second method in the package is the p-uniform* method as
described in van Aert and van Assen (2019) <doi:10.31222/osf.io/zqjr9>.  This
method is an extension of the p-uniform method that allows for estimation of
the average effect size and the between-study variance in a meta-analysis, and
uses both the statistically significant and nonsignificant effect sizes.  The
third method in the package is the hybrid method as described in van Aert and
van Assen (2017) <doi:10.3758/s13428-017-0967-6>.  The hybrid method is a
meta-analysis method for combining an original study and replication and while
taking into account statistical significance of the  original study.  The
p-uniform and hybrid method are based on the statistical theory that the
distribution of p-values is uniform conditional on the population effect size.
The fourth method in the package is the Snapshot Bayesian Hybrid Meta-Analysis
Method as described in van Aert and van Assen (2018)
<doi:10.1371/journal.pone.0175302>.  This method computes posterior
probabilities for four true effect sizes (no, small, medium, and large) based
on an original study and replication while taking into account publication bias
in the original study.  The method can also be used for computing the required
sample size of the replication akin to power analysis in null hypothesis
significance testing.  The meta-plot is a visual tool for meta-analysis that
provides information on the primary studies in the meta-analysis, the results
of the meta-analysis, and characteristics of the research on the effect under
study (van Assen and others, 2020).  Helper functions to apply the Correcting
for Outcome Reporting Bias (CORB) method to correct for outcome reporting bias
in a meta-analysis (van Aert & Wicherts, 2020).")
    (license license:gpl2+)))

