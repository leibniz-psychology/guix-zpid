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
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages geo)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages cran))

(define-public r-prereg
  (package
    (name "r-prereg")
    (version "0.5.0")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "prereg" version))
        (sha256
          (base32
            "0bck13iiaxwpqh0rd45mp1s5d8z62ggg0wa7rmyi8a65aywiypsi"))))
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

;; Not upstreamable, contains precompiled jars.
(define-public r-xlsxjars
  (package
    (name "r-xlsxjars")
    (version "0.6.1")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "xlsxjars" version))
        (sha256
          (base32
            "1rka5smm7yqnhhlblpihhciydfap4i6kjaa4a7isdg7qjmzm3h9p"))))
    (properties `((upstream-name . "xlsxjars")))
    (build-system r-build-system)
    (propagated-inputs `(("r-rjava" ,r-rjava)))
    (home-page
      "https://cran.r-project.org/web/packages/xlsxjars")
    (synopsis
      "Package required POI jars for the xlsx package")
    (description
	  "The xlsxjars package collects all the external jars required for the
xlxs package.  This release corresponds to POI 3.10.1.")
    (license license:gpl3)))

(define-public r-xlsx
  (package
    (name "r-xlsx")
    (version "0.6.5")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "xlsx" version))
        (sha256
          (base32
            "01r1ngdm51w18bdan8h94r91m731knkf04zal4g67mx3fpa5x31p"))))
    (properties `((upstream-name . "xlsx")))
    (build-system r-build-system)
    (propagated-inputs
      `(("r-rjava" ,r-rjava) ("r-xlsxjars" ,r-xlsxjars)))
    (native-inputs `(("r-knitr" ,r-knitr)))
    (home-page "https://github.com/colearendt/xlsx")
    (synopsis
      "Read, Write, Format Excel 2007 and Excel 97/2000/XP/2003 Files")
    (description
	  "Provide R functions to read/write/format Excel 2007 and Excel
97/2000/XP/2003 file formats.")
    (license license:gpl3)))

;; Not upstreamable: Git version
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
     "Pairing with the 'learnr' R package, 'gradethis' provides multiple
methods to grade 'learnr' exercises.  To learn more about 'learnr' tutorials,
please visit @url{http://rstudio.github.io/learnr/}.")
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
      "Create reproducible and transparent research projects in 'R', with a minimal amount of code.  This package is based on the Workflow for Open Reproducible Code in Science (WORCS), a step-by-step procedure based on best practices for Open Science.  It includes an 'RStudio' project template, several convenience functions, and all dependencies required to make your project reproducible and transparent.  WORCS is explained in the tutorial paper by Van Lissa, Brandmaier, Brinkman, Lamprecht, Struiksma, & Vreede (2020). <doi:10.17605/OSF.IO/ZCVBS>.")
    (license license:gpl3+))))

(define-public r-esc
  (package
    (name "r-esc")
    (version "0.5.1")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "esc" version))
        (sha256
          (base32
            "0gns7gz55p6pha05413r3hlvd7f2v1amxkg13d197mab1ypqic7q"))))
    (properties `((upstream-name . "esc")))
    (build-system r-build-system)
    (home-page "https://strengejacke.github.io/esc/")
    (synopsis
      "Effect Size Computation for Meta Analysis")
    (description
      "Implementation of the web-based 'Practical Meta-Analysis Effect Size
Calculator' from David B.  Wilson
(@url{http://www.campbellcollaboration.org/escalc/html/EffectSizeCalculator-Home.php})
in R.  Based on the input, the effect size can be returned as standardized mean
difference, Cohen's f, Hedges' g, Pearson's r or Fisher's transformation z,
odds ratio or log odds, or eta squared effect size.")
    (license license:gpl3)))

(define-public r-qdapregex
  (package
    (name "r-qdapregex")
    (version "0.7.2")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "qdapRegex" version))
        (sha256
          (base32
            "1xa8q1way3gjadrjh3mv3xr4c6b4h16nd2c6lgl969difplpfz9p"))))
    (properties `((upstream-name . "qdapRegex")))
    (build-system r-build-system)
    (propagated-inputs `(("r-stringi" ,r-stringi)))
    (home-page
      "http://trinker.github.com/qdapRegex/")
    (synopsis
      "Regular Expression Removal, Extraction, and Replacement Tools")
    (description
      "This package provides a collection of regular expression tools associated with the 'qdap' package that may be useful outside of the context of discourse analysis.  Tools include removal/extraction/replacement of abbreviations, dates, dollar amounts, email addresses, hash tags, numbers, percentages, citations, person tags, phone numbers, times, and zip codes.")
    (license license:gpl2)))

