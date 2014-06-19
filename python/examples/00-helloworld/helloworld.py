import bgfx
import pyglet


width = 1280
height = 720

bgfx.init()

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


bgfx.shutdown()