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
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages openstack)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages xml))

(define-public python-trustme
  (package
    (name "python-trustme")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "trustme" version))
       (sha256
        (base32
         "0v3vr5z6apnfmklf07m45kv5kaqvm6hxrkaqywch57bjd2siiywx"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-cryptography" ,python-cryptography)
       ("python-idna" ,python-idna)))
    (home-page
     "https://github.com/python-trio/trustme")
    (synopsis
     "#1 quality TLS certs while you wait, for the discerning tester")
    (description
     "trustme is a tiny Python package that gives you a fake certificate
authority (CA) to generate fake TLS certs to use in tests.")
    (license '(license:expat license:asl2.0))))

(define-public python-py-cpuinfo
  (package
    (name "python-py-cpuinfo")
    (version "5.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "py-cpuinfo" version))
       (sha256
        (base32
         "0045y6832gqjg63jmw0qj2jwyypgjwr7sfdq3lfv49b6fxpl5xic"))))
    (build-system python-build-system)
    (home-page
     "https://github.com/workhorsy/py-cpuinfo")
    (synopsis "Get CPU info with pure Python")
    (description
     "Py-cpuinfo gets CPU info with pure Python.  Py-cpuinfo should work without
any extra programs or libraries, beyond what your OS provides.")
    (license license:expat)))

(define-public python-pytest-benchmark
  (package
    (name "python-pytest-benchmark")
    (version "3.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pytest-benchmark" version))
       (sha256
        (base32
         "0a4mpb4j73dsyk47hd1prrjpfk4r458s102cn80rf253jg818hxd"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-pathlib2" ,python-pathlib2)
       ("python-py-cpuinfo" ,python-py-cpuinfo)
       ("python-pytest" ,python-pytest)
       ))
    (home-page
     "https://pytest-benchmark.readthedocs.io/en/latest/")
    (synopsis
     "A pytest fixture for benchmarking code")
    (description
     "This pytest plugin provides a benchmark fixture.  This fixture is a
callable object that will benchmark any function passed to it.")
    (license license:bsd-2)))

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

(define-public python-immutables
  (package
    (name "python-immutables")
    (version "0.11")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "immutables" version))
       (sha256
        (base32
         "18x4lnl03rkg2y7ljb916pv3v40kvi6zwg0i36n30rfwl1w0b1fn"))))
    (build-system python-build-system)
    (home-page
     "https://github.com/MagicStack/immutables")
    (synopsis "Immutable Collections")
    (description "An immutable mapping type for Python.  The underlying
datastructure is a Hash Array Mapped Trie (HAMT) used in Clojure, Scala,
Haskell, and other functional languages.  Immutable mappings based on HAMT have
O(log N) performance for both set() and get() operations, which is essentially
O(1) for relatively small mappings.")
    (license license:asl2.0)))

