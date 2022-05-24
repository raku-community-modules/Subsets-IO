use Subsets::IO;

say $?FILE.IO ~~ IO::Path::e;
-> IO::Path::e {}($?FILE.IO.add: "meow");

# vim: expandtab shiftwidth=4
