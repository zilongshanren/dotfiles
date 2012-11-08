#!/usr/bin/perl

my $file = shift;

sub usage
{
    print <<EOH;
usage: pullproto.pl <filename>

  filename  The (header) file from which to pull the prototype

  STDIN should have a list of directives that define what prototypes 
  to pull from <filename>.  The lines should look like this:

  <line number>|<function name>|[class]

  where class is optional and need not be supplied if the function
  is not a member function of a class.
EOH
}

if (!defined($file))
{
    usage();
    exit(1);
}
if (! -r $file)
{
    print STDERR "$file is not readable.";
    exit(1);
}
open INFILE, "<$file" or die "unable to open $file";
my @c = <INFILE>;
close INFILE;

# (Matt Spear) This is a strange regexp to check for matched <>, e.g. get<std::vector<unsigned> >(const std::string &s) const
my $matched = qr/(?{local $d=0})
\<
(?:
	\< (?{$d++})
	| \> (?{$d--}) (?: (?{$d<0}) (?!))
	| (?> [^\<\>]*)
)
\>
/x;

while (<STDIN>)
{
    chomp;
    my $linenum = "";
    my $function = "";
    my $class = "";
    ($linenum, $function, $class) = split /\|/, $_;
    my @temp = @c;

    # Hideous hack... look for "signals:" before the function's line.  If you
    # find it then this function is actually a Qt signal and not a regular
    # function, in which case, we don't want to emit it into the
    # implementation.  Ugly ugly ugly...
    #
    # There's probably some awesome negative-lookahead RE for this, but I
    # can't figure out what it would be, nor if that would even be better :)
    #
    my @upto = reverse @temp[0..$linenum];
    my $signal = 0;
    foreach my $l (@upto) {
      $l =~ s!//.*$!!;
      if ($l =~ /\bsignals\b\s*:\s*$/) {
        $signal = 1;
        last;
      } elsif ($l =~ /^\s*[\s\w]+:\s*$/) {
        last;
      }
    }
    next if ($signal);
    if ($temp[$linenum - 2] =~ m/\Q$function\E/)
    {
        @temp = @temp[$linenum - 1..$#temp]
    }
    else
    {
        @temp = @temp[$linenum - 2..$#temp]
    }

    my $content = join "", @temp;
    my $fname = "";
    my $pre = "";
    my $post = "";
    if ($function =~ m/^operator/)
    {
        $function =~ s/\s//g;
    }
    my ($justclass) = $class =~ m/^.*::(.*)$/;
    $justclass = $class if !defined($justclass) || $justclass eq "";
    if ($function eq $justclass || $function eq "~$justclass")
    {
        ($fname, $post) = $content =~ m/(\Q$function\E$matched?)\s*(\([^\)]*\)[^;]*);/m; # (Matt Spear) added \Q\E and $matched
    }
    else
    {
        # Paolo Capriotti - Simplify function regexp and fix bug for pointer and reference return types
        my @a = $content =~ m/((const)?\s*(unsigned)?\s*\S+\s*[\*&]?)(\Q$function\E$matched?)\s*(\([^\)]*\)[^;]*);/m; # (Matt Spear) added \Q\E and $matched
        $pre = @a[0];
        $fname = @a[3];
        $post = @a[4];
    }
    print "==\n";
    my $toprint = "$pre$fname$post";
    if ($class ne "")
    {
        $toprint = "$pre$class" . "::" . "$fname$post";
    }
    $toprint =~ s/^\s*//;
    print $toprint;
    print "\n";
}
