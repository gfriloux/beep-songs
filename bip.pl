#!/usr/bin/perl

use  strict;

# beep.pl : A menu and CLI based script to play songs  through your PC speaker
# 
# Don't know exactly howto document  this code as GPL, but this code is GPL friendly :)
#
# Author:   binarypearl
#
# Versions:
#    0.01 - SMM - 03/21/2010
#         Contains 4 songs.  The first is original, the 2nd and 3rd are  covers, and the 4th (taps) was taken from 
#        a forum in  ubuntuforums.org; where I learned some of the details to make 
#         the other songs.
#

use Getopt::Long;

my $version =  "0.01";
my $version_flag = "";

my $user_input = "";
my  $song_requested = "";

GetOptions (
    "song:s" =>  \$song_requested,
    "version" => \$version_flag,
);

#  Octave 0
my $CN0 = "-f 16.35";
my $CS0 = my $Db0 = "-f 17.32";
my  $DN0 = "-f 18.35";
my $DS0 = my $Eb0 = "-f 19.45";
my $EN0 = "-f  20.60";
my $FN0 = "-f 21.83";
my $FS0 = my $Gb0 = "-f 23.12";
my  $GN0 = "-f 24.50";
my $GS0 = my $Ab0 = "-f 25.96";
my $AN0 = "-f  27.50";
my $AS0 = my $Bb0 = "-f 29.14";
my $BN0 = "-f 30.87";

#  Octave 1
my $CN1 = "-f 32.70";
my $CS1 = my $Db1 = "-f 34.65";
my  $DN1 = "-f 36.71";
my $DS1 = my $Eb1 = "-f 38.89";
my $EN1 = "-f  41.20";
my $FN1 = "-f 43.65";
my $FS1 = my $Gb1 = "-f 46.25";
my  $GN1 = "-f 49.00";
my $GS1 = my $Ab1 = "-f 51.91";
my $AN1 = "-f  55.00";
my $AS1 = my $Bb1 = "-f 58.27";
my $BN1 = "-f 61.74";

#  Octave 2
my $CN2 = "-f 65.41";
my $CS2 = my $Db2 = "-f 69.30";
my  $DN2 = "-f 73.42";
my $DS2 = my $Eb2 = "-f 77.78";
my $EN2 = "-f  82.41";
my $FN2 = "-f 87.31";
my $FS2 = my $Gb2 = "-f 92.50";
my  $GN2 = "-f 98.00";
my $GS2 = my $Ab2 = "-f 103.83";
my $AN2 = "-f  110.00";
my $AS2 = my $Bb2 = "-f 116.54";
my $BN2 = "-f 123.47";

#  Octave 3
my $CN3 = "-f 130.81";
my $CS3 = my $Db3 = "-f 138.59";
my  $DN3 = "-f 146.83";
my $DS3 = my $Eb3 = "-f 155.56";
my $EN3 =  "-f 164.81";
my $FN3 = "-f 174.61";
my $FS3 = my $Gb3 = "-f  185.00";
my $GN3 = "-f 196.00";
my $GS3 = my $Ab3 = "-f 207.65";
my  $AN3 = "-f 220.00";
my $AS3 = my $Bb3 = "-f 233.08";
my $BN3 =  "-f 246.94";

# Octave 4
my $CN4 = "-f 261.63";
my $CS4 = my  $Db4 = "-f 277.63";
my $DN4 = "-f 293.66";
my $DS4 = my $Eb4 =  "-f 311.13";
my $EN4 = "-f 329.63";
my $FN4 = "-f 349.23";
my  $FS4 = my $Gb4 = "-f 369.99";
my $GN4 = "-f 392.00";
my $GS4 = my  $Ab4 = "-f 415.30";
my $AN4 = "-f 440.00";
my $AS4 = my $Bb4 = "-f  466.16";
my $BN4 = "-f 493.88";

# Octave 5
my $CN5 = "-f  523.25";
my $CS5 = my $Db5 = "-f 554.37";
my $DN5 = "-f 587.33";
my  $DS5 = my $Eb5 = "-f 622.25";
my $EN5 = "-f 659.26";
my $FN5 =  "-f 698.46";
my $FS5 = my $Gb5 = "-f 739.99";
my $GN5 = "-f  783.99";
my $GS5 = my $Ab5 = "-f 830.61";
my $AN5 = "-f 880.00";
my  $AS5 = my $Bb5 = "-f 932.33";
my $BN5 = "-f 987.77";

