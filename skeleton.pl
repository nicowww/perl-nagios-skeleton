#!/usr/bin/perl

# IMPORT PACKAGES
use strict;
use Getopt::Long;

# NAGIOS CODE
my %ERRORS=('OK'=>0,'WARNING'=>1,'CRITICAL'=>2,'UNKNOWN'=>3);

# VARIABLES
my $Version='1.0.0';
my $Name=$0;
my $text = "";
my $state = "";
my $status = undef;
my $dbh;

my $o_help=		undef; 		# want some help ?
my $o_version= 		undef;  	# print version
my $o_timeout=  	10;        	# default 10s Timeout
my $o_debug=		undef;		# debug mode
# TODO : init options

# FUNCTIONS

# Display plugin's version
sub show_versioninfo { print "$Name version : $Version\n"; }

# Display plugin's usage
sub print_usage {
	my $msg = shift;
	if (defined($msg)) {print $msg};
	print "Usage: $Name [ -o <timeout> -V -D]\n";
}

# Check parameters passed to the plugin
sub check_options {
  Getopt::Long::Configure ("bundling");
  GetOptions(
	'h'     => \$o_help,        'help'          => \$o_help,
	'o:i'   => \$o_timeout,     'timeout:i'     => \$o_timeout,
	'V:s'   => \$o_version,     'version:s'     => \$o_version,
	'D'     => \$o_debug,       'debug'         => \$o_debug,
	# TODO : Describe options
  );

  if (defined($o_help)) { help(); exit $ERRORS{"UNKNOWN"}};
  if (defined($o_version)) { show_versioninfo(); exit $ERRORS{"UNKNOWN"}};
}

# Display help and plugin's features
sub help {
	print $Name." for Nagios, version ",$Version,"\n\n";
	print_usage();
	print <<EOT;
-h, --help
   print this help message
-o, --timeout=TIMEOUT
   timeout in seconds (Default: $o_timeout)
-V, --version
   prints version number
-D, --debug
   debug mode
Note :
  The script will return
        OK       if we are able to ...,
        CRITICAL if we are able to ...,
        UNKNOWN  if we aren't able to ... 

EOT
}

# MAIN
sub main() {
	check_options();
	# TODO : your code here
}

main();
