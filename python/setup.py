from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize
import os

curdir = os.path.split(__file__)[0]
bgfx_root = os.path.split(curdir)[0]
projects_root = os.path.split(bgfx_root)[0]
bgfx_src = os.path.join(bgfx_root, "src")
bgfx_include = os.path.join(bgfx_root, "include")
bx_root = os.path.join(projects_root, "bx")
bx_include = os.path.join(bx_root, "include")

bgfx_build = os.path.join(bgfx_root, ".build", "win32_vs2010", "bin")

#bx_compat = os.path.join(bx_include, "compat", platform)

thirdparty = os.path.join(bgfx_root, "3rdparty")

glsl_optimizer = os.path.join(thirdparty, "glsl-optimizer")

build_mode = "Release"

bgfx_module = Extension(
    "_bgfx",
    ["_bgfx.pyx"],
    include_dirs=[
        bgfx_include,
        #bx_include,
        #bx_compat
        #os.path.join(glsl_optimizer, "include", "c99"),

    ],
    library_dirs=[bgfx_build],
    libraries=["bgfx" + build_mode],
    language="c++"
)

hgfx_ext = cythonize(
   [
       bgfx_module
   ]
)

setup(
    name='bgfx',
    version='',
    packages=[''],
    url='',
    license='',
    author='Paul Vollweiler',
    author_email='',
    description='',
    ext_modules=hgfx_ext
)
