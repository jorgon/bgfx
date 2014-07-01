from libc.stdint cimport uint8_t, uint16_t, uint32_t, uint64_t, int32_t, UINT32_MAX, UINT16_MAX
from libcpp cimport bool

include "defines.pxi"

IF PYBGFX_SDL:
    ctypedef uint32_t Uint32
    ctypedef uint16_t Uint16
    ctypedef bool SDL_bool

    cdef extern from "SDL2/SDL.h":
        struct SDL_Surface:
            pass

        struct SDL_Rect:
            pass

        struct SDL_DisplayMode:
            pass

        struct SDL_Surface:
            pass

        struct SDL_WindowShaper:
            pass

        struct SDL_WindowUserData:
            pass

        struct SDL_Window:
            const void * magic
            Uint32 id
            char * title
            SDL_Surface * icon
            int x
            int y
            int w
            int h
            int min_w
            int min_h
            int max_w
            int max_h
            Uint32 flags
            Uint32 last_fullscreen_flags
            SDL_Rect windowed
            SDL_DisplayMode fullscreen_mode
            float brightness
            Uint16 * gamma
            Uint16 * saved_gamma
            SDL_Surface * surface
            SDL_bool surface_valid
            SDL_bool is_destroying
            SDL_WindowShaper * shaper
            SDL_WindowUserData * data
            void * driverdata
            SDL_Window * prev
            SDL_Window * next


cdef extern from "bx/allocator.h" namespace "bx":
    cdef struct _AllocatorI "bx::AllocatorI":
        void* alloc(size_t _size, size_t _align, const char* _file, uint32_t _line)
        void free(void* _ptr, size_t _align, const char* _file, uint32_t _line)

    cdef struct _ReallocatorI "bx::ReallocatorI":
        void* realloc(void* _ptr, size_t _size, size_t _align, const char* _file, uint32_t _line)


