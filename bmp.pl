#!/usr/bin/perl -w

use strict;

my @hdr = qw(
    bfType
    bfSize
    bfReserved1
    bfReserved2
    bfOffBits
    biSize
    biWidth
    biHeight
    biPlanes
    biBitCount
    biCompression
    biSizeImage
    biXPelsPerMeter
    biYPelsPerMeter
    biClrUsed
    biClrImportant
);

binmode STDIN;
binmode STDOUT;

my $BMP = 'image3.bmp';
open BMP, $BMP or die $!;
binmode BMP;
my $data = <BMP>;
close BMP;

my @hdr_dat = unpack "SLSSLLLLSSLLLLLL", $data;
my %header;
@header{@hdr}=@hdr_dat;
print "$_\t$header{$_}\n" for @hdr;