(define-public r-mgsub
  (package
    (name "r-mgsub")
    (version "1.7.2")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "mgsub" version))
        (sha256
          (base32
            "02l1b96zv36ia0c97wgcwfhi037mbn3wy9c64hcw0n0w67yj77rr"))))
    (properties `((upstream-name . "mgsub")))
    (build-system r-build-system)
    (native-inputs `(("r-knitr" ,r-knitr)))
    (home-page
      "https://cran.r-project.org/package=mgsub")
    (synopsis
      "Safe, Multiple, Simultaneous String Substitution")
    (description
      "Designed to enable simultaneous substitution in strings in a safe fashion.  Safe means it does not rely on placeholders (which can cause errors in same length matches).")
    (license license:expat)))

(define-public r-dtt
  (package
    (name "r-dtt")
    (version "0.1-2")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "dtt" version))
        (sha256
          (base32
            "0n8gj5iylfagdbaqirpykb01a9difsy4zl6qq55f0ghvazxqdvmn"))))
    (properties `((upstream-name . "dtt")))
    (build-system r-build-system)
    (home-page "http://www.r-project.org")
    (synopsis "Discrete Trigonometric Transforms")
    (description
      "This package provides functions for 1D and 2D Discrete Cosine Transform (DCT), Discrete Sine Transform (DST) and Discrete Hartley Transform (DHT).")
    (license license:gpl2+)))

(define-public r-textshape
  (package
    (name "r-textshape")
    (version "1.7.1")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "textshape" version))
        (sha256
          (base32
            "02111kj3kka84mpx7s19bjna9cas8diw5fxz51v5ggz0ldswa5pa"))))
    (properties `((upstream-name . "textshape")))
    (build-system r-build-system)
    (propagated-inputs
      `(("r-data-table" ,r-data-table)
        ("r-slam" ,r-slam)
        ("r-stringi" ,r-stringi)))
    (home-page "http://github.com/trinker/textshape")
    (synopsis "Tools for Reshaping Text")
    (description
      "Tools that can be used to reshape and restructure text data.")
    (license license:gpl2)))

(define-public r-syuzhet
  (package
    (name "r-syuzhet")
    (version "1.0.6")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "syuzhet" version))
        (sha256
          (base32
            "16iccqdbw02iw82nah6kwz3gwfghi864j2y698n4b9dyc386ijzv"))))
    (properties `((upstream-name . "syuzhet")))
    (build-system r-build-system)
    (propagated-inputs
      `(("r-dplyr" ,r-dplyr)
        ("r-dtt" ,r-dtt)
        ("r-nlp" ,r-nlp)
        ("r-rlang" ,r-rlang)
        ("r-textshape" ,r-textshape)
        ("r-tidyr" ,r-tidyr)
        ("r-zoo" ,r-zoo)))
    (native-inputs `(("r-knitr" ,r-knitr)))
    (home-page "https://github.com/mjockers/syuzhet")
    (synopsis
      "Extracts Sentiment and Sentiment-Derived Plot Arcs from Text")
    (description
      "Extracts sentiment and sentiment-derived plot arcs from text using a variety of sentiment dictionaries conveniently packaged for consumption by R users.  Implemented dictionaries include \"syuzhet\" (default) developed in the Nebraska Literary Lab \"afinn\" developed by Finn Ã\x85rup Nielsen, \"bing\" developed by Minqing Hu and Bing Liu, and \"nrc\" developed by Mohammad, Saif M.  and Turney, Peter D.  Applicable references are available in README.md and in the documentation for the \"get_sentiment\" function.  The package also provides a hack for implementing Stanford's coreNLP sentiment parser.  The package provides several methods for plot arc normalization.")
    (license license:gpl3)))

