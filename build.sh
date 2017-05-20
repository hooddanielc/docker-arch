if [ ! -d ./arch-rootfs ]; then
  ./download.sh
fi

for repo in base base-devel; do
  docker build -f Dockerfile.${repo} -t dhoodlum/arch-${repo} .
done
