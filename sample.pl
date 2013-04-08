#!/usr/bin/env perl
BEGIN {
  push @INC, "./lib";
}

use strict;
use warnings;

use Fizz::Buzz;

my $fb = new Fizz::Buzz; # Create an instance!

$fb->exec; # Standard FizzBuzz
$fb->exec("start"=>101, "end"=>200); # Keep on going
my @array = $fb->exec("start"=>201, "end"=>300, "ret"=>"array"); # Return array
printf "%s\n", join "\n", @array; # Print it out
my $string = $fb->exec("start"=>301, "end"=>400, "ret"=>"string"); # String
printf "%s\n", $string; # Print it out
$fb->set("ret"=>"print"); # Let's print from here
$fb->exec("start"=>401, "end"=>500, "sep"=>","); # Comma separated
$fb->set_args("fizz"=>"hoge", "buzz"=>"fuga"); # Japanesque?
$fb->exec("start"=>501, "end"=>600, "sep"=>"\n");
