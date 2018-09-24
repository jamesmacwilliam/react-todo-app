# get checksum of app directory to determine if we need to rebuild docker image
dir="$(git rev-parse --show-toplevel)/app"
dirsum=0
for sum  in $(find ${dir} -type f | xargs cksum | awk '{print $1}')
do
  dirsum=$(( ${sum} + ${dirsum} ))
done
inc=$(date)

#echo $dirsum
echo "{\"cksum\":\"${dirsum}\",\"inc\":\"${inc}\"}"
