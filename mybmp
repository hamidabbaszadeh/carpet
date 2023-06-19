#!/usr/bin/perl

#use strict;
use Image::BMP;

my $img = new Image::BMP(
    file    => 'image.bmp',
    debug   => 0,
);

print '\documentclass[12pt,a4paper,twocolumn]{article}
\usepackage[top=.5in, bottom=.5in, left=.5in, right=.5in]{geometry}
\begin{document}';


#print "Resulation: $img->{Width} x $img->{Height}\n";
#print "Colors: $img->{ColorsUsed}\n";

#for (my $var = 0; $var < $img->{ColorsUsed}; $var++) {
#    printf "RGB Color %2d: %x\n",$var,$img->colormap($var);
#}

my @rows = undef;
for (my $y = $img->{Height}-1; $y > -1; $y--) {
#for (my $y = 3; $y > -1; $y--) {


    for (my $x= 0; $x < $img->{Width} ; $x++) {
        my $xy_color = $img->xy_index($x,$y);
        $this_row{$xy_color} = undef unless exists $this_row{$xy_color};
        push @{$this_row{$xy_color}},$x+1;
    }

        print '\subsubsection*{Radif: ';
    print $img->{Height}-$y;
    print '}';
    print "\n";
    print '\begin';
    print '{itemize}';
    for (my $color = 0; $color < $img->{ColorsUsed}; $color++) {
        if (@{$this_row{$color}}) {

            print '\item[',($color+1),':]';

            @_ = (@{$this_row{$color}});
            $_ = undef;

            my $pre = -1;
            my $abc = 0;

            #foreach $_ (@_) {
                #if ($_ == ($pre+1)) {
                #    $abc++;
                #}
                #if ($_ != ($pre+1) or $_ == $img->{Width} ) {
                #    if ($abc == 0) { printf " %d",$_;}
                ##    if ($abc == 1) { printf " %d %d",$_-1,$_;}
                #    if ($abc >  1) { printf " %d---%d", $_-$abc,$_;}
                #    $abc = 0;
                #}
                #$pre = $_;
            #}
            #print '\end{tabular}';
            print "@_";
            print '.';
            print "\n";

            @{$this_row{$color}} = ();
        }
    }
    print '\end{itemize}';
}
print '\end{document}';

$img->close;


exit;
