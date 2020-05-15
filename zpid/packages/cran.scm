(define-module (zpid packages cran)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix utils)
  #:use-module (guix build utils)
  #:use-module (guix build-system r)
  #:use-module (gnu packages)
  #:use-module (gnu packages statistics))

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

