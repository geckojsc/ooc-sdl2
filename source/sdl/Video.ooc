use sdl
import sdl/Core

SDLVideo: cover {
	
	setMode: extern(SDL_SetVideoMode) static func(Int, Int, Int, UInt32) -> Surface*
	wmSetCaption: extern(SDL_WM_SetCaption) static func(CString, CString)
	glSwapBuffers: extern(SDL_GL_SwapBuffers) static func
        createRgbSurface: extern(SDL_CreateRGBSurface) static func (UInt32, Int, Int, Int, UInt32, UInt32, UInt32, UInt32) -> Surface*
	getVideoSurface: extern(SDL_GetVideoSurface) static func() -> Surface*
        flip: extern(SDL_Flip) static func (SdlSurface*)
    
}

