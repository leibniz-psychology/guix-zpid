(define-module (zpid packages jupyterlab)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages check)
  #:use-module (gnu packages monitoring)
  #:use-module (gnu packages node)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix hg-download)
  #:use-module (guix utils)
  #:use-module (guix build-system python))

(define-public python-requests-unixsocket
  (package
    (name "python-requests-unixsocket")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "requests-unixsocket" version))
       (sha256
        (base32
         "1sn12y4fw1qki5gxy9wg45gmdrxhrndwfndfjxhpiky3mwh1lp4y"))))
    (build-system python-build-system)
    (native-inputs
     ;; pbr is required for setup only
     `(("python-pbr" ,python-pbr)))
    (propagated-inputs
     `(("python-requests" ,python-requests)
       ("python-urllib3" ,python-urllib3)))
    (arguments
     ;; tests depend on very specific package version, which are not available in guix
     '(#:tests? #f))
    (home-page
     "https://github.com/msabramo/requests-unixsocket")
    (synopsis
     "Use requests to talk HTTP via a UNIX domain socket")
    (description
     "Use requests to talk HTTP via a UNIX domain socket")
    (license license:asl2.0)))

;; custom version with socket patch
(define-public python-notebook-zpid
  (package
    (inherit python-notebook)
    (name "python-notebook-zpid")
    (source (origin
              (inherit (package-source python-notebook))
              (patches (append (origin-patches (package-source python-notebook))
                               (search-patches "jupyter-unix-domain-sockets-4835-5.7.4.patch")))))
    ;; required for unix socket patches’ tests (not run by python-notebook, but
    ;; python-jupyterlab-server
    (propagated-inputs
     `(("python-requests-unixsocket" ,python-requests-unixsocket)
       ,@(package-propagated-inputs python-notebook)))))

;; jupyter package, which uses our custom notebook
(define jupyter-zpid-rewritten
  ((package-input-rewriting `((,python-notebook . ,python-notebook-zpid))) jupyter))

;; new name for the package XXX: can we do this in one step?
(define-public jupyter-zpid
  (package
    (inherit jupyter-zpid-rewritten)
    (name "jupyter-zpid")))

(define-public python-pytest-check-links
  (package
    (name "python-pytest-check-links")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       ;; URI uses underscores
       (uri (pypi-uri "pytest_check_links" version))
       (sha256
        (base32
         "12x3wmrdzm6wgk0vz02hb769h68nr49q47w5q1pj95pc89hsa34v"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-docutils" ,python-docutils)
       ("python-html5lib" ,python-html5lib)
       ("python-nbconvert" ,python-nbconvert)
       ("python-nbformat" ,python-nbformat)
       ("python-pytest" ,python-pytest)
       ("python-six" ,python-six)))
    (native-inputs
     `(("python-pbr-minimal" ,python-pbr-minimal)))
    (home-page
     "https://github.com/minrk/pytest-check-links")
    (synopsis "Check links in files")
    (description "Plugin for pytest that checks URLs for HTML-containing files")
    (license license:bsd-3)))

(define-public python-json5
  (package
    (name "python-json5")
    (version "0.8.5")
    (source
     (origin
       ;; sample.json5 is missing from PyPi source tarball
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/dpranke/pyjson5.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0nyngj18jlkgvm1177lc3cj47wm4yh3dqigygvcvw7xkyryafsqn"))))
    (build-system python-build-system)
    (home-page "https://github.com/dpranke/pyjson5")
    (synopsis
     "Python implementation of the JSON5 data format")
    (description
     "JSON5 extends the JSON data interchange format to make it slightly more
usable as a configuration language.  This Python package implements parsing and
dumping of JSON5 data structures.")
    (license license:asl2.0)))

(define-public python-jupyterlab-server
  (package
    (name "python-jupyterlab-server")
    (version "1.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "jupyterlab_server" version))
       (sha256
        (base32
         "1bax8iqwcc5p02h5ysdc48zvx7ll5jfzfsybhb3lfvyfpwkpb5yh"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-jinja2" ,python-jinja2)
       ("python-json5" ,python-json5)
       ("python-jsonschema" ,python-jsonschema)
       ("python-notebook-zpid" ,python-notebook-zpid)))
    (native-inputs
     `(("python-pytest" ,python-pytest)
       ("python-requests" ,python-requests)
       ("python-ipykernel" ,python-ipykernel)))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         ;; python setup.py test does not invoke pytest?
         (replace 'check
           (lambda _
             (invoke "pytest" "-vv"))))))
    (home-page "https://jupyter.org")
    (synopsis "JupyterLab Server")
    (description "A set of server components for JupyterLab and JupyterLab like
applications")
    (license license:bsd-3)))

(define-public python-jupyterlab
  (package
    (name "python-jupyterlab")
    (version "1.2.6")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "jupyterlab" version))
        (sha256
          (base32
            "0mc3nrj7fc5q2ajr09m261j386jsp8qjljg8anghlh8czc9ln4s2"))
        (patches (search-patches "python-jupyterlab-copy-nometa.patch"))))
    (build-system python-build-system)
    (propagated-inputs
      `(("python-jinja2" ,python-jinja2)
        ("python-jupyterlab-server"
         ,python-jupyterlab-server)
        ("python-notebook-zpid" ,python-notebook-zpid)
        ("python-tornado" ,python-tornado)
		("node" ,node)))
    (native-inputs
      `(("python-pytest" ,python-pytest)
        ("python-pytest-check-links"
         ,python-pytest-check-links)
        ("python-requests" ,python-requests)
        ("python-ipykernel" ,python-ipykernel)))
    (arguments
     ;; testing requires npm, so disabled for now
     '(#:tests? #f
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'patch-syspath
           (lambda* (#:key outputs inputs configure-flags #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out")))
               (substitute* "jupyterlab/commands.py"
                 ;; sys.prefix defaults to Python’s prefix in the store, not
                 ;; jupyterlab’s. Fix that.
                 (("sys\\.prefix")
                  (string-append "'" out "'"))))
             #t))
         ;; 'build does not respect configure-flags
         (replace 'build
           (lambda _
             (invoke "python" "setup.py" "build" "--skip-npm"))))
      #:configure-flags (list "--skip-npm")))
    (home-page "https://jupyter.org")
    (synopsis
      "The JupyterLab notebook server extension")
    (description
	  "An extensible environment for interactive and reproducible computing,
based on the Jupyter Notebook and Architecture.")
    (license license:bsd-3)))

