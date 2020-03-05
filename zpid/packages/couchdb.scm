;; CouchDB

(define-module (zpid packages couchdb)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (guix build utils)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages)
  #:use-module (gnu packages check)
  #:use-module (gnu packages erlang)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages gnuzilla)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages python)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages elixir))

(define-public couchdb
  (package
    (name "couchdb")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://apache/couchdb/source/" version
             "/apache-couchdb-" version ".tar.gz"))
       (sha256
        (base32
         "1nbz2vafzhp9jv8xna8cfnf99jwn22xs4ydzm426qx7yf0dbn2fi"))
       (modules '((guix build utils)))
       ;; remove pre-built binary, will be rebuilt
       (snippet '(begin (delete-file "bin/rebar") #t))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-paths
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "src/couch/rebar.config.script"
               (("/usr/include/mozjs-60")
                (string-append (assoc-ref inputs "mozjs") "/include/mozjs-60")))
             (substitute* "Makefile"
               ;; disable python-black code formatting
               (("check: all python-black") "check: all")
               ;; disable venv creation and package installation
               (("python3 -m venv .venv") "true")
               (("\\.venv/bin/python3 -m pip install -r requirements.txt") "true")
               ;; do not test elixir, depends on `mix` and several external dependencies
               (("@\\$\\(MAKE\\) elixir") "")
               ;; use system python
               (("\\.venv/bin/python3")
                (string-append (assoc-ref inputs "python") "/bin/python3")))
             #t))
         (add-after 'unpack 'set-env
           (lambda* (#:key inputs #:allow-other-keys)
             ;; make sure rebar finds a C compiler
             (setenv "CC" (string-append (assoc-ref inputs "gcc") "/bin/gcc"))
             #t))
         (replace 'configure
           (lambda* (#:key inputs #:allow-other-keys)
             (invoke "./configure" "--skip-deps" "--spidermonkey-version" "60")
             #t))
         (replace 'build
           (lambda _
             ;; create a release build
             (invoke "make" "release")
             #t))
         (replace 'install
           (lambda* (#:key inputs outputs #:allow-other-keys)
             ;; couchdb tries to bundle erts, use our own copy
             (let ((erts-version "10.3.5.9"))
               (delete-file-recursively
                (string-append "rel/couchdb/erts-" erts-version))
               (substitute* '("rel/couchdb/bin/couchdb" "rel/couchdb/bin/remsh")
                 (("ROOTDIR=\\$\\{ERTS_BIN_DIR%/\\*\\}")
                  (string-append "ROOTDIR=" (assoc-ref outputs "out")))
                 (("BINDIR=\"[^\"]+\"")
                  (string-append
                   "BINDIR=" (assoc-ref inputs "erlang")
                   "/lib/erlang/erts-" erts-version "/bin")))
               (copy-recursively "rel/couchdb" (assoc-ref outputs "out")))
             #t)))))
    (native-inputs
     ;; for tests
     `(("python" ,python)
       ("python-nose" ,python-nose)
       ("python-requests" ,python-requests)
       ("python-hypothesis" ,python-hypothesis)
       ("curl" ,curl)
       ;; for documentation
       ("python-sphinx" ,python-sphinx)))
    (inputs
     `(("erlang" ,erlang)
       ("icu4c" ,icu4c)
       ("openssl" ,openssl)
       ("mozjs" ,mozjs-60)))
    (home-page "https://couchdb.apache.org/")
    (synopsis "Document-oriented NoSQL database, implemented in Erlang")
    (description "CouchDB is a database that completely embraces the web.  Store
your data with JSON documents.  Access your documents with your web browser, via
HTTP.  Query, combine, and transform your documents with JavaScript.  CouchDB
works well with modern web and mobile apps.  You can distribute your data,
efficiently using CouchDB’s incremental replication.  CouchDB supports
master-master setups with automatic conflict detection.")
    (license license:asl2.0)))

