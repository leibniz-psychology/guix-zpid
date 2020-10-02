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
  #:use-module (guix-science packages jupyter)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26))

(define-public psychnotebook-app-rstudio
  (let ((commit "654f3d6601cab1f1b35a7a6f36cf5d9ccfb9cfee")
        (revision "2"))
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
                "0ai5zk7d44zgpnsl087b88pigbnbl79djdbs2cqw9ajic0vxzkgl"))))
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

(define-public psychnotebook-app-rmarkdown
  (let ((commit "f957f5d723ea7669b304386f5fe307614cf5c037")
        (revision "2"))
  (package
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
                "0jccmqdap9rr149v00ahjcisx00yc3jsfzsndszw5rxdkl7a44m2"))))
    (build-system gnu-build-system)
    (native-inputs `(("m4" ,m4)))
    ;; R packages must be propagated.
    (propagated-inputs
     `(("r-rmarkdown" ,r-rmarkdown)
       ("r-shiny" ,r-shiny) ; rmarkdown does not depend shiny?!
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
    (license #f))))

(define-public psychnotebook-app-jupyterlab
  (let ((commit "79a1ebd167268ca3119bec11a5621be638a1012c")
        (revision "3"))
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
                "165pk0j2m6mfpj8difnm16qz10csq12mvfq5gc710aw2ghj27x0q"))))
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