(define-public r-lexicon
  (package
    (name "r-lexicon")
    (version "1.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "lexicon" version))
        (sha256
          (base32
            "0x7rscsh6par2lj11sby7bmz41cxn63iiw51lgh29z09cg8j606c"))))
    (properties `((upstream-name . "lexicon")))
    (build-system r-build-system)
    (propagated-inputs
      `(("r-data-table" ,r-data-table)
        ("r-syuzhet" ,r-syuzhet)))
    (home-page "https://github.com/trinker/lexicon")
    (synopsis "Lexicons for Text Analysis")
    (description
      "This package provides a collection of lexical hash tables, dictionaries, and word lists.")
    (license license:gpl3)))

(define-public r-english
  (package
    (name "r-english")
    (version "1.2-5")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "english" version))
        (sha256
          (base32
            "0d6rin40wy2y6k75x8d5qvf03rfy139f309wrl8xwbdb1h8fjkd1"))))
    (properties `((upstream-name . "english")))
    (build-system r-build-system)
    (native-inputs `(("r-knitr" ,r-knitr)))
    (home-page
      "https://cran.r-project.org/package=english")
    (synopsis "Translate Integers into English")
    (description
      "Allow numbers to be presented in an English language version, one, two, three, ...  Ordinals are also available, first, second, third, ...  and indefinite article choice, \"a\" or \"an\".")
    (license license:gpl2)))

(define-public r-textclean
  (package
    (name "r-textclean")
    (version "0.9.3")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "textclean" version))
        (sha256
          (base32
            "0kgjh6c4f14qkjc4fds7q7rpf4nkma3p0igm54fplmm3p853nvrz"))))
    (properties `((upstream-name . "textclean")))
    (build-system r-build-system)
    (propagated-inputs
      `(("r-data-table" ,r-data-table)
        ("r-english" ,r-english)
        ("r-glue" ,r-glue)
        ("r-lexicon" ,r-lexicon)
        ("r-mgsub" ,r-mgsub)
        ("r-qdapregex" ,r-qdapregex)
        ("r-stringi" ,r-stringi)
        ("r-textshape" ,r-textshape)))
    (home-page
      "https://github.com/trinker/textclean")
    (synopsis "Text Cleaning Tools")
    (description
      "Tools to clean and process text.  Tools are geared at checking for substrings that are not optimal for analysis and replacing or removing them (normalizing) with more analysis friendly substrings (see Sproat, Black, Chen, Kumar, Ostendorf, & Richards (2001) <doi:10.1006/csla.2001.0169>) or extracting them into new variables.  For example, emoticons are often used in text but not always easily handled by analysis algorithms.  The replace_emoticon() function replaces emoticons with word equivalents.")
    (license license:gpl2)))

(define-public r-striprtf
  (package
    (name "r-striprtf")
    (version "0.5.2")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "striprtf" version))
        (sha256
          (base32
            "1ra6aalalig6drsj26z9s24lmb10zssagqrvgqqi4358zbm8gwcd"))))
    (properties `((upstream-name . "striprtf")))
    (build-system r-build-system)
    (propagated-inputs
      `(("r-magrittr" ,r-magrittr)
        ("r-rcpp" ,r-rcpp)
        ("r-stringr" ,r-stringr)))
    (home-page "https://github.com/kota7/striprtf")
    (synopsis "Extract Text from RTF File")
    (description
      "Extracts plain text from RTF (Rich Text Format) file.")
    (license license:expat)))

