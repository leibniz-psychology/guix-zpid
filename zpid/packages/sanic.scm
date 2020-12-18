(define-module (zpid packages sanic)
  #:use-module (guix packages)
  #:use-module ((gnu packages python-web) #:prefix guix:))

; Upstreamed.
(define-public python-sanic
  (deprecated-package "python-sanic" guix:python-sanic))

