import nash-ubuntu/all
import image.sh

fn run() {
    -test -d $IMAGEFILE

    if $status != "0" {
            echo "Image not built. Run:"
            echo "make image"
            return
    }

    outDir <= mktemp -d | xargs echo -n
    tar -c $IMAGEFILE $outDir

    # Create a container (user, pid, mount, ipc, uts)
    rfork upmis {
        mount -t proc proc $outDir + "/proc"
        mount -t tmpfs tmpfs $outDir + "/tmp"

        chroot $outDir /app.example
    }
}

run()
