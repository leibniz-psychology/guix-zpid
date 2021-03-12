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

;; We used to package tortoise-orm here.
(define-public python-pypika
  (deprecated-package "python-pypika" db:python-pypika))

(define-public python-tortoise-orm
  (deprecated-package "python-tortoise-orm" db:python-tortoise-orm))

