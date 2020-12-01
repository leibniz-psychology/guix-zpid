;; Modules for python-sanic. Packages not using the latest version should have
;; the version in their variable name.
;; Before upstreaming to guix check package descriptions.

(define-module (zpid packages sanic)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (guix build utils)
  #:use-module (guix build-system python)
  #:use-module (gnu packages)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages python-compression)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages openstack)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages xml))

(define-public python-pytest-sanic
  (package
    (name "python-pytest-sanic")
    (version "1.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pytest-sanic" version))
       (sha256
        (base32
         "0xndjbq27b27rdmyzqx4hmnm3b0cgjvp5ivq1cpnnc4w0gxrns67"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-aiohttp" ,python-aiohttp)
       ("python-async-generator"
        ,python-async-generator)
       ("python-pytest" ,python-pytest)))
    ;; disable tests, as they depend on python-sanic, which causes a loop
    (arguments `(#:tests? #f))
    (home-page
     "https://github.com/yunstanford/pytest-sanic/")
    (synopsis "a pytest plugin for Sanic")
    (description "a pytest plugin for Sanic")
    (license license:expat)))

(define-public python-httpcore-0.3
  (package
    (name "python-httpcore")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "httpcore" version))
       (sha256
        (base32
         "0n3bamaixxhcm27gf1ws3g6rkamvqx87087c88r6hyyl52si1ycn"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-certifi" ,python-certifi)
       ("python-chardet" ,python-chardet)
       ("python-h11" ,python-h11-0.8)
       ("python-h2" ,python-h2)
       ("python-idna" ,python-idna)
       ("python-rfc3986" ,python-rfc3986-1.3)))
    (home-page "https://github.com/encode/httpcore")
    (synopsis "Minimal low-level HTTP client")
    (description "The HTTP Core package provides a minimal low-level HTTP
client, which does one thing only.  Sending HTTP requests.
It does not provide any high level model abstractions over the API, does not
handle redirects, multipart uploads, building authentication headers,
transparent HTTP caching, URL parsing, session cookie handling, content or
charset decoding, handling JSON, environment based configuration defaults, or
any of that Jazz.")
    (license license:bsd-3)))

(define-public python-towncrier
  (package
    (name "python-towncrier")
    (version "19.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "towncrier" version))
       (sha256
        (base32
         "15l1gb0hhi9pf3mhhb9vpc93w6w3hrih2ljmzbkgfb3dwqd1l9a8"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-click" ,python-click)
       ("python-incremental" ,python-incremental)
       ("python-jinja2" ,python-jinja2)
       ("python-toml" ,python-toml)))
    (home-page
     "https://github.com/hawkowl/towncrier")
    (synopsis "Building newsfiles for your project.")
    (description
     "towncrier is a utility to produce useful, summarised news files for your
project.  Rather than reading the Git history as some newer tools to produce it,
or having one single file which developers all write to, towncrier reads \"news
fragments\" which contain information useful to end users.")
    (license license:expat)))

(define-public python-uvloop
  (package
    (name "python-uvloop")
    (version "0.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "uvloop" version))
       (sha256
        (base32
         "07j678z9gf41j98w72ysrnb5sa41pl5yxd7ib17lcwfxqz0cjfhj"))
       ;; passing --use-system-libuv to setup.py does not seem to work
       (patches (search-patches "python-uvloop-0.14.0-setupcfg.patch"))
       (modules '((guix build utils)))
       (snippet
        '(begin
           ;; Remove pre-compiled .c files
           (delete-file "uvloop/loop.c")
           ;; Remove bundled copy of libuv
           (delete-file-recursively "vendor/libuv")
           #t))))
    (propagated-inputs
     `(("dash" ,dash)))
    (inputs
     `(("libuv" ,libuv)))
    (native-inputs
     `(("python-cython" ,python-cython)
       ("python-pyopenssl" ,python-pyopenssl)
       ("python-flake8" ,python-flake8)
       ("python-psutil" ,python-psutil)
       ("python-aiohttp" ,python-aiohttp)))
    (arguments
     ;; TODO: Lots of test failures that need investigation
     '(#:tests? #f
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-bin-sh
           ;; substitute hard-coded reference to /bin/sh with dash from
           ;; propagated-inputs
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((dash (assoc-ref inputs "dash")))
               (substitute* "uvloop/loop.pyx"
                 (("'/bin/sh'") (string-append "'" dash "/bin/sh'")))
               #t))))))
    (build-system python-build-system)
    (home-page "http://github.com/MagicStack/uvloop")
    (synopsis
     "Fast implementation of asyncio event loop on top of libuv")
    (description
     "uvloop is a fast, drop-in replacement of the built-in asyncio event
loop.  uvloop is implemented in Cython and uses libuv under the hood.")
    (license license:expat)))

(define-public python-h11-0.8
  (package
    (inherit python-h11)
    (name "python-h11")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "h11" version))
       (sha256
        (base32
         "1jqspv3i6b93hkmav4c9x31y57nm8wczzhzjjva3v2jdlc4i0a9b"))))))

(define-public python-hstspreload
  (package
    (name "python-hstspreload")
    (version "2020.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "hstspreload" version))
       (sha256
        (base32
         "0nlxpksxx2xswlqb2c7qkdbca3gllzpx7mb6f5a9w0b992hhl4jz"))))
    (build-system python-build-system)
    (home-page
     "https://github.com/sethmlarson/hstspreload")
    (synopsis
     "Chromium HSTS Preload list as a Python package")
    (description
     "Chrome's HTTP Strict Transport Security (HSTS) preload list is a list of
sites that are hardcoded into Chrome as being HTTPS only.  This packages
provides a Python interface for the list.")
    (license license:bsd-3)))

