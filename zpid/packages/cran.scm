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

