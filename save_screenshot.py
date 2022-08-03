import vedo
from vedo import settings,Plotter
from vedo.io import screenshot
settings.screenshotTransparentBackground = True

def save_screenshot(mesh_path, outfile,debug=False):
    mesh = vedo.load(mesh_path)
    if debug:
        axes = 1
    else:
        axes = 0
    vp = Plotter(axes=axes, interactive=0, offscreen=True)
    vp += mesh
    screenshot(outfile)

if __name__ == '__main__':

    import argparse

    parser = argparse.ArgumentParser()

    parser.add_argument('input_file')
    parser.add_argument('output_file')

    args = parser.parse_args()

    save_screenshot(args.input_file,args.output_file)