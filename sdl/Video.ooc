use sdl
import sdl/Core

SDLVideo: cover {
	
	getVideoSurface: extern(SDL_GetVideoSurface) static func -> Surface*
	setMode: extern(SDL_SetVideoMode) static func(Int, Int, Int, UInt32) -> Surface*
	wmSetCaption: extern(SDL_WM_SetCaption) static func(const Char*, const Char*)
	glSwapBuffers: extern(SDL_GL_SwapBuffers) static func
        createRgbSurface: extern(SDL_CreateRGBSurface) static func (UInt32, Int, Int, Int, UInt32, UInt32, UInt32, UInt32) -> Surface*
	getVideoSurface: extern(SDL_GetVideoSurface) static func() -> Surface*
	setMode: extern(SDL_SetVideoMode) static func(Int,Int,Int,UInt32) -> Surface*
	wmSetCaption: extern(SDL_WM_SetCaption) static func(const String, const String)
	glSwapBuffers: extern(SDL_GL_SwapBuffers) static func()
        blitSurface: extern(SDL_BlitSurface) static func (Surface*, Rectangle*, Surface*, Rectangle*)
    
}

