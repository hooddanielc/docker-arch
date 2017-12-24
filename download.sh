CURRENT_DATE=$(./print-latest-release.sh)
ALREADY_BUILT=$(docker images | grep dhoodlum/arch-base | grep $CURRENT_DATE)

# download if user has not built latest version
if [ -z "$ALREADY_BUILT"  ]; then
  echo "Downloading newest Arch Linux - ${CURRENT_DATE}"

  # remove old files if they exist
  if [ -d arch-rootfs ]; then
    echo "need root permission to remove ${arch-rootfs}"
    sudo rm -rf arch-rootfs
  fi

  docker build -f Dockerfile.download-arch -t dhoodlum/download-arch .
  docker run --rm -v $(pwd):/data -t dhoodlum/download-arch
fi
