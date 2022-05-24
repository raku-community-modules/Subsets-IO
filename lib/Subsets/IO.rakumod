# NOTE: Before release 2022.04, there was no "will complain" trait for
# subsets.  So in those cases we revert to the original code based on
# the original Subset::Helper module.  Since the code with "will complain"
# does not compile on the older versions, we need to only compile that
# if we can with an EVAL.  However, this exposed issues in pre-compilation.
# So the setting up of a lexical version of the "will complain" trait
# is always compiled for all versions of Rakudo, but in such a way that it
# is a runtime decision to actually call the "will complain" trait.
#
# Sadly, the old code could not be made part of an EVAL (probably for
# similar reasons), so it has been extracted into a separate file that
# is required conditionally.  Since both versions of the code just put
# their subsets into the IO::Path stash, we don't need to worry about
# the lexicality of the "require" or the EVAL.  This could be considered
# a feature in these circumstances.

# Workaround for https://github.com/rakudo/rakudo/issues/4933
use experimental;
my constant $original-will = &trait_mod:<will>;
my constant $complainer = ::("EXPORT").WHO<will-complain>:exists
  ?? ::("EXPORT").WHO<will-complain>
  !! Nil;

my sub trait_mod:<will>(|c) {
    c<complain> && !($complainer =:= Nil)
      ?? $complainer.WHO<&trait_mod:<will>>(|c)
      !! $original-will(|c)
}

if Compiler.new.version < v2022.04 {
    require Subsets::IO-helper;
}
else {
    Q:to/NEW/.EVAL;
#--------------------------------------------------------------------------------
my subset IO::Path::e of IO::Path:D
  will complain { 'Path must exist' }
  where *.e;
my subset IO::Path::E of IO::Path:D
  will complain { 'Path must NOT exist' }
  where *.e.not;

my subset IO::Path::f of IO::Path:D
  will complain { 'Path must be an existing file' }
  where *.f;
my subset IO::Path::F of IO::Path:D
  will complain { 'Path must NOT be an existing file' }
  where *.f.not;

my subset IO::Path::d of IO::Path:D
  will complain { 'Path must be an existing directory' }
  where *.d;
my subset IO::Path::D of IO::Path:D
  will complain { 'Path must NOT be an existing directory' }
  where *.d.not;

my subset IO::Path::fr of IO::Path:D
  will complain { 'Path must be an existing, readable file' }
  where {.f and .r};
my subset IO::Path::frw of IO::Path:D
  will complain { 'Path must be an existing, readable and writable file' }
  where {.f and .rw};
my subset IO::Path::frx of IO::Path:D
  will complain { 'Path must be an existing, readable and executable file' }
  where {.f and .r and .x};
my subset IO::Path::fwx of IO::Path:D
  will complain { 'Path must be an existing, writable and executable file' }
  where {.f and .w and .x};
my subset IO::Path::frwx of IO::Path:D
  will complain { 'Path must be an existing, readable, writable, and executable file' }
  where {.f and .rwx};

my subset IO::Path::dr of IO::Path:D
  will complain { 'Path must be an existing, readable directory' }
  where {.d and .r};
my subset IO::Path::drw of IO::Path:D
  will complain { 'Path must be an existing, readable and writable directory' }
  where {.d and .rw};
my subset IO::Path::drx of IO::Path:D
  will complain { 'Path must be an existing, readable and executable directory' }
  where {.d and .r and .x};
my subset IO::Path::dwx of IO::Path:D
  will complain { 'Path must be an existing, writable and executable directory' }
  where {.d and .w and .x};
my subset IO::Path::drwx of IO::Path:D
  will complain { 'Path must be an existing, readable, writable, and executable directory' }
  where {.d and .rwx};
NEW
#--------------------------------------------------------------------------------
}

=begin pod

=head1 NAME

`Subsets::IO` - Subsets for various types of `IO::Path` instances

=head1 SYNOPSIS

=begin code :lang<raku>

use Subsets::IO;

say "Our script is writable and readable"
    if $?FILE.IO ~~ IO::Path::frw;

=end code

=begin code :lang<raku>

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

=end code

=head1 DESCRIPTION

The module provides subsets of
L<C<IO::Path:D>|https://docs.raku.org/type/IO::Path> that additionally perform
file tests and either uses the new C<will complain> (since Rakudo 2022.04)
feature, or uses
L<C<Subset::Helper>|https://raku.land/zef:raku-community-modules/Subset::Helper>
to display useful error messages on typecheck failures.

=head1 AVAILABLE SUBSETS

=head2 IO::Path::e

Path must exist.

=head2 IO::Path::E

Path must NOT exist.

=head2 IO::Path::f

Path must be an existing file.

=head2 IO::Path::F

Path must NOT be an existing file.

=head2 IO::Path::d

Path must be an existing directory.

=head2 IO::Path::D

Path must NOT be an existing directory.

=head2 IO::Path::fr

Path must be an existing, readable file.

=head2 IO::Path::frw

Path must be an existing, readable and writable file.

=head2 IO::Path::frx

Path must be an existing, readable and executable file.

=head2 IO::Path::fwx

Path must be an existing, writeable and executable file.

=head2 IO::Path::frwx

Path must be an existing, readable, writable, and executable file.

=head2 IO::Path::dr

Path must be an existing, readable directory.

=head2 IO::Path::drw

Path must be an existing, readable and writable directory.

=head2 IO::Path::drx

Path must be an existing, readable and executable directory.

=head2 IO::Path::dwx

Path must be an existing, writeable and executable directory.

=head2 IO::Path::drwx

Path must be an existing, readable, writable, and executable directory.

=head1 AUTHOR

Zoffix Znet

=head1 COPYRIGHT AND LICENSE

Copyright 2018 Zoffix Znet

Copyright 2019 - 2022 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
