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

(define-public r-diffobj
  (package
    (name "r-diffobj")
    (version "0.3.2")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "diffobj" version))
        (sha256
          (base32
            "0v18zz14g8ppzmj1d997rdmsfh327ml4wvpmfx168lravdsk5ym2"))))
    (properties `((upstream-name . "diffobj")))
    (build-system r-build-system)
    (propagated-inputs `(("r-crayon" ,r-crayon)))
    (native-inputs `(("r-knitr" ,r-knitr)))
    (home-page "https://github.com/brodieG/diffobj")
    (synopsis "Diffs for R Objects")
    (description
      "Generate a colorized diff of two R objects for an intuitive
visualization of their differences.")
    (license license:gpl2+)))

(define-public r-waldo
  (package
    (name "r-waldo")
    (version "0.2.3")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "waldo" version))
        (sha256
          (base32
            "0lsw8p4wiggqm9fvh5vgmf0ms0npcg3hcwyzlg5ahv5yx4pv5fhz"))))
    (properties `((upstream-name . "waldo")))
    (build-system r-build-system)
    (propagated-inputs
      `(("r-cli" ,r-cli)
        ("r-diffobj" ,r-diffobj)
        ("r-fansi" ,r-fansi)
        ("r-glue" ,r-glue)
        ("r-rematch2" ,r-rematch2)
        ("r-rlang" ,r-rlang)
        ("r-tibble" ,r-tibble)))
    (home-page "https://github.com/r-lib/waldo")
    (synopsis "Find Differences Between R Objects")
    (description
      "Compare complex R objects and reveal the key differences.  Designed
particularly for use in testing packages where being able to quickly isolate
key differences makes understanding test failures much easier.")
    (license license:expat)))

(define-public r-credentials
  (package
    (name "r-credentials")
    (version "1.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "credentials" version))
        (sha256
          (base32
            "1w9zj34xdwz9bszsvhv2cbgq96y5sgxbh7ndn31pgfcpzlkfq6f1"))))
    (properties `((upstream-name . "credentials")))
    (build-system r-build-system)
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'add-env
           (lambda* (#:key inputs #:allow-other-keys)
            (setenv "HOME" "/tmp")
               #t)))))
    (inputs `(("git" ,git)))
    (propagated-inputs
      `(("r-askpass" ,r-askpass)
        ("r-curl" ,r-curl)
        ("r-jsonlite" ,r-jsonlite)
        ("r-openssl" ,r-openssl)
        ("r-sys" ,r-sys)))
    (native-inputs `(("r-knitr" ,r-knitr)))
    (home-page
      "https://docs.ropensci.org/credentialshttps://github.com/r-lib/credentials")
    (synopsis
      "Tools for Managing SSH and Git Credentials")
    (description
      "Setup and retrieve HTTPS and SSH credentials for use with 'git' and other services.  For HTTPS remotes the package interfaces the 'git-credential' utility which 'git' uses to store HTTP usernames and passwords.  For SSH remotes we provide convenient functions to find or generate appropriate SSH keys.  The package both helps the user to setup a local git installation, and also provides a back-end for git/ssh client libraries to authenticate with existing user credentials.")
    (license license:expat)))

(define-public r-gert
  (package
    (name "r-gert")
    (version "1.0.2")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "gert" version))
        (sha256
          (base32
            "1lq4hgv2727lwcv8vha5af26nslj99rjxjrgflshmmcihawpls1n"))))
    (properties `((upstream-name . "gert")))
    (build-system r-build-system)
    (inputs `(("zlib" ,zlib) ("libgit2" ,libgit2)))
    (propagated-inputs
      `(("r-askpass" ,r-askpass)
        ("r-credentials" ,r-credentials)
        ("r-openssl" ,r-openssl)
        ("r-rstudioapi" ,r-rstudioapi)
        ("r-zip" ,r-zip)))
    (native-inputs
      `(("pkg-config" ,pkg-config) ("r-knitr" ,r-knitr)))
    (home-page "https://docs.ropensci.org/gert/")
    (synopsis "Simple Git Client for R")
    (description
      "Simple git client for R based on 'libgit2' with support for SSH and HTTPS remotes.  All functions in 'gert' use basic R data types (such as vectors and data-frames) for their arguments and return values.  User credentials are shared with command line 'git' through the git-credential store and ssh keys stored on disk or ssh-agent.  On Linux, a somewhat recent version of 'libgit2' is required; we provide a 'PPA' for older Ubuntu 'LTS' versions.")
    (license license:expat)))

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

