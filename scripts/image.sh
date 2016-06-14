#!/usr/bin/env nash

-nashget github.com/NeowayLabs/nash-rootfs

import nash-rootfs/all

TARGET         = "app.example"
VERSION        = "0.0.1"
UBUNTU_RELEASE = "trusty"
IMAGEFILE      = $TARGET+"-"+$VERSION+".tgz"

fn build_image() {
    destDir <= ns_ubuntu_fsbuild($UBUNTU_RELEASE)

    echo "Ubuntu rootfs created at " + $destDir

    cp $TARGET $destDir+"/"+$TARGET
    tar czvf $IMAGEFILE $destDir

    echo "Image generated: "+$IMAGEFILE
    rm -rf $destDir
}

build_image()
