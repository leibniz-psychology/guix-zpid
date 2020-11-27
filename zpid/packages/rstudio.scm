(define-module (zpid packages rstudio)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system ant)
  #:use-module (gnu packages)
  #:use-module (guix-science packages rstudio))

;; special version with monkey-patched unix domain socket support
(define-public rstudio-server-zpid
  (package
    (inherit rstudio-server)
    (name "rstudio-server-zpid")
    (source (origin
              (inherit (package-source rstudio-server))
              (patches (append (origin-patches (package-source rstudio-server))
                               (search-patches "rstudio-server-1.3-oneshot.patch"
                                               "rstudio-server-1.3-rserver-socket.patch"
                                               "rstudio-server-1.3-disable-overlay.patch")))))))

