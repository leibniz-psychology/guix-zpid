(define-module (zpid packages collectd)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module (guix licenses)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages rrdtool))

(define-public collectd
  (package
    (name "collectd")
    (version "5.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://storage.googleapis.com/collectd-tarballs/collectd-"
                    version
                    ".tar.bz2"))
              (sha256
               (base32
                "1cjxksxdqcqdccz1nbnc2fp6yy84qq361ynaq5q8bailds00mc9p"))
              (patches (search-patches "collectd-5.11.0-noinstallvar.patch"))))
    (build-system gnu-build-system)
    (arguments
     `(#:configure-flags (list "--localstatedir=/var" "--sysconfdir=/etc")
                         #:phases
                         (modify-phases %standard-phases
                           ;; Required because of patched sources.
                           (add-before 'configure 'autoreconf
                             (lambda _ (invoke "autoreconf" "-vfi") #t)))))
    (inputs
     `(("rrdtool" ,rrdtool)
       ("curl" ,curl)))
    (native-inputs
     `(("autoconf" ,autoconf)
       ("automake" ,automake)
       ("libtool" ,libtool)
       ("pkg-config" ,pkg-config)))
    (home-page "https://collectd.org/")
    (synopsis "Collect system and application performance metrics periodically")
    (description
     "collectd gathers metrics from various sources, e.g. the operating system,
applications, logfiles and external devices, and stores this information or
makes it available over the network. Those statistics can be used to monitor
systems, find performance bottlenecks (i.e. performance analysis) and predict
future system load (i.e. capacity planning).")
    (license '(licenses:expat licenses:gpl2))))
