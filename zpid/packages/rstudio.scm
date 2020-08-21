;; RStudio server and its dependencies. Only the first level of dependencies is
;; built from source right now. Also RStudio itself bundles a lot of external
;; libraries, some with custom modifications.
;; 
;; An older version is available at
;; https://github.com/BIMSBbioinfo/guix-bimsb/blob/master/bimsb/packages/staging.scm

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
  #:use-module (gnu packages boost)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages statistics)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages java)
  #:use-module (gnu packages base))

(define-public rstudio-server
  (package
    (name "rstudio-server")
    (version "1.3.1073")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rstudio/rstudio.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0kcdjl1fw6aglz4k1di0qpr0hi2jqf7s5sm1jrzp50rs3nlsab0q"))
              (patches
               (search-patches "rstudio-server-1.3.959-unbundle.patch"
							   "rstudio-server-1.3-fix-auth-none.patch"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  ;; de-blob: windows tools
                  delete-file-recursively "dependencies/windows/tools"
                  #t))))
    (build-system cmake-build-system)
    (arguments
     `(#:configure-flags
       '("-DRSTUDIO_TARGET=Server"
         "-DCMAKE_BUILD_TYPE=Release"
         ;; auto-detection seems to be broken with boost 1.72
         "-DRSTUDIO_BOOST_SIGNALS_VERSION=2")
       #:tests? #f ; no tests exist
       #:modules ((guix build cmake-build-system)
                  (guix build utils)
                  (ice-9 match))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'unpack-dictionary
           (lambda* (#:key inputs native-inputs #:allow-other-keys)
             (let ((dict-dir "dependencies/common/dictionaries"))
               (mkdir dict-dir)
               (invoke "unzip" "-qd" dict-dir (assoc-ref inputs "dict-source-tarball")))
             #t))
         ;; change the default paths for mathjax and pandoc and a hardcoded call to `which`
         (add-after 'unpack 'patch-paths
           (lambda* (#:key inputs native-inputs #:allow-other-keys)
             (substitute* "src/cpp/session/SessionOptions.cpp"
               (("resources/mathjax-27") (assoc-ref inputs "mathjax")))
             (substitute* "src/cpp/session/SessionOptions.cpp"
               (("bin/pandoc") (string-append (assoc-ref inputs "pandoc") "/bin/pandoc")))
             (substitute* "src/cpp/core/r_util/REnvironmentPosix.cpp"
               (("runCommand\\(\"which") (string-append "runCommand(\"" (assoc-ref inputs "which") "/bin/which")))
             (substitute* '("src/cpp/session/SessionConsoleProcess.cpp" "src/cpp/session/modules/SessionTerminalShell.cpp")
               (("/usr/bin/env") (string-append (assoc-ref inputs "coreutils") "/bin/env")))
             (substitute* '("src/cpp/session/modules/SessionFiles.R")
               (("\"zip\"") (string-append "\"" (assoc-ref inputs "zip") "/bin/zip\"")))
             #t))
         (add-after 'unpack 'set-JAVA_HOME
           (lambda* (#:key inputs #:allow-other-keys)
             (setenv "JAVA_HOME" (assoc-ref inputs "jdk"))
             ;; set proper version information
             (match (string-split ,version #\.)
               ((major minor patch)
                (setenv "RSTUDIO_VERSION_MAJOR" major)
                (setenv "RSTUDIO_VERSION_MINOR" minor)
                (setenv "RSTUDIO_VERSION_PATCH" patch)))
             #t)))))
    (native-inputs
     `(("unzip" ,unzip)
       ;; gwt-components are built using ant
       ("ant" ,ant)
       ("jdk" ,icedtea "jdk")))
    (inputs
     `(("boost" ,boost)
       ("zlib" ,zlib)
       ("linux-pam" ,linux-pam)
       ("r-minimal" ,r-minimal)
       ("openssl" ,openssl)
       ;; for libuuid
       ("util-linux" ,util-linux "lib")
       ("pandoc" ,ghc-pandoc)
       ("which" ,which)
	   ("mathjax" ,mathjax) ; XXX: not sure this is the correct version, but
	   ; any 2.7 patch release should work, right?
       ;; for `env`
       ("coreutils" ,coreutils)
       ;; File panel -> More -> Export
       ("zip" ,zip)
       ("dict-source-tarball"
        ,(origin
           (method url-fetch)
           (uri "https://s3.amazonaws.com/rstudio-buildtools/dictionaries/core-dictionaries.zip")
           (sha256
            (base32
             "153lg3ai97qzbqp6zjg10dh3sfvz80v42cjw45zwz7gv1risjha3"))))
       ("junit-source-tarball"
        ,(origin
           (method url-fetch)
           (uri "https://s3.amazonaws.com/rstudio-buildtools/junit-4.9b3.jar")
           (sha256
            (base32
             "0l850yfbq0cgycp8n0r0a1b7xznd37pgfd656vzdwim4blznqmnw"))))))
    (home-page "https://rstudio.com/products/rstudio/#rstudio-server")
    (synopsis "Integrated development environment (IDE) for R")
    (description "RStudio is an integrated development environment (IDE) for the R
programming language. Some of its features include: Customizable workbench
with all of the tools required to work with R in one place (console, source,
plots, workspace, help, history, etc.); syntax highlighting editor with code
completion; execute code directly from the source editor (line, selection, or
file); full support for authoring Sweave and TeX documents.  RStudio can also
be run as a server, enabling multiple users to access the RStudio IDE using a
web browser.")
    (license license:agpl3)))

;; special version with monkey-patched unix domain socket support
(define-public rstudio-server-zpid
  (package
    (inherit rstudio-server)
    (name "rstudio-server-zpid")
    (source (origin
              (inherit (package-source rstudio-server))
              (patches (append (origin-patches (package-source rstudio-server))
                               (search-patches "rstudio-server-1.3-oneshot.patch"
											   "rstudio-server-1.3-rserver-socket.patch")))))))

(define-public mathjax
  (package
    (name "mathjax")
    (version "2.7.8")
    ( source (origin
               (method url-fetch)
               (uri (string-append "https://github.com/mathjax/MathJax/archive/" version ".tar.gz"))
               (sha256
                (base32
                 "0pfkybf95a3s3v17rfb7cy598hlswkpi2g0lhnpnvlwcbj1z9p11"))))
    (build-system copy-build-system)
    (arguments
     '(#:install-plan
       '(("." "."))))
    (synopsis "JavaScript display engine for mathematics")
    (description
     "MathJax is an open-source JavaScript display engine for LaTeX, MathML,
and AsciiMath notation that works in all modern browsers, with built-in support
for assistive technology like screen readers.")
    (home-page "https://www.mathjax.org/")
    (license license:asl2.0)))

