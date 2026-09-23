# Each subset is a file test over IO::Path:D with a `will complain`
# message shown on a typecheck failure. A `my subset IO::Path::e`
# declaration installs the subset into the IO::Path stash.
use experimental :will-complain;

my subset IO::Path::e of IO::Path:D
  will complain { 'Path must exist' }  # UNCOVERABLE
  where *.e;
my subset IO::Path::E of IO::Path:D
  will complain { 'Path must NOT exist' }  # UNCOVERABLE
  where *.e.not;

my subset IO::Path::f of IO::Path:D
  will complain { 'Path must be an existing file' }  # UNCOVERABLE
  where *.f;
my subset IO::Path::F of IO::Path:D
  will complain { 'Path must NOT be an existing file' }  # UNCOVERABLE
  where *.f.not;

my subset IO::Path::d of IO::Path:D
  will complain { 'Path must be an existing directory' }  # UNCOVERABLE
  where *.d;
my subset IO::Path::D of IO::Path:D
  will complain { 'Path must NOT be an existing directory' }  # UNCOVERABLE
  where *.d.not;

my subset IO::Path::fr of IO::Path:D
  will complain { 'Path must be an existing, readable file' }  # UNCOVERABLE
  where {.f and .r};
my subset IO::Path::frw of IO::Path:D
  will complain { 'Path must be an existing, readable and writable file' }  # UNCOVERABLE
  where {.f and .rw};
my subset IO::Path::frx of IO::Path:D
  will complain { 'Path must be an existing, readable and executable file' }  # UNCOVERABLE
  where {.f and .r and .x};
my subset IO::Path::fwx of IO::Path:D
  will complain { 'Path must be an existing, writable and executable file' }  # UNCOVERABLE
  where {.f and .w and .x};
my subset IO::Path::frwx of IO::Path:D
  will complain { 'Path must be an existing, readable, writable, and executable file' }  # UNCOVERABLE
  where {.f and .rwx};

my subset IO::Path::dr of IO::Path:D
  will complain { 'Path must be an existing, readable directory' }  # UNCOVERABLE
  where {.d and .r};
my subset IO::Path::drw of IO::Path:D
  will complain { 'Path must be an existing, readable and writable directory' }  # UNCOVERABLE
  where {.d and .rw};
my subset IO::Path::drx of IO::Path:D
  will complain { 'Path must be an existing, readable and executable directory' }  # UNCOVERABLE
  where {.d and .r and .x};
my subset IO::Path::dwx of IO::Path:D
  will complain { 'Path must be an existing, writable and executable directory' }  # UNCOVERABLE
  where {.d and .w and .x};
my subset IO::Path::drwx of IO::Path:D
  will complain { 'Path must be an existing, readable, writable, and executable directory' }  # UNCOVERABLE
  where {.d and .rwx};

# vim: expandtab shiftwidth=4
