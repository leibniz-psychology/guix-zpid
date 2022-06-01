(define-module (zpid packages pyactigraphy)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages check)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages statistics)
  #:use-module (gnu packages xml))

(define-public python-stochastic
  (package
    (name "python-stochastic")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "stochastic" version))
              (sha256
               (base32
                "123v83xms04r8m48h1vhy9f8dbngscm2yib18gq79b1vr36fjf7x"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f)) ; No tests in PyPi tarball.
    (propagated-inputs (list python-numpy python-scipy))
    (native-inputs (list python-pytest))
    (home-page "https://github.com/crflynn/stochastic")
    (synopsis "Generate realizations of stochastic processes")
    (description "Generate realizations of stochastic processes")
    (license license:expat)))

(define-public python-spm1d
  (package
    (name "python-spm1d")
    (version "0.4.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "spm1d" version))
              (sha256
               (base32
                "1hsaqrhi491is7kyhxl7b6mq3qhjvvqgpgn1h1mymp9ld18yw6ag"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f)) ; No tests.
    (propagated-inputs (list python-matplotlib python-numpy python-scipy))
    (home-page "https://github.com/0todd0000/spm1d")
    (synopsis "One-Dimensional Statistical Parametric Mapping")
    (description "One-Dimensional Statistical Parametric Mapping")
    (license license:gpl3)))

(define-public python-pyexcel-ezodf
  (package
    (name "python-pyexcel-ezodf")
    (version "0.3.4")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pyexcel-ezodf" version))
              (sha256
               (base32
                "1w8z07gcb0h1dis84whb183mxfn7ihvvgp2wzh6vdfp4n2lywblp"))))
    (build-system python-build-system)
    (propagated-inputs (list python-lxml))
    (native-inputs (list python-nose))
    (home-page "https://github.com/pyexcel/pyexcel-ezodf")
    (synopsis "A Python package to create/manipulate OpenDocumentFormat files")
    (description
     "This package provides a Python package to create/manipulate OpenDocumentFormat
files")
    (license license:expat)))

(define-public python-pyexcel-ods3
  (package
    (name "python-pyexcel-ods3")
    (version "0.6.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pyexcel-ods3" version))
              (sha256
               (base32
                "0bmwzqycb4vas88jqkykjf22s99vpdbzbr0fvhyf94bfpk4hyx2k"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f)) ; Break circle with python-pyexcel.
    (propagated-inputs (list python-lxml python-pyexcel-ezodf
                             python-pyexcel-io))
    (home-page "https://github.com/pyexcel/pyexcel-ods3")
    (synopsis
     "A wrapper library to read, manipulate and write data in ods format")
    (description
     "This package provides a wrapper library to read, manipulate and write data in
ods format")
    (license license:bsd-3)))

(define-public python-pyexcel-io
  (package
    (name "python-pyexcel-io")
    (version "0.6.6")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pyexcel-io" version))
              (sha256
               (base32
                "17wni9nvdvxm34z2xc48y4d844x51wvl9pzp3k3g9yx5mzqln27n"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f)) ; Break circle with python-pyexcel.
    (propagated-inputs (list python-lml))
    (native-inputs (list python-nose))
    (home-page "https://github.com/pyexcel/pyexcel-io")
    (synopsis
     "A python library to read and write structured data in csv, zipped csvformat and to/from databases")
    (description
     "This package provides a python library to read and write structured data in csv,
zipped csvformat and to/from databases")
    (license license:bsd-3)))

(define-public python-lml
  (package
    (name "python-lml")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "lml" version))
              (sha256
               (base32
                "1idwff3hbyl5dnrzyc0h9idy7a30qm232v0wsiq1v6dpkfi8b82p"))))
    (build-system python-build-system)
    (native-inputs (list python-nose python-mock python-pytest))
    (home-page "https://github.com/python-lml/lml")
    (synopsis "Load me later. A lazy plugin management system.")
    (description "Load me later.  A lazy plugin management system.")
    (license license:bsd-3)))

