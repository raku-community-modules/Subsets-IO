use Subset::Helper;

my subset IO::Path::e
  of IO::Path:D where subset-is *.e,
  'Path must exist';
my subset IO::Path::E
  of IO::Path:D where subset-is *.e.not,
  'Path must NOT exist';

my subset IO::Path::f
  of IO::Path:D where subset-is *.f,
  'Path must be an existing file';
my subset IO::Path::F
  of IO::Path:D where subset-is *.f.not,
  'Path must NOT be an existing file';

my subset IO::Path::d
  of IO::Path:D where subset-is *.d,
  'Path must be an existing directory';
my subset IO::Path::D
  of IO::Path:D where subset-is *.d.not,
  'Path must NOT be an existing directory';

my subset IO::Path::fr
  of IO::Path:D where subset-is {.f and .r},
  'Path must be an existing, readable file';
my subset IO::Path::frw
  of IO::Path:D where subset-is {.f and .rw},
  'Path must be an existing, readable and writable file';
my subset IO::Path::frx
  of IO::Path:D where subset-is {.f and .r and .x},
  'Path must be an existing, readable and executable file';
my subset IO::Path::fwx
  of IO::Path:D where subset-is {.f and .w and .x},
  'Path must be an existing, writable and executable file';
my subset IO::Path::frwx
  of IO::Path:D where subset-is {.f and .rwx},
  'Path must be an existing, readable, writable, and executable file';

my subset IO::Path::dr
  of IO::Path:D where subset-is {.d and .r},
  'Path must be an existing, readable directory';
my subset IO::Path::drw
  of IO::Path:D where subset-is {.d and .rw},
  'Path must be an existing, readable and writable directory';
my subset IO::Path::drx
  of IO::Path:D where subset-is {.d and .r and .x},
  'Path must be an existing, readable and executable directory';
my subset IO::Path::dwx
  of IO::Path:D where subset-is {.d and .w and .x},
  'Path must be an existing, writable and executable directory';
my subset IO::Path::drwx
  of IO::Path:D where subset-is {.d and .rwx},
  'Path must be an existing, readable, writable, and executable directory';
