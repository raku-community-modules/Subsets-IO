[![Actions Status](https://github.com/raku-community-modules/Subsets-IO/actions/workflows/test.yml/badge.svg)](https://github.com/raku-community-modules/Subsets-IO/actions)

NAME
====

`Subsets::IO` - Subsets for various types of `IO::Path` instances

SYNOPSIS
========

```raku
use Subsets::IO;

say "Our script is writable and readable"
    if $?FILE.IO ~~ IO::Path::frw;
```

```raku
use Subsets::IO;

sub make-conf($conf where IO::Path::dw | IO::Path::fw) {
    say "$conf is either a writable directory or a writable file";
}

sub make-conf-file(IO::Path::E $conf) {
    say "$conf is a non-existent path";
}
make-conf-file $?FILE.IO;
# Path must NOT exist Got /home/zoffix/CPANPRC/Subsets-IO/foo.p6
# Constraint type check failed in binding to parameter '$conf';
#   expected IO::Path::E but got IO::Path (IO::Path.new("/home/z...)
```

DESCRIPTION
===========

The module provides subsets of [`IO::Path:D`](https://docs.raku.org/type/IO::Path) that additionally perform file tests and either uses the new `will complain` (since Rakudo 2022.04) feature, or uses [`Subset::Helper`](https://raku.land/zef:raku-community-modules/Subset::Helper) to display useful error messages on typecheck failures.

AVAILABLE SUBSETS
=================

IO::Path::e
-----------

Path must exist.

IO::Path::E
-----------

Path must NOT exist.

IO::Path::f
-----------

Path must be an existing file.

IO::Path::F
-----------

Path must NOT be an existing file.

IO::Path::d
-----------

Path must be an existing directory.

IO::Path::D
-----------

Path must NOT be an existing directory.

IO::Path::fr
------------

Path must be an existing, readable file.

IO::Path::frw
-------------

Path must be an existing, readable and writable file.

IO::Path::frx
-------------

Path must be an existing, readable and executable file.

IO::Path::fwx
-------------

Path must be an existing, writeable and executable file.

IO::Path::frwx
--------------

Path must be an existing, readable, writable, and executable file.

IO::Path::dr
------------

Path must be an existing, readable directory.

IO::Path::drw
-------------

Path must be an existing, readable and writable directory.

IO::Path::drx
-------------

Path must be an existing, readable and executable directory.

IO::Path::dwx
-------------

Path must be an existing, writeable and executable directory.

IO::Path::drwx
--------------

Path must be an existing, readable, writable, and executable directory.

AUTHOR
======

Zoffix Znet

COPYRIGHT AND LICENSE
=====================

Copyright 2018 Zoffix Znet

Copyright 2019 - 2022 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

