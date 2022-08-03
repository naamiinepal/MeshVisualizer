# assume docker container has been built and is called vedo-test-local:latest

# this script
# - searches for ply files in input dir
# - writes rendered mesh to output files

basedir=/mnt/driveD/sources-git/3d-teeth-seg-miccai/pretrained_models/pointnet_220720_074533/evaluation/ply
inputdir=$basedir
outputdir=rendering
mkdir -p ${basedir}/${outputdir}

for filename in $inputdir/*.ply
do
  file_id=$(basename $filename)
  extension="${file_id##*.}"
  file_stem="${file_id%.*}"
  echo  ${outputdir}/${file_stem}.ply
  docker run --rm -v ${inputdir}:/app/data vedo-test-local:latest python save_screenshot.py /app/data/${file_id}  /app/data/${outputdir}/${file_stem}.png
done
