(define-module (zpid packages tortoise)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (guix build-system python)
  #:use-module (gnu packages)
  #:use-module (gnu packages check)
  #:use-module (gnu packages time)
  #:use-module (gnu packages python-xyz)
  #:use-module (zpid packages sanic))

(define-public python-aiounittest
  (package
    (name "python-aiounittest")
    (version "1.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "aiounittest" version))
        (sha256
          (base32
            "1q4bhmi80smaa1lknvdna0sx3915naczlfna1fp435nf6cjyrjl1"))))
    (build-system python-build-system)
    (native-inputs
      `(("python-coverage" ,python-coverage)
        ("python-nose" ,python-nose)))
    (home-page
      "https://github.com/kwarunek/aiounittest")
    (synopsis "Test asyncio code more easily.")
    (description "Test asyncio code more easily.")
    (license license:expat)))

(define-public python-aiosqlite
  (package
    (name "python-aiosqlite")
    (version "0.11.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "aiosqlite" version))
        (sha256
          (base32
            "1f3zdldp9zgrw6qz5fsp3wa5zw73cjf139pj4vf24ryv895320jg"))))
    (build-system python-build-system)
    (native-inputs
      `(("python-aiounittest" ,python-aiounittest)))
    (home-page "https://github.com/jreese/aiosqlite")
    (synopsis
      "asyncio bridge to the standard sqlite3 module")
    (description
      "asyncio bridge to the standard sqlite3 module")
    (license license:expat)))

(define-public python-pypika
  (package
    (name "python-pypika")
    (version "0.36.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "PyPika" version))
        (sha256
          (base32
            "0qzn5vygirg52dlizm6ayzdc5llq8p2krrx0kymr236lrz89wqp8"))))
    (build-system python-build-system)
    (native-inputs
      `(("python-parameterized" ,python-parameterized)))
    (home-page "https://github.com/kayak/pypika")
    (synopsis "A SQL query builder API for Python")
    (description
      "A SQL query builder API for Python")
    (license license:asl2.0)))

(define-public python-ciso8601
  (package
    (name "python-ciso8601")
    (version "2.1.3")
    (source
      (origin
       (method git-fetch)
       ;; Pypi package lacks file tests.py
       (uri (git-reference
             (url "https://github.com/closeio/ciso8601.git")
             (commit (string-append "v" version))))
        (sha256
          (base32
            "0g1aiyc1ayh0rnibyy416m5mmck38ksgdm3jsy0z3rxgmgb24951"))))
    (build-system python-build-system)
    (native-inputs
      `(("python-pytz" ,python-pytz)))
    (home-page "https://github.com/closeio/ciso8601")
    (synopsis
      "Fast ISO8601 date time parser for Python written in C")
    (description
      "Fast ISO8601 date time parser for Python written in C")
    (license license:expat)))

(define-public python-tortoise-orm
  (package
    (name "python-tortoise-orm")
    (version "0.16.2")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "tortoise-orm" version))
        (sha256
          (base32
            "1byph1psmlc1m065k4p86knxsvnr5xd9fhcspa220acv9prlpwap"))))
    (build-system python-build-system)
    ;; Disable tests for now. They pull in a lot of dependencies.
    (arguments `(#:tests? #f))
    (native-inputs
      `(("python-ciso8601" ,python-ciso8601)
        ("python-asynctest" ,python-asynctest)
        ("python-nose2" ,python-nose2)))
    (propagated-inputs
      `(("python-aiosqlite" ,python-aiosqlite)
        ("python-pypika" ,python-pypika)
        ("python-typing-extensions"
         ,python-typing-extensions)))
    (home-page
      "https://github.com/tortoise/tortoise-orm")
    (synopsis
      "Easy async ORM for python, built with relations in mind")
    (description
      "Easy async ORM for python, built with relations in mind")
    (license license:asl2.0)))