# Octave  6
my $CN6 = "-f 1046.50";
my $CS6 = my $Db6 = "-f 1108.73";
my  $DN6 = "-f 1174.66";
my $DS6 = my $Eb6 = "-f 1244.51";
my $EN6 =  "-f 1318.51";
my $FN6 = "-f 1396.91";
my $FS6 = my $Gb6 = "-f  1479.98";
my $GN6 = "-f 1567.98";
my $GS6 = my $Ab6 = "-f  1661.22";
my $AN6 = "-f 1760.00";
my $AS6 = my $Bb6 = "-f  1864.66";
my $BN6 = "-f 1975.53";

# Octave 7
my $CN7 = "-f  2093.00";
my $CS7 = my $Db7 = "-f 2217.46";
my $DN7 = "-f  2349.32";
my $DS7 = my $Eb7 = "-f 2489.02";
my $EN7 = "-f  2637.02";
my $FN7 = "-f 2793.83";
my $FS7 = my $Gb7 = "-f  2959.96";
my $GN7 = "-f 3135.96";
my $GS7 = my $Ab7 = "-f  3322.44";
my $AN7 = "-f 3520.00";
my $AS7 = my $Bb7 = "-f  3729.31";
my $BN7 = "-f 3951.07";

# Octave 8 (Don't know all  of it)
my $CN8 = "-f 4186.01";
my $CS8 = my $Db8 = "-f 4434.92";
my  $DN8 = "-f 4698.64";
my $DS8 = my $Eb8 = "-f 4978.03";

my  $whole='-l 2048';
my $dottedhalf='-l 1536';
my $half='-l 1024';
my  $dottedquarter='-l 768';
my $quarter='-l 512';
my  $dottedeighth='-l 384';
my $eighth='-l 256';
my $sixteenth='-l  128';

my $super_small='-D 32';
my $smallspace='-D 64';
my  $longspace='-D 128';

if ($version_flag) {
    system  ("clear");
    print "beep.pl: $version\n";
    exit 0;
}

while  (1) {
    print_header();
    display_menu();
}

sub  print_header() {
    system ("clear");
    print "----------"x10;
     print "\nBeep song menu\tversion: $version\n";
    print  "----------"x10;
    print "\n\n";    
}

sub display_menu()  {
    print "1.  Bass warmup\n";
    print "2.  On to  Zanarkand\n";
    print "3.  Entry of the Gladiators\n";
    print  "4.  Taps\n";
    print "Q.  Quit / Exit\n";

    print  "\nSong to play: ";

    chomp ($song_requested);

    if  ($song_requested ne "") {
        $user_input = $song_requested;
         #print "***$song_requested***\n";
        determine_song();
         $song_requested = "";
    }

    else {
         get_user_input();
        determine_song();
    }
}

sub  get_user_input() {
    $user_input = <>;
    chomp  ($user_input);
}

sub determine_song() {

    if  ($user_input == 1) {
        base_warmup();
    }

    elsif  ($user_input == 2) {
        on_to_zanarkand();
    }

     elsif ($user_input == 3) {
        entry_of_the_gladiators();
    }

     elsif ($user_input == 4) {
        taps();
    }


     elsif ($user_input eq 'q' || $user_input eq 'Q') {
        print  "\nThanks to play Zpong\n";
        exit 0;
    }
}

#  SONGS
# REMEMBER TO PUT A SPACE AFTER EACH -n !!! 
# Otheriwse the  song won't play
#
# REMEMBER TO NOT have a -n on the last note.   Otherwise you get an aditional, unintentional beep at the end

