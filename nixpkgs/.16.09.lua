add_property(   "lmod", "sticky")

local root = "/cvmfs/soft.computecanada.ca/nix/var/nix/profiles/16.09"

setenv("NIXUSER_PROFILE", root)
prepend_path("PATH", pathJoin(root, "sbin"))
prepend_path("PATH", pathJoin(root, "bin"))
prepend_path("LIBRARY_PATH", pathJoin(root, "lib"))
prepend_path("CPATH", pathJoin(root, "include"))
prepend_path("ACLOCAL_PATH", pathJoin(root, "share/aclocal"))
prepend_path("PKG_CONFIG_PATH", pathJoin(root, "lib/pkgconfig"))
setenv("FONTCONFIG_FILE", pathJoin(root, "etc/fonts/fonts.conf"))
prepend_path("CMAKE_PREFIX_PATH", root)
prepend_path("PYTHONPATH", pathJoin(root, "lib/python2.7/site-packages"))
setenv("PERL5OPT", "-I" .. pathJoin(root, "lib/perl5") .. " -I" .. pathJoin(root, "lib/perl5/site_perl"))
prepend_path("PERL5LIB", pathJoin(root, "lib/perl5/site_perl"))
prepend_path("PERL5LIB", pathJoin(root, "lib/perl5"))
setenv("SSL_CERT_FILE", "/etc/pki/tls/certs/ca-bundle.crt")
setenv("CURL_CA_BUNDLE", "/etc/pki/tls/certs/ca-bundle.crt")
setenv("PAGER", "less -R")
setenv("LESSOPEN", "|" .. pathJoin(root, "bin/lesspipe.sh %s"))
setenv("LOCALE_ARCHIVE", pathJoin(root, "lib/locale/locale-archive"))
-- workaround for id issue
prepend_path("LD_LIBRARY_PATH", "/usr/lib64/nvidia")
prepend_path("LD_LIBRARY_PATH", "/cvmfs/soft.computecanada.ca/nix/lib")

-- also make easybuild and easybuild-generated modules accessible
require("os")
prepend_path("PATH", "/cvmfs/soft.computecanada.ca/easybuild/bin")
prepend_path("PYTHONPATH", "/cvmfs/soft.computecanada.ca/easybuild/lib/python2.7/site-packages")
setenv("EASYBUILD_CONFIGFILES", "/cvmfs/soft.computecanada.ca/easybuild/config.cfg")
setenv("EASYBUILD_BUILDPATH", pathJoin("/dev/shm", os.getenv("USER")))

prepend_path("MODULEPATH", "/cvmfs/soft.computecanada.ca/easybuild/modules/2017/Core")
if os.getenv("USER") ~= "ebuser" then
    prepend_path("MODULEPATH", pathJoin(os.getenv("HOME"), ".local/easybuild/modules/2017/Core"))
end