(define-public python-sniffio
  (package
    (name "python-sniffio")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sniffio" version))
       (sha256
        (base32
         "08bsp2pp2dxzn9yzcafwzw8jlm0jf50as0ix8vfhxzk91w810f4f"))))
    (build-system python-build-system)
    (native-inputs
     `(("python-curio" ,python-curio)
       ("python-pytest" ,python-pytest)))
    (home-page
     "https://sniffio.readthedocs.io/en/latest/")
    (synopsis
     "Sniff out which async library your code is running under")
    (description
     "This is a tiny package whose only purpose is to let you detect which
async library your code is running under.")
    (license '(license:expat license:asl2.0))))

(define-public python-hpack
  (package
    (name "python-hpack")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "hpack" version))
       (sha256
        (base32
         "1lp9ja4dk6jg0pm2d18kvh95k9p6yxhh4l1h7y541qzs9cgrrv4f"))))
    (build-system python-build-system)
    (home-page "https://python-hyper.org/projects/hpack/en/latest/")
    (synopsis "Pure-Python HPACK header compression")
    (description
     "hpack provides a simple Python interface to the HPACK compression
algorithm, used to compress HTTP headers in HTTP/2.  Used by some of the most
popular HTTP/2 implementations in Python, HPACK offers a great Python interface
as well as optional upgrade to optimised C-based compression routines from
nghttp2.")
    (license license:expat)))

(define-public python-hyperframe
  (package
    (name "python-hyperframe")
    (version "5.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "hyperframe" version))
       (sha256
        (base32
         "07xlf44l1cw0ghxx46sbmkgzil8vqv8kxwy42ywikiy35izw3xd9"))))
    (build-system python-build-system)
    (home-page
     "https://python-hyper.org/hyperframe/en/latest/")
    (synopsis "HTTP/2 framing layer for Python")
    (description "hyperframe is a pure-Python tool for working with HTTP/2
frames.  This library allows you to create, serialize, and parse HTTP/2
frames.")
    (license license:expat)))

(define-public python-h2
  (package
    (name "python-h2")
    (version "3.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "h2" version))
       (sha256
        (base32
         "1d1svhixk3hr78ph3nx8wi7sagx1xrvm712mmk028i2rhb92p8xq"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-hpack" ,python-hpack)
       ("python-hyperframe" ,python-hyperframe)))
    (home-page "https://python-hyper.org/projects/h2/en/stable/")
    (synopsis
     "HTTP/2 State-Machine based protocol implementation")
    (description
     "Hyper-h2 is a HTTP/2 protocol stack, written entirely in Python.  The
goal of Hyper-h2 is to be a common HTTP/2 stack for the Python ecosystem,
usable in all programs regardless of concurrency model or environment.  To
achieve this, Hyper-h2 is entirely self-contained: it does no I/O of any kind,
leaving that up to a wrapper library to control.  This ensures that it can
seamlessly work in all kinds of environments, from single-threaded code to
Twisted.")
    (license license:expat)))

(define-public python-h11
  (package
    (name "python-h11")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "h11" version))
       (sha256
        (base32
         "1qfad70h59hya21vrzz8dqyyaiqhac0anl2dx3s3k80gpskvrm1k"))))
    (build-system python-build-system)
    (native-inputs
     `(("python-pytest" ,python-pytest)))
    (home-page "https://github.com/python-hyper/h11")
    (synopsis
     "A pure-Python, bring-your-own-I/O implementation of HTTP/1.1")
    (description
     "h11 implements the HTTP/1.1 protocol, but contains no IO code whatsoever.
This means you can hook h11 up to your favorite network API, and that could be
anything you want: synchronous, threaded or asynchronous.")
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
       ("uvicorn" ,uvicorn)))
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

(define-public python-websockets
  (package
    (name "python-websockets")
    (version "8.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "websockets" version))
       (sha256
        (base32
         "03s3ml6sbki24aajllf8aily0xzrn929zxi84p50zkkbikdd4raw"))))
    (build-system python-build-system)
    (home-page
     "https://websockets.readthedocs.io/en/stable/")
    (synopsis
     "An implementation of the WebSocket Protocol (RFC 6455 & 7692)")
    (description
     "websockets is a library for building WebSocket servers and clients in
Python with a focus on correctness and simplicity.  Built on top of asyncio,
Python’s standard asynchronous I/O framework, it provides an elegant
coroutine-based API.")
    (license license:bsd-3)))

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

(define-public python-httptools
  (package
    (name "python-httptools")
    (version "0.0.13")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "httptools" version))
       (sha256
        (base32
         "1z0xl0n16jdv84yqm78nh68z8lz1qsmq7094jkj4ixqzl1xvs370"))))
    (build-system python-build-system)
    (home-page
     "https://github.com/MagicStack/httptools")
    (synopsis
     "Python binding for the nodejs HTTP parser")
    (description
     "This package contains Python bindings for the HTTP parser library used by
NodeJS.")
    (license license:expat)))

(define-public python-sanic
  (package
    (name "python-sanic")
    (version "19.12.2")
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
         "12cb4phd8y6rlf493zian5kpvn8qzq8zhkdawhc0c54v3lr0ahqx"))))
    (build-system python-build-system)
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
       ("python-bandit" ,python-bandit)
       ("python-beautifulsoup4" ,python-beautifulsoup4)
       ("python-black" ,python-black)
       ("python-flake8" ,python-flake8)
       ("gunicorn" ,gunicorn)
       ("python-httpcore" ,python-httpcore-0.3)
       ("python-pytest" ,python-pytest-5.2)
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
       ("uvicorn" ,uvicorn)))
    (home-page
     "http://github.com/huge-success/sanic")
    (synopsis
     "A web server and web framework that's written to go fast. Build fast. Run fast.")
    (description
     "A web server and web framework that's written to go fast. Build fast. Run fast.")
    (license license:expat)))

