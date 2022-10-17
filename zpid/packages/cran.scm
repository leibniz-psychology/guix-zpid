(define-module (zpid packages cran)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (guix build utils)
  #:use-module (guix build-system r)
  #:use-module (gnu packages)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages statistics)
  #:use-module (gnu packages graph)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages geo)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages cran))

;; Not upstreamable: Git version.
(define-public r-gradethis
 (let ((commit "28b22dcd714374f254bfc7f954c500bb7ee34778")
        (revision "1"))
  (package
    (name "r-gradethis")
    (version (git-version "0.1.0.9004" revision commit))
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rstudio-education/gradethis.git")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0y8z5bs4i6j3qxk09s1jv58cxjpg6zmr4zhsv53cxcsqvgg1fiy0"))))
    (properties `((upstream-name . "gradethis")))
    (build-system r-build-system)
    (propagated-inputs
      `(("r-purrr" ,r-purrr)
        ("r-rlang" ,r-rlang)
        ("r-glue" ,r-glue)
        ("r-checkmate" ,r-checkmate)
        ("r-testthat" ,r-testthat)
        ("r-learnr" ,r-learnr)
        ("r-lifecycle" ,r-lifecycle)
        ("r-ellipsis" ,r-ellipsis)
        ("r-waldo" ,r-waldo)))
    (native-inputs `(("r-knitr" ,r-knitr)))
    (home-page "https://github.com/rstudio-education/gradethis/")
    (synopsis
      "Tools for \"grading\" student exercises in learnr tutorials")
    (description
     "Pairing with the @code{learnr} R package, @code{gradethis} provides
multiple methods to grade @code{learnr} exercises.  To learn more about
@code{learnr} tutorials, please visit @url{http://rstudio.github.io/learnr/}.")
    (license license:gpl3))))

;; Not upstreamable: git version
(define-public r-worcs
 (let ((commit "aad055c1f874cd65d48429ac9ace25cef1f3b599")
        (revision "1"))
  (package
    (name "r-worcs")
    (version (git-version "0.1.6.4" revision commit))
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cjvanlissa/worcs.git")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0s5j4mw73pwdys4fbi9i9xn9cbhvzhdh38kpm4sdd9qs7p6vry5f"))))
    (properties `((upstream-name . "worcs")))
    (build-system r-build-system)
    (propagated-inputs
      `(("r-digest" ,r-digest)
        ("r-gert" ,r-gert)
        ("r-prereg" ,r-prereg)
        ("r-ranger" ,r-ranger)
        ("r-rmarkdown" ,r-rmarkdown)
        ("r-rticles" ,r-rticles)
        ("r-yaml" ,r-yaml)))
    (native-inputs `(("r-knitr" ,r-knitr)))
    (home-page "https://github.com/cjvanlissa/worcs")
    (synopsis
      "Workflow for Open Reproducible Code in Science")
    (description
      "Create reproducible and transparent research projects in @command{R},
with a minimal amount of code.  This package is based on the Workflow for Open
Reproducible Code in Science (WORCS), a step-by-step procedure based on best
practices for Open Science.  It includes an RStudio project template, several
convenience functions, and all dependencies required to make your project
reproducible and transparent.  WORCS is explained in the tutorial paper by Van
Lissa, Brandmaier, Brinkman, Lamprecht, Struiksma, & Vreede (2020).
@url{doi:10.17605/OSF.IO/ZCVBS}.")
    (license license:gpl3+))))

