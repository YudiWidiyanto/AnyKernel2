# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Zero ProjectX
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=mido
device.name2=Redmi Note 4
device.name3=Redmi Note 4x
device.name4=HMNote4x
device.name5=Redmi Note 4X
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chmod -R 755 $ramdisk/sbin;
chown -R root:root $ramdisk/*;


## AnyKernel install
dump_boot;

# begin ramdisk changes

insert_line init.rc 'zpx' after 'import /init.\${ro.zygote}.rc' 'import /init.zpx.rc';

# end ramdisk changes

write_boot;

## end install

