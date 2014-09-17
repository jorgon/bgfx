
include "platform.pxi"
include "defines.pxi"
include "externs.pxi"

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

class Reset:
    NONE                    = BGFX_RESET_NONE
    Fullscreen              = BGFX_RESET_FULLSCREEN
    Shift                   = BGFX_RESET_FULLSCREEN_SHIFT
    Mask                    = BGFX_RESET_FULLSCREEN_MASK
    MSAAx2                  = BGFX_RESET_MSAA_X2
    MSAAx4                  = BGFX_RESET_MSAA_X4
    MSAAx8                  = BGFX_RESET_MSAA_X8
    MSAAx16                 = BGFX_RESET_MSAA_X16
    MSAAShift               = BGFX_RESET_MSAA_SHIFT
    MSAAMask                = BGFX_RESET_MSAA_MASK
    VSync                   = BGFX_RESET_VSYNC
    Capture                 = BGFX_RESET_CAPTURE

class Debug:
    NONE                    = BGFX_DEBUG_NONE
    Wireframe               = BGFX_DEBUG_WIREFRAME
    IFH                     = BGFX_DEBUG_IFH
    Stats                   = BGFX_DEBUG_STATS
    Text                    = BGFX_DEBUG_TEXT

class State:
    NONE = BGFX_STATE_NONE
    RGB_Write = BGFX_STATE_RGB_WRITE
    Alpha_Write = BGFX_STATE_ALPHA_WRITE
    Depth_Write = BGFX_STATE_DEPTH_WRITE

    class DepthTest:
        Less = BGFX_STATE_DEPTH_TEST_LESS
        LEqual = BGFX_STATE_DEPTH_TEST_LEQUAL
        Equal = BGFX_STATE_DEPTH_TEST_EQUAL
        GEqual = BGFX_STATE_DEPTH_TEST_GEQUAL
        Greater = BGFX_STATE_DEPTH_TEST_GREATER
        NotEqual = BGFX_STATE_DEPTH_TEST_NOTEQUAL
        Never = BGFX_STATE_DEPTH_TEST_NEVER
        Always = BGFX_STATE_DEPTH_TEST_ALWAYS
        Shift = BGFX_STATE_DEPTH_TEST_SHIFT
        Mask = BGFX_STATE_DEPTH_TEST_MASK

    class Blend:
        ZERO = BGFX_STATE_BLEND_ZERO
        ONE = BGFX_STATE_BLEND_ONE
        SRC_COLOR = BGFX_STATE_BLEND_SRC_COLOR
        INV_SRC_COLOR = BGFX_STATE_BLEND_INV_SRC_COLOR
        SRC_ALPHA = BGFX_STATE_BLEND_SRC_ALPHA
        INV_SRC_ALPHA = BGFX_STATE_BLEND_INV_SRC_ALPHA
        DST_ALPHA = BGFX_STATE_BLEND_DST_ALPHA
        INV_DST_ALPHA = BGFX_STATE_BLEND_INV_DST_ALPHA
        DST_COLOR = BGFX_STATE_BLEND_DST_COLOR
        INV_DST_COLOR = BGFX_STATE_BLEND_INV_DST_COLOR
        SRC_ALPHA_SAT = BGFX_STATE_BLEND_SRC_ALPHA_SAT
        FACTOR = BGFX_STATE_BLEND_FACTOR
        INV_FACTOR = BGFX_STATE_BLEND_INV_FACTOR
        SHIFT = BGFX_STATE_BLEND_SHIFT
        MASK = BGFX_STATE_BLEND_MASK
        INDEPENDENT = BGFX_STATE_BLEND_INDEPENDENT

        class Equation:
            Sub = BGFX_STATE_BLEND_EQUATION_SUB
            RevSub = BGFX_STATE_BLEND_EQUATION_REVSUB
            Min = BGFX_STATE_BLEND_EQUATION_MIN
            Max = BGFX_STATE_BLEND_EQUATION_MAX
            Shift = BGFX_STATE_BLEND_EQUATION_SHIFT
            Mask = BGFX_STATE_BLEND_EQUATION_MASK

    class Cull:
        CW = BGFX_STATE_CULL_CW
        CCW = BGFX_STATE_CULL_CCW
        SHIFT = BGFX_STATE_CULL_SHIFT
        MASK = BGFX_STATE_CULL_MASK

    ALPHA_REF_SHIFT = BGFX_STATE_ALPHA_REF_SHIFT
    ALPHA_REF_MASK = BGFX_STATE_ALPHA_REF_MASK
    PT_TRISTRIP = BGFX_STATE_PT_TRISTRIP
    PT_LINES = BGFX_STATE_PT_LINES
    PT_POINTS = BGFX_STATE_PT_POINTS
    PT_SHIFT = BGFX_STATE_PT_SHIFT
    PT_MASK = BGFX_STATE_PT_MASK
    POINT_SIZE_SHIFT = BGFX_STATE_POINT_SIZE_SHIFT
    POINT_SIZE_MASK = BGFX_STATE_POINT_SIZE_MASK
    MSAA = BGFX_STATE_MSAA
    RESERVED_MASK = BGFX_STATE_RESERVED_MASK
    MASK = BGFX_STATE_MASK
    DEFAULT = BGFX_STATE_DEFAULT
    ALPHA_REF = BGFX_STATE_ALPHA_REF
    POINT_SIZE = BGFX_STATE_POINT_SIZE

    class Blend:
        EQUATION_SEPARATE = BGFX_STATE_BLEND_EQUATION_SEPARATE
        FUNC = BGFX_STATE_BLEND_FUNC
        EQUATION = BGFX_STATE_BLEND_EQUATION
        ADD = BGFX_STATE_BLEND_ADD
        ALPHA = BGFX_STATE_BLEND_ALPHA
        DARKEN = BGFX_STATE_BLEND_DARKEN
        LIGHTEN = BGFX_STATE_BLEND_LIGHTEN
        MULTIPLY = BGFX_STATE_BLEND_MULTIPLY
        NORMAL = BGFX_STATE_BLEND_NORMAL
        SCREEN = BGFX_STATE_BLEND_SCREEN
        LINEAR_BURN = BGFX_STATE_BLEND_LINEAR_BURN
        FUNC_RT_x = BGFX_STATE_BLEND_FUNC_RT_x
        FUNC_RT_xE = BGFX_STATE_BLEND_FUNC_RT_xE
        FUNC_RT_1 = BGFX_STATE_BLEND_FUNC_RT_1
        FUNC_RT_2 = BGFX_STATE_BLEND_FUNC_RT_2
        FUNC_RT_3 = BGFX_STATE_BLEND_FUNC_RT_3
        FUNC_RT_1E = BGFX_STATE_BLEND_FUNC_RT_1E
        FUNC_RT_2E = BGFX_STATE_BLEND_FUNC_RT_2E
        FUNC_RT_3E = BGFX_STATE_BLEND_FUNC_RT_3E