;; Not upstreamable: Git version.
(define-public r-quantqual
  (let ((commit
          "97b9e8de092205b38c7812a95d7ce92b1d35c0ce")
        (revision "1"))
    (package
      (name "r-quantqual")
      (version (git-version "0.3.7" revision commit))
      (source
        (origin
          (method git-fetch)
          (uri (git-reference
                 (url "https://github.com/AndreasFischer1985/quantqual.git")
                 (commit commit)))
          (file-name (git-file-name name version))
          (sha256
            (base32
              "1ai41jn3gnxcv4vi75ghf4zwa0p1a0jljzw0zdpz1nc92yv7rqbp"))))
      (properties `((upstream-name . "quantqual")))
      (build-system r-build-system)
      (propagated-inputs
        `(("r-caret" ,r-caret)
          ("r-glmnet" ,r-glmnet)
          ("r-knitr" ,r-knitr)
          ("r-nnet" ,r-nnet)
          ("r-packcircles" ,r-packcircles)
          ("r-psych" ,r-psych)
          ("r-quanteda" ,r-quanteda)
          ("r-readtext" ,r-readtext)
          ("r-rmarkdown" ,r-rmarkdown)
          ("r-stm" ,r-stm)
          ("r-stringr" ,r-stringr)
          ("r-topicmodels" ,r-topicmodels)
          ("r-wordcloud" ,r-wordcloud)))
      (native-inputs
        `(("r-knitr" ,r-knitr)))
      (home-page
        "https://github.com/AndreasFischer1985/quantqual.git")
      (synopsis
        "Software package for analyzing quantitative and qualitative data.")
      (description
        "Software package for analyzing quantitative and qualitative data.")
      (license license:gpl2))))

(define-public r-superpower
  (package
    (name "r-superpower")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "Superpower" version))
              (sha256
               (base32
                "0bv2jx3hadp5d9c3q790in3m728c8jc1nkp9wqvzcdip1d29hyin"))))
    (properties `((upstream-name . "Superpower")))
    (build-system r-build-system)
    (propagated-inputs (list r-afex
                             r-dplyr
                             r-emmeans
                             r-ggplot2
                             r-gridextra
                             r-magrittr
                             r-mass
                             r-mvtnorm
                             r-reshape2
                             r-tidyr
                             r-tidyselect))
    (native-inputs (list r-knitr))
    (home-page "https://aaroncaldwell.us/SuperpowerBook/")
    (synopsis "Simulation-Based Power Analysis for Factorial Designs")
    (description
     "This package provides functions to perform simulations of ANOVA designs of up to
three factors.  Calculates the observed power and average observed effect size
for all main effects and interactions in the ANOVA, and all simple comparisons
between conditions.  Includes functions for analytic power calculations and
additional helper functions that compute effect sizes for ANOVA designs,
observed error rates in the simulations, and functions to plot power curves.
Please see Lakens, D., & Caldwell, A.  R. (2021). \"Simulation-Based Power
Analysis for Factorial Analysis of Variance Designs\".
<doi:10.1177/2515245920951503>.")
    (license license:expat)))

(define-public r-hdinterval
  (package
    (name "r-hdinterval")
    (version "0.2.2")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "HDInterval" version))
              (sha256
               (base32
                "1vb5fn9zfig0jqs3mvkpik4wvrndj4qmxqx8rg0iv8nvqc4fnzh4"))))
    (properties `((upstream-name . "HDInterval")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/package=HDInterval")
    (synopsis "Highest (Posterior) Density Intervals")
    (description
     "This package provides a generic function and a set of methods to calculate
highest density intervals for a variety of classes of objects which can specify
a probability density distribution, including MCMC output, fitted density
objects, and functions.")
    (license license:gpl3)))

(define-public r-ggdist
  (package
    (name "r-ggdist")
    (version "3.1.1")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "ggdist" version))
              (sha256
               (base32
                "177dnaz3gzs8mw95dwcssf87va5cyjm1g4ds3b6mwmz88ywq4a6r"))))
    (properties `((upstream-name . "ggdist")))
    (build-system r-build-system)
    (propagated-inputs (list r-distributional
                             r-dplyr
                             r-ggplot2
                             r-glue
                             r-hdinterval
                             r-numderiv
                             r-rlang
                             r-scales
                             r-tibble
                             r-tidyselect
                             r-vctrs
                             r-withr))
    (native-inputs (list r-knitr))
    (home-page "https://mjskay.github.io/ggdist/")
    (synopsis "Visualizations of Distributions and Uncertainty")
    (description
     "This package provides primitives for visualizing distributions using 'ggplot2'
that are particularly tuned for visualizing uncertainty in either a frequentist
or Bayesian mode.  Both analytical distributions (such as frequentist confidence
distributions or Bayesian priors) and distributions represented as samples (such
as bootstrap distributions or Bayesian posterior samples) are easily visualized.
 Visualization primitives include but are not limited to: points with multiple
uncertainty intervals, eye plots (Spiegelhalter D., 1999)
<https://ideas.repec.org/a/bla/jorssa/v162y1999i1p45-58.html>, density plots,
gradient plots, dot plots (Wilkinson L., 1999)
<doi:10.1080/00031305.1999.10474474>, quantile dot plots (Kay M., Kola T.,
Hullman J., Munson S., 2016) <doi:10.1145/2858036.2858558>, complementary
cumulative distribution function barplots (Fernandes M., Walls L., Munson S.,
Hullman J., Kay M., 2018) <doi:10.1145/3173574.3173718>, and fit curves with
multiple uncertainty ribbons.")
    (license license:gpl3+)))

