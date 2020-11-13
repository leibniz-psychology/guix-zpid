(define-module (zpid packages asyncssh)
  #:use-module (guix packages)
  #:use-module ((gnu packages ssh) #:prefix guix:))

; Upstreamed.
(define-public python-asyncssh
  (deprecated-package "python-asyncssh" guix:python-asyncssh))

