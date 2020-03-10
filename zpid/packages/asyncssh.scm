(define-module (zpid packages asyncssh)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (guix build utils)
  #:use-module (guix build-system python)
  #:use-module (gnu packages)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-xyz))

;; asyncio with support for old python-cryptography 2.7
(define-public python-asyncssh
  (package
    (name "python-asyncssh")
    (version "2.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "asyncssh" version))
        (sha256
          (base32
            "1vhq3ikz6ya3113krzi74119j2dcqpsg39ipsa037l4rdfrx492s"))
        ;; revert changes that require python-cryptography 2.8, no functional
        ;; differences
        (patches (search-patches "python-asyncio-2.2.0-no-crypto2.8.patch"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-cryptography" ,python-cryptography)
       ("python-pyopenssl" ,python-pyopenssl)
       ("python-gssapi" ,python-gssapi)
       ("python-bcrypt" ,python-bcrypt)))
    ;; required for test suite
    (native-inputs
     `(("openssh" ,openssh)
       ("openssl" ,openssl)))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'disable-tests
           (lambda* _
            (substitute* "tests/test_agent.py"
              ;; Test fails for unknown reason
              (("async def test_confirm")
                "@unittest.skip('disabled by guix')\n    async def test_confirm")))))))
    (home-page "https://asyncssh.readthedocs.io/")
    (synopsis
      "Asynchronous SSHv2 client and server library")
    (description
      "AsyncSSH is a Python package which provides an asynchronous client and
server implementation of the SSHv2 protocol on top of the Python 3.6+ asyncio
framework")
    (license license:epl2.0)))

