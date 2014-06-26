from libc.stdint cimport uint8_t, uint16_t, uint32_t, uint64_t, int32_t

cdef extern from "bgfx.h" namespace "bgfx":
    cdef enum _Fatal "Fatal":
        _DebugCheck "bgfx::Fatal::DebugCheck"
        _MinimumRequiredSpecs "bgfx::Fatal::MinimumRequiredSpecs"
        _InvalidShader "bgfx::Fatal::InvalidShader"
        _UnableToInitialize "bgfx::Fatal::UnableToInitialize"
        _UnableToCreateTexture "bgfx::Fatal::UnableToCreateTexture"

    cdef enum _RendererType "RendererType":
        _Null "bgfx::RendererType::Null"
        _Direct3D9 "bgfx::RendererType::Direct3D9"
        _Direct3D11 "bgfx::RendererType::Direct3D11"
        _OpenGLES "bgfx::RendererType::OpenGLES"
        _OpenGL "bgfx::RendererType::OpenGL"

        _RendererTypeCount "bgfx::RendererType::Count"

    cdef enum _Attrib "Attrib":
        _Position "bgfx::Attrib::Position"
        _Normal "bgfx::Attrib::Normal"
        _Tangent "bgfx::Attrib::Tangent"
        _Color0 "bgfx::Attrib::Color0"
        _Color1 "bgfx::Attrib::Color1"
        _Indices "bgfx::Attrib::Indices"
        _Weight "bgfx::Attrib::Weight"
        _TexCoord0 "bgfx::Attrib::TexCoord0"
        _TexCoord1 "bgfx::Attrib::TexCoord1"
        _TexCoord2 "bgfx::Attrib::TexCoord2"
        _TexCoord3 "bgfx::Attrib::TexCoord3"
        _TexCoord4 "bgfx::Attrib::TexCoord4"
        _TexCoord5 "bgfx::Attrib::TexCoord5"
        _TexCoord6 "bgfx::Attrib::TexCoord6"
        _TexCoord7 "bgfx::Attrib::TexCoord7"

        _AttribCount "bgfx::Attrib::Count"

    cdef enum _AttribType "AttribType":
        _Uint8 "bgfx::AttribType::Uint8"
        _Int16 "bgfx::AttribType::Int16"
        _Half "bgfx::AttribType::Half"
        _Float "bgfx::AttribType::Float"
        _AttribTypeCount "bgfx::AttribType::Count"

    cdef enum _TextureFormat "TextureFormat":
        _BC1 "bgfx::TextureFormat::BC1"
        _BC2 "bgfx::TextureFormat::BC2"
        _BC3 "bgfx::TextureFormat::BC3"
        _BC4 "bgfx::TextureFormat::BC4"
        _BC5 "bgfx::TextureFormat::BC5"
        _ETC1 "bgfx::TextureFormat::ETC1"
        _ETC2 "bgfx::TextureFormat::ETC2"
        _ETC2A "bgfx::TextureFormat::ETC2A"
        _ETC2A1 "bgfx::TextureFormat::ETC2A1"
        _PTC12 "bgfx::TextureFormat::PTC12"
        _PTC14 "bgfx::TextureFormat::PTC14"
        _PTC12A "bgfx::TextureFormat::PTC12A"
        _PTC14A "bgfx::TextureFormat::PTC14A"
        _PTC22 "bgfx::TextureFormat::PTC22"
        _PTC24 "bgfx::TextureFormat::PTC24"
        _Unknown "bgfx::TextureFormat::Unknown"
        _R8 "bgfx::TextureFormat::R8"
        _R16 "bgfx::TextureFormat::R16"
        _R16F "bgfx::TextureFormat::R16F"
        _BGRA8 "bgfx::TextureFormat::BGRA8"
        _RGBA16 "bgfx::TextureFormat::RGBA16"
        _RGBA16F "bgfx::TextureFormat::RGBA16F"
        _R5G6B5 "bgfx::TextureFormat::R5G6B5"
        _RGBA4 "bgfx::TextureFormat::RGBA4"
        _RGB5A1 "bgfx::TextureFormat::RGB5A1"
        _RGB10A2 "bgfx::TextureFormat::RGB10A2"
        _UnknownDepth "bgfx::TextureFormat::UnknownDepth"
        _D16 "bgfx::TextureFormat::D16"
        _D24 "bgfx::TextureFormat::D24"
        _D24S8 "bgfx::TextureFormat::D24S8"
        _D32 "bgfx::TextureFormat::D32"
        _D16F "bgfx::TextureFormat::D16F"
        _D24F "bgfx::TextureFormat::D24F"
        _D32F "bgfx::TextureFormat::D32F"
        _D0S8 "bgfx::TextureFormat::D0S8"
        _TextureFormatCount "bgfx::TextureFormat::Count"

