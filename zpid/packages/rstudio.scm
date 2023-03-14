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
  (let ((version "2021.09.3+396")
        (commit "297afa3a45715eb50d28316ea58c9e2968652cf3")
        (revision "1"))
    (package
      (inherit rstudio-server)
      (name "rstudio-server-zpid")
      (version (git-version version revision commit))
      (source (origin
        ;; Keep snippets, but remove everything else.
        (inherit (package-source rstudio-server))
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/leibniz-psychology/rstudio.git")
              (commit commit)))
        (file-name (git-file-name name version))
        (sha256
         (base32
          "1k0362lipmhzc8c53gp22xyiz2lp18wc1fa9bsgnw5p7qdy2air4"))
        (patches '()))))))

