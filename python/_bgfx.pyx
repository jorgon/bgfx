cdef extern from "bgfx.c99.h":
    cdef enum bgfx_renderer_type:
        BGFX_RENDERER_TYPE_NULL
        BGFX_RENDERER_TYPE_DIRECT3D9
        BGFX_RENDERER_TYPE_DIRECT3D11
        BGFX_RENDERER_TYPE_OPENGLES
        BGFX_RENDERER_TYPE_OPENGL

        BGFX_RENDERER_TYPE_COUNT


    cdef struct CallbackI:
        pass

    cdef struct ReallocatorI:
        pass

    void bgfx_init(bgfx_renderer_type renderer=BGFX_RENDERER_TYPE_COUNT, CallbackI* _callback = NULL, ReallocatorI* _reallocator = NULL)

cdef init(bgfx_renderer_type renderer=BGFX_RENDERER_TYPE_COUNT, CallbackI* _callback = NULL, ReallocatorI* _reallocator = NULL):
    bgfx_init(renderer, _callback, _reallocator)
