use sdl
import sdl/Sdl

SDLVideo: cover {

        createRgbSurface: extern(SDL_CreateRGBSurface) static func (UInt32, Int, Int, Int, UInt32, UInt32, UInt32, UInt32) -> SdlSurface*
	getVideoSurface: extern(SDL_GetVideoSurface) static func() -> SdlSurface*
	setMode: extern(SDL_SetVideoMode) static func(Int,Int,Int,UInt32) -> SdlSurface*
	wmSetCaption: extern(SDL_WM_SetCaption) static func(const CString, const CString)
	glSwapBuffers: extern(SDL_GL_SwapBuffers) static func()
        blitSurface: extern(SDL_BlitSurface) static func (SdlSurface*, SdlRectangle*, SdlSurface*, SdlRectangle*)
        flip: extern(SDL_Flip) static func (SdlSurface*)
    
}