sub  taps() {
my $song = join (":", <<SONG =~ /(.+)/g);
     $dottedeighth $GN4 $smallspace -n 
    $sixteenth $GN4 $smallspace -n  
    $dottedhalf $CN5 $longspace -n 
    $dottedeighth $GN4  $smallspace -n 
    $sixteenth $CN5 $smallspace -n 
     $dottedhalf $EN5 $longspace -n 
    $dottedeighth $GN4 $smallspace -n  
    $sixteenth $CN5 $smallspace -n 
    $quarter $EN5  $smallspace -n 
    $dottedeighth $GN4 $smallspace -n 
     $sixteenth $CN5 $smallspace -n 
    $quarter $EN5 $smallspace -n 
     $dottedeighth $GN4 $smallspace -n 
    $sixteenth $CN5 $smallspace  -n 
    $dottedhalf $EN5 $longspace -n 
    $eighth $CN5  $smallspace -n 
    $eighth $EN5 $smallspace -n 
    $half $GN5  $smallspace -n 
    $quarter $EN5 $smallspace -n 
    $quarter  $CN5 $smallspace -n 
    $dottedhalf $GN4 $longspace -n 
     $dottedeighth $GN4 $smallspace -n 
    $sixteenth $GN4 $smallspace -n  
    $whole $CN5
SONG
    `beep $song`;
}

