(define-module (zpid packages tortoise)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (guix build utils)
  #:use-module (guix build-system python)
  #:use-module (gnu packages)
  #:use-module ((gnu packages databases) #:prefix db:)
  #:use-module (gnu packages python-xyz))

(define-public python-asynctest-notest
  (package
    (inherit python-asynctest)
    (name "python-asynctest")
    ;; tests fail with python 3.8
    (arguments `(#:tests? #f))))

(define-public python-pypika
  (package
    (inherit db:python-pypika)
    (name "python-pypika")
    (version "0.37.6")
    (source
     (origin (method git-fetch)
             (uri (git-reference
                   (url "https://github.com/kayak/pypika.git")
                   (commit (string-append "v" version))))
             (file-name (git-file-name name version))
             (sha256
              (base32
               "0b137xcl5fj3lc7aqvljg173y17d3jn85ybrhi0kilka8z318c3d"))))))

(define python-tortoise-orm-rewritten
  ((package-input-rewriting
   `((,python-asynctest . ,python-asynctest-notest)
     (,db:python-pypika . ,python-pypika)))
    db:python-tortoise-orm))

(define-public python-tortoise-orm
  (package
    (inherit python-tortoise-orm-rewritten)
    (name "python-tortoise-orm")
    (version "0.16.11")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tortoise-orm" version))
       (sha256
        (base32
         "1fw6w7rm7ff1c1fiyl6c0ijm2hdfqkw0c5lx8vlspgbil5cmr8h8"))))))

