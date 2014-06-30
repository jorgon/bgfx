# build with "build_ext --inplace --force"

from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize
import os

curdir = os.path.abspath(os.path.curdir)

#curdir = os.path.split(__file__)[0]
bgfx_root = os.path.split(curdir)[0]

bgfx_build = os.path.join(bgfx_root, ".build", "win32_vs2010", "bin")

build_mode = "Debug"
#build_mode = "Release"

shared = "-shared-lib"
shared = ""

platform = {
    "windows": 1,
    "sdl": 1,
}

with open(os.path.join(curdir, "platform.pxi"), "w") as fd:
    for key, val in platform.items():
        fd.write('DEF PYBGFX_%s = %d\n' % (key.upper(), int(val)))


bgfx_module = Extension(
    "bgfx",
    ["bgfx.pyx", "bgfx_helper.cpp"],
    include_dirs=[
        os.path.join(bgfx_root, "..", "bx", "include"),

        os.path.join(bgfx_root, "..", "bx", "include", "compat", "msvc"),
        os.path.join(bgfx_root, "include"),
        #"$(DXSDK_DIR)\include",
        os.path.join(bgfx_root, "3rdparty", "khronos"),
        os.path.join(bgfx_root, "3rdparty", "sdl", "include")
    ],
    library_dirs=[
        bgfx_build,
        "C:/Program Files (x86)/Microsoft DirectX SDK (June 2010)/Lib/x86",
        os.path.join(bgfx_root, "3rdparty", "sdl", "lib", "x86")
    ],
    libraries=[
        "bgfx" + shared + build_mode,
        "User32",
        "Gdi32",
        "sdl2"
        ],
    language="c++",
    extra_compile_args=["-Zi", "/Od"],
    extra_link_args=["-debug"],
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