(define-public r-jmvcore
  (package
    (name "r-jmvcore")
    (version "2.3.12")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "jmvcore" version))
              (sha256
               (base32
                "1vmjf9sszskf767n92rzpg8lai2g1qgkncgn96j39mgck92vrnqn"))))
    (properties `((upstream-name . "jmvcore")))
    (build-system r-build-system)
    (propagated-inputs (list r-base64enc r-jsonlite r-r6 r-rlang r-stringi))
    (home-page "https://www.jamovi.org")
    (synopsis "Dependencies for the 'jamovi' Framework")
    (description
     "This package provides a framework for creating rich interactive analyses for the
jamovi platform (see <https://www.jamovi.org> for more information).")
    (license license:gpl2+)))

(define-public r-toster
  (package
    (name "r-toster")
    (version "0.4.1")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "TOSTER" version))
              (sha256
               (base32
                "1k6m4x5pp06f2nlcqj70gqk0pddwf4l36njkc1rg8zf7fr9x5f3a"))))
    (properties `((upstream-name . "TOSTER")))
    (build-system r-build-system)
    (propagated-inputs (list r-cowplot
                             r-distributional
                             r-ggdist
                             r-ggplot2
                             r-jmvcore
                             r-r6
                             r-tidyr))
    (native-inputs (list r-knitr))
    (home-page "https://aaroncaldwell.us/TOSTERpkg/")
    (synopsis "Two One-Sided Tests (TOST) Equivalence Testing")
    (description
     "Two one-sided tests (TOST) procedure to test equivalence for t-tests,
correlations, differences between proportions, and meta-analyses, including
power analysis for t-tests and correlations.  Allows you to specify equivalence
bounds in raw scale units or in terms of effect sizes.  See: Lakens (2017)
<doi:10.1177/1948550617697177>.")
    (license license:gpl3)))

(define-public r-fabricatr
  (package
    (name "r-fabricatr")
    (version "0.16.0")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "fabricatr" version))
              (sha256
               (base32
                "0f9p90klcv7k6ajcwqrwzzgxna3ciwpms4vcsxnkb3vy2skhbrzz"))))
    (properties `((upstream-name . "fabricatr")))
    (build-system r-build-system)
    (propagated-inputs (list r-rlang))
    (home-page "https://declaredesign.org/r/fabricatr/")
    (synopsis "Imagine Your Data Before You Collect It")
    (description
     "Helps you imagine your data before you collect it.  Hierarchical data structures
and correlated data can be easily simulated, either from random number
generators or by resampling from existing data sources.  This package is faster
with 'data.table' and 'mvnfast' installed.")
    (license license:expat)))

(define-public r-estimatr
  (package
    (name "r-estimatr")
    (version "0.30.6")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "estimatr" version))
              (sha256
               (base32
                "03y9hcdj5y2bhz7k8sh5mmv619zpbqh4gyv82sf9s57infhc3zph"))))
    (properties `((upstream-name . "estimatr")))
    (build-system r-build-system)
    (propagated-inputs (list r-formula r-generics r-rcpp r-rcppeigen r-rlang))
    (home-page "https://declaredesign.org/r/estimatr/")
    (synopsis "Fast Estimators for Design-Based Inference")
    (description
     "Fast procedures for small set of commonly-used, design-appropriate estimators
with robust standard errors and confidence intervals.  Includes estimators for
linear regression, instrumental variables regression, difference-in-means,
Horvitz-Thompson estimation, and regression improving precision of experimental
estimates by interacting treatment with centered pre-treatment covariates
introduced by Lin (2013) <doi:10.1214/12-AOAS583>.")
    (license license:expat)))

