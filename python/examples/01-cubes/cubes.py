import sys, os

sys.path.append(os.path.dirname(os.path.dirname(os.path.dirname(__file__))))

#os.environ['PYSDL2_DLL_PATH'] = "C:\\Users\\Jorgon\\src\\bgfx\\python\\examples\\third_party"
os.environ['PYSDL2_DLL_PATH'] = "C:\\Users\\Jorgon\\src\\SDL2\\VisualC\\SDL\\Win32\\Debug"

#os.environ['PYSDL2_DLL_PATH'] = "C:\\dont_backup\\personal\\bgfx\\python\\examples\\third_party"

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

PosColorVertex = bgfx.VertexDecl() \
    .begin() \
    .add(bgfx.Attrib.Position, 3, bgfx.AttribType.Float) \
    .add(bgfx.Attrib.Color0, 4, bgfx.AttribType.Uint8) \
    .end()

cube_vertices = (
    (-1.0,  1.0,  1.0, 0xff000000),
    ( 1.0,  1.0,  1.0, 0xff0000ff),
    (-1.0, -1.0,  1.0, 0xff00ff00),
    ( 1.0, -1.0,  1.0, 0xff00ffff),
    (-1.0,  1.0, -1.0, 0xffff0000),
    ( 1.0,  1.0, -1.0, 0xffff00ff),
    (-1.0, -1.0, -1.0, 0xffffff00),
    ( 1.0, -1.0, -1.0, 0xffffffff),
)

cube_indices = (
    0, 1, 2,  # 0
    1, 3, 2,
    4, 6, 5,  # 2
    5, 6, 7,
    0, 2, 4,  # 4
    4, 2, 6,
    1, 5, 3,  # 6
    5, 7, 3,
    0, 4, 1,  # 8
    4, 5, 1,
    2, 3, 6,  # 10
    6, 3, 7,
)

vbh = bgfx.create_vertex_buffer(cube_vertices, PosColorVertex)
ibh = bgfx.create_index_buffer(cube_indices)

bgfx.reset(width, height, bgfx.Reset.VSync)
bgfx.set_debug(bgfx.Debug.Text)

bgfx.set_view_clear(0, rgba=0x303030ff, depth=1.0)

while True:
    sdl2.SDL_PumpEvents()
    bgfx.set_view_rect(0, 0, 0, width, height)
    bgfx.submit(0)

    bgfx.debug_text_clear()
    bgfx.debug_text_printf(0, 1, 0x4f, "bgfx/examples/01-cube")
    bgfx.debug_text_printf(0, 2, 0x6f, "Description: Rendering a simple static mesh.")

    for x in range(11):
        for y in range(11):
            #bgfx.set_transform(mtx)
            #bgfx.set_program(program)

            bgfx.set_vertex_buffer(vbh)
            bgfx.set_index_buffer(ibh)

            bgfx.set_state(bgfx.S)



    bgfx.frame()

bgfx.shutdown()
sdl2.ext.quit()
