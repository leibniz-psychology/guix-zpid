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
    (version "1.2.5033")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rstudio/rstudio.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0f3p2anz9xay2859bxj3bvyj582igsp628qxsccpkgn0jifvi4np"))
              (patches
               (search-patches "rstudio-server-1.2.5033-boost-1.70.0_p1.patch"
                               "rstudio-server-1.2.5033-boost-1.70.0_p2.patch"
                               "rstudio-server-1.2.5033-unbundle.patch"
                               ))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  ;; de-blob: windows tools
                  delete-file-recursively "dependencies/windows/tools"
                  #t))))
    (build-system cmake-build-system)
    (arguments
     `(#:configure-flags '("-DRSTUDIO_TARGET=Server" "-DCMAKE_BUILD_TYPE=Release")
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
               (("resources/mathjax-26") (assoc-ref inputs "mathjax")))
             (substitute* "src/cpp/session/SessionOptions.cpp"
               (("bin/pandoc") (string-append (assoc-ref inputs "pandoc") "/bin/pandoc")))
             (substitute* "src/cpp/core/r_util/REnvironmentPosix.cpp"
               (("runCommand\\(\"which") (string-append "runCommand(\"" (assoc-ref inputs "which") "/bin/which")))
             (substitute* '("src/cpp/session/SessionConsoleProcess.cpp" "src/cpp/session/modules/SessionTerminalShell.cpp")
               (("/usr/bin/env") (string-append (assoc-ref inputs "coreutils") "/bin/env")))
             #t))
         ;; XXX: figure out how to get away without copying. Set classpath?
         (add-after 'unpack 'copy-jars
           (lambda* (#:key inputs native-inputs #:allow-other-keys)
             (let ((dest-dir "src/gwt/lib/gwt/2.8.1"))
               (mkdir-p dest-dir)
               (copy-recursively (assoc-ref inputs "java-gwt") dest-dir)
               )
             (let ((dest-dir "src/gwt/lib/gin/2.1.2"))
               (mkdir-p dest-dir)
               (copy-recursively (string-append (assoc-ref inputs "java-gin")) dest-dir)
               )
             (mkdir-p "src/gwt/lib")
             (copy-file (assoc-ref inputs "junit-source-tarball") "src/gwt/lib/junit-4.9b3.jar")
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
       ("util-linux" ,util-linux)
       ("pandoc" ,ghc-pandoc)
       ("which" ,which)
       ("java-gwt" ,java-gwt)
       ("java-gin" ,java-gin)
       ("mathjax" ,mathjax)
       ;; for `env`
       ("coreutils" ,coreutils)
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

(define-public mathjax
  (package
    (name "mathjax")
    (version "2.6.1")
    ( source (origin
               (method url-fetch)
               (uri "https://github.com/mathjax/MathJax/archive/2.6.1.tar.gz")
               (sha256
                (base32
                 "1f7v48s7km9fi9i0bignn8f91z3bk04n4jx407l3xsd4hxfr8in7"))))
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

(define-public java-gwt
  (package
    (name "java-gwt")
    (version "2.8.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gwt.googlesource.com/gwt")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0amfj27jbq7az85sz02jqbkmiz2fyp7g4nsnvxis4wyr4iygwxv2"))
              (patches
               (search-patches "java-gwt-2.8.1-nogit.patch"))
              ))
    (build-system ant-build-system)
    (arguments
     `(#:tests? #f
       #:build-target "dist"
       #:phases
       (modify-phases %standard-phases
         ;; build.xml has no install phase. Instead extract the .zip and copy
         ;; it to the destination
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (invoke "unzip" "build/dist/gwt-2.8.1.zip")
             (copy-recursively "gwt-2.8.1" (assoc-ref outputs "out"))
             ))
         (add-after 'unpack 'set-env
           (lambda* (#:key inputs #:allow-other-keys)
             ;;             (setenv "GWT_TOOLS" (string-append (getcwd) "/gwttools"))
             (setenv "GWT_TOOLS" (assoc-ref inputs "gwt-tools"))
             (setenv "GWT_VERSION" "2.8.1")
                               ; see -nogit.patch
             (setenv "GWT_GITREV" "release")
             #t)))))
    ;;         (add-after 'unpack 'rebase-guava
    ;;           (lambda* (#:key inputs #:allow-other-keys)
    ;;            (let* (
    ;;(dest-dir "gwttools/lib/guava/guava-19.0")
    ;;(dest-file (string-append dest-dir "/guava-19.0-rebased.jar")))
    ;;            (mkdir-p dest-dir)
    ;;            ; per instructions from
    ;;            ; https://github.com/gwtproject/tools/tree/master/lib/guava/guava-19.0
    ;;            (invoke "java" "-jar" (string-append (assoc-ref inputs "java-jarjar") "/share/java/jarjar-1.4.jar") "process" (string-append (assoc-ref inputs "gwt-tools") "/lib/guava/guava-19.0/guava-19.0.jarjar-rules") (string-append (assoc-ref inputs "java-guava") "/share/java/guava.jar") dest-file)
    ;;            (invoke "zip" dest-file "-d" "META-INF/*")
    ;;             #t)))
    ;;         (add-after 'unpack 'copy-jars
    ;;           (lambda* (#:key inputs #:allow-other-keys)
    ;;            (mkdir-p "gwttools/lib/eclipse")
    ;;            (copy-file (string-append (assoc-ref inputs "java-eclipse-jdt-core") "/share/java/eclipse-jdt-core.jar") "gwttools/lib/eclipse/org.eclipse.jdt.core_3.11.2-CUSTOM-GWT-2.8-20160205.jar")
    ;;            (mkdir-p "gwttools/lib/colt")
    ;;            (copy-file (string-append (assoc-ref inputs "java-colt") "/colt.jar") "gwttools/lib/colt/colt-1.2.jar")
    ;;            (mkdir-p "gwttools/lib/objectweb/asm-5.0.3/lib/")
    ;;            (copy-file (string-append (assoc-ref inputs "java-asm") "/share/java/asm-6.0.jar") "gwttools/lib/objectweb/asm-5.0.3/lib/asm-all-5.0.3.jar")
    ;;            (mkdir-p "gwttools/lib/apache")
    ;;            (copy-file (string-append (assoc-ref inputs "ant") "/lib/ant.jar") "gwttools/lib/apache/ant-1.6.5.jar")
    ;;             #t)))))
    (inputs `(
              ;;("java-guava" ,java-guava)
              ;;("java-eclipse-jdt-core" ,java-eclipse-jdt-core)
              ;;("java-colt" ,java-colt)
              ;;("java-asm" ,java-asm)
              ;;("ant" ,ant)
              ("gwt-tools"
               ,(origin
                  (method git-fetch)
                  (uri (git-reference
                        (url "https://github.com/gwtproject/tools.git")
                        (commit "f42d2729a3a8e6ba9b9aec069957bce5dc0f6f6d")))
                  (file-name (git-file-name "gwt-tools" version))
                  (sha256
                   (base32
                    "14sipzc7y81l9cia5zv3187i94r0harsrjk4c8p9ixi3b3ypmn2f"))))))
    (native-inputs
     ;; for 'install phase
     `(("unzip" ,unzip)
       ("java-jarjar" ,java-jarjar)))
    (home-page "http://www.gwtproject.org/")
    (synopsis "Google Web Toolkit")
    (description
     "GWT is a development toolkit for building and optimizing complex
browser-based applications. Its goal is to enable productive development of
high-performance web applications without the developer having to be an expert
in browser quirks, XMLHttpRequest, and JavaScript.")
    (license license:asl2.0)))

(define-public java-gin
  (package
    (name "java-gin")
    (version "2.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gwtplus/google-gin.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "02q81pgf2ifqq1r7azk2ci5zkp6nb6i1lwjfdb7cwbyymmyd8fra"))
              ))
    (build-system ant-build-system)
    (arguments
     `(#:tests? #f
       #:build-target "dist"
       #:phases
       (modify-phases %standard-phases
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             ;; since we’re not tracking dependencies properly, install the
             ;; pre-packaged guice*.jar as well
             (invoke "unzip" "-od" "gin-2.1.2" "out/dist/gin-2.1.2.zip")
             (copy-recursively "gin-2.1.2" (assoc-ref outputs "out"))
             ))
         (add-after 'unpack 'set-env
           (lambda* (#:key inputs #:allow-other-keys)
             (setenv "GWT_HOME" (assoc-ref inputs "java-gwt"))
             #t)))))
    (inputs `(("java-gwt" ,java-gwt)))
    ;; for 'install phase
    (native-inputs `(("unzip" ,unzip)))
    (home-page "https://gwtplus.github.io/google-gin/site/index.html")
    (synopsis "GWT INjection")
    (description
     "Gin (GWT INjection) brings automatic dependency injection to GWT
client-side code. Gin is built on top of Guice and uses (a subset of) Guice's
binding language.")
    (license license:asl2.0)))

(define-public java-colt
  (package
    (name "java-colt")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://dst.lbl.gov/ACSSoftware/colt/colt-download/releases/colt-1.2.0.tar.gz")
              (sha256
               (base32
                "1fyxppzqw9l83fx9rxllcm5ldnja1fbn1524vjv7max42hir89ns"))
              (patches (search-patches "java-colt-1.2.0-encoding.patch"))))
    (build-system ant-build-system)
    (arguments 
     '(#:build-target "build"
       #:tests? #f
       #:phases
       (modify-phases %standard-phases
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (install-file "lib/colt.jar" (assoc-ref outputs "out"))
             )))))
    (home-page "https://dst.lbl.gov/ACSSoftware/colt/index.html")
    (synopsis "Java libraries for High Performance Scientific and Technical Computing")
    (description "")
    ;; custom license + lgpl minus military applications
    (license #f)))