sub  entry_of_the_gladiators() {
my $song = join (":", <<SONG =~  /(.+)/g);
#=INTRO========================================
     $dottedquarter $EN5 $super_small -n 
    $sixteenth $EN5 $super_small  -n 
    $sixteenth $EN5 $super_small -n 

    $dottedquarter  $EN5 $super_small -n 
    $sixteenth $EN5 $super_small -n 
     $sixteenth $EN5 $super_small -n 

    $sixteenth $EN5 $super_small  -n 
    $sixteenth $Eb5 $super_small -n 
    $sixteenth $DN5  $super_small -n 
    $sixteenth $Db5 $super_small -n 
     $sixteenth $CN5 $super_small -n 
    $sixteenth $BN4 $super_small -n 
     $sixteenth $Bb4 $super_small -n 
    $sixteenth $AN4 $super_small -n  
    $sixteenth $Ab4 $super_small -n 
    $sixteenth $GN4  $super_small -n 
    $sixteenth $Gb4 $super_small -n 
     $sixteenth $FN4 $super_small -n 
    $sixteenth $EN4 $super_small -n 
     $sixteenth $Eb4 $super_small -n 
    $sixteenth $DN4 $super_small -n  
    $sixteenth $CS4 $super_small -n 
#-----------------------------------------------
     $dottedquarter $FS5 $super_small -n 
    $sixteenth $FS5  $super_small -n 
    $sixteenth $FS5 $super_small -n 

     $dottedquarter $FS5 $super_small -n 
    $sixteenth $FS5 $super_small  -n 
    $sixteenth $FS5 $super_small -n 

    $sixteenth $FS5  $super_small -n 
    $sixteenth $FN5 $super_small -n 
     $sixteenth $EN5 $super_small -n 
    $sixteenth $Eb5 $super_small -n 
     $sixteenth $DN5 $super_small -n 
    $sixteenth $Db5 $super_small -n  
    $sixteenth $CN5 $super_small -n 
    $sixteenth $BN4  $super_small -n 
    $sixteenth $Bb4 $super_small -n 
     $sixteenth $AN4 $super_small -n 
    $sixteenth $Ab4 $super_small -n 
     $sixteenth $GN4 $super_small -n 
    $sixteenth $FS4 $super_small -n  
    $sixteenth $FN4 $super_small -n 
    $sixteenth $EN4  $super_small -n 
    $sixteenth $DS4 $super_small -n 
#------------------------------------------
     $dottedquarter $GN5 $super_small -n 
    $sixteenth $GN5  $super_small -n 
    $sixteenth $GN5 $super_small -n 

     $dottedquarter $GN5 $super_small -n 
    $sixteenth $GN5 $super_small  -n 
    $sixteenth $GN5 $super_small -n 

#=Intro to part  A===========================
    $sixteenth $GN4 $super_small -n 
     $sixteenth $GS4 $super_small -n 
    $sixteenth $AN4 $super_small -n  
    $sixteenth $AS4 $super_small -n 
    $sixteenth $BN4  $super_small -n 
    $sixteenth $CN5 $super_small -n 
     $sixteenth $CS5 $super_small -n 
    $sixteenth $DN5 $super_small -n 
     $sixteenth $DS5 $super_small -n 
    $sixteenth $EN5 $super_small -n  
    $sixteenth $FN5 $super_small -n 
    $sixteenth $FS5  $super_small -n 
    $sixteenth $GN5 $super_small -n 
     $sixteenth $GS5 $super_small -n 
    $sixteenth $AN5 $super_small -n 
     $sixteenth $BN5 $super_small -n 

#=Part  A===================================

    $eighth $CN6  $super_small -n 
    $eighth $BN5 $super_small -n 
    $sixteenth  $Bb5 $super_small -n 
    $sixteenth $BN5 $super_small -n 
     $sixteenth $Bb5 $super_small -n 
    $sixteenth $AN5 $super_small -n 

     $eighth $Ab5 $super_small -n 
    $eighth $GN5 $super_small -n 
     $eighth $FS5 $super_small -n 
    $eighth $GN5 $super_small -n 

     $eighth $AN5 $super_small -n 
    $eighth $Ab5 $super_small -n 
     $sixteenth $GN5 $super_small -n 
    $sixteenth $Ab5 $super_small -n  
    $sixteenth $GN5 $super_small -n 
    $sixteenth $FS5  $super_small -n 

    $eighth $FN5 $super_small -n 
    $eighth  $EN5 $super_small -n 
    $eighth $DS5 $super_small -n 
     $eighth $EN5 $super_small -n 

    $sixteenth $GN5 $longspace -n 
     $sixteenth $FN5 $super_small -n 
    $sixteenth $FN5 $super_small -n  
    $eighth $CS5 $super_small -n 
    $eighth $DN5 $super_small  -n 

    $sixteenth $GN5 $longspace -n 
    $sixteenth $FN5  $super_small -n 
    $sixteenth $FN5 $super_small -n 
    $eighth  $CS5 $super_small -n 
    $eighth $DN5 $super_small -n 

     $sixteenth $BN4 $super_small -n 
    $sixteenth $CN5 $super_small -n 
     $sixteenth $CS5 $super_small -n 
    $sixteenth $DN5 $super_small -n  
    $sixteenth $DS5 $super_small -n 
    $sixteenth $EN5  $super_small -n 
    $sixteenth $FN5 $super_small -n 
     $sixteenth $FS5 $super_small -n 
    $sixteenth $GN5 $super_small -n 
     $sixteenth $GS5 $super_small -n 
    $sixteenth $AN5 $super_small -n  
    $sixteenth $BN5 $super_small -n 
    $eighth $AN5  $super_small -n 
    $eighth $GN5 $super_small -n  
#=Part  A2==========================================
    $eighth $CN6  $super_small -n 
    $eighth $BN5 $super_small -n 
    $sixteenth  $Bb5 $super_small -n 
    $sixteenth $BN5 $super_small -n 
     $sixteenth $Bb5 $super_small -n 
    $sixteenth $AN5 $super_small -n 

     $eighth $Ab5 $super_small -n 
    $eighth $GN5 $super_small -n 
     $eighth $FS5 $super_small -n 
    $eighth $GN5 $super_small -n 

     $eighth $AN5 $super_small -n 
    $eighth $Ab5 $super_small -n 
     $sixteenth $GN5 $super_small -n 
    $sixteenth $Ab5 $super_small -n  
    $sixteenth $GN5 $super_small -n 
    $sixteenth $FS5  $super_small -n 

    $eighth $FN5 $super_small -n 
    $eighth  $EN5 $super_small -n 
    $eighth $DS5 $super_small -n 
     $eighth $EN5 $super_small -n 

# Ending 1
    $eighth $DS5  $super_small -n 
    $sixteenth $DS5 $super_small -n 
     $sixteenth $DS5 $super_small -n 
    $eighth $FS5 $super_small -n 
     $eighth $BN4 $super_small -n 

    $sixteenth $GN5 $super_small  -n 
    $sixteenth $AN5 $super_small -n 
    $sixteenth $GN5  $super_small -n 
    $sixteenth $FS5 $super_small -n 
    $eighth  $EN5 $super_small -n 
    $eighth $BN4 $super_small -n 

     $eighth $BN5 $super_small -n 
    $sixteenth $BN5 $super_small -n 
     $sixteenth $BN5 $super_small -n 
    $eighth $BN5 $super_small -n 
     $eighth $BN5 $super_small -n 

    $sixteenth $BN5 $super_small  -n 
    $sixteenth $BN5 $super_small -n 
    $sixteenth $BN5  $super_small -n 
    $sixteenth $BN5 $super_small -n 
     $sixteenth $BN5 $super_small -n 
    $sixteenth $BN5 $super_small -n 
     $eighth $BN5 $super_small -n 

#=Part  A===================================

    $eighth $CN6  $super_small -n 
    $eighth $BN5 $super_small -n 
    $sixteenth  $Bb5 $super_small -n 
    $sixteenth $BN5 $super_small -n 
     $sixteenth $Bb5 $super_small -n 
    $sixteenth $AN5 $super_small -n 

     $eighth $Ab5 $super_small -n 
    $eighth $GN5 $super_small -n 
     $eighth $FS5 $super_small -n 
    $eighth $GN5 $super_small -n 

     $eighth $AN5 $super_small -n 
    $eighth $Ab5 $super_small -n 
     $sixteenth $GN5 $super_small -n 
    $sixteenth $Ab5 $super_small -n  
    $sixteenth $GN5 $super_small -n 
    $sixteenth $FS5  $super_small -n 

    $eighth $FN5 $super_small -n 
    $eighth  $EN5 $super_small -n 
    $eighth $DS5 $super_small -n 
     $eighth $EN5 $super_small -n 

    $sixteenth $GN5 $longspace -n 
     $sixteenth $FN5 $super_small -n 
    $sixteenth $FN5 $super_small -n  
    $eighth $CS5 $super_small -n 
    $eighth $DN5 $super_small  -n 

    $sixteenth $GN5 $longspace -n 
    $sixteenth $FN5  $super_small -n 
    $sixteenth $FN5 $super_small -n 
    $eighth  $CS5 $super_small -n 
    $eighth $DN5 $super_small -n 

     $sixteenth $BN4 $super_small -n 
    $sixteenth $CN5 $super_small -n 
     $sixteenth $CS5 $super_small -n 
    $sixteenth $DN5 $super_small -n  
    $sixteenth $DS5 $super_small -n 
    $sixteenth $EN5  $super_small -n 
    $sixteenth $FN5 $super_small -n 
     $sixteenth $FS5 $super_small -n 
    $sixteenth $GN5 $super_small -n 
     $sixteenth $GS5 $super_small -n 
    $sixteenth $AN5 $super_small -n  
    $sixteenth $BN5 $super_small -n 
    $eighth $AN5  $super_small -n 
    $eighth $GN5 $super_small -n 
#=Part  A2==========================================
    $eighth $CN6  $super_small -n 
    $eighth $BN5 $super_small -n 
    $sixteenth  $Bb5 $super_small -n 
    $sixteenth $BN5 $super_small -n 
     $sixteenth $Bb5 $super_small -n 
    $sixteenth $AN5 $super_small -n 

     $eighth $Ab5 $super_small -n 
    $eighth $GN5 $super_small -n 
     $eighth $FS5 $super_small -n 
    $eighth $GN5 $super_small -n 

     $eighth $AN5 $super_small -n 
    $eighth $Ab5 $super_small -n 
     $sixteenth $GN5 $super_small -n 
    $sixteenth $Ab5 $super_small -n  
    $sixteenth $GN5 $super_small -n 
    $sixteenth $FS5  $super_small -n 

    $eighth $FN5 $super_small -n 
    $eighth  $EN5 $super_small -n 
    $eighth $DS5 $super_small -n 
     $eighth $EN5 $super_small -n 

#=Ending 2
    $eighth $DN5  $super_small -n 
    $sixteenth $DN5 $super_small -n 
     $sixteenth $DN5 $super_small -n 
    $eighth $AN5 $super_small -n 
     $eighth $DN5 $super_small -n 
    
    $eighth $Eb5 $super_small  -n 
    $sixteenth $Eb5 $super_small -n 
    $sixteenth $Eb5  $super_small -n 
    $quarter $Bb5 $super_small -n 

     $sixteenth $BN5 $super_small -n 
    $sixteenth $DN6 $super_small -n 
     $sixteenth $CS6 $super_small -n 
    $sixteenth $CN6 $super_small -n  
    $eighth $BN5 $super_small -n 
    $eighth $AN5 $super_small  -n 
    
    $eighth $GN5 $super_small 
SONG
    `beep  $song`;
}

