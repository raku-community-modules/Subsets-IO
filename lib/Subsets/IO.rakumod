# Each subset is a file test over IO::Path:D with a `will complain`
# message shown on a typecheck failure. A `my subset IO::Path::e`
# declaration installs the subset into the IO::Path stash.
use experimental :will-complain;

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

=begin pod

=head1 NAME

`Subsets::IO` - Subsets for various types of `IO::Path` instances

=head1 SYNOPSIS

=begin code :lang<raku>

use Subsets::IO;

say "Our script is writable and readable"
    if $*PROGRAM ~~ IO::Path::frw;

=end code

=begin code :lang<raku>

use Subsets::IO;

sub make-conf($conf where IO::Path::dw | IO::Path::fw) {
    say "$conf is either a writable directory or a writable file";
}

sub make-conf-file(IO::Path::E $conf) {
    say "$conf is a non-existent path";
}
make-conf-file $*PROGRAM;
# Path must NOT exist Got /home/zoffix/CPANPRC/Subsets-IO/foo.p6
# Constraint type check failed in binding to parameter '$conf';
#   expected IO::Path::E but got IO::Path (IO::Path.new("/home/z...)

=end code

=head1 DESCRIPTION

The module provides subsets of
L<C<IO::Path:D>|https://docs.raku.org/type/IO::Path> that additionally perform
file tests, using the C<will complain> feature to display useful error
messages on typecheck failures.

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