(define-public python-curio
  (package
    (name "python-curio")
    (version "1.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "curio" version))
       (sha256
        (base32
         "07477rzjm8j0vjr5b6hnx4kwfvqm402ykpasqkd8lsh6d63h101a"))))
    (build-system python-build-system)
    (native-inputs
     `(("python-pytest" ,python-pytest)
       ("python-sphinx" ,python-sphinx)))
    (home-page "https://curio.readthedocs.io/en/latest/")
    (synopsis "Concurrent I/O")
    (description "Curio is a coroutine-based library for concurrent Python
systems programming. It provides standard programming abstractions such as as
tasks, sockets, files, locks, and queues.")
    (license license:bsd-3)))

(define-public python-aiohttp-cors
  (package
    (name "python-aiohttp-cors")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "aiohttp_cors" version))
       (sha256
        (base32
         "0pczn54bqd32v8zhfbjfybiza6xh1szwxy6as577dn8g23bwcfad"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-aiohttp" ,python-aiohttp)))
    ;; tests require selenium
    (arguments `(#:tests? #f))
    (home-page
     "https://github.com/aio-libs/aiohttp-cors")
    (synopsis "CORS support for aiohttp")
    (description "CORS support for aiohttp")
    (license license:asl2.0)))

(define-public uvicorn
  (package
    (name "uvicorn")
    (version "0.11.3")
    (source
     (origin
       (method git-fetch)
       ;; Pypi does not have tests.
       (uri (git-reference
             (url "https://github.com/encode/uvicorn")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0c06klxnk5f8r3wgk9cgf224ajk8x87mmb4nbigi2qfnh8j5x6i9"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-click" ,python-click)
       ("python-h11" ,python-h11)
       ("python-httptools" ,python-httptools)
       ("python-uvloop" ,python-uvloop)
       ("python-websockets" ,python-websockets)
       ("python-wsproto" ,python-wsproto)))
    (native-inputs
     `(("python-pytest" ,python-pytest)
       ("python-requests" ,python-requests)))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (replace 'check
           (lambda _
             (invoke "pytest"))))))
    (home-page "https://github.com/encode/uvicorn")
    (synopsis "The lightning-fast ASGI server")
    (description "Uvicorn is a lightning-fast ASGI server implementation, using
uvloop and httptools.  It currently supports HTTP/1.1 and WebSockets.")
    (license license:bsd-3)))

(define-public python-wsproto
  (package
    (name "python-wsproto")
    (version "0.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "wsproto" version))
       (sha256
        (base32
         "17gsxlli4w8am1wwwl3k90hpdfa213ax40ycbbvb7hjx1v1rhiv1"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-h11" ,python-h11)))
    (native-inputs
     `(("python-pytest" ,python-pytest)))
    (home-page
     "https://wsproto.readthedocs.io/en/latest/")
    (synopsis
     "WebSockets state-machine based protocol implementation")
    (description
     "wsproto is a WebSocket protocol stack written to be as flexible as
possible.  To that end it is written in pure Python and performs no I/O of its
own.  Instead it relies on the user to provide a bridge between it and
whichever I/O mechanism is in use, allowing it to be used in single-threaded,
multi-threaded or event-driven code.")
    (license license:expat)))

(define-public python-outcome
  (package
    (name "python-outcome")
    ;; cannot upgrade to 1.0.1 until python-attrs and thus python-pytest are
    ;; upgraded
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "outcome" version))
       (sha256
        (base32
         "0wdcakx1r1317bx6139k9gv6k272fryid83d1kk0r43andfw0n4x"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-attrs" ,python-attrs)))
    (native-inputs
     `(("python-pytest" ,python-pytest)
       ("python-async-generator" ,python-async-generator)))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (replace 'check
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (add-installed-pythonpath inputs outputs)
             (invoke "pytest" "tests"))))))
    (home-page
     "https://outcome.readthedocs.io/en/latest/")
    (synopsis
     "Capture the outcome of Python function calls.")
    (description
     "Outcome provides a function for capturing the outcome of a Python
function call, so that it can be passed around.")
    (license '(license:expat license:asl2.0))))

(define-public python-trio
  (package
    (name "python-trio")
    ;; cannot upgrade until python-attrs is upgraded to >= 19.2
    (version "0.12.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "trio" version))
       (sha256
        (base32
         "0wnnrs36arvimrfgrlbpjw3nx7lppx43yvk2b380ivv69h52i6hl"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-async-generator"
        ,python-async-generator)
       ("python-attrs" ,python-attrs)
       ("python-idna" ,python-idna)
       ("python-outcome" ,python-outcome)
       ("python-sniffio" ,python-sniffio)
       ("python-sortedcontainers"
        ,python-sortedcontainers)))
    (native-inputs
     `(("python-pytest" ,python-pytest)
       ("python-astor" ,python-astor)
       ("python-yapf" ,python-yapf)
       ("python-pyopenssl" ,python-pyopenssl)
       ("python-pylint" ,python-pylint)
       ("python-jedi" ,python-jedi)
       ("python-trustme" ,python-trustme)))
    (arguments
     ;; most tests require I/O and don’t work in the sandbox
     `(#:tests? #f))
    (home-page "https://github.com/python-trio/trio")
    (synopsis
     "A friendly Python library for async concurrency and I/O")
    (description
     "A friendly Python library for async concurrency and I/O")
    (license '(license:expat license:asl2.0))))

(define-public python-brotli
  (package
    (name "python-brotli")
    (version "1.0.7")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "Brotli" version ".zip"))
       (sha256
        (base32
         "19x5dqxckb62n37mpnczp21rfxqvgpm0ki5ds8ac65zx8hbxqf05"))))
    (build-system python-build-system)
    ;; build system does not support linking to system libbrotli, it’s always
    ;; built from source
    (native-inputs
     ;; sources only available as zip
     `(("unzip" ,unzip)))
    (home-page "https://github.com/google/brotli")
    (synopsis
     "Python bindings for the Brotli compression library")
    (description
     "Brotli is a general-purpose lossless compression algorithm.
It is similar in speed to deflate but offers denser compression.  This package
provides Python bindings for libbrotlienc and libbrotlidec.")
    (license license:expat)))

(define-public python-pytest-5.2
  (package
    (name "python-pytest")
    (version "5.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pytest" version))
       (sha256
        (base32
         "185a7k3c4bdmkk7rw2z9hb5i1ib5phkiqc378yrhq7clyhsk8mna"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-atomicwrites" ,python-atomicwrites)
       ("python-attrs" ,python-attrs)
       ("python-colorama" ,python-colorama)
       ("python-importlib-metadata"
        ,python-importlib-metadata)
       ("python-more-itertools" ,python-more-itertools)
       ("python-packaging" ,python-packaging)
       ("python-pathlib2" ,python-pathlib2)
       ("python-pluggy" ,python-pluggy-0.13)
       ("python-py" ,python-py)
       ("python-wcwidth" ,python-wcwidth)))
    (native-inputs
     `(("python-argcomplete" ,python-argcomplete)
       ("python-hypothesis" ,python-hypothesis)
       ("python-mock" ,python-mock)
       ("python-nose" ,python-nose)
       ("python-requests" ,python-requests)
       ("python-xmlschema" ,python-xmlschema)
       ("python-setuptools-scm" ,python-setuptools-scm)
       ("python-pluggy" ,python-pluggy-0.13)))
    (home-page "https://docs.pytest.org/en/latest/")
    (synopsis
     "pytest: simple powerful testing with Python")
    (description
     "pytest: simple powerful testing with Python")
    (license license:expat)))

(define-public python-pluggy-0.13
  (package
    (name "python-pluggy")
    (version "0.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pluggy" version))
       (sha256
        (base32
         "1c35qyhvy27q9ih9n899f3h4sdnpgq027dbiilly2qb5cvgarchm"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-importlib-metadata"
        ,python-importlib-metadata)))
    (native-inputs
     `(("python-setuptools-scm" ,python-setuptools-scm)
       ("python-tox" ,python-tox)))
    (home-page
     "https://github.com/pytest-dev/pluggy")
    (synopsis
     "plugin and hook calling mechanisms for python")
    (description
     "plugin and hook calling mechanisms for python")
    (license license:expat)))

