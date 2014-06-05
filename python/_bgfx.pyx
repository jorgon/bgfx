cdef extern from "bx.h" namespace "bx":
    cdef struct ReallocatorI:
        pass

cdef extern from "bgfx.h" namespace "bgfx":
    cdef enum RenderType:
        Null = 0
        Direct3D9 = 1
        Direct3D11 = 2
        OpenGLES = 3
        OpenGL = 4

    cdef struct CallbackI:
        pass

    void init(RenderType renderer=Null, CallbackI* _callback = NULL, ReallocatorI* _reallocator = None)

