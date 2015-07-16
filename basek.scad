use <MCAD/nuts_and_bolts.scad>;

base_size = 180;
base_height = 20;
vslot_offset = 80;
glass_thickness = 3;
glass_rim_thickness = 4;
glass_rim_width = 4;
glass_height = base_height - glass_thickness;
heated_bed_size = 160;
glass_rim_size = heated_bed_size - glass_rim_width;
glass_rim_height = glass_height;

module cut_corner()
{
    rotate([0,0,0]) translate([base_size - vslot_offset + 30,-40,-0.01]) cube([50,80,base_height + .2]);
    rotate([0,0,120]) translate([base_size - vslot_offset + 30,-40,-0.01]) cube([50,80,base_height + .2]);
    rotate([0,0,240]) translate([base_size - vslot_offset + 30,-40,-0.01]) cube([50,80,base_height + .2]);    
}

module cut_vslot()
{
        rotate([0,0,0]) translate([base_size - vslot_offset,-10,-0.1]) cube([20,20,base_height+.2]);
        rotate([0,0,120]) translate([base_size - vslot_offset,-10,-0.1]) cube([20,20,base_height+.2]);
        rotate([0,0,240]) translate([base_size - vslot_offset,-10,-0.1]) cube([20,20,base_height+.2]);    
}



module cut_vslot_bolts()
{
    rotate([0,0,0]) translate([base_size - vslot_offset + 30 - 2,0,base_height / 2]) rotate([0,-90,0]) boltHole(5,length=14);
    rotate([0,0,120]) translate([base_size - vslot_offset + 30 - 2,0,base_height / 2]) rotate([0,-90,0]) boltHole(5,length=14);
    rotate([0,0,240]) translate([base_size - vslot_offset + 30 - 2,0,base_height / 2]) rotate([0,-90,0]) boltHole(5,length=14);
    
}

module cut_glass_bolts()
{
    rotate([0,0,0]) translate([base_size - vslot_offset - 10,0,base_height-2]) rotate([0,180,0]) boltHole(3,length=14);
    rotate([0,0,120]) translate([base_size - vslot_offset + 30 - 2,0,base_height / 2]) rotate([0,-90,0]) boltHole(3,length=14);
    rotate([0,0,240]) translate([base_size - vslot_offset + 30 - 2,0,base_height / 2]) rotate([0,-90,0]) boltHole(3,length=14);
    
}

module cut_wire()
{
    rotate([0,0,0]) translate([base_size-vslot_offset-32,-20,base_height / 2]) rotate([90,0,90]) cylinder(r=5,h=70);
    rotate([0,0,0]) translate([base_size-vslot_offset-32, 20,base_height / 2]) rotate([90,0,90]) cylinder(r=5,h=70);
    rotate([0,0,0]) translate([base_size-vslot_offset + 10, 30 ,base_height / 2]) rotate([90,0,0]) cylinder(r=5,h=60);
    
}


module body()
{
    difference(){
        translate([0,0,0]) cylinder(r=base_size,h=base_height,$fn=3);
        translate([0,0,glass_height]) cylinder(r=heated_bed_size/2,h=glass_thickness+.1,$fn=256);
        translate([0,0,-.1]) cylinder(r=glass_rim_size/2,h=glass_rim_height+.2,$fn=256);
        
        cut_corner();
        cut_vslot();
        cut_vslot_bolts();
        cut_glass_bolts();
        cut_wire();
         }
}

body();
cylinder(r=heated_bed_size/2,h=1);