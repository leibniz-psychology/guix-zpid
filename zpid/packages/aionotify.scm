(define-module (zpid packages aionotify)
  #:use-module (guix packages)
  #:use-module ((gnu packages python-xyz) #:prefix guix:))

;; We used to provide a package here.
(define-public python-aionotify
  (deprecated-package "python-aionotify" guix:python-aionotify))

