(define-module (zpid packages borg)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module ((gnu packages backup) #:prefix guix:))

(define-public borg
  (let ((commit "9bfe210948885b3a872ae7a5de7329a7b6e5a5a7")
        (revision "1")
        (base guix:borg))
  (package
    (inherit base)
    (name "borg")
    (version (git-version "1.2.2" revision commit))
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/borgbackup/borg.git")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0dicfvlnp47x8mlzbw2vavdpwvm54k2mgm6bkgmm0bv05fkbma40"))))
    (arguments
      (substitute-keyword-arguments (package-arguments base)
        ((#:phases phases)
          #~(modify-phases #$phases
              (add-after 'unpack 'fake-version
                (lambda _
                  ;; borg uses its own parsing and so we cannot use a setuptools_scm
                  ;; version string with git identifier
                  (setenv "SETUPTOOLS_SCM_PRETEND_VERSION" "1.2.2")
                  ;; Since setuptools_scm is not operational data is not automatically
                  ;; included in the build.
                  (call-with-output-file "MANIFEST.in"
                    (lambda (port)
                      (format port "global-include *~%"))))))))))))

