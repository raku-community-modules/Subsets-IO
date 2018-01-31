use lib <lib ../lib>;
use Subsets::IO;

say $?FILE.IO ~~ IO::Path::e;
-> IO::Path::e {}($?FILE.IO.add: "meow");
