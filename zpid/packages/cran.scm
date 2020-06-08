(define-module (zpid packages cran)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
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

