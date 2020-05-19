(define-module (zpid packages aionotify)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (guix build utils)
  #:use-module (guix build-system python)
  #:use-module (gnu packages)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages tls)
  #:use-module ((gnu packages python-xyz) #:prefix guix:))

;; aionotify without tests, asynctest is broken with python 3.8
(define-public python-aionotify
  (package
    (inherit guix:python-aionotify)
    (source
     (origin
       (inherit (package-source guix:python-aionotify))))
    (native-inputs `())
    (arguments `(#:tests? #f))))

