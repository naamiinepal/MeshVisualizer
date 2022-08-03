# MeshVisualizer

This repository contains script to build a docker container that can be used to perform offscreen render on a remote server.

**Usecase**: projects working on mesh need a tool to visualize meshes for quick viewing without opening a dedictaed mesh viewer such as meshlab or paraview. This is difficult in a remote server like ours where a GUI may not be available.
**Proposal**: Run vedo library on a docker container with xvfb and libgl1-mesa.  

**Docker Build and Test Instructions**
```
$ ./test.sh
$ docker run --rm -v local-dir-absolute-path:/app/data vedo-test-local:latest python save_screenshot.py path-to-ply-file.ply path-to-output-file.png
$example: docker run --rm -v /mnt/driveD/sources-git/3d-teeth-seg-miccai/pretrained_models/pointnet_220720_074533/evaluation/ply:/app/data vedo-test-local:latest python save_screenshot.py /app/data/decimated_01HXMTNF_lower.ply /app/data/decimated_01HXMTNF_lower.png
```
for more details: https://vedo.embl.es/autodocs/content/vedo/index.html