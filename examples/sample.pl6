use lib <lib>;
use Subsets::IO;

say $?FILE.IO ~~ Path::e;
# -> Path::e {}($?FILE.IO.add: "meow");
