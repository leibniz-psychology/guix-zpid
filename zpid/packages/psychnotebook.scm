(define-module (zpid packages psychnotebook)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix gexp)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages statistics)
  #:use-module (gnu packages m4)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages less)
  #:use-module (gnu packages certs)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages cran)
  #:use-module (zpid packages rstudio)
  #:use-module (zpid packages jupyterlab)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26))

(define-public psychnotebook-app-rstudio
  (let ((commit "8f39d49003f9bc6d78583913cb893195a666df05")
        (revision "1"))
  (package
    (name "psychnotebook-app-rstudio")
    (version (git-version "0.1" revision commit))
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/leibniz-psychology/psychnotebook-app-rstudio.git")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0yqgkc1hsllrbyx1vclxx1kk3r675b3phdms7c272ma6bv06whxl"))))
    (build-system gnu-build-system)
    (native-inputs `(("m4" ,m4)))
    (inputs
     `(("rstudio-server" ,rstudio-server-zpid)))
    ;; Propagate packages required to run rstudio properly
    (propagated-inputs
     `(("r-minimal" ,r-minimal) ; Obviously required. Use same r-minimal as
                                        ; rstudio-server-zpid does.
       ;; Make terminal useful and avoid rewriting shell scripts
       ("grep" ,grep)
       ("coreutils" ,coreutils)
       ("findutils" ,findutils)
       ("procps" ,procps)
       ("less" ,less)
       ("which" ,which)
       ("nss-certs" ,nss-certs))) ; RStudio likes to have SSL
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (delete 'build)
         (delete 'check)
         (replace 'install
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (invoke
              "make" "install"
              (string-append "PREFIX=" (assoc-ref outputs "out"))
              (string-append "RSTUDIO_PREFIX=" (assoc-ref inputs "rstudio-server"))))))))
    (home-page "https://github.com/leibniz-psychology/psychnotebook-app-rstudio")
    (synopsis "RStudio integration for PsychNotebook")
    (description #f)
    (license #f))))

;; r-httpuv with fixed issue https://github.com/rstudio/httpuv/issues/282
(define r-httpuv-fixed
  (let ((base r-httpuv))
    (package
      (inherit base)
      ;; Cannot use substitute-keyword-arguments here, because package has no #:phases
      (arguments
       `(#:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'fix-socket
             (lambda* (#:key outputs #:allow-other-keys)
               ;; Fix https://github.com/rstudio/httpuv/issues/282
               (substitute* "src/http.cpp"
                 (("uv_pipe_init\\(pLoop, &pSocket->handle\\.pipe, true\\);")
                  "uv_pipe_init(pLoop, &pSocket->handle.pipe, 0);"))
               #t))))))))

(define rewrite-r-httpuv
  (package-input-rewriting
   `((,r-httpuv . ,r-httpuv-fixed))))

(define-public psychnotebook-app-rmarkdown
  (let ((commit "55db8b9b683efb3479e4b5749190b9b5efa251a4")
        (revision "1"))
  (rewrite-r-httpuv (package
    (name "psychnotebook-app-rmarkdown")
    (version (git-version "0.1" revision commit))
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/leibniz-psychology/psychnotebook-app-rmarkdown.git")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1l1apl48q6x5qqgamchjciyns8s93vr0955m3x70r8wibgxxds77"))))
    (build-system gnu-build-system)
    (native-inputs `(("m4" ,m4)))
    ;; R packages must be propagated.
    (propagated-inputs
     `(("r-rmarkdown" ,r-rmarkdown)
       ("r-shiny" ,r-shiny) ; rmarkdown does not include shiny.
       ("r-learnr" ,r-learnr) ; Commonly used, depends on r-httpuv and must be rewritten here, because we cannot do that from /spec manifests.
       ("coreutils" ,coreutils) ; For some reason.
       ("r-minimal" ,r-minimal))) ; Must be propagated, so it sets R_LIBS_SITE.
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (delete 'build)
         (delete 'check)
         (replace 'install
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (invoke
              "make" "install"
              (string-append "PREFIX=" (assoc-ref outputs "out"))
              (string-append "R_PREFIX=" (assoc-ref inputs "r-minimal"))))))))
    (home-page "https://github.com/leibniz-psychology/psychnotebook-app-rmarkdown")
    (synopsis "RMarkdown integration for PsychNotebook")
    (description #f)
    (license #f)))))

(define-public psychnotebook-app-jupyterlab
  (let ((commit "ef5498b275013723cc1984a729f467e7c439a913")
        (revision "1"))
  (package
    (name "psychnotebook-app-jupyterlab")
    (version (git-version "0.1" revision commit))
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/leibniz-psychology/psychnotebook-app-jupyterlab.git")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1p6xxjig035mwv5c7n9q2bh9vpri1qx7j6z07icqji56hh2rckvw"))))
    (build-system gnu-build-system)
    (native-inputs `(("m4" ,m4)))
    (inputs
     `(("python-jupyter-core" ,python-jupyter-core)))
    (propagated-inputs
     `(("python-jupyterlab" ,python-jupyterlab)
       ;; Python support. Propagate, so `python` is usable on the command-line
       ("python" ,python)
       ("python-wrapper" ,python-wrapper) ; python -> python3
       ;; R support
       ("r-minimal" ,r-minimal)
       ("r-irkernel" ,r-irkernel)
       ;; make terminal useful and avoid rewriting shell scripts
       ("grep" ,grep)
       ("coreutils" ,coreutils)
       ("findutils" ,findutils)
       ("procps" ,procps)
       ("less" ,less)
       ("which" ,which)))
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (delete 'build)
         (delete 'check)
         (replace 'install
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (invoke
              "make" "install"
              (string-append "PREFIX=" (assoc-ref outputs "out"))
              (string-append "JUPYTER_PREFIX=" (assoc-ref inputs "python-jupyter-core"))))))))
    (home-page "https://github.com/leibniz-psychology/psychnotebook-app-jupyterlab")
    (synopsis "JupyterLab integration for PsychNotebook")
    (description #f)
    (license #f))))
