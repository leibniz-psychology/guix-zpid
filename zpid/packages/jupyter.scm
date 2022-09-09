(define-module (zpid packages jupyter)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:use-module (gnu packages python-xyz)
  #:use-module (guix-science packages jupyter))

(define-public python-nbformat-no-chmod
  (package-with-extra-patches python-nbformat (search-patches "python-nbformat-no-chmod.patch")))

(define-public python-jupyterlab-for-notebook
  ((package-input-rewriting `((,python-nbformat . ,python-nbformat-no-chmod))) python-jupyterlab))

