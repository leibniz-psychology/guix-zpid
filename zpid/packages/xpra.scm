(define-module (zpid packages xpra)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system python)
  #:use-module (guix gexp)
  #:use-module (gnu packages)
  #:use-module (gnu packages lisp-xyz)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26))

;; Not upstreamable: Pre-built JavaScript mess.
(define-public xpra-html5
  (package
    (name "xpra-html5")
    (version "4.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.xpra.org/src/xpra-html5-"
                           version ".tar.xz"))
       (sha256
        (base32 "1hhssbdhjdh9kkqhc76ri0jk56rdsca6fd1fk03b44qvxiw1fazk"))))
    (build-system python-build-system)
    (native-inputs `(("uglify-js" ,uglify-js)))
    (arguments
     `(#:tests? #f ; No tests.
       #:phases
       (modify-phases %standard-phases
         ;; built by 'install phase
         (delete 'build)
		 (replace 'install
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (invoke
              "python" "setup.py" "install"
			  (string-append (assoc-ref outputs "out") "/share/xpra/www")))))))
    (home-page "https://www.xpra.org/")
    (synopsis "HTML5 client for Xpra")
    (description "")
    (license license:mpl2.0)))