"""    enum: BGFX_RESET_VSYNC
    enum: BGFX_CLEAR_COLOR_BIT
    enum: BGFX_CLEAR_DEPTH_BIT

    ctypedef enum bgfx_renderer_type_t:
        BGFX_RENDERER_TYPE_NULL
        BGFX_RENDERER_TYPE_DIRECT3D9
        BGFX_RENDERER_TYPE_DIRECT3D11
        BGFX_RENDERER_TYPE_OPENGLES
        BGFX_RENDERER_TYPE_OPENGL

    enum: BGFX_RENDERER_TYPE_COUNT

    cdef enum bgfx_attrib_t:
        BGFX_ATTRIB_POSITION
        BGFX_ATTRIB_NORMAL
        BGFX_ATTRIB_TANGENT
        BGFX_ATTRIB_COLOR0
        BGFX_ATTRIB_COLOR1
        BGFX_ATTRIB_INDICES
        BGFX_ATTRIB_WEIGHT
        BGFX_ATTRIB_TEXCOORD0
        BGFX_ATTRIB_TEXCOORD1
        BGFX_ATTRIB_TEXCOORD2
        BGFX_ATTRIB_TEXCOORD3
        BGFX_ATTRIB_TEXCOORD4
        BGFX_ATTRIB_TEXCOORD5
        BGFX_ATTRIB_TEXCOORD6
        BGFX_ATTRIB_TEXCOORD7

    enum: BGFX_ATTRIB_COUNT

    ctypedef enum bgfx_attrib_type_t:
        BGFX_ATTRIB_TYPE_UINT8
        BGFX_ATTRIB_TYPE_INT16
        BGFX_ATTRIB_TYPE_HALF
        BGFX_ATTRIB_TYPE_FLOAT

    enum: BGFX_ATTRIB_TYPE_COUNT

    ctypedef enum bgfx_texture_format_t:
        BGFX_TEXTURE_FORMAT_BC1
        BGFX_TEXTURE_FORMAT_BC2
        BGFX_TEXTURE_FORMAT_BC3
        BGFX_TEXTURE_FORMAT_BC4
        BGFX_TEXTURE_FORMAT_BC5
        BGFX_TEXTURE_FORMAT_ETC1
        BGFX_TEXTURE_FORMAT_ETC2
        BGFX_TEXTURE_FORMAT_ETC2A
        BGFX_TEXTURE_FORMAT_ETC2A1
        BGFX_TEXTURE_FORMAT_PTC12
        BGFX_TEXTURE_FORMAT_PTC14
        BGFX_TEXTURE_FORMAT_PTC12A
        BGFX_TEXTURE_FORMAT_PTC14A
        BGFX_TEXTURE_FORMAT_PTC22
        BGFX_TEXTURE_FORMAT_PTC24

        BGFX_TEXTURE_FORMAT_UNKNOWN

        BGFX_TEXTURE_FORMAT_R8
        BGFX_TEXTURE_FORMAT_R16
        BGFX_TEXTURE_FORMAT_R16F
        BGFX_TEXTURE_FORMAT_BGRA8
        BGFX_TEXTURE_FORMAT_RGBA16
        BGFX_TEXTURE_FORMAT_RGBA16F
        BGFX_TEXTURE_FORMAT_R5G6B5
        BGFX_TEXTURE_FORMAT_RGBA4
        BGFX_TEXTURE_FORMAT_RGB5A1
        BGFX_TEXTURE_FORMAT_RGB10A2

        BGFX_TEXTURE_FORMAT_UNKNOWN_DEPTH

        BGFX_TEXTURE_FORMAT_D16
        BGFX_TEXTURE_FORMAT_D24
        BGFX_TEXTURE_FORMAT_D24S8
        BGFX_TEXTURE_FORMAT_D32
        BGFX_TEXTURE_FORMAT_D16F
        BGFX_TEXTURE_FORMAT_D24F
        BGFX_TEXTURE_FORMAT_D32F
        BGFX_TEXTURE_FORMAT_D0S8

    enum: BGFX_TEXTURE_FORMAT_COUNT

    ctypedef enum bgfx_uniform_type_t:
        BGFX_UNIFORM_TYPE_UNIFORM1I
        BGFX_UNIFORM_TYPE_UNIFORM1F
        BGFX_UNIFORM_TYPE_END

        BGFX_UNIFORM_TYPE_UNIFORM1IV
        BGFX_UNIFORM_TYPE_UNIFORM1FV
        BGFX_UNIFORM_TYPE_UNIFORM2FV
        BGFX_UNIFORM_TYPE_UNIFORM3FV
        BGFX_UNIFORM_TYPE_UNIFORM4FV
        BGFX_UNIFORM_TYPE_UNIFORM3X3FV
        BGFX_UNIFORM_TYPE_UNIFORM4X4FV

    enum: BGFX_UNIFORM_TYPE_COUNT

    ctypedef uint16_t bgfx_dynamic_index_buffer_handle_t
    ctypedef uint16_t bgfx_dynamic_vertex_buffer_handle_t
    ctypedef uint16_t bgfx_frame_buffer_handle_t
    ctypedef uint16_t bgfx_index_buffer_handle_t
    ctypedef uint16_t bgfx_program_handle_t
    ctypedef uint16_t bgfx_shader_handle_t
    ctypedef uint16_t bgfx_texture_handle_t
    ctypedef uint16_t bgfx_uniform_handle_t
    ctypedef uint16_t bgfx_vertex_buffer_handle_t
    ctypedef uint16_t bgfx_vertex_decl_handle_t

    ctypedef struct bgfx_memory_t:
        uint8_t* data
        uint32_t size

    ctypedef struct bgfx_vertex_decl_t:
        uint32_t hash
        uint16_t stride
        uint16_t offset[BGFX_ATTRIB_COUNT]
        uint8_t attributes[BGFX_ATTRIB_COUNT]

    ctypedef struct bgfx_transient_index_buffer_t:
        uint8_t* data
        uint32_t size
        bgfx_index_buffer_handle_t handle
        uint32_t startIndex

    ctypedef struct bgfx_transient_vertex_buffer_t:
        uint8_t* data
        uint32_t size
        uint32_t startVertex
        uint16_t stride
        bgfx_vertex_buffer_handle_t handle
        bgfx_vertex_decl_handle_t decl

    ctypedef struct bgfx_instance_data_buffer_t:
        uint8_t* data
        uint32_t size
        uint32_t offset
        uint16_t stride
        uint16_t num
        bgfx_vertex_buffer_handle_t handle

    ctypedef struct bgfx_texture_info_t:
        bgfx_texture_format_t format
        uint32_t storageSize
        uint16_t width
        uint16_t height
        uint16_t depth
        uint8_t numMips
        uint8_t bitsPerPixel

    ctypedef struct bgfx_caps_t:
        bgfx_renderer_type_t rendererType
        uint64_t supported
        uint64_t emulated
        uint16_t maxTextureSize
        uint16_t maxDrawCalls
        uint8_t  maxFBAttachments

    ctypedef enum bgfx_fatal_t:
        BGFX_FATAL_DEBUG_CHECK
        BGFX_FATAL_MINIMUM_REQUIRED_SPECS
        BGFX_FATAL_INVALID_SHADER
        BGFX_FATAL_UNABLE_TO_INITIALIZE
        BGFX_FATAL_UNABLE_TO_CREATE_TEXTURE

    ctypedef struct bgfx_callback_interface_vtbl_t:
        void* ctor
        void (__stdcall *fatal)(bgfx_fatal_t code, const char* _str)
        uint32_t (__stdcall *cache_read_size)(uint64_t _id)
        bint (__stdcall *cache_read)(uint64_t _id, void* _data, uint32_t _size)
        void (__stdcall *cache_write)(uint64_t _id, const void* _data, uint32_t _size)
        void (__stdcall *screen_shot)(const char* _filePath, uint32_t _width, uint32_t _height,
                                      uint32_t _pitch, const void* _data, uint32_t _size, bint _yflip)
        void (__stdcall *capture_begin)(uint32_t _width, uint32_t _height, uint32_t _pitch,
                                        bgfx_texture_format_t _format, bint _yflip)
        void (__stdcall *capture_end)()
        void (__stdcall *capture_frame)(const void* _data, uint32_t _size)


    ctypedef struct bgfx_callback_interface_t:
        const bgfx_callback_interface_vtbl_t* vtbl

    ctypedef struct bgfx_reallocator_vtbl_t:
        void* ctor
        void* (__stdcall *alloc)(size_t _size, size_t _align, const char* _file, uint32_t _line)
        void  (__stdcall *free)(void* _ptr, size_t _align, const char* _file, uint32_t _line)
        void* (__stdcall *realloc)(void* _ptr, size_t _size, size_t _align, const char* _file, uint32_t _line)

    ctypedef struct bgfx_reallocator_interface_t:
        const bgfx_reallocator_vtbl_t* vtbl

    void vertex_decl_begin(bgfx_vertex_decl_t* _decl, bgfx_renderer_type_t _renderer)
    void vertex_decl_add(bgfx_vertex_decl_t* _decl, bgfx_attrib_t _attrib, uint8_t _num, bgfx_attrib_type_t _type, bint _normalized, bint _asInt)
    void vertex_decl_skip(bgfx_vertex_decl_t* _decl, uint8_t _num)
    void vertex_decl_end(bgfx_vertex_decl_t* _decl)
    void vertex_pack(const float _input[4], bint _inputNormalized, bgfx_attrib_t _attr, const bgfx_vertex_decl_t* _decl, void* _data, uint32_t _index)
    void vertex_unpack(float _output[4], bgfx_attrib_t _attr, const bgfx_vertex_decl_t* _decl, const void* _data, uint32_t _index)
    void vertex_convert(const bgfx_vertex_decl_t* _destDecl, void* _destData, const bgfx_vertex_decl_t* _srcDecl, const void* _srcData, uint32_t _num)
    uint16_t weld_vertices(uint16_t* _output, const bgfx_vertex_decl_t* _decl, const void* _data, uint16_t _num, float _epsilon)
    void image_swizzle_bgra8(uint32_t _width, uint32_t _height, uint32_t _pitch, const void* _src, void* _dst)
    void image_rgba8_downsample_2x2(uint32_t _width, uint32_t _height, uint32_t _pitch, const void* _src, void* _dst)
    uint8_t get_supported_renderers(bgfx_renderer_type_t _enum[BGFX_RENDERER_TYPE_COUNT])
    const char* get_renderer_name(bgfx_renderer_type_t _type)
    void init(bgfx_renderer_type_t renderer, bgfx_callback_interface_t* _callback, bgfx_reallocator_interface_t* _reallocator)
    void shutdown()
    void reset(uint32_t _width, uint32_t _height, uint32_t _flags)
    uint32_t frame()
    renderer_type_t get_renderer_type()
    caps_t* get_caps()
    const bgfx_memory_t* alloc(uint32_t _size)
    const bgfx_memory_t* copy(const void* _data, uint32_t _size)
    const bgfx_memory_t* make_ref(const void* _data, uint32_t _size)
    void set_debug(uint32_t _debug)
    void dbg_text_clear(uint8_t _attr, bint _small)
    void dbg_text_printf(uint16_t _x, uint16_t _y, uint8_t _attr, const char* _format, ...)
    index_buffer_handle_t create_index_buffer(const bgfx_memory_t* _mem)
    void destroy_index_buffer(index_buffer_handle_t _handle)
    vertex_buffer_handle_t bgfx_create_vertex_buffer(const bgfx_memory_t* _mem, const bgfx_vertex_decl_t* _decl)
    void bgfx_destroy_vertex_buffer(bgfx_vertex_buffer_handle_t _handle)
    bgfx_dynamic_index_buffer_handle_t bgfx_create_dynamic_index_buffer(uint32_t _num)
    bgfx_dynamic_index_buffer_handle_t bgfx_create_dynamic_index_buffer_mem(const bgfx_memory_t* _mem)
    void bgfx_update_dynamic_index_buffer(bgfx_dynamic_index_buffer_handle_t _handle, const bgfx_memory_t* _mem)
    void bgfx_destroy_dynamic_index_buffer(bgfx_dynamic_index_buffer_handle_t _handle)
    bgfx_dynamic_vertex_buffer_handle_t bgfx_create_dynamic_vertex_buffer(uint16_t _num, const bgfx_vertex_decl_t* _decl)
    bgfx_dynamic_vertex_buffer_handle_t bgfx_create_dynamic_vertex_buffer_mem(const bgfx_memory_t* _mem, const bgfx_vertex_decl_t* _decl)
    void bgfx_update_dynamic_vertex_buffer(bgfx_dynamic_vertex_buffer_handle_t _handle, const bgfx_memory_t* _mem)
    void bgfx_destroy_dynamic_vertex_buffer(bgfx_dynamic_vertex_buffer_handle_t _handle)
    bint bgfx_check_avail_transient_index_buffer(uint32_t _num)
    bint bgfx_check_avail_transient_vertex_buffer(uint32_t _num, const bgfx_vertex_decl_t* _decl)
    bint bgfx_check_avail_instance_data_buffer(uint32_t _num, uint16_t _stride)
    bint bgfx_check_avail_transient_buffers(uint32_t _numVertices, const bgfx_vertex_decl_t* _decl, uint32_t _numIndices)
    void bgfx_alloc_transient_index_buffer(bgfx_transient_index_buffer_t* _tib, uint32_t _num)
    void bgfx_alloc_transient_vertex_buffer(bgfx_transient_vertex_buffer_t* _tvb, uint32_t _num, const bgfx_vertex_decl_t* _decl)
    bint bgfx_alloc_transient_buffers(bgfx_transient_vertex_buffer_t* _tvb, const bgfx_vertex_decl_t* _decl, uint16_t _numVertices, bgfx_transient_index_buffer_t* _tib, uint16_t _numIndices)
    const bgfx_instance_data_buffer_t* bgfx_alloc_instance_data_buffer(uint32_t _num, uint16_t _stride)
    bgfx_shader_handle_t bgfx_create_shader(const bgfx_memory_t* _mem)
    uint16_t bgfx_get_shader_uniforms(bgfx_shader_handle_t _handle, bgfx_uniform_handle_t* _uniforms, uint16_t _max)
    void bgfx_destroy_shader(bgfx_shader_handle_t _handle)
    bgfx_program_handle_t bgfx_create_program(bgfx_shader_handle_t _vsh, bgfx_shader_handle_t _fsh, bint _destroyShaders)
    void bgfx_destroy_program(bgfx_program_handle_t _handle)
    void bgfx_calc_texture_size(bgfx_texture_info_t* _info, uint16_t _width, uint16_t _height, uint16_t _depth, uint8_t _numMips, bgfx_texture_format_t _format)
    bgfx_texture_handle_t bgfx_create_texture(const bgfx_memory_t* _mem, uint32_t _flags, uint8_t _skip, bgfx_texture_info_t* _info)
    bgfx_texture_handle_t bgfx_create_texture_2d(uint16_t _width, uint16_t _height, uint8_t _numMips, bgfx_texture_format_t _format, uint32_t _flags, const bgfx_memory_t* _mem)
    bgfx_texture_handle_t bgfx_create_texture_3d(uint16_t _width, uint16_t _height, uint16_t _depth, uint8_t _numMips, bgfx_texture_format_t _format, uint32_t _flags, const bgfx_memory_t* _mem)
    bgfx_texture_handle_t bgfx_create_texture_cube(uint16_t _size, uint8_t _numMips, bgfx_texture_format_t _format, uint32_t _flags, const bgfx_memory_t* _mem)
    void bgfx_update_texture_2d(bgfx_texture_handle_t _handle, uint8_t _mip, uint16_t _x, uint16_t _y, uint16_t _width, uint16_t _height, const bgfx_memory_t* _mem, uint16_t _pitch)
    void bgfx_update_texture_3d(bgfx_texture_handle_t _handle, uint8_t _mip, uint16_t _x, uint16_t _y, uint16_t _z, uint16_t _width, uint16_t _height, uint16_t _depth, const bgfx_memory_t* _mem)
    void bgfx_update_texture_cube(bgfx_texture_handle_t _handle, uint8_t _side, uint8_t _mip, uint16_t _x, uint16_t _y, uint16_t _width, uint16_t _height, const bgfx_memory_t* _mem, uint16_t _pitch)
    void bgfx_destroy_texture(bgfx_texture_handle_t _handle)
    bgfx_frame_buffer_handle_t bgfx_create_frame_buffer(uint16_t _width, uint16_t _height, bgfx_texture_format_t _format, uint32_t _textureFlags)
    bgfx_frame_buffer_handle_t bgfx_create_frame_buffer_from_handles(uint8_t _num, bgfx_texture_handle_t* _handles, bint _destroyTextures)
    void bgfx_destroy_frame_buffer(bgfx_frame_buffer_handle_t _handle)
    bgfx_uniform_handle_t bgfx_create_uniform(const char* _name, bgfx_uniform_type_t _type, uint16_t _num)
    void bgfx_destroy_uniform(bgfx_uniform_handle_t _handle)
    void bgfx_set_view_name(uint8_t _id, const char* _name)
    void bgfx_set_view_rect(uint8_t _id, uint16_t _x, uint16_t _y, uint16_t _width, uint16_t _height)
    void bgfx_set_view_rect_mask(uint32_t _viewMask, uint16_t _x, uint16_t _y, uint16_t _width, uint16_t _height)
    void bgfx_set_view_scissor(uint8_t _id, uint16_t _x, uint16_t _y, uint16_t _width, uint16_t _height)
    void bgfx_set_view_scissor_mask(uint32_t _viewMask, uint16_t _x, uint16_t _y, uint16_t _width, uint16_t _height)
    void bgfx_set_view_clear(uint8_t _id, uint8_t _flags, uint32_t _rgba, float _depth, uint8_t _stencil)
    void bgfx_set_view_clear_mask(uint32_t _viewMask, uint8_t _flags, uint32_t _rgba, float _depth, uint8_t _stencil)
    void bgfx_set_view_seq(uint8_t _id, bint _enabled)
    void bgfx_set_view_seq_mask(uint32_t _viewMask, bint _enabled)
    void bgfx_set_view_frame_buffer(uint8_t _id, bgfx_frame_buffer_handle_t _handle)
    void bgfx_set_view_frame_buffer_mask(uint32_t _viewMask, bgfx_frame_buffer_handle_t _handle)
    void bgfx_set_view_transform(uint8_t _id, const void* _view, const void* _proj)
    void bgfx_set_view_transform_mask(uint32_t _viewMask, const void* _view, const void* _proj)
    void bgfx_set_marker(const char* _marker)
    void bgfx_set_state(uint64_t _state, uint32_t _rgba)
    void bgfx_set_stencil(uint32_t _fstencil, uint32_t _bstencil)
    uint16_t bgfx_set_scissor(uint16_t _x, uint16_t _y, uint16_t _width, uint16_t _height)
    void bgfx_set_scissor_cached(uint16_t _cache)
    uint32_t bgfx_set_transform(const void* _mtx, uint16_t _num)
    void bgfx_set_transform_cached(uint32_t _cache, uint16_t _num)
    void bgfx_set_uniform(bgfx_uniform_handle_t _handle, const void* _value, uint16_t _num)
    void bgfx_set_index_buffer(bgfx_index_buffer_handle_t _handle, uint32_t _firstIndex, uint32_t _numIndices)
    void bgfx_set_dynamic_index_buffer(bgfx_dynamic_index_buffer_handle_t _handle, uint32_t _firstIndex, uint32_t _numIndices)
    void bgfx_set_transient_index_buffer(const bgfx_transient_index_buffer_t* _tib, uint32_t _firstIndex, uint32_t _numIndices)
    void bgfx_set_vertex_buffer(bgfx_vertex_buffer_handle_t _handle, uint32_t _startVertex, uint32_t _numVertices)
    void bgfx_set_dynamic_vertex_buffer(bgfx_dynamic_vertex_buffer_handle_t _handle, uint32_t _numVertices)
    void bgfx_set_transient_vertex_buffer(const bgfx_transient_vertex_buffer_t* _tvb, uint32_t _startVertex, uint32_t _numVertices)
    void bgfx_set_instance_data_buffer(const bgfx_instance_data_buffer_t* _idb, uint16_t _num)
    void bgfx_set_program(bgfx_program_handle_t _handle)
    void bgfx_set_texture(uint8_t _stage, bgfx_uniform_handle_t _sampler, bgfx_texture_handle_t _handle, uint32_t _flags)
    void bgfx_set_texture_from_frame_buffer(uint8_t _stage, bgfx_uniform_handle_t _sampler, bgfx_frame_buffer_handle_t _handle, uint8_t _attachment, uint32_t _flags)
    uint32_t bgfx_submit(uint8_t _id, int32_t _depth)
    uint32_t bgfx_submit_mask(uint32_t _viewMask, int32_t _depth)
    void bgfx_discard()
    void bgfx_save_screen_shot(const char* _filePath)


cdef class _callback(bgfx_callback_interface_vtbl_t):
    cdef void __stdcall fatal(bgfx_fatal_t code, const char* _str):
        print(_str)

    cdef uint32_t __stdcall cache_read_size(uint64_t _id)
    cdef bint __stdcall cache_read(uint64_t _id, void* _data, uint32_t _size)
    cdef void __stdcall cache_write(uint64_t _id, const void* _data, uint32_t _size)
    cdef void __stdcall screen_shot(const char* _filePath, uint32_t _width, uint32_t _height,
                                  uint32_t _pitch, const void* _data, uint32_t _size, bint _yflip)
    cdef void __stdcall capture_begin(uint32_t _width, uint32_t _height, uint32_t _pitch,
                                    bgfx_texture_format_t _format, bint _yflip)
    cdef void __stdcall capture_end()
    cdef void __stdcall capture_frame(const void* _data, uint32_t _size)


class Renderer:
    Null = BGFX_RENDERER_TYPE_NULL
    Direct3D9 = BGFX_RENDERER_TYPE_DIRECT3D9
    Direct3D11 = BGFX_RENDERER_TYPE_DIRECT3D11
    OpenGLES = BGFX_RENDERER_TYPE_OPENGLES
    OpenGL = BGFX_RENDERER_TYPE_OPENGL

def init(renderer=BGFX_RENDERER_TYPE_COUNT, callback=None, reallocator=None):
    cdef bgfx_callback_interface_t* _callback = NULL
    cdef bgfx_reallocator_interface_t* _reallocator = NULL

    if renderer is None:
        renderer = BGFX_RENDERER_TYPE_COUNT

    if callback is not None:
        pass

    if reallocator is not None:
        pass

    bgfx_init(renderer, _callback, _reallocator)

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
    DebugCheck = _DebugCheck
    MinimumRequiredSpace = _MinimumRequiredSpecs
    InvalidShader = _InvalidShader
    UnableToInitialize = _UnableToInitialize
    UnableToCreateTexture = _UnableToCreateTexture

class RendererType:
    Null = _Null
    Direct3D9 = _Direct3D9
    Direct3D11 = _Direct3D11
    OpenGLES = _OpenGLES
    OpenGL = _OpenGL

    Count = _RendererTypeCount

class Attrib:
    Position = _Position
    Normal = _Normal
    Tangent = _Tangent
    Color0 = _Color0
    Color1 = _Color1
    Indices = _Indices
    Weight = _Weight
    TexCoord0 = _TexCoord0
    TexCoord1 = _TexCoord1
    TexCoord2 = _TexCoord2
    TexCoord3 = _TexCoord3
    TexCoord4 = _TexCoord4
    TexCoord5 = _TexCoord5
    TexCoord6 = _TexCoord6
    TexCoord7 = _TexCoord7
    Count = _AttribCount

class AttribType:
    Uint8 = _Uint8
    Int16 = _Int16
    Half = _Half
    Float = _Float
    Count = _AttribCount

class TextureFormat:
    BC1 = _BC1
    BC2 = _BC2
    BC3 = _BC3
    BC4 = _BC4
    BC5 = _BC5
    ETC1 = _ETC1
    ETC2 = _ETC2
    ETC2A = _ETC2A
    ETC2A1 = _ETC2A1
    PTC12 = _PTC12
    PTC14 = _PTC14
    PTC12A = _PTC12A
    PTC14A = _PTC14A
    PTC22 = _PTC22
    PTC24 = _PTC24
    Unknown = _Unknown
    R8 = _R8
    R16 = _R16
    R16F = _R16F
    BGRA8 = _BGRA8
    RGBA16 = _RGBA16
    RGBA16F = _RGBA16F
    R5G6B5 = _R5G6B5
    RGBA4 = _RGBA4
    RGB5A1 = _RGB5A1
    RGB10A2 = _RGB10A2
    UnknownDepth = _UnknownDepth
    D16 = _D16
    D24 = _D24
    D24S8 = _D24S8
    D32 = _D32
    D16F = _D16F
    D24F = _D24F
    D32F = _D32F
    D0S8 = _D0S8
    Count = _TextureFormatCount