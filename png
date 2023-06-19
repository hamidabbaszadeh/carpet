#!/usr/bin/perl

#use strict;
use GD;

$img = newFromPng GD::Image('image1.png') || die;

$maxColors = $img->colorsTotal;
$height = $img->height;
$width = $img->width;

print '\documentclass[12pt,a4paper,twocolumn]{article}
       \usepackage[top=.5in, bottom=.5in, left=.5in, right=.5in]{geometry}
       \begin{document}';


my @rows = undef;
for (my $y = $height-1; $y > -1; $y--) {

    for (my $x= 0; $x < $width ; $x++) {
        my $xy_color = $img->getPixel($x,$y);
        $this_row{$xy_color} = undef unless exists $this_row{$xy_color};
        push @{$this_row{$xy_color}},$x+1;
    }

    print '\subsubsection*{Radif: ';
    print $height-$y;
    print '}';
    print "\n";
    print '\begin';
    print '{itemize}';
    for (my $color = 0; $color < $maxColors; $color++) {
        if (@{$this_row{$color}}) {

            print '\item[',($color+1),':]';

            @_ = (@{$this_row{$color}});
            $_ = undef;

            my $pre = -5;
            my $abc = 0;

            my $last = $_[-1];

            foreach $_ (@_) {
                if ($_ != ($pre+1) or $_ == $last) {
									if ($abc) {
										if ($abc > 1 ) {print ' ---'};
										print ' '.$pre;
									}
									print " $_";
									$abc=0;
								} else {
									$abc++;
								}
                $pre = $_;
            }
            print '.';
            print "\n";

            @{$this_row{$color}} = ();
        }
    }
    print '\end{itemize}';
}
print '\end{document}';

#$img->close;


exit;
