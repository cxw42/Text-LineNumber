use strict;
use warnings;
use ExtUtils::MakeMaker;
use File::Spec;

my $PM = File::Spec->catfile(qw(lib Text LineNumber.pm));

WriteMakefile(
    NAME                => 'Text::LineNumber',
    AUTHOR              => 'Juergen Weigert <jw@suse.de>',
    VERSION_FROM        => $PM,
    ABSTRACT_FROM       => $PM,
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => ['Text-LineNumber-*', '*.orig'] },
);