sub on_to_zanarkand() {
my $song = join (":",  <<SONG =~ /(.+)/g);
    $eighth $EN5 $longspace -n 
     $eighth $EN4 $longspace -n 
    $eighth $GN4 $longspace -n 
     $eighth $BN4 $longspace -n 
    $eighth $EN5 $longspace -n 
     $eighth $FS5 $longspace -n 
    $dottedhalf $GN5 $longspace -n 
     
    $eighth $DN5 $longspace -n 
    $eighth $DN4 $longspace -n 
     $eighth $FS4 $longspace -n 
    $eighth $AN4 $longspace -n 
     $eighth $DN5 $longspace -n 
    $eighth $EN5 $longspace -n 
     $dottedhalf $FS5 $longspace -n 

    $quarter $BN4 $longspace -n 
     $quarter $BN4 $longspace -n 
    $quarter $BN4 $longspace -n 
     $quarter $BN4 $longspace -n 
    $dottedquarter $AN4 $longspace -n 
     $eighth $DN5 $longspace -n 
    $dottedhalf $GN4 $longspace -n  
     
    $quarter $EN5 $longspace -n 
    $quarter $EN5 $longspace -n  
    $quarter $EN5 $longspace -n 
    $quarter $EN5 $longspace -n  
    $dottedquarter $DN5 $longspace -n 
    $eighth $GN5  $longspace -n 
    $dottedhalf $CN5 $longspace -n 

    $eighth  $FN4 $longspace -n 
    $eighth $CN4 $longspace -n 
    $eighth  $FN4 $longspace -n 
    $eighth $GN4 $longspace -n 
    $eighth  $AN4 $longspace -n 
    $eighth $CN5 $longspace -n 

     $dottedquarter $EN5 $longspace -n 
    $eighth $BN4 $longspace -n 
     $eighth $EN5 $longspace -n 
    $eighth $FS5 $longspace -n 
    
     $quarter $GN5 $longspace -n 
    $quarter $FS5 $longspace -n 
     $quarter $EN5 $longspace -n 

    $dottedquarter $DN5 $longspace  -n 
    $eighth $EN5 $longspace -n 
    $quarter $DN5 $longspace  -n 
    $dottedhalf $BN4 $longspace -n  
#----------------------------------------------------------
     $dottedquarter $EN5 $longspace -n 
    $eighth $BN4 $longspace -n 
     $eighth $EN5 $longspace -n 
    $eighth $FS5 $longspace -n 
    
     $quarter $GN5 $longspace -n 
    $quarter $FS5 $longspace -n 
     $quarter $GN5 $longspace -n 

    $dottedquarter $AN5 $longspace  -n 
    $eighth $GN5 $longspace -n 
    $quarter $AN5 $longspace  -n 
    $dottedhalf $BN5 $longspace -n 

    $dottedquarter  $EN5 $longspace -n 
    $eighth $BN4 $longspace -n 
    $eighth  $EN5 $longspace -n 
    $eighth $FS5 $longspace -n 
    
     $quarter $GN5 $longspace -n 
    $quarter $FS5 $longspace -n 
     $quarter $EN5 $longspace -n 

    $dottedquarter $DN5 $longspace  -n 
    $eighth $EN5 $longspace -n 
    $quarter $DN5 $longspace  -n 
    
    $half $BN4 $longspace -n  
    $eighth $GN4  $longspace -n 
    $eighth $AN4 $longspace -n 

    $quarter  $BN4 $longspace -n 
    $quarter $BN4 $longspace -n 
    $quarter  $BN4 $longspace -n 

    $quarter $BN4 $longspace -n 
     $quarter $AN4 $longspace -n 
    $quarter $DN5 $longspace -n 

     $dottedquarter $GN4 $longspace -n 
    $eighth $GN4 $longspace -n 
     $eighth $FS4 $longspace -n 
    $eighth $DN4 $longspace -n 

     $dottedhalf $EN4 $longspace -n 

    # Bass line, melody is  empty.  Might want to remove this measure
    $eighth $GN4 $longspace  -n 
    $eighth $GN3 $longspace -n 
    $eighth $BN3 $longspace  -n 
    $eighth $EN4 $longspace -n 
    $eighth $GN4 $longspace -n  
    $eighth $BN4 $longspace -n 

    $half $AN5 $longspace -n  
    $quarter $EN6 $longspace -n 

    $quarter $EN6  $longspace -n 
    $quarter $DN6 $longspace -n 
    $quarter $CN6  $longspace -n 

    $half $BN5 $longspace -n 
    $quarter $GN6  $longspace -n 

    $dottedhalf $GN6 $longspace -n 

     $half $BN5 $longspace -n 
    $quarter $FS6 $longspace -n 

     $dottedhalf $FS6 $longspace -n 

    $half $AN5 $longspace -n 
     $quarter $EN6 $longspace -n 

    $quarter $EN6 $longspace -n 
     $half $DS6 $longspace -n 

    # Key change.  Now in key of D
     $half $BN4 $longspace -n 
    $quarter $FS5 $longspace -n 

     $quarter $FS5 $longspace -n 
    $quarter $EN5 $longspace -n 
     $quarter $DN5 $longspace -n 

    $half $CS5 $longspace -n 
     $quarter $AN5 $longspace -n 

    $dottedhalf $AN5 $longspace -n 

     $quarter $GS5 $longspace -n 
    $quarter $EN5 $longspace -n 
     $quarter $CS5 $longspace -n 

    $half $BN4 $longspace -n 
     $quarter $FS5 $longspace -n 
    
    $dottedhalf $AN4 $longspace  -n 
    $eighth $FS4 $longspace -n 
    $quarter $AN4 $longspace  -n 

    $half $BN4 $longspace 

SONG
    `beep $song`;
}