(define-public r-ndjson
  (package
    (name "r-ndjson")
    (version "0.8.0")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "ndjson" version))
        (sha256
          (base32
            "0lvzbgfi1sg4kya1mvv67z14qk3vz9q57x22qh57xq8ampdkg812"))))
    (properties `((upstream-name . "ndjson")))
    (build-system r-build-system)
    (inputs `(("zlib" ,zlib) ("zlib" ,zlib)))
    (propagated-inputs
      `(("r-data-table" ,r-data-table)
        ("r-rcpp" ,r-rcpp)
        ("r-tibble" ,r-tibble)))
    (home-page "http://gitlab.com/hrbrmstr/ndjson")
    (synopsis
      "Wicked-Fast Streaming 'JSON' ('ndjson') Reader")
    (description
      "Streaming 'JSON' ('ndjson') has one 'JSON' record per-line and many modern 'ndjson' files contain large numbers of records.  These constructs may not be columnar in nature, but it is often useful to read in these files and \"flatten\" the structure out to enable working with the data in an R 'data.frame'-like context.  Functions are provided that make it possible to read in plain 'ndjson' files or compressed ('gz') 'ndjson' files and either validate the format of the records or create \"flat\" 'data.table' structures from them.")
    (license license:expat)))

(define-public r-streamr
  (package
    (name "r-streamr")
    (version "0.4.5")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "streamR" version))
        (sha256
          (base32
            "1clx3b0j2515r1nmnl6ki7qw5n54q3x2jvqv3zrc00kq71mlj7ix"))))
    (properties `((upstream-name . "streamR")))
    (build-system r-build-system)
    (propagated-inputs
      `(("r-ndjson" ,r-ndjson)
        ("r-rcurl" ,r-rcurl)
        ("r-rjson" ,r-rjson)))
    (home-page
      "https://cran.r-project.org/package=streamR")
    (synopsis
      "Access to Twitter Streaming API via R")
    (description
      "This package provides functions to access Twitter's filter, sample, and user streams, and to parse the output into data frames.")
    (license license:gpl2)))

(define-public r-readods
  (package
    (name "r-readods")
    (version "1.7.0")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "readODS" version))
        (sha256
          (base32
            "1hi217ab7hp15jsbzi5ak57cqf8jn2rv78bnn74q72gn9mrfra7n"))))
    (properties `((upstream-name . "readODS")))
    (build-system r-build-system)
    (propagated-inputs
      `(("r-cellranger" ,r-cellranger)
        ("r-readr" ,r-readr)
        ("r-stringi" ,r-stringi)
        ("r-xml2" ,r-xml2)))
    (native-inputs `(("r-knitr" ,r-knitr)))
    (home-page
      "https://cran.r-project.org/package=readODS")
    (synopsis "Read and Write ODS Files")
    (description
      "Import ODS (OpenDocument Spreadsheet) into R as a data frame.  Also support writing data frame into ODS file.")
    (license license:gpl3)))

