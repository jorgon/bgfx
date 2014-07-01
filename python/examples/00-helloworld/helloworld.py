import sys, os

sys.path.append(os.path.dirname(os.path.dirname(os.path.dirname(__file__))))

import subprocess
#subprocess.Popen(["c:/python33/python.exe", "setup.py", "build_ext",  "--inplace", "--force"], cwd=os.path.dirname(os.path.dirname(os.path.dirname(__file__)))).wait()

#os.environ['PYSDL2_DLL_PATH'] = "C:\\Users\\Jorgon\\src\\bgfx\\python\\examples\\third_party"
#os.environ['PYSDL2_DLL_PATH'] = "C:\\Users\\Jorgon\\src\\SDL2\\VisualC\\SDL\\Win32\\Debug"

os.environ['PYSDL2_DLL_PATH'] = "C:\\dont_backup\\personal\\bgfx\\python\\examples\\third_party"

import sdl2
import sdl2.ext

import bgfx

width = 1280
height = 720



sdl2.ext.init()
window = sdl2.ext.Window("Hello World", size=(width, height))
window.show()
info = sdl2.syswm.SDL_SysWMinfo()
sdl2.SDL_VERSION(info.version)
sdl2.SDL_GetWindowWMInfo(window.window, info)

# windows setup
bgfx.winSetHwnd(info.info.win.window)

bgfx.init()

bgfx.reset(width, height, bgfx.Reset.VSync)
bgfx.set_debug(bgfx.Debug.Text)

bgfx.set_view_clear(0, rgba=0x303030ff, depth=1.0)

while True:
    sdl2.SDL_PumpEvents()
    bgfx.set_view_rect(0, 0, 0, width, height)
    bgfx.submit(0)

    bgfx.debug_text_clear()
    bgfx.debug_text_printf(0, 1, 0x4f, "bgfx/examples/00-helloworld")
    bgfx.debug_text_printf(0, 2, 0x6f, "Description: Initialization and debug text.")
    bgfx.frame()

bgfx.shutdown()
sdl2.ext.quit()