sub  base_warmup() {
# Play!
`beep $AN3; beep $AN3; beep $DN4; beep  $EN4; beep $GN4; beep $EN4; beep $GN4; beep $AN4`;
`beep $AN3; beep  $AN3; beep $DN4; beep $EN4; beep $GN4; beep $EN4; beep $DS4; beep $DN4`;
`beep  $AN3; beep $AN3; beep $DN4; beep $EN4; beep $GN4; beep $EN4; beep $GN4;  beep $AN4`;
`beep $CN5; beep $AN4; beep $CN5; beep $DN5; beep $DN5;  beep $CN5; beep $AN4; beep $GN4; beep $AN4`;

`beep $AN3; beep  $AN3; beep $DN4; beep $EN4; beep $GN4; beep $EN4; beep $GN4; beep $AN4`;
`beep  $AN3; beep $AN3; beep $DN4; beep $EN4; beep $GN4; beep $EN4; beep $DS4;  beep $DN4`;
`beep $AN3; beep $AN3; beep $DN4; beep $EN4; beep $GN4;  beep $EN4; beep $GN4; beep $AN4`;
`beep $CN5; beep $AN4; beep $CN5;  beep $DN5; beep $DN5; beep $CN5; beep $AN4; beep $GN4; beep $AN4`;

`beep  $DN5; beep $CN5; beep $AN4; beep $GN4; beep $AN4; beep $CN5; beep $AN4;  beep $GN4`;
`beep $DN5; beep $CN5; beep $AN4; beep $GN4; beep $AN4;  beep $CN5; beep $AN4; beep $GN4`;
`beep $DN5; beep $CN5; beep $AN4;  beep $GN4; beep $AN4; beep $CN5; beep $AN4; beep $CN5`;
`beep $DN5;  beep $CN5; beep $DN5; beep $DN5; beep $EN5; beep $DN5; beep $CN5; beep  $AN4`;

`beep $DN5; beep $CN5; beep $AN4; beep $GN4; beep $AN4;  beep $CN5; beep $AN4; beep $GN4`;
`beep $DN5; beep $CN5; beep $AN4;  beep $GN4; beep $AN4; beep $CN5; beep $AN4; beep $GN4`;
`beep $DN5;  beep $CN5; beep $AN4; beep $GN4; beep $AN4; beep $CN5; beep $AN4; beep  $CN5`;
`beep $DN5; beep $CN5; beep $DN5; beep $DN5; beep $EN5; beep  $DN5; beep $CN5; beep $AN4`;

`beep $AN3; beep $AN3; beep $DN4;  beep $EN4; beep $GN4; beep $EN4; beep $GN4; beep $AN4`;
`beep $AN3;  beep $AN3; beep $DN4; beep $EN4; beep $GN4; beep $EN4; beep $DS4; beep  $DN4`;
`beep $AN3; beep $AN3; beep $DN4; beep $EN4; beep $GN4; beep  $EN4; beep $GN4; beep $AN4`;
`beep $CN5; beep $AN4; beep $CN5; beep  $DN5; beep $DN5; beep $CN5; beep $AN4; beep $GN4; beep $AN4`;
}