cdef extern from "bgfx.h" namespace "bgfx":
    cdef enum _Fatal            "Fatal":
        _DebugCheck             "bgfx::Fatal::DebugCheck"
        _MinimumRequiredSpecs   "bgfx::Fatal::MinimumRequiredSpecs"
        _InvalidShader          "bgfx::Fatal::InvalidShader"
        _UnableToInitialize     "bgfx::Fatal::UnableToInitialize"
        _UnableToCreateTexture  "bgfx::Fatal::UnableToCreateTexture"

    cdef enum _RendererType     "bgfx::RendererType::Enum":
        _Null                   "bgfx::RendererType::Null"
        _Direct3D9              "bgfx::RendererType::Direct3D9"
        _Direct3D11             "bgfx::RendererType::Direct3D11"
        _OpenGLES               "bgfx::RendererType::OpenGLES"
        _OpenGL                 "bgfx::RendererType::OpenGL"

        _RendererTypeCount      "bgfx::RendererType::Count"

    cdef enum _Attrib           "Attrib":
        _Position               "bgfx::Attrib::Position"
        _Normal                 "bgfx::Attrib::Normal"
        _Tangent                "bgfx::Attrib::Tangent"
        _Color0                 "bgfx::Attrib::Color0"
        _Color1                 "bgfx::Attrib::Color1"
        _Indices                "bgfx::Attrib::Indices"
        _Weight                 "bgfx::Attrib::Weight"
        _TexCoord0              "bgfx::Attrib::TexCoord0"
        _TexCoord1              "bgfx::Attrib::TexCoord1"
        _TexCoord2              "bgfx::Attrib::TexCoord2"
        _TexCoord3              "bgfx::Attrib::TexCoord3"
        _TexCoord4              "bgfx::Attrib::TexCoord4"
        _TexCoord5              "bgfx::Attrib::TexCoord5"
        _TexCoord6              "bgfx::Attrib::TexCoord6"
        _TexCoord7              "bgfx::Attrib::TexCoord7"

        _AttribCount            "bgfx::Attrib::Count"

    cdef enum _AttribType       "AttribType":
        _Uint8                  "bgfx::AttribType::Uint8"
        _Int16                  "bgfx::AttribType::Int16"
        _Half                   "bgfx::AttribType::Half"
        _Float                  "bgfx::AttribType::Float"
        _AttribTypeCount        "bgfx::AttribType::Count"

    cdef enum _TextureFormat    "TextureFormat":
        _BC1                    "bgfx::TextureFormat::BC1"
        _BC2                    "bgfx::TextureFormat::BC2"
        _BC3                    "bgfx::TextureFormat::BC3"
        _BC4                    "bgfx::TextureFormat::BC4"
        _BC5                    "bgfx::TextureFormat::BC5"
        _ETC1                   "bgfx::TextureFormat::ETC1"
        _ETC2                   "bgfx::TextureFormat::ETC2"
        _ETC2A                  "bgfx::TextureFormat::ETC2A"
        _ETC2A1                 "bgfx::TextureFormat::ETC2A1"
        _PTC12                  "bgfx::TextureFormat::PTC12"
        _PTC14                  "bgfx::TextureFormat::PTC14"
        _PTC12A                 "bgfx::TextureFormat::PTC12A"
        _PTC14A                 "bgfx::TextureFormat::PTC14A"
        _PTC22                  "bgfx::TextureFormat::PTC22"
        _PTC24                  "bgfx::TextureFormat::PTC24"
        _Unknown                "bgfx::TextureFormat::Unknown"
        _R8                     "bgfx::TextureFormat::R8"
        _R16                    "bgfx::TextureFormat::R16"
        _R16F                   "bgfx::TextureFormat::R16F"
        _BGRA8                  "bgfx::TextureFormat::BGRA8"
        _RGBA16                 "bgfx::TextureFormat::RGBA16"
        _RGBA16F                "bgfx::TextureFormat::RGBA16F"
        _R5G6B5                 "bgfx::TextureFormat::R5G6B5"
        _RGBA4                  "bgfx::TextureFormat::RGBA4"
        _RGB5A1                 "bgfx::TextureFormat::RGB5A1"
        _RGB10A2                "bgfx::TextureFormat::RGB10A2"
        _UnknownDepth           "bgfx::TextureFormat::UnknownDepth"
        _D16                    "bgfx::TextureFormat::D16"
        _D24                    "bgfx::TextureFormat::D24"
        _D24S8                  "bgfx::TextureFormat::D24S8"
        _D32                    "bgfx::TextureFormat::D32"
        _D16F                   "bgfx::TextureFormat::D16F"
        _D24F                   "bgfx::TextureFormat::D24F"
        _D32F                   "bgfx::TextureFormat::D32F"
        _D0S8                   "bgfx::TextureFormat::D0S8"
        _TextureFormatCount     "bgfx::TextureFormat::Count"

    cdef enum _UniformType      "UniformType":
        _Uniform1i              "bgfx::UniformType::Uniform1i"
        _Uniform1f              "bgfx::UniformType::Uniform1f"
        _End                    "bgfx::UniformType::End"
        _Uniform1iv             "bgfx::UniformType::Uniform1iv"
        _Uniform1fv             "bgfx::UniformType::Uniform1fv"
        _Uniform2fv             "bgfx::UniformType::Uniform2fv"
        _Uniform3fv             "bgfx::UniformType::Uniform3fv"
        _Uniform4fv             "bgfx::UniformType::Uniform4fv"
        _Uniform3x3fv           "bgfx::UniformType::Uniform3x3fv"
        _Uniform4x4fv           "bgfx::UniformType::Uniform4x4fv"
        _UniformTypeCount       "bgfx::UniformType::Count"

    cdef struct _DynamicIndexBufferHandle "bgfx::DynamicIndexBufferHandle":
        uint16_t idx
        bool isValid(_DynamicIndexBufferHandle _handle)

    cdef struct _DynamicVertexBufferHandle "bgfx::DynamicVertexBufferHandle":
        uint16_t idx
        bool isValid(_DynamicVertexBufferHandle _handle)

    cdef struct _FrameBufferHandle "bgfx::FrameBufferHandle":
        uint16_t idx
        bool isValid(_FrameBufferHandle _handle)

    cdef struct _IndexBufferHandle "bgfx::IndexBufferHandle":
        uint16_t idx
        bool isValid(_IndexBufferHandle _handle)

    cdef struct _ProgramHandle "bgfx::ProgramHandle":
        uint16_t idx
        bool isValid(_ProgramHandle _handle)

    cdef struct _ShaderHandle "bgfx::ShaderHandle":
        uint16_t idx
        bool isValid(_ShaderHandle _handle)

    cdef struct _TextureHandle "bgfx::TextureHandle":
        uint16_t idx
        bool isValid(_TextureHandle _handle)

    cdef struct _UniformHandle "bgfx::UniformHandle":
        uint16_t idx
        bool isValid(_UniformHandle _handle)

    cdef struct _VertexBufferHandle "bgfx::VertexBufferHandle":
        uint16_t idx
        bool isValid(_VertexBufferHandle _handle)

    cdef struct _VertexDeclHandle "bgfx::VertexDeclHandle":
        uint16_t idx
        bool isValid(_VertexDeclHandle _handle)

    cdef struct _CallbackI "bgfx::CallbackI":
        void fatal(_Fatal _code, const char* _str)
        uint32_t cacheReadSize(uint64_t _id)
        bool cacheRead(uint64_t _id, void* _data, uint32_t _size)
        void cacheWrite(uint64_t _id, const void* _data, uint32_t _size)
        void screenShot(const char* _filePath, uint32_t _width, uint32_t _height, uint32_t _pitch, const void* _data, uint32_t _size, bool _yflip)
        void captureBegin(uint32_t _width, uint32_t _height, uint32_t _pitch, _TextureFormat _format, bool _yflip)
        void captureEnd()
        void captureFrame(const void* _data, uint32_t _size)

    cdef struct _Memory "bgfx::Memory":
        uint8_t* data
        uint32_t size

    cdef struct _Caps "bgfx::Caps":
        _RendererType rendererType
        uint64_t supported
        uint64_t emulated
        uint64_t maxTextureSize
        uint64_t maxDrawCalls
        uint64_t maxFBAttachments

    cdef struct _TransientIndexBuffer "bgfx::TransientIndexBuffer":
        uint8_t* data
        uint32_t size
        _IndexBufferHandle handle
        uint32_t startIndex

    cdef struct _TransientVertexBuffer "bgfx::TransientVertexBuffer":
        uint8_t* data
        uint32_t size
        uint32_t startVertex
        uint16_t stride
        _VertexBufferHandle handle
        _VertexDeclHandle decl

    cdef struct _InstanceDataBuffer "bgfx::InstanceDataBuffer":
        uint8_t* data
        uint32_t size
        uint32_t offset
        uint16_t stride
        uint16_t num
        _VertexBufferHandle handle

    cdef struct _TextureInfo "bgfx::TextureInfo":
        _TextureFormat format
        uint32_t storageSize
        uint16_t width
        uint16_t height
        uint16_t depth
        uint8_t numMips
        uint8_t bitsPerPixel


    cdef struct _VertexDecl "bgfx::VertexDecl":
        _VertexDecl& begin(_RendererType _renderer)
        void end()

        _VertexDecl& add(_Attrib _attrib, uint8_t _num, _AttribType _type, bool _normalized, bool _asInt)
        _VertexDecl& skip(uint8_t _num)
        void decode(_Attrib _attrib, uint8_t& _num, _AttribType& _type, bool& _normalized, bool& _asInt)
        bool has(_Attrib _attrib)
        uint16_t getOffset(_Attrib _attrib)
        uint16_t getStride()
        uint32_t getSize(uint32_t _num)
        uint32_t m_hash
        uint16_t m_stride
        uint16_t* m_offset
        uint8_t* m_attributes

    cdef void _vertexPack "bgfx::vertexPack" (const float _input[4],
                                         bool _inputNormalized,
                                         _Attrib _attr,
                                         const _VertexDecl& _decl,
                                         void* _data,
                                         uint32_t _index = 0)

    cdef void _vertexUnpack "bgfx::vertexUnpack" (float _output[4],
                                            _Attrib _attr,
                                            const _VertexDecl& _decl,
                                            const void* _data,
                                            uint32_t _index = 0)

    cdef void _vertexConvert "bgfx::vertexConvert" (const _VertexDecl& _destDecl,
                                               void* _destData,
                                               const _VertexDecl& _srcDecl,
                                               const void* _srcData,
                                               uint32_t _num = 1)

    cdef uint16_t _weldVertices "bgfx::weldVertices" (uint16_t* _output,
                                                     const _VertexDecl& _decl,
                                                     const void* _data,
                                                     uint16_t _num,
                                                     float _epsilon = 0.001)

    void _imageSwizzleBgra8 "bgfx::imageSwizzleBgra8" (uint32_t _width, uint32_t _height, uint32_t _pitch, const void* _src, void* _dst)
    void _imageRgba8Downsample2x2 "bgfx::imageRgba8Downsample2x2" (uint32_t _width, uint32_t _height, uint32_t _pitch, const void* _src, void* _dst)
    uint8_t _getSupportedRenderers "bgfx::getSupportedRenderers" (_RendererType* _enum)
    const char* _getRendererName "bgfx::getRendererName" (_RendererType _type)

    cdef void _init "bgfx::init" (_RendererType _type,
                   _CallbackI* _callback,
                   _ReallocatorI* _reallocator)

    cdef void _shutdown "bgfx::shutdown" ()
    cdef void _reset "bgfx::reset" (uint32_t _width, uint32_t _height, uint32_t _flags = BGFX_RESET_NONE)
    cdef uint32_t _frame "bgfx::frame" ()
    cdef _RendererType getRendererType "bgfx::getRendererType" ()
    cdef const _Caps* getCaps "bgfx::Caps" ()
    cdef const _Memory* alloc "bgfx::Memory" (uint32_t _size)
    cdef const _Memory* copy "bgfx::Memory" (const void* _data, uint32_t _size)
    cdef const _Memory* makeRef "bgfx::Memory" (const void* _data, uint32_t _size)
    cdef void _setDebug "bgfx::setDebug" (uint32_t _debug)
    cdef void _dbgTextClear "bgfx::dbgTextClear" (uint8_t _attr = 0, bool _small = False)
    cdef void _dbgTextPrintf "bgfx::dbgTextPrintf" (uint16_t _x, uint16_t _y, uint8_t _attr, const char* _format, ...)
    cdef _IndexBufferHandle _createIndexBuffer "bgfx::createIndexBuffer" (const _Memory* _mem)
    cdef void _destroyIndexBuffer "bgfx::destroyIndexBuffer" (_IndexBufferHandle _handle)
    cdef _VertexBufferHandle _createVertexBuffer "bgfx::createVertexBuffer" (const _Memory* _mem, const _VertexDecl& _decl)
    cdef void _destroyVertexBuffer "bgfx::destroyVertexBuffer" (_VertexBufferHandle _handle)
    cdef _DynamicIndexBufferHandle _createDynamicIndexBuffer "bgfx::createDynamicIndexBuffer" (uint32_t _num)
    cdef _DynamicIndexBufferHandle _createDynamicIndexBuffer "bgfx::createDynamicIndexBuffer" (const _Memory* _mem)
    cdef void _updateDynamicIndexBuffer "bgfx::updateDynamicIndexBuffer" (_DynamicIndexBufferHandle _handle, const _Memory* _mem)
    cdef void _destroyDynamicIndexBuffer "bgfx::destroyDynamicIndexBuffer" (_DynamicIndexBufferHandle _handle)
    cdef _DynamicVertexBufferHandle _createDynamicVertexBuffer "bgfx::createDynamicVertexBuffer" (uint16_t _num, const _VertexDecl& _decl)
    cdef _DynamicVertexBufferHandle _createDynamicVertexBuffer "bgfx::createDynamicVertexBuffer" (const _Memory* _mem, const _VertexDecl& _decl)
    cdef void _updateDynamicVertexBuffer "bgfx::updateDynamicVertexBuffer" (_DynamicVertexBufferHandle _handle, const _Memory* _mem)
    cdef void _destroyDynamicVertexBuffer "bgfx::destroyDynamicVertexBuffer" (_DynamicVertexBufferHandle _handle)
    cdef bool _checkAvailTransientIndexBuffer "bgfx::checkAvailTransientIndexBuffer" (uint32_t _num)
    cdef bool _checkAvailTransientVertexBuffer "bgfx::checkAvailTransientVertexBuffer" (uint32_t _num, const _VertexDecl& _decl)
    cdef bool _checkAvailInstanceDataBuffer "bgfx::checkAvailInstanceDataBuffer" (uint32_t _num, uint16_t _stride)
    cdef bool _checkAvailTransientBuffers "bgfx::checkAvailTransientBuffers" (uint32_t _numVertices, const _VertexDecl& _decl, uint32_t _numIndices)
    cdef void _allocTransientIndexBuffer "bgfx::allocTransientIndexBuffer" (_TransientIndexBuffer* _tib, uint32_t _num)
    cdef void _allocTransientVertexBuffer "bgfx::allocTransientVertexBuffer" (_TransientVertexBuffer* _tvb, uint32_t _num, const _VertexDecl& _decl)
    cdef bool _allocTransientBuffers "bgfx::allocTransientBuffers" (_TransientVertexBuffer* _tvb, const _VertexDecl& _decl, uint16_t _numVertices, _TransientIndexBuffer* _tib, uint16_t _numIndices)
    cdef const _InstanceDataBuffer* allocInstanceDataBuffer "bgfx::InstanceDataBuffer" (uint32_t _num, uint16_t _stride)
    cdef _ShaderHandle _createShader "bgfx::createShader" (const _Memory* _mem)
    cdef uint16_t _getShaderUniforms "bgfx::getShaderUniforms" (_ShaderHandle _handle, _UniformHandle* _uniforms = NULL, uint16_t _max = 0)
    cdef void _destroyShader "bgfx::destroyShader" (_ShaderHandle _handle)
    cdef _ProgramHandle _createProgram "bgfx::createProgram" (_ShaderHandle _vsh, _ShaderHandle _fsh, bool _destroyShaders = False)
    cdef void _destroyProgram "bgfx::destroyProgram" (_ProgramHandle _handle)
    cdef void _calcTextureSize "bgfx::calcTextureSize" (_TextureInfo& _info, uint16_t _width, uint16_t _height, uint16_t _depth, uint8_t _numMips, _TextureFormat _format)
    cdef _TextureHandle _createTexture "bgfx::createTexture" (const _Memory* _mem, uint32_t _flags = BGFX_TEXTURE_NONE, uint8_t _skip = 0, _TextureInfo* _info = NULL)
    cdef _TextureHandle _createTexture2D "bgfx::createTexture2D" (uint16_t _width, uint16_t _height, uint8_t _numMips, _TextureFormat _format, uint32_t _flags = BGFX_TEXTURE_NONE, const _Memory* _mem = NULL)
    cdef _TextureHandle _createTexture3D "bgfx::createTexture3D" (uint16_t _width, uint16_t _height, uint16_t _depth, uint8_t _numMips, _TextureFormat _format, uint32_t _flags = BGFX_TEXTURE_NONE, const _Memory* _mem = NULL)
    cdef _TextureHandle _createTextureCube "bgfx::createTextureCube" (uint16_t _size, uint8_t _numMips, _TextureFormat _format, uint32_t _flags = BGFX_TEXTURE_NONE, const _Memory* _mem = NULL)
    cdef void _updateTexture2D "bgfx::updateTexture2D" (_TextureHandle _handle, uint8_t _mip, uint16_t _x, uint16_t _y, uint16_t _width, uint16_t _height, const _Memory* _mem, uint16_t _pitch = UINT16_MAX)
    cdef void _updateTexture3D "bgfx::updateTexture3D" (_TextureHandle _handle, uint8_t _mip, uint16_t _x, uint16_t _y, uint16_t _z, uint16_t _width, uint16_t _height, uint16_t _depth, const _Memory* _mem)
    cdef void _updateTextureCube "bgfx::updateTextureCube" (_TextureHandle _handle, uint8_t _side, uint8_t _mip, uint16_t _x, uint16_t _y, uint16_t _width, uint16_t _height, const _Memory* _mem, uint16_t _pitch = UINT16_MAX)
    cdef void _destroyTexture "bgfx::destroyTexture" (_TextureHandle _handle)
    cdef _FrameBufferHandle _createFrameBuffer "bgfx::createFrameBuffer" (uint16_t _width, uint16_t _height, _TextureFormat _format, uint32_t _textureFlags = BGFX_TEXTURE_U_CLAMP|BGFX_TEXTURE_V_CLAMP)
    cdef _FrameBufferHandle _createFrameBuffer "bgfx::createFrameBuffer" (uint8_t _num, _TextureHandle* _handles, bool _destroyTextures = False)
    cdef void _destroyFrameBuffer "bgfx::destroyFrameBuffer" (_FrameBufferHandle _handle)
    cdef _UniformHandle _createUniform "bgfx::createUniform" (const char* _name, _UniformType _type, uint16_t _num = 1)
    cdef void _destroyUniform "bgfx::destroyUniform" (_UniformHandle _handle)
    cdef void _setViewName "bgfx::setViewName" (uint8_t _id, const char* _name)
    cdef void _setViewRect "bgfx::setViewRect" (uint8_t _id, uint16_t _x, uint16_t _y, uint16_t _width, uint16_t _height)
    cdef void _setViewRectMask "bgfx::setViewRectMask" (uint32_t _viewMask, uint16_t _x, uint16_t _y, uint16_t _width, uint16_t _height)
    cdef void _setViewScissor "bgfx::setViewScissor" (uint8_t _id, uint16_t _x = 0, uint16_t _y = 0, uint16_t _width = 0, uint16_t _height = 0)
    cdef void _setViewScissorMask "bgfx::setViewScissorMask" (uint32_t _viewMask, uint16_t _x = 0, uint16_t _y = 0, uint16_t _width = 0, uint16_t _height = 0)
    cdef void _setViewClear "bgfx::setViewClear" (uint8_t _id, uint8_t _flags, uint32_t _rgba = 0x000000ff, float _depth = 1.0, uint8_t _stencil = 0)
    cdef void _setViewClearMask "bgfx::setViewClearMask" (uint32_t _viewMask, uint8_t _flags, uint32_t _rgba = 0x000000ff, float _depth = 1.0, uint8_t _stencil = 0)
    cdef void _setViewSeq "bgfx::setViewSeq" (uint8_t _id, bool _enabled)
    cdef void _setViewSeqMask "bgfx::setViewSeqMask" (uint32_t _viewMask, bool _enabled)
    cdef void _setViewFrameBuffer "bgfx::setViewFrameBuffer" (uint8_t _id, _FrameBufferHandle _handle)
    cdef void _setViewFrameBufferMask "bgfx::setViewFrameBufferMask" (uint32_t _viewMask, _FrameBufferHandle _handle)
    cdef void _setViewTransform "bgfx::setViewTransform" (uint8_t _id, const void* _view, const void* _proj)
    cdef void _setViewTransformMask "bgfx::setViewTransformMask" (uint32_t _viewMask, const void* _view, const void* _proj)
    cdef void _setMarker "bgfx::setMarker" (const char* _marker)
    cdef void _setState "bgfx::setState" (uint64_t _state, uint32_t _rgba = 0)
    cdef void _setStencil "bgfx::setStencil" (uint32_t _fstencil, uint32_t _bstencil = BGFX_STENCIL_NONE)
    cdef uint16_t _setScissor "bgfx::setScissor" (uint16_t _x, uint16_t _y, uint16_t _width, uint16_t _height)
    cdef void _setScissor "bgfx::setScissor" (uint16_t _cache = UINT16_MAX)
    cdef uint32_t _setTransform "bgfx::setTransform" (const void* _mtx, uint16_t _num = 1)
    cdef void _setTransform "bgfx::setTransform" (uint32_t _cache, uint16_t _num = 1)
    cdef void _setUniform "bgfx::setUniform" (_UniformHandle _handle, const void* _value, uint16_t _num = 1)
    cdef void _setIndexBuffer "bgfx::setIndexBuffer" (_IndexBufferHandle _handle, uint32_t _firstIndex = 0, uint32_t _numIndices = UINT32_MAX)
    cdef void _setIndexBuffer "bgfx::setIndexBuffer" (_DynamicIndexBufferHandle _handle, uint32_t _firstIndex = 0, uint32_t _numIndices = UINT32_MAX)
    cdef void _setIndexBuffer "bgfx::setIndexBuffer" (const _TransientIndexBuffer* _tib)
    cdef void _setIndexBuffer "bgfx::setIndexBuffer" (const _TransientIndexBuffer* _tib, uint32_t _firstIndex, uint32_t _numIndices)
    cdef void _setVertexBuffer "bgfx::setVertexBuffer" (_VertexBufferHandle _handle)
    cdef void _setVertexBuffer "bgfx::setVertexBuffer" (_VertexBufferHandle _handle, uint32_t _startVertex, uint32_t _numVertices)
    cdef void _setVertexBuffer "bgfx::setVertexBuffer" (_DynamicVertexBufferHandle _handle, uint32_t _numVertices = UINT32_MAX)
    cdef void _setVertexBuffer "bgfx::setVertexBuffer" (const _TransientVertexBuffer* _tvb)
    cdef void _setVertexBuffer "bgfx::setVertexBuffer" (const _TransientVertexBuffer* _tvb, uint32_t _startVertex, uint32_t _numVertices)
    cdef void _setInstanceDataBuffer "bgfx::setInstanceDataBuffer" (const _InstanceDataBuffer* _idb, uint16_t _num = UINT16_MAX)
    cdef void _setProgram "bgfx::setProgram" (_ProgramHandle _handle)
    cdef void _setTexture "bgfx::setTexture" (uint8_t _stage, _UniformHandle _sampler, _TextureHandle _handle, uint32_t _flags = UINT32_MAX)
    cdef void _setTexture "bgfx::setTexture" (uint8_t _stage, _UniformHandle _sampler, _FrameBufferHandle _handle, uint8_t _attachment = 0, uint32_t _flags = UINT32_MAX)
    cdef uint32_t _submit "bgfx::submit" (uint8_t _id, int32_t _depth = 0)
    cdef uint32_t _submitMask "bgfx::submitMask" (uint32_t _viewMask, int32_t _depth = 0)
    cdef void _discard "bgfx::discard" ()
    cdef void _saveScreenShot "bgfx::saveScreenShot" (const char* _filePath)

IF PYBGFX_WINDOWS:

    cdef extern from "windows.h":
        ctypedef void* HWND
        ctypedef void* HDC
        ctypedef long DWORD

        cdef HDC GetDC(HWND wnd)
        cdef DWORD GetLastError()

cdef extern from "bgfxplatform.h":
    IF PYBGFX_WINDOWS:
        void _winSetHwnd "bgfx::winSetHwnd"(HWND _window)
    IF PYBGFX_SDL:
        bool sdlSetWindow(SDL_Window* _window)

cdef extern from "bgfx_helper.h":
    IF PYBGFX_WINDOWS:
        void _set_window "set_window" (HWND window)
