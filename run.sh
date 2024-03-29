# assume docker container has been built and is called vedo-test-local:latest

# this script
# takes -i input_directory as argument
# - searches for ply files in input dir
# - writes rendered mesh to input_directory/rendering

while getopts i:s: flag
do
  case "${flag}" in 
    i) basedir=${OPTARG};;
  esac
done

echo "searching for ply files in $basedir"
total_files=$(ls -l ${basedir}/*.ply | wc -l)
echo "found ${total_files} files"

# convert relative path to absolute path, if required
inputdir=$(readlink -f $basedir)
outputdir=rendering
mkdir -p ${basedir}/${outputdir}

count=0
for filename in $inputdir/*.ply
do
  count=$((count+1))
  file_id=$(basename $filename)
  extension="${file_id##*.}"
  file_stem="${file_id%.*}"
  echo  "(${count}/${total_files})writing to ${basedir}/${outputdir}/${file_stem}.png"
  docker run --rm -v ${inputdir}:/app/data vedo-test-local:latest python save_screenshot.py /app/data/${file_id}  /app/data/${outputdir}/${file_stem}.png 1> /dev/null 2> /dev/null
done
