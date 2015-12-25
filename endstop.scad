
use <MCAD/nuts_and_bolts.scad>;

$fn=128;

module endstop()
{
  difference(){
    translate([-7.5,-10,0]) cube([15,50,5]);
    translate([0,0,1.6]) boltHole(3.2,length=6);
    }
  
  difference(){
    translate([-7.5,40,30]) rotate([90,90,0]) cube([25,15,5]); 
    translate([0,34,18]) rotate([90,90,180]) boltHole(5.2,length=7);
  } 
}


translate([0,0,10]) rotate([0,90,0]) endstop();
