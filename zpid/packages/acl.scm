(define-module (zpid packages acl)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (guix build utils)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages)
  #:use-module (gnu packages attr)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bash))

(define-public nfs4-acl-tools
  (package
    (name "nfs4-acl-tools")
    (version "0.3.7")
    (source (origin
              (method git-fetch)
              ;; tarballs are available here:
;; http://linux-nfs.org/~bfields/nfs4-acl-tools/
              (uri (git-reference
                    (url "git://git.linux-nfs.org/projects/bfields/nfs4-acl-tools.git")
                    (commit (string-append name "-" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0lq9xdaskxysggs918vs8x42xvmg9nj7lla21ni2scw5ljld3h1i"))
              (patches (search-patches "nfs4-acl-tools-0.3.7-fixpaths.patch"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f ; no tests
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-bin-sh
           (lambda* (#:key inputs native-inputs #:allow-other-keys)
             (substitute* "include/buildmacros"
               (("/bin/sh") (string-append (assoc-ref inputs "bash-minimal") "/bin/sh")))
             #t)))))
    (native-inputs
     `(("automake" ,automake)
       ("autoconf" ,autoconf)
       ("bash-minimal" ,bash-minimal)
       ("libtool" ,libtool)))
    (inputs
     `(("attr" ,attr)))
    (home-page "http://linux-nfs.org/wiki/index.php/Main_Page")
    (synopsis "This package contains commandline ACL utilities for the Linux
NFSv4 client")
    (description "Provides the commandline utilities nfs4_setfacl and
nfs4_getfacl, which are similar to their POSIX equivalents.")
    (license license:bsd-3)))