(define-public r-declaredesign
  (package
    (name "r-declaredesign")
    (version "0.30.0")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "DeclareDesign" version))
              (sha256
               (base32
                "1p6nazfja6lmlxlinr84a1gp48vzwypydjxiqd6a1kqr73m90kj3"))))
    (properties `((upstream-name . "DeclareDesign")))
    (build-system r-build-system)
    (propagated-inputs (list r-estimatr r-fabricatr r-generics r-randomizr
                             r-rlang))
    (home-page "https://declaredesign.org/r/declaredesign/")
    (synopsis "Declare and Diagnose Research Designs")
    (description
     "Researchers can characterize and learn about the properties of research designs
before implementation using `DeclareDesign`.  Ex ante declaration and diagnosis
of designs can help researchers clarify the strengths and limitations of their
designs and to improve their properties, and can help readers evaluate a
research strategy prior to implementation and without access to results.  It can
also make it easier for designs to be shared, replicated, and critiqued.")
    (license license:expat)))

(define-public r-mc2d
  (package
    (name "r-mc2d")
    (version "0.1-21")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "mc2d" version))
              (sha256
               (base32
                "1vp7xai7pk260053g2g23wzwn6l1pai0n4vjwjg1j8qd6d95j8mi"))))
    (properties `((upstream-name . "mc2d")))
    (build-system r-build-system)
    (propagated-inputs (list r-mvtnorm))
    (home-page "https://cran.r-project.org/package=mc2d")
    (synopsis "Tools for Two-Dimensional Monte-Carlo Simulations")
    (description
     "This package provides a complete framework to build and study Two-Dimensional
Monte-Carlo simulations, aka Second-Order Monte-Carlo simulations.  Also
includes various distributions (pert, triangular, Bernoulli, empirical discrete
and continuous).")
    (license license:gpl2+)))

(define-public r-wrs2
  (package
    (name "r-wrs2")
    (version "1.1-4")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "WRS2" version))
              (sha256
               (base32
                "1838wy59cqd65s0bw6c24xcvx7zflypqcbgs35l9s2fj87vw2hdc"))))
    (properties `((upstream-name . "WRS2")))
    (build-system r-build-system)
    (propagated-inputs (list r-mass r-mc2d r-plyr r-reshape))
    (native-inputs (list r-knitr))
    (home-page "https://r-forge.r-project.org/projects/psychor/")
    (synopsis "A Collection of Robust Statistical Methods")
    (description
     "This package provides a collection of robust statistical methods based on
Wilcox' WRS functions.  It implements robust t-tests (independent and dependent
samples), robust ANOVA (including between-within subject designs), quantile
ANOVA, robust correlation, robust mediation, and nonparametric ANCOVA models
based on robust location measures.")
    (license license:gpl3)))

(define-public r-statsexpressions
  (package
    (name "r-statsexpressions")
    (version "1.3.2")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "statsExpressions" version))
              (sha256
               (base32
                "12kyns9zr8szvnpa1rmqackja9g62px01spivhqw4f3x056j60rr"))))
    (properties `((upstream-name . "statsExpressions")))
    (build-system r-build-system)
    (propagated-inputs (list r-bayesfactor
                             r-correlation
                             r-datawizard
                             r-dplyr
                             r-effectsize
                             r-glue
                             r-insight
                             r-magrittr
                             r-parameters
                             r-performance
                             r-rlang
                             r-tibble
                             r-tidyr
                             r-wrs2
                             r-zeallot))
    (native-inputs (list r-knitr))
    (home-page "https://indrajeetpatil.github.io/statsExpressions/")
    (synopsis "Tidy Dataframes and Expressions with Statistical Details")
    (description
     "Utilities for producing dataframes with rich details for the most common types
of statistical approaches and tests: parametric, nonparametric, robust, and
Bayesian t-test, one-way ANOVA, correlation analyses, contingency table
analyses, and meta-analyses.  The functions are pipe-friendly and provide a
consistent syntax to work with tidy data.  These dataframes additionally contain
expressions with statistical details, and can be used in graphing packages.
This package also forms the statistical processing backend for 'ggstatsplot'.")
    (license license:gpl3)))

