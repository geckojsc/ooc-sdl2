use sdl

SDL_INIT_TIMER : extern(SDL_INIT_TIMER) const Int
SDL_INIT_AUDIO : extern(SDL_INIT_AUDIO) const Int
SDL_INIT_VIDEO : extern(SDL_INIT_VIDEO) const Int
SDL_INIT_CDROM : extern(SDL_INIT_CDROM) const Int
SDL_INIT_JOYSTICK : extern (SDL_INIT_JOYSTICK) const Int
SDL_INIT_NOPARACHUTE : extern (SDL_INIT_NOPARACHUTE) const Int
SDL_INIT_EVENTTHREAD : extern (SDL_INIT_EVENTTHREAD) const Int
SDL_INIT_EVERYTHING  : extern (SDL_INIT_EVERYTHING) const Int

SDL_SWSURFACE: extern(SDL_SWSURFACE)	const Int/* Surface is in system memory */
SDL_HWSURFACE: extern(SDL_HWSURFACE)	const Int/* Surface is in video memory */
SDL_ASYNCBLIT: extern(SDL_ASYNCBLIT)	const Int/* Use asynchronous blits if possible */

/* Available for SDL_SetVideoMode() */
SDL_ANYFORMAT: extern(SDL_ANYFORMAT)	const Int/* Allow any video depth/pixel-format */
SDL_HWPALETTE: extern(SDL_HWPALETTE)	const Int/* Surface has exclusive palette */
SDL_DOUBLEBUF: extern(SDL_DOUBLEBUF)	const Int/* Set up double-buffered video mode */
SDL_FULLSCREEN: extern (SDL_FULLSCREEN)	const Int/* Surface is a full screen display */
SDL_OPENGL: extern(SDL_OPENGL) 			const Int/* Create an OpenGL rendering context */
SDL_OPENGLBLIT: extern(SDL_OPENGLBLIT)	const Int/* Create an OpenGL rendering context and use it for blitting */
SDL_RESIZABLE: extern(SDL_RESIZABLE)	const Int/* This video mode may be resized */
SDL_NOFRAME: extern(SDL_NOFRAME)		const Int/* No window caption or edge frame */
SDL_GL_DOUBLEBUFFER: extern(SDL_GL_DOUBLEBUFFER) const Int

/* Used internally (read-only) */
SDL_HWACCEL: extern(SDL_HWACCEL)		const Int/* Blit uses hardware acceleration */
SDL_SRCCOLORKEY: extern(SDL_SRCCOLORKEY)const Int/* Blit uses a source color key */
SDL_RLEACCELOK: extern(SDL_RLEACCELOK)	const Int/* Private flag */
SDL_RLEACCEL: extern(SDL_RLEACCEL)		const Int/* Surface is RLE encoded */
SDL_SRCALPHA: extern(SDL_SRCALPHA)		const Int/* Blit uses source alpha blending */
SDL_PREALLOC: extern(SDL_PREALLOC)		const Int/* Surface uses preallocated memory */


SDL_GL_ALPHA_SIZE  : extern(SDL_GL_ALPHA_SIZE)	const Int
SDL_GL_RED_SIZE    : extern(SDL_GL_RED_SIZE)	const Int       
SDL_GL_GREEN_SIZE  : extern(SDL_GL_GREEN_SIZE)  const Int     
SDL_GL_BLUE_SIZE   : extern(SDL_GL_BLUE_SIZE) 	const Int      
SDL_GL_DEPTH_SIZE  : extern(SDL_GL_DEPTH_SIZE) 	const Int  
SDL_GL_DOUBLEBUFFER: extern(SDL_GL_DOUBLEBUFFER)const Int

SdlRectangle: cover from SDL_Rect {
    x, y: extern Int16
    w, h: extern UInt16
}

SdlSurface: cover from SDL_Surface {
    w: extern Int
    h: extern Int
    pixels: extern Pointer
    pitch: UInt16
}

VideoInfo: cover from SDL_VideoInfo {
    hw_available: extern Int
    blit_hw: extern Int
}

SDL_ENABLE: extern(SDL_ENABLE) 		const Int
SDL_DISABLE: extern(SDL_DISABLE)	const Int
SDL_GRAB_ON: extern(SDL_GRAB_ON) 	const Int 
	
 
SDL: cover {
	
	/* Some general methods for sdl */
	init: extern(SDL_Init) static func(UInt32) -> Int
	initSubSystem: extern(SDL_InitSubSystem) static func(UInt32) -> Int
	quitSubSystem: extern(SDL_QuitSubSystem) static func(UInt32)
	quit: extern(SDL_Quit) static func()
	wasInit: extern (SDL_WasInit) static func(UInt32) -> Int
	getError: extern(SDL_GetError) static func() -> String
	setError: extern(SDL_SetError) static func (const String, ...)
	//error: extern(SDL_Error) static func (extern(SDL_errorcode))
	clearError: extern(SDL_ClearError) static func()
	loadObject: extern(SDL_LoadObject) static func(const String) -> Void*
	loadFunction: extern(SDL_LoadFunction) static func(Void* , const String) -> Void*
	unloadObject: extern(SDL_UnloadObject) static func(Void*)
	getTicks: extern(SDL_GetTicks) static func() -> Int
	enableKeyRepeat: extern(SDL_EnableKeyRepeat) static func(Int,Int)
	showCursor: extern(SDL_ShowCursor) static func(Int)
	warpMouse: extern(SDL_WarpMouse) static func(Int,Int)
	WM_GrabInput: extern(SDL_WM_GrabInput) static func(Int)
	WM_ToggleFullScreen: extern(SDL_WM_ToggleFullScreen) static func(SdlSurface*)
	loadBMP: extern(SDL_LoadBMP) static func(String) -> SdlSurface*
	getVideoInfo: extern(SDL_GetVideoInfo) static func() -> VideoInfo*
	GL_SetAttribute: extern (SDL_GL_SetAttribute) static func (Int,Int)
	getModState: extern(SDL_GetModState) static func () -> Int
	getKeyState: extern(SDL_GetKeyState) static func (Int*) -> UChar*
	getRelativeMouseState: extern(SDL_GetRelativeMouseState) static func(Int*, Int*) -> UInt8
	delay: extern(SDL_Delay) static func(UInt32)
	//linkedVersion: extern(SDL_Linked_Version) static func() -> const SDL_version*
        enableUnicode: extern(SDL_EnableUNICODE) static func(enable: Bool)

}

