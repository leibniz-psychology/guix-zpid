(define-module (zpid packages cran)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix utils)
  #:use-module (guix build utils)
  #:use-module (guix build-system r)
  #:use-module (gnu packages)
  #:use-module (gnu packages statistics)
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
    (home-page "http://github.com/mike-lawrence/ez")
    (synopsis
      "Easy Analysis and Visualization of Factorial Experiments")
    (description
      "Facilitates easy analysis of factorial experiments, including purely within-Ss designs (a.k.a. \"repeated measures\"), purely between-Ss designs, and mixed within-and-between-Ss designs.  The functions in this package aim to provide simple, intuitive and consistent specification of data analysis and visualization.  Visualization functions also include design visualization for pre-analysis data auditing, and correlation matrix visualization.  Finally, this package includes functions for non-parametric analysis, including permutation tests and bootstrap resampling.  The bootstrap function obtains predictions either by cell means or by more advanced/powerful mixed effects models, yielding predictions and confidence intervals that may be easily visualized at any level of the experiment's design.")
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
    (home-page
      "https://cran.r-project.org/web/packages/QuantPsyc")
    (synopsis "Quantitative Psychology Tools")
    (description
      "Contains functions useful for data screening, testing moderation, mediation and estimating power.")
    (license license:gpl2+)))


