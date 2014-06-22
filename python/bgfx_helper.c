#include "bgfx.h"

~callback_helper::callback_helper()
{
}

/// If fatal code code is not Fatal::DebugCheck this callback is
/// called on unrecoverable error. It's not safe to continue, inform
/// user and terminate application from this call.
void callback_helper::fatal(Fatal::Enum _code, const char* _str)
{
}

/// Return size of for cached item. Return 0 if no cached item was
/// found.
uint32_t callback_helper::cacheReadSize(uint64_t _id)
{
}

/// Read cached item.
bool callback_helper::cacheRead(uint64_t _id, void* _data, uint32_t _size)
{
}

/// Write cached item.
void callback_helper::cacheWrite(uint64_t _id, const void* _data, uint32_t _size)
{
}

/// Screenshot captured. Screenshot format is always 4-byte BGRA.
void callback_helper::screenShot(const char* _filePath, uint32_t _width, uint32_t _height, uint32_t _pitch, const void* _data, uint32_t _size, bool _yflip)
{
}

/// Called when capture begins.
void callback_helper::captureBegin(uint32_t _width, uint32_t _height, uint32_t _pitch, TextureFormat::Enum _format, bool _yflip)
{
}

/// Called when capture ends.
void callback_helper::captureEnd()
{
}

/// Captured frame.
void callback_helper::captureFrame(const void* _data, uint32_t _size)
{
}