(define-public r-qpdf
  (package
    (name "r-qpdf")
    (version "1.1")
	(source
	 (origin
	  (method url-fetch)
	  (uri (cran-uri "qpdf" version))
	  (sha256
	   (base32
		"03lnfncw8qd1fwfyqh1mjvnsjr3b63wxbah0wp5g7z7gba90dwbi"))
	  (modules '((guix build utils)))
	  (snippet
	   '(begin
           ;; unvendor libqpdf
          (delete-file-recursively "src/libqpdf")
          (delete-file-recursively "src/include/qpdf")
          #t))))
    (properties `((upstream-name . "qpdf")))
    (build-system r-build-system)
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'configure
           (lambda _
             (setenv "EXTERNAL_QPDF" "1")
             #t)))))
    (inputs
      `(("zlib" ,zlib)
        ("qpdf" ,qpdf)))
    (propagated-inputs
      `(("r-askpass" ,r-askpass)
        ("r-curl" ,r-curl)
        ("r-rcpp" ,r-rcpp)))
    (native-inputs `(("pkg-config" ,pkg-config)))
    (home-page "https://github.com/ropensci/qpdf")
    (synopsis
      "Split, Combine and Compress PDF Files")
    (description
      "Content-preserving transformations transformations of PDF files such as split, combine, and compress.  This package interfaces directly to the 'qpdf' C++ API and does not require any command line utilities.  Note that 'qpdf' does not read actual content from PDF files: to extract text and data you need the 'pdftools' package.")
    (license license:asl2.0)))

(define-public r-pdftools
  (package
    (name "r-pdftools")
    (version "2.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "pdftools" version))
        (sha256
          (base32
            "01i5g2mjkshis0zlm7lrvi7kkzl4dn3if1hzwkgzf9n2mi33ndsx"))))
    (properties `((upstream-name . "pdftools")))
    (build-system r-build-system)
    (inputs
      `(("zlib" ,zlib)
        ("poppler" ,poppler)))
    (propagated-inputs
      `(("r-qpdf" ,r-qpdf) ("r-rcpp" ,r-rcpp)))
    (native-inputs `(("pkg-config" ,pkg-config)))
    (home-page
      "https://docs.ropensci.org/pdftoolshttps://github.com/ropensci/pdftools#readmehttps://poppler.freedesktop.org")
    (synopsis
      "Text Extraction, Rendering and Converting of PDF Documents")
    (description
      "Utilities based on 'libpoppler' for extracting text, fonts, attachments and metadata from a PDF file.  Also supports high quality rendering of PDF documents into PNG, JPEG, TIFF format, or into raw bitmap vectors for further processing in R.")
    (license license:expat)))

(define-public r-antiword
  (package
    (name "r-antiword")
    (version "1.3")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "antiword" version))
        (sha256
          (base32
            "034znb0g9wwb8gi1r3z75v3sbb4mh83qrc4y8mbfx5lbgh8zhj6j"))))
    (properties `((upstream-name . "antiword")))
    (build-system r-build-system)
    (propagated-inputs `(("r-sys" ,r-sys)))
    (home-page
      "https://github.com/ropensci/antiword#readmehttp://www.winfield.demon.nl")
    (synopsis
      "Extract Text from Microsoft Word Documents")
    (description
      "Wraps the 'AntiWord' utility to extract text from Microsoft Word documents.  The utility only supports the old 'doc' format, not the new xml based 'docx' format.  Use the 'xml2' package to read the latter.")
    (license license:gpl2)))

(define-public r-readtext
  (package
    (name "r-readtext")
    (version "0.80")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "readtext" version))
        (sha256
          (base32
            "0q8ajnp99fwvh14ppkm2z3gqwdwmjrvxvsfb4q7ad0dhkqric05y"))))
    (properties `((upstream-name . "readtext")))
    (build-system r-build-system)
    (propagated-inputs
      `(("r-antiword" ,r-antiword)
        ("r-data-table" ,r-data-table)
        ("r-digest" ,r-digest)
        ("r-httr" ,r-httr)
        ("r-jsonlite" ,r-jsonlite)
        ("r-pdftools" ,r-pdftools)
        ("r-readods" ,r-readods)
        ("r-readxl" ,r-readxl)
        ("r-streamr" ,r-streamr)
        ("r-stringi" ,r-stringi)
        ("r-striprtf" ,r-striprtf)
        ("r-tibble" ,r-tibble)
        ("r-xml2" ,r-xml2)))
    (native-inputs `(("r-knitr" ,r-knitr)))
    (home-page
      "https://github.com/quanteda/readtext")
    (synopsis
      "Import and Handling for Plain and Formatted Text Files")
    (description
      "This package provides functions for importing and handling text files and formatted text files with additional meta-data, such including '.csv', '.tab', '.json', '.xml', '.html', '.pdf', '.doc', '.docx', '.rtf', '.xls', '.xlsx', and others.")
    (license license:gpl3)))

(define-public r-packcircles
  (package
    (name "r-packcircles")
    (version "0.3.4")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "packcircles" version))
        (sha256
          (base32
            "05pv5c4k4njkr0xw6i6ksiy34hcyx2lbiqpv5gxw81yrkm0rxfyk"))))
    (properties `((upstream-name . "packcircles")))
    (build-system r-build-system)
    (propagated-inputs `(("r-rcpp" ,r-rcpp)))
    (native-inputs `(("r-knitr" ,r-knitr)))
    (home-page
      "https://github.com/mbedward/packcircles")
    (synopsis "Circle Packing")
    (description
      "Algorithms to find arrangements of non-overlapping circles.")
    (license license:expat)))

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

