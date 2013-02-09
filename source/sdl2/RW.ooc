use sdl2
include SDL_rwops

RWops: cover from SDL_RWops* {

    /**
     * Use this function to *create a new SDL_RWops structure for reading from
     * and/or writing to a named file
     */
    new: static extern(SDL_RWFromFile) func ~fromFile (path: CString, mode: CString) -> This

    /**
     * Use this function to read from a data source -or- *call the function
     * pointed to by an SDL_RWops structure's read member.*
     */
    read: extern(SDL_RWread) func (ptr: Pointer, size: SizeT, maxnum: SizeT) -> SizeT

    /**
     * Use this function to seek within an SDL_RWops data stream.
     */
    seek: extern(SDL_RWseek) func (offset: Long, whence: SDL_SeekMode) -> Long

    /**
     * Use this function to perform a do-nothing seek to get the current offset
     * in an SDL_RWops data stream.
     */
    tell: extern(SDL_RWtell) func -> Long

    /**
     * Use this function to close and free an allocated SDL_RWops structure
     * -or- *call the close function in an SDL_RWops structure*.
     */
    close: extern(SDL_RWclose) func -> Int

}

/**
 * SDL seek modes - similar to 
 */
SDL_SeekMode: enum {
    SET: extern (RW_SEEK_SET)
    CUR: extern (RW_SEEK_CUR)
    END: extern (RW_SEEK_END)
}

