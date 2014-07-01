#include "bgfx.h"
#include "bgfxplatform.h"

struct callback_helper : bgfx::CallbackI
{
    virtual ~callback_helper();

    /// If fatal code code is not Fatal::DebugCheck this callback is
    /// called on unrecoverable error. It's not safe to continue, inform
    /// user and terminate application from this call.
    virtual void fatal(bgfx::Fatal::Enum _code, const char* _str);

    /// Return size of for cached item. Return 0 if no cached item was
    /// found.
    virtual uint32_t cacheReadSize(uint64_t _id);

    /// Read cached item.
    virtual bool cacheRead(uint64_t _id, void* _data, uint32_t _size);

    /// Write cached item.
    virtual void cacheWrite(uint64_t _id, const void* _data, uint32_t _size);

    /// Screenshot captured. Screenshot format is always 4-byte BGRA.
    virtual void screenShot(const char* _filePath, uint32_t _width, uint32_t _height, uint32_t _pitch, const void* _data, uint32_t _size, bool _yflip);

    /// Called when capture begins.
    virtual void captureBegin(uint32_t _width, uint32_t _height, uint32_t _pitch, bgfx::TextureFormat::Enum _format, bool _yflip);

    /// Called when capture ends.
    virtual void captureEnd();

    /// Captured frame.
    virtual void captureFrame(const void* _data, uint32_t _size);
};

