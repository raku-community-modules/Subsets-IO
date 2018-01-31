use Subset::Helper;

my subset Path::e is export(:e, :DEFAULT)
  of IO::Path:D where subset-is *.e,
  'Path must exist';
my subset Path::E is export(:E, :DEFAULT)
  of IO::Path:D where subset-is *.e.not,
  'Path must NOT exist';

my subset Path::f is export(:f, :DEFAULT)
  of IO::Path:D where subset-is *.f,
  'Path must be an existing file';
my subset Path::F is export(:F, :DEFAULT)
  of IO::Path:D where subset-is *.f.not,
  'Path must NOT be an existing file';

my subset Path::d is export(:d, :DEFAULT)
  of IO::Path:D where subset-is *.d,
  'Path must be an existing directory';
my subset Path::D is export(:D, :DEFAULT)
  of IO::Path:D where subset-is *.d.not,
  'Path must NOT be an existing directory';


my subset Path::fr is export(:fr, :DEFAULT)
  of IO::Path:D where subset-is {.f and .r},
  'Path must be an existing, readable file';
my subset Path::frw is export(:frw, :DEFAULT)
  of IO::Path:D where subset-is {.f and .rw},
  'Path must be an existing, readable and writable file';
my subset Path::frwx is export(:frwx, :DEFAULT)
  of IO::Path:D where subset-is {.f and .rwx},
  'Path must be an existing, readable, writable, and executable file';

my subset Path::dr is export(:dr, :DEFAULT)
  of IO::Path:D where subset-is {.d and .r},
  'Path must be an existing, readable directory';
my subset Path::drw is export(:drw, :DEFAULT)
  of IO::Path:D where subset-is {.d and .rw},
  'Path must be an existing, readable and writable directory';
my subset Path::drwx is export(:drwx, :DEFAULT)
  of IO::Path:D where subset-is {.d and .rwx},
  'Path must be an existing, readable, writable, and executable directory';
