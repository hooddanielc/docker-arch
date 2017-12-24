CURRENT_DATE=$(./print-latest-release.sh)

./download.sh

for repo in base base-devel; do
  docker build -f Dockerfile.${repo} -t dhoodlum/arch-${repo}:${CURRENT_DATE} .
  docker tag dhoodlum/arch-${repo}:${CURRENT_DATE} dhoodlum/arch-${repo}
done
