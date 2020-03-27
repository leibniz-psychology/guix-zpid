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
    (synopsis "Test asyncio code more easily")
    (description "The aiounittest is a helper library to ease of your pain (and
boilerplate), when writing a test of the asynchronous code (asyncio).")
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
     "Asyncio bridge for sqlite3")
    (description
     "The package aiosqlite replicates the standard sqlite3 module, but with
async versions of all the standard connection and cursor methods, and context
managers for automatically closing connections.")
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
    (synopsis "SQL query builder API for Python")
    (description
     "PyPika is a python SQL query builder that exposes the full richness of
the SQL language using a syntax that reflects the resulting query.")
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
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0g1aiyc1ayh0rnibyy416m5mmck38ksgdm3jsy0z3rxgmgb24951"))))
    (build-system python-build-system)
    (native-inputs
     `(("python-pytz" ,python-pytz)))
    (home-page "https://github.com/closeio/ciso8601")
    (synopsis
     "Fast ISO8601 date time parser")
    (description
     "The package ciso8601 converts ISO 8601 or RFC 3339 date time strings into
Python datetime objects.")
    (license license:expat)))

(define-public python-tortoise-orm
  (package
    (name "python-tortoise-orm")
    (version "0.16.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tortoise-orm" version))
       (sha256
        (base32
         "01hbvfyxs2qd1mjc96aipwsdxxhydw8ww686r4gsf87bl6f98dvz"))))
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
     "Tortoise ORM is an easy-to-use asyncio ORM (Object Relational Mapper)
inspired by Django.  Tortoise ORM was build with relations in mind and
admiration for the excellent and popular Django ORM.  It’s engraved in it’s
design that you are working not with just tables, you work with relational
data.")
    (license license:asl2.0)))

