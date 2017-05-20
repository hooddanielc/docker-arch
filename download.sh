TAR_DATE="$(date --date="${1:-"now"}" +'%Y.%m').01"
ARCHLINUX_ARCH=x86_64

mkdir -p arch-rootfs

wget -q --no-cookies -O - https://archive.archlinux.org/iso/${TAR_DATE}/archlinux-bootstrap-${TAR_DATE}-${ARCHLINUX_ARCH}.tar.gz \
  | tar xz -f - --strip-components=1 --directory=./arch-rootfs root.${ARCHLINUX_ARCH}/