(define-public r-stars
  (package
    (name "r-stars")
    (version "0.5-1")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "stars" version))
        (sha256
          (base32
            "0ybk899rc0rpf2cv5kwk78fvis5xnr255hfcy5khdxsxdqgl0m9j"))))
    (properties `((upstream-name . "stars")))
    (build-system r-build-system)
    (propagated-inputs
      `(("r-abind" ,r-abind)
        ("r-classint" ,r-classint)
        ("r-lwgeom" ,r-lwgeom)
        ("r-rlang" ,r-rlang)
        ("r-sf" ,r-sf)
        ("r-units" ,r-units)))
    (native-inputs `(("r-knitr" ,r-knitr)))
    (home-page "https://r-spatial.github.io/stars/")
    (synopsis
      "Spatiotemporal Arrays, Raster and Vector Data Cubes")
    (description
      "Reading, manipulating, writing and plotting spatiotemporal arrays (raster and vector data cubes) in 'R', using 'GDAL' bindings provided by 'sf', and 'NetCDF' bindings by 'ncmeta' and 'RNetCDF'.")
    (license license:asl2.0)))

(define-public r-lwgeom
  (package
    (name "r-lwgeom")
    (version "0.2-5")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "lwgeom" version))
        (sha256
          (base32
            "0byhjqa2acns8mznl1ngnfygxxxyszvnq66qfg0smhhhdkwr67aa"))))
    (properties `((upstream-name . "lwgeom")))
    (build-system r-build-system)
    (inputs `(("geos" ,geos) ("proj" ,proj) ("sqlite" ,sqlite)))
    (propagated-inputs
      `(("r-rcpp" ,r-rcpp)
        ("r-sf" ,r-sf)
        ("r-units" ,r-units)))
    (native-inputs `(("pkg-config" ,pkg-config)))
    (home-page
      "https://github.com/r-spatial/lwgeom/")
    (synopsis
      "Bindings to Selected 'liblwgeom' Functions for Simple Features")
    (description
      "Access to selected functions found in 'liblwgeom' <https://github.com/postgis/postgis/tree/master/liblwgeom>, the light-weight geometry library used by 'PostGIS' <http://postgis.net/>.")
    (license license:gpl2)))

(define-public r-tmaptools
  (package
    (name "r-tmaptools")
    (version "3.1-1")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "tmaptools" version))
        (sha256
          (base32
            "0bal3czrdr93qig8s5cf5szld5vjbbks67rismfhlkmlgw6wp2gx"))))
    (properties `((upstream-name . "tmaptools")))
    (build-system r-build-system)
    (propagated-inputs
      `(("r-dichromat" ,r-dichromat)
        ("r-lwgeom" ,r-lwgeom)
        ("r-magrittr" ,r-magrittr)
        ("r-rcolorbrewer" ,r-rcolorbrewer)
        ("r-sf" ,r-sf)
        ("r-stars" ,r-stars)
        ("r-units" ,r-units)
        ("r-viridislite" ,r-viridislite)
        ("r-xml" ,r-xml)))
    (home-page
      "https://github.com/mtennekes/tmaptools")
    (synopsis "Thematic Map Tools")
    (description
      "Set of tools for reading and processing spatial data.  The aim is to supply the workflow to create thematic maps.  This package also facilitates 'tmap', the package for visualizing thematic maps.")
    (license license:gpl3)))

(define-public r-rworldmap
  (package
    (name "r-rworldmap")
    (version "1.3-6")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "rworldmap" version))
        (sha256
          (base32
            "1q1h0n9qr0m5pdx10swrh9ddsvdj8kv5nqngrf3lnx9rg9iwivjk"))))
    (properties `((upstream-name . "rworldmap")))
    (build-system r-build-system)
    (propagated-inputs
      `(("r-fields" ,r-fields)
        ("r-maptools" ,r-maptools)
        ("r-sp" ,r-sp)))
    (home-page
      "https://github.com/AndySouth/rworldmap/")
    (synopsis "Mapping Global Data")
    (description
      "Enables mapping of country level and gridded user datasets.")
    (license license:gpl2+)))

