use <MCAD/nuts_and_bolts.scad>;
use <basek.scad>;

$fn=128;

space=135.52;
psux = 89;
psuy = 34;
module psu_body()
{
    translate([space/2-19,-58,0]) rotate([0,0,-120+90]) cube([8,80,40]);
    translate([0-space/2-33,14,0]) rotate([0,0, 120+90]) cube([8,80,40]);
    
    //translate([space/2-6,8-5,0]) rotate([0,0,-120-90]) cube([8,25,40]);
    //translate([0-space/2-1,7.8,0]) rotate([0,0, 120+90]) cube([8,25,40]);
    
    translate([-2-space/2,-20,0]) cube([127,8,20]);
    translate([-2-space/2,-80,0]) cube([127,60,8]);
    translate([-2-space/2,-80,8]) cube([10,60,12]);
    translate([ space/2-20.5,-80,8]) cube([10,60,12]);
    translate([-psux/2-5,-psuy/2-50,0]) standoff();
    translate([ psux/2-5,-psuy/2-50,0]) standoff();
    translate([-psux/2-5, psuy/2-50,0]) standoff();
    translate([ psux/2-5, psuy/2-50,0]) standoff();
}

module standoff()
{
    
    difference(){
        translate([0,0,7.9]) cylinder(r=4,h=12);
        boltHole(3.3,length=20);
    }
    
}

module standoff_hole()
{
        
        boltHole(3.3,length=20);
}

module psu_holes()
{
    translate([space/2+21,-1,25]) rotate([0,90,-120-90]) boltHole(3.5,length=15);
    translate([0-space/2-34,1,25]) rotate([0,90, 120-90]) boltHole(3.5,length=15);
    translate([-psux/2-5,-psuy/2-50,2]) standoff_hole();
    translate([ psux/2-5,-psuy/2-50,2]) standoff_hole();
    translate([-psux/2-5, psuy/2-50,2]) standoff_hole();
    translate([ psux/2-5, psuy/2-50,2]) standoff_hole();
    
}


module psu_bracket()
{
    difference(){
        psu_body();
        psu_holes();
    }
    
}

%cut_vslot();
translate([33,-45,0]) rotate([0,0,90+120+180+1]) psu_bracket();