(define-public python-httpx-0.9
  (package
    (name "python-httpx")
    (version "0.9.3")
    (source
     (origin
       (method git-fetch)
       ;; Pypi package lacks tests
       (uri (git-reference
             (url "https://github.com/encode/httpx")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "18gcr82sp1ngkczngp320pw7yvc3r4iv3azz805wm0cmrvpkkgji"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-certifi" ,python-certifi)
       ("python-chardet" ,python-chardet)
       ("python-h11" ,python-h11-0.8)
       ("python-h2" ,python-h2)
       ("python-hstspreload" ,python-hstspreload)
       ("python-idna" ,python-idna)
       ("python-rfc3986" ,python-rfc3986-1.3)
       ("python-sniffio" ,python-sniffio)
       ("python-urllib3" ,python-urllib3)))
    (native-inputs
     `(("python-rfc3986" ,python-rfc3986-1.3)
       ("python-pytest" ,python-pytest)
       ("python-trio" ,python-trio)
       ("python-trustme" ,python-trustme)
       ("python-pytest-cov" ,python-pytest-cov)
       ("python-brotli" ,python-brotli)
       ("python-uvicorn" ,python-uvicorn)))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-tests
           (lambda _
             (substitute*
                 '("tests/conftest.py" "tests/test_concurrency.py"
                   "tests/test_utils.py" "tests/dispatch/utils.py")
               ;; fix import
               (("tests\\.concurrency") "concurrency")
               (("tests\\.utils") "utils"))
             #t))
         (replace 'check
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (add-installed-pythonpath inputs outputs)
             (invoke "pytest"))))))
    (home-page "https://github.com/encode/httpx")
    (synopsis "The next generation HTTP client.")
    (description "The next generation HTTP client.")
    (license license:bsd-3)))

(define-public python-rfc3986-1.3
  (package
    (inherit python-rfc3986)
    (name "python-rfc3986")
    (version "1.3.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "rfc3986" version))
              (sha256
               (base32
                "01b42wqzwpnq5pnp1z0rplmqv8mnhwbvd8kw9raww9l18ayx0i03"))))
    (build-system python-build-system)))

(define-public python-aiofiles
  (package
    (name "python-aiofiles")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "aiofiles" version))
       (sha256
        (base32
         "1vmvq9qja3wahv8m1adkyk00zm7j0x64pk3f2ry051ja66xa07h2"))))
    (build-system python-build-system)
    (home-page "https://github.com/Tinche/aiofiles")
    (synopsis "File support for asyncio")
    (description "Ordinary local file IO is blocking, and cannot easily and
portably made asynchronous.  This means doing file IO may interfere with
asyncio applications, which shouldn't block the executing thread.  aiofiles
helps with this by introducing asynchronous versions of files that support
delegating operations to a separate thread pool.")
    (license license:asl2.0)))

(define-public python-sanic
  (package
    (name "python-sanic")
    (version "19.12.4")
    ;; pypi releases lack the examples/ directory, which is required for tests
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/huge-success/sanic.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1zslwfxdq8y9fnaslckgp2dg8dfxfbn8g19m9xdr5ibma290ffbm"))))
    (build-system python-build-system)
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'use-recent-pytest
           ;; allow using a recent pytest
           (lambda* (#:key inputs #:allow-other-keys)
            (substitute* "setup.py"
             (("pytest==5.2.1") "pytest")
             (("multidict==5.0.0") "multidict"))
             #t)))))
    (propagated-inputs
     `(("python-aiofiles" ,python-aiofiles)
       ("python-httptools" ,python-httptools)
       ("python-httpx" ,python-httpx-0.9)
       ("python-multidict" ,python-multidict)
       ("python-ujson" ,python-ujson)
       ("python-uvloop" ,python-uvloop)
       ("python-websockets" ,python-websockets)))
    (native-inputs
     `(("python-aiofiles" ,python-aiofiles)
       ("python-aiohttp" ,python-aiohttp)
       ("python-beautifulsoup4" ,python-beautifulsoup4)
       ("python-black" ,python-black)
       ("python-flake8" ,python-flake8)
       ("gunicorn" ,gunicorn)
       ("python-httpcore" ,python-httpcore-0.3)
       ;; package asks for this precise version
       ("python-pytest" ,python-pytest)
       ("python-pytest-asyncio" ,python-pytest-asyncio)
       ("python-pytest-benchmark"
        ,python-pytest-benchmark)
       ("python-pytest-cov" ,python-pytest-cov)
       ("python-pytest-sanic" ,python-pytest-sanic)
       ("python-pytest-sugar" ,python-pytest-sugar)
       ("python-towncrier" ,python-towncrier)
       ("python-tox" ,python-tox)
       ("python-ujson" ,python-ujson)
       ("python-uvloop" ,python-uvloop)
       ("python-uvicorn" ,python-uvicorn)))
    (home-page
     "http://github.com/huge-success/sanic")
    (synopsis
     "A web server and web framework that's written to go fast. Build fast. Run fast.")
    (description
     "A web server and web framework that's written to go fast. Build fast. Run fast.")
    (license license:expat)))