(define-public r-prismatic
  (package
    (name "r-prismatic")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "prismatic" version))
              (sha256
               (base32
                "1f6k11hcll33g2wbadjhm91pm5h4khg4zd8g9fzs3m9xlqpfaywh"))))
    (properties `((upstream-name . "prismatic")))
    (build-system r-build-system)
    (propagated-inputs (list r-farver))
    (home-page "https://github.com/EmilHvitfeldt/prismatic")
    (synopsis "Color Manipulation Tools")
    (description
     "Manipulate and visualize colors in a intuitive, low-dependency and functional
way.")
    (license license:expat)))

(define-public r-paletteer
  (package
    (name "r-paletteer")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "paletteer" version))
              (sha256
               (base32
                "1m0h1p0cbmmi0rk157qyrgcz57pw0syadskrnfa4vs7hm1rndp3m"))))
    (properties `((upstream-name . "paletteer")))
    (build-system r-build-system)
    (propagated-inputs (list r-prismatic r-rematch2 r-rlang r-rstudioapi))
    (home-page "https://github.com/EmilHvitfeldt/paletteer")
    (synopsis "Comprehensive Collection of Color Palettes")
    (description
     "The choices of color palettes in R can be quite overwhelming with palettes
spread over many packages with many different API's.  This packages aims to
collect all color palettes across the R ecosystem under the same package with a
streamlined API.")
    (license license:gpl3)))

(define-public r-correlation
  (package
    (name "r-correlation")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "correlation" version))
              (sha256
               (base32
                "0lgjcmiacykn98zlbr1bpy86hw17zsn6l0vgx39lrgw6wa58chik"))))
    (properties `((upstream-name . "correlation")))
    (build-system r-build-system)
    (propagated-inputs (list r-bayestestr r-datawizard r-insight r-parameters))
    (native-inputs (list r-knitr))
    (home-page "https://easystats.github.io/correlation/")
    (synopsis "Methods for Correlation Analysis")
    (description
     "Lightweight package for computing different kinds of correlations, such as
partial correlations, Bayesian correlations, multilevel correlations, polychoric
correlations, biweight correlations, distance correlations and more.  Part of
the 'easystats' ecosystem.")
    (license license:gpl3)))

(define-public r-ggstatsplot
  (package
    (name "r-ggstatsplot")
    (version "0.9.3")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "ggstatsplot" version))
              (sha256
               (base32
                "1yljbirx4dyjkvxrp8r1jfr8qpy1hsjji2rn9n6m4wk6zk6v53nf"))))
    (properties `((upstream-name . "ggstatsplot")))
    (build-system r-build-system)
    (propagated-inputs (list r-correlation
                             r-dplyr
                             r-ggplot2
                             r-ggrepel
                             r-ggsignif
                             r-glue
                             r-insight
                             r-paletteer
                             r-parameters
                             r-patchwork
                             r-performance
                             r-purrr
                             r-rlang
                             r-statsexpressions
                             r-tidyr))
    (native-inputs (list r-knitr))
    (home-page "https://indrajeetpatil.github.io/ggstatsplot/")
    (synopsis "'ggplot2' Based Plots with Statistical Details")
    (description
     "Extension of 'ggplot2', 'ggstatsplot' creates graphics with details from
statistical tests included in the plots themselves.  It provides an easier
syntax to generate information-rich plots for statistical analysis of continuous
(violin plots, scatterplots, histograms, dot plots, dot-and-whisker plots) or
categorical (pie and bar charts) data.  Currently, it supports the most common
types of statistical approaches and tests: parametric, nonparametric, robust,
and Bayesian versions of t-test/ANOVA, correlation analyses, contingency table
analysis, meta-analysis, and regression analyses.")
    (license license:gpl3)))

