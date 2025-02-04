#!/usr/bin/perl

use Image::Magick;

#
# Hide an image within an image
#
$watermark=Image::Magick->new;
$watermark->ReadImage('smile.gif');
($width, $height)=$watermark->Get('width','height');
#
# Hide image in image.
#
$image=Image::Magick->new;
$image->ReadImage('model.gif');
$image->SteganoImage(image=>$watermark,offset=>91);
$image->Write('model.pam');
$image->Write('show:');
#
# Extract image from image.
#
$size="$width" . "x" . "$height" . "+91";
$stegano=Image::Magick->new(size=>$size);
$stegano->ReadImage('stegano:model.pam');
$stegano->Write('stegano.pam');
$image->Write(magick=>'SHOW',title=>"Steganography Demo");
