CURRENT_DATE=$(./print-latest-release.sh)
for repo in base base-devel; do
  docker push dhoodlum/arch-${repo}:$CURRENT_DATE
  docker push dhoodlum/arch-${repo}:latest
done