(define-public r-paramtest
  (package
    (name "r-paramtest")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "paramtest" version))
              (sha256
               (base32
                "0yn1s1qkgby8x0qn7cy1zhxzc0wyi7bm30pkvijhn5h5afjpylsy"))))
    (properties `((upstream-name . "paramtest")))
    (build-system r-build-system)
    (propagated-inputs (list r-boot))
    (native-inputs (list r-knitr))
    (home-page "https://cran.r-project.org/package=paramtest")
    (synopsis "Run a Function Iteratively While Varying Parameters")
    (description
     "Run simulations or other functions while easily varying parameters from one
iteration to the next.  Some common use cases would be grid search for machine
learning algorithms, running sets of simulations (e.g., estimating statistical
power for complex models), or bootstrapping under various conditions.  See the
'paramtest' documentation for more information and examples.")
    (license license:gpl3)))

(define-public r-effsize
  (package
    (name "r-effsize")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "effsize" version))
              (sha256
               (base32
                "1m5ch2g77f4ldbxhzp2ls1pga8hq7ggkz1xs8a90h0s09rj0gd7w"))))
    (properties `((upstream-name . "effsize")))
    (build-system r-build-system)
    (home-page "https://github.com/mtorchiano/effsize/")
    (synopsis "Efficient Effect Size Computation")
    (description
     "This package provides a collection of functions to compute the standardized
effect sizes for experiments (Cohen d, Hedges g, Cliff delta, Vargha-Delaney A).
 The computation algorithms have been optimized to allow efficient computation
even with very large data sets.")
    (license license:gpl2)))

(define-public r-apatables
  (package
    (name "r-apatables")
    (version "2.0.8")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "apaTables" version))
              (sha256
               (base32
                "0jy6x0z9ivqqkjihqhyg3fxyghqa9gs6q2bpxzjdnbcb3kq151vd"))))
    (properties `((upstream-name . "apaTables")))
    (build-system r-build-system)
    (propagated-inputs (list r-boot
                             r-broom
                             r-car
                             r-dplyr
                             r-mbess
                             r-tibble))
    (home-page "https://github.com/dstanley4/apaTables")
    (synopsis "Create American Psychological Association (APA) Style Tables")
    (description
     "This package provides a common task faced by researchers is the creation of APA
style (i.e., American Psychological Association style) tables from statistical
output.  In R a large number of function calls are often needed to obtain all of
the desired information for a single APA style table.  As well, the process of
manually creating APA style tables in a word processor is prone to transcription
errors.  This package creates Word files (.doc files) containing APA style
tables for several types of analyses.  Using this package minimizes
transcription errors and reduces the number commands needed by the user.")
    (license license:expat)))

(define-public r-psychreport
  (package
    (name "r-psychreport")
    (version "3.0.2")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "psychReport" version))
              (sha256
               (base32
                "193y07hmx630wn83ss47i2rssl1pswgc87z2ygpkaw8y8vv46wk9"))))
    (properties `((upstream-name . "psychReport")))
    (build-system r-build-system)
    (propagated-inputs (list r-broom r-cli r-dplyr r-ez r-xtable))
    (home-page "https://cran.r-project.org/package=psychReport")
    (synopsis "Reproducible Reports in Psychology")
    (description
     "Helper functions for producing reports in Psychology (Reproducible Research).
Provides required formatted strings (APA style) for use in 'Knitr'/'Latex'
integration within *.Rnw files.")
    (license license:expat)))

