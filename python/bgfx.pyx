
include "platform.pxi"
include "externs.pxi"

"""

def reset(width, height, _reset):
    bgfx_reset(width, height, _reset)

def shutdown():
    bgfx_shutdown()

def set_debug(debug):
    bgfx_set_debug(debug)

def set_view_clear(_id, _flags, _rgba, _depth, _stencil):
    bgfx_set_view_clear(_id, _flags, _rgba, _depth, _stencil)

def set_view_rect(_id, x, y, width, height):
    bgfx_set_view_rect(_id, x, y, width, height)

def submit(_id, depth):
    bgfx_submit(_id, depth)

def debug_text_clear(attr, small):
    bgfx_dbg_text_clear(attr, small)

def debug_text_printf(x, y, attr, format, *args):
    s = format.format(*args)
    bgfx_dbg_text_printf(x, y, attr, s)

def frame():
    bgfx_frame()
"""


class Fatal:
    DebugCheck              = _DebugCheck
    MinimumRequiredSpace    = _MinimumRequiredSpecs
    InvalidShader           = _InvalidShader
    UnableToInitialize      = _UnableToInitialize
    UnableToCreateTexture   = _UnableToCreateTexture

class RendererType:
    Null                    = _Null
    Direct3D9               = _Direct3D9
    Direct3D11              = _Direct3D11
    OpenGLES                = _OpenGLES
    OpenGL                  = _OpenGL
    Count                   = _RendererTypeCount

class Attrib:
    Position                = _Position
    Normal                  = _Normal
    Tangent                 = _Tangent
    Color0                  = _Color0
    Color1                  = _Color1
    Indices                 = _Indices
    Weight                  = _Weight
    TexCoord0               = _TexCoord0
    TexCoord1               = _TexCoord1
    TexCoord2               = _TexCoord2
    TexCoord3               = _TexCoord3
    TexCoord4               = _TexCoord4
    TexCoord5               = _TexCoord5
    TexCoord6               = _TexCoord6
    TexCoord7               = _TexCoord7
    Count                   = _AttribCount

class AttribType:
    Uint8                   = _Uint8
    Int16                   = _Int16
    Half                    = _Half
    Float                   = _Float
    Count                   = _AttribCount

class TextureFormat:
    BC1                     = _BC1
    BC2                     = _BC2
    BC3                     = _BC3
    BC4                     = _BC4
    BC5                     = _BC5
    ETC1                    = _ETC1
    ETC2                    = _ETC2
    ETC2A                   = _ETC2A
    ETC2A1                  = _ETC2A1
    PTC12                   = _PTC12
    PTC14                   = _PTC14
    PTC12A                  = _PTC12A
    PTC14A                  = _PTC14A
    PTC22                   = _PTC22
    PTC24                   = _PTC24
    Unknown                 = _Unknown
    R8                      = _R8
    R16                     = _R16
    R16F                    = _R16F
    BGRA8                   = _BGRA8
    RGBA16                  = _RGBA16
    RGBA16F                 = _RGBA16F
    R5G6B5                  = _R5G6B5
    RGBA4                   = _RGBA4
    RGB5A1                  = _RGB5A1
    RGB10A2                 = _RGB10A2
    UnknownDepth            = _UnknownDepth
    D16                     = _D16
    D24                     = _D24
    D24S8                   = _D24S8
    D32                     = _D32
    D16F                    = _D16F
    D24F                    = _D24F
    D32F                    = _D32F
    D0S8                    = _D0S8
    Count                   = _TextureFormatCount

class UniformType:
    Uniform1i               = _Uniform1i
    Uniform1f               = _Uniform1f
    End                     = _End
    Uniform1iv              = _Uniform1iv
    Uniform1fv              = _Uniform1fv
    Uniform2fv              = _Uniform2fv
    Uniform3fv              = _Uniform3fv
    Uniform4fv              = _Uniform4fv
    Uniform3x3fv            = _Uniform3x3fv
    Uniform4x4fv            = _Uniform4x4fv
    Count                   = _UniformTypeCount


def set_window(window):
    IF PYBGFX_WINDOWS:
        cdef HWND _window
        _window = <HWND>window
    _set_window(_window)

def init(renderer_type = RendererType.Count, callback = None, reallocator = None):
    cdef _CallbackI* _callback = NULL
    cdef _ReallocatorI* _reallocator = NULL

    if callback is not None:
        _callback = NULL
    if reallocator is not None:
        _reallocator = NULL

    _init(renderer_type, _callback, _reallocator)

def test_getdc(hwnd):
    cdef HWND _hwnd = <HWND> hwnd
    cdef HDC _hdc = GetDC(_hwnd)

    return GetLastError()