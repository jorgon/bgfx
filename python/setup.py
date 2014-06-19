from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize
import os

curdir = os.path.split(__file__)[0]
bgfx_root = os.path.split(curdir)[0]

bgfx_build = os.path.join(bgfx_root, ".build", "win32_vs2010", "bin")

build_mode = "Debug"

bgfx_module = Extension(
    "bgfx",
    ["bgfx.pyx"],
    include_dirs=[
        os.path.join(bgfx_root, "..", "bx", "include"),
        os.path.join(bgfx_root, "..", "bx", "include", "compat", "msvc"),
        os.path.join(bgfx_root, "include"),
        #"$(DXSDK_DIR)\include",
        os.path.join(bgfx_root, "3rdparty", "khronos")
    ],
    library_dirs=[bgfx_build],
    libraries=[
        "bgfx-shared-lib" + build_mode,
        "User32",
        "Gdi32"
        ],
    #language="c++"
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
