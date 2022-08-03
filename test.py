from vedo import Sphere, Plotter, settings
settings.screenshotTransparentBackground = True
sph = Sphere(pos=[-5, 0, 0], c="r")
plt = Plotter(interactive=False, offscreen=True)
plt.show(sph)
plt.screenshot("./data/out.png", scale=2).close()