cdef class VertexDecl:
    cdef _VertexDecl obj

    def __cinit__(self):
        #self.ptr = new _VertexDecl()
        pass
    def __dealloc__(self):
        del self.ptr

IF PYBGFX_WINDOWS:
    def winSetHwnd(hwnd):
        cdef size_t size
        cdef HWND _window
        size = <size_t> hwnd
        _window = <HWND> size
        _winSetHwnd(_window)


def vertex_pack(point, input_normalized, attr, decl, data, index=0):
    cdef float _input[4]
    cdef bool _inputNormalized = <bool> input_normalized
    cdef _Attrib _attr = <_Attrib> attr
    cdef VertexDecl d = <VertexDecl> decl
    cdef _VertexDecl _decl = d.obj

    cdef void* _data = <void*> data
    cdef uint32_t _index = <uint32_t> index

    for i in range(4):
        _input[i] = <float> point[i]

    _vertexPack(_input, _inputNormalized, _attr, _decl, _data, _index)


def init(renderer_type = RendererType.Count, callback = None, reallocator = None):
    cdef _CallbackI* _callback = NULL
    cdef _ReallocatorI* _reallocator = NULL

    if callback is not None:
        _callback = NULL
    if reallocator is not None:
        _reallocator = NULL

    _init(renderer_type, _callback, _reallocator)

def shutdown():
    _shutdown()

def reset(width, height, flags=None):
    cdef uint32_t _width
    cdef uint32_t _height
    cdef uint32_t _flags

    _width = width
    _height = height

    _flags = BGFX_RESET_NONE
    if flags is not None:
        _flags = <uint32_t> flags

    _reset(_width, _height, _flags)

def set_debug(flag):
    cdef uint32_t _flag

    _flag = <uint32_t> flag
    _setDebug(_flag)

def set_view_clear(id, rgba=None, depth=None, stencil=None):
    cdef uint8_t _id
    cdef uint8_t _flags = 0
    cdef uint32_t _rgba
    cdef float _depth
    cdef uint8_t _stencil

    _id = <uint8_t> id

    if rgba is None:
        _rgba = 0x000000ff
    else:
        _rgba = <uint32_t> rgba
        _flags |= BGFX_CLEAR_COLOR_BIT

    if depth is None:
        _depth = 1.0
    else:
        _depth  = <float> depth
        _flags |= BGFX_CLEAR_DEPTH_BIT

    if stencil is None:
        _stencil = 0
    else:
        _stencil  = <uint8_t> stencil
        _flags |= BGFX_CLEAR_STENCIL_BIT

    _setViewClear(_id, _flags, _rgba, _depth, _stencil)

def set_view_rect(id, x, y, width, height):
    cdef uint8_t _id = <uint8_t> id
    cdef uint16_t _x = <uint16_t> x
    cdef uint16_t _y = <uint16_t> y
    cdef uint16_t _width = <uint16_t> width
    cdef uint16_t _height = <uint16_t> height

    _setViewRect(_id, _x, _y, _width, _height)

def submit(id):
    cdef uint8_t _id = <uint8_t> id
    _submit(_id)

def frame():
    _frame()

def debug_text_clear(attr=0, small=False):
    cdef uint8_t _attr = <uint8_t> attr
    cdef bool _small = <bool> small

    _dbgTextClear(_attr, _small)

def debug_text_printf(x, y, attr, *text):
    text = " ".join(text).encode("ascii")

    cdef uint16_t _x = <uint16_t> x
    cdef uint16_t _y = <uint16_t> y
    cdef uint8_t _attr = <uint8_t> attr
    cdef const char* _format = <const char*> text

    _dbgTextPrintf(_x, _y, _attr, _format)