import sys, os

sys.path.append(os.path.dirname(os.path.dirname(os.path.dirname(__file__))))

import subprocess
#subprocess.Popen(["c:/python33/python.exe", "setup.py", "build_ext",  "--inplace", "--force"], cwd=os.path.dirname(os.path.dirname(os.path.dirname(__file__)))).wait()

os.environ['PYSDL2_DLL_PATH'] = "C:\\Users\\Jorgon\\src\\bgfx\\python\\examples\\third_party"

import sdl2
import sdl2.ext

import bgfx

sdl2.ext.init()
window = sdl2.ext.Window("Hello World", size=(640, 480))
window.show()
info = sdl2.syswm.SDL_SysWMinfo()
sdl2.SDL_VERSION(info.version)
sdl2.SDL_GetWindowWMInfo(window.window, info)

ret = bgfx.test_getdc(info.info.win.window)



#platform = pyglet.window.get_platform()
#display = platform.get_default_display()
#screen = display.get_default_screen()
#
#template = pyglet.gl.Config(alpha_size=8)
#config = screen.get_best_config(template)
#context = config.create_context(None)
#window = pyglet.window.Window(context=context)


width = 1280
height = 720



bgfx.set_window(info.info.win.window)

bgfx.init(bgfx.RendererType.OpenGL)
#bgfx.init()
print("inited")

bgfx.reset(width, height, bgfx.BGFX_RESET_VSYNC)
bgfx.set_debug(bgfx.BGFX_RESET_VSYNC)

bgfx.set_view_clear(0, bgfx.BGFX_CLEAR_COLOR_BIT | bgfx.BGFX_CLEAR_DEPTH_BIT, 0x303030ff, 1.0, 0)

while True:
    bgfx.set_view_rect(0, 0, 0, width, height)
    bgfx.submit(0)

    bgfx.debug_text_clear()
    bgfx.debug_text_printf(0, 1, 0x4f, "bgfx/examples/00-helloworld")
    bgfx.debug_text_printf(0, 1, 0x6f, "Description: Initialization and debug text.")
    bgfx.frame()


processor = sdl2.ext.TestEventProcessor()
processor.run(window)

sdl2.ext.quit()

bgfx.shutdown()