(define-public r-corx
  (package
    (name "r-corx")
    (version "1.0.7.1")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "corx" version))
              (sha256
               (base32
                "1jcvya0581f22xhjcsysnkhfv5bsbc0dkzvwaz8ys1dadj39v37d"))))
    (properties `((upstream-name . "corx")))
    (build-system r-build-system)
    (propagated-inputs (list r-clipr
                             r-crayon
                             r-ggcorrplot
                             r-ggplot2
                             r-ggpubr
                             r-glue
                             r-moments
                             r-ppcor
                             r-tidyselect))
    (home-page "https://github.com/conig/corx")
    (synopsis "Create and Format Correlation Matrices")
    (description
     "Create correlation (or partial correlation) matrices.  Correlation matrices are
formatted with significance stars based on user preferences.  Matrices of
coefficients, p-values, and number of pairwise observations are returned.  Send
resultant formatted matrices to the clipboard to be pasted into excel and other
programs.  A plot method allows users to visualize correlation matrices created
with 'corx'.")
    (license license:expat)))

(define-public r-jtools
  (package
    (name "r-jtools")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "jtools" version))
              (sha256
               (base32
                "1aafnjmldg01c25psi47xnqrf5p7kjfcffjknghgw6dczjpn500f"))))
    (properties `((upstream-name . "jtools")))
    (build-system r-build-system)
    (propagated-inputs (list r-crayon
                             r-generics
                             r-ggplot2
                             r-magrittr
                             r-pander
                             r-pkgconfig
                             r-rlang
                             r-tibble))
    (native-inputs (list r-knitr))
    (home-page "https://jtools.jacob-long.com")
    (synopsis "Analysis and Presentation of Social Scientific Data")
    (description
     "This is a collection of tools for more efficiently understanding and sharing the
results of (primarily) regression analyses.  There are also a number of
miscellaneous functions for statistical and programming purposes.  Support for
models produced by the survey and lme4 packages are points of emphasis.")
    (license license:gpl3+)))

(define-public r-trackdown
  (package
    (name "r-trackdown")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "trackdown" version))
              (sha256
               (base32
                "1l8mqdfpdf25vyibxqcqhyip6aqllb9riz2v6w4k1rfc8b9dl07f"))))
    (properties `((upstream-name . "trackdown")))
    (build-system r-build-system)
    (propagated-inputs (list r-cli r-googledrive r-rmarkdown))
    (native-inputs (list r-knitr))
    (home-page "https://github.com/claudiozandonella/trackdown/")
    (synopsis
     "Collaborative Editing of Rmd (or Rnw) Documents in Google Drive")
    (description
     "Collaborative writing and editing of R Markdown (or Sweave) documents.  The
local .Rmd (or .Rnw) is uploaded as a plain-text file to Google Drive.  By
taking advantage of the easily readable Markdown (or LaTeX) syntax and the
well-known online interface offered by Google Docs, collaborators can easily
contribute to the writing and editing process.  After integrating all authors’
contributions, the final document can be downloaded and rendered locally.")
    (license license:gpl3)))

(define-public r-languager
  (package
    (name "r-languager")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "languageR" version))
              (sha256
               (base32
                "1iipnr2b4hd2w718prbh075j56m5xnchlcb2vg26m16qpydp6afn"))))
    (properties `((upstream-name . "languageR")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/package=languageR")
    (synopsis
     "Analyzing Linguistic Data: A Practical Introduction to Statistics")
    (description
     "Data sets exemplifying statistical methods, and some facilitatory utility
functions used in ``Analyzing Linguistic Data: A practical introduction to
statistics using R'', Cambridge University Press, 2008.")
    (license license:gpl2+)))
