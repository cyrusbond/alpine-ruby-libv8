# Ruby libv8 gem for Alpine

## TL;DR

This repository stores build scripts to publish an Alpine compatible version of libv8.

The Alpine Linux distribution relies on the musl libc instead of the
traditional GNU C Library (glibc). Many binary packages need to be rebuilt with
musl in order to work on Alpine.


## libv8 distribution

In Ruby, the libv8 gem is a binary build of V8. The gem exists in 2 versions:
 - source gem: that's the odd version number (e.g. 6.3.292.48.1)
 - compiled gem: the even version number (e.g. 6.3.292.48.0)

In Ruby, the binary gems are bundled per OS. Distinguishing variants such as
musl or glibc is not possible. It means the default binary version of libv8
does not work on Alpine Linux.


## Building for Alpine

When installing libv8 on some versions of Alpine, Ruby will fetch automatically
the latest version of libv8. This version is the compiled version for the glibc.

This repository forces the installation & compilation of the source version and
bundles it into a native Linux musl gem.

This [gem can be downloaded from here](https://download.sqreen.io/ruby/alpine/).



Made with :heart: by Sqreen
![Sqreen](https://s3-eu-west-1.amazonaws.com/sqreen-assets/npm/20171113/sqreen_horizontal_250.png)