(define-public python-pyexcel-xls
  (package
    (name "python-pyexcel-xls")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pyexcel-xls" version))
              (sha256
               (base32
                "1jw4vfr4zf4r0zvhh2y1wxg1ggr3ghm29n7vqfqgpak7hvphdijy"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f)) ; Break cycle with python-pyexcel.
    (propagated-inputs (list python-pyexcel-io python-xlrd python-xlwt))
    (native-inputs (list python-nose))
    (home-page "https://github.com/pyexcel/pyexcel-xls")
    (synopsis
     "A wrapper library to read, manipulate and write data in xls format. Itreads xlsx and xlsm format")
    (description
     "This package provides a wrapper library to read, manipulate and write data in
xls format.  Itreads xlsx and xlsm format")
    (license license:bsd-3)))

(define-public python-pyexcel-xlsx
  (package
    (name "python-pyexcel-xlsx")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pyexcel-xlsx" version))
              (sha256
               (base32
                "17d7lsd5zpp1ddg313l2fz40wdyi9czj1nvid351lijj89v4yxam"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f)) ; Break cycle with python-pyexcel.
    (propagated-inputs (list python-openpyxl python-pyexcel-io))
    (home-page "https://github.com/pyexcel/pyexcel-xlsx")
    (synopsis
     "A wrapper library to read, manipulate and write data in xlsx and xlsmformat")
    (description
     "This package provides a wrapper library to read, manipulate and write data in
xlsx and xlsmformat")
    (license license:bsd-3)))

(define-public python-pyexcel
  (package
    (name "python-pyexcel")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pyexcel" version))
              (sha256
               (base32
                "02cp2999l018ajwr33bj357sdh127xq017wsy7vcx5ivv7jyxw7v"))))
    (build-system python-build-system)
    (arguments
     `(#:tests? #f ; Lots of unknown failures.
       #:phases
        (modify-phases %standard-phases
          (replace 'check
            (lambda* (#:key tests? #:allow-other-keys)
              (when tests?
                (invoke "nosetests" "-v" "tests")))))))
    (propagated-inputs (list python-chardet python-lml python-pyexcel-io
                             python-texttable))
    (native-inputs (list python-nose
                         python-psutil
                         python-pyexcel-xls
                         python-pyexcel-xlsx
                         python-sqlalchemy))
    (home-page "https://github.com/pyexcel/pyexcel")
    (synopsis
     "A wrapper library that provides one API to read, manipulate and writedata in different excel formats")
    (description
     "This package provides a wrapper library that provides one API to read,
manipulate and writedata in different excel formats")
    (license license:bsd-3)))

;; Private, because it does not work, only the inherited package below
;; is useful.
(define python-pyactigraphy
  (package
    (name "python-pyactigraphy")
    (version "1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ghammad/pyActigraphy.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0z4p40ayqms0y44267dg9n4x21riahqshvxj1qcskq2rkaqkdds8"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
        (modify-phases %standard-phases
          (replace 'check
            (lambda* (#:key tests? #:allow-other-keys)
              (when tests?
                (invoke "pytest" "-v" "pyActigraphy/tests")))))))
    (propagated-inputs (list python-joblib
                             python-lmfit
                             python-numba
                             python-numpy
                             python-pandas
                             python-pyexcel
                             python-pyexcel-ods3
                             python-scipy
                             python-spm1d
                             python-statsmodels
                             python-stochastic))
    (native-inputs (list python-pytest-runner python-pytest))
    (home-page "http://github.com/ghammad/pyActigraphy")
    (synopsis "Analysis package for actigraphy data")
    (description "Analysis package for actigraphy data")
    (license license:gpl3)))

(define-public python-pyactigraphy-with-light
  ;; Latest commit from the feature/light branch as of 2022-06-01.
  (let ((commit "fbb8b44f220f3ac13ab770057b5eb2f09371b4bb")
        (revision "0"))
  (package
    (inherit python-pyactigraphy)
    (name "python-pyactigraphy-with-light")
    (version (git-version "1.0" revision commit))
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ghammad/pyActigraphy.git")
             (commit commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0npqmcb7456anb0ksa9881r8i5awp5yy3n2x5cg9lkd4vk5vvd1n"))))
   (arguments
     `(#:phases
        (modify-phases %standard-phases
          (replace 'check
            (lambda* (#:key tests? #:allow-other-keys)
              (when tests?
                (invoke "pytest" "-v"  "-k" "not test_mesa_intervals \
and not test_mesa_white_light \
and not test_mesa_red_light \
and not test_mesa_green_light \
and not test_mesa_blue_light"
"pyActigraphy/tests"))))))))))
