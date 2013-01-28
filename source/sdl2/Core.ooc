use sdl2
include SDL
	
SDL_INIT_TIMER      : extern const Int
SDL_INIT_AUDIO      : extern const Int
SDL_INIT_VIDEO      : extern const Int
SDL_INIT_CDROM      : extern const Int
SDL_INIT_JOYSTICK   : extern const Int
SDL_INIT_NOPARACHUTE: extern const Int
SDL_INIT_EVENTTHREAD: extern const Int
SDL_INIT_EVERYTHING : extern const Int

/* SDL_WindowFlags */
SDL_WINDOW_FULLSCREEN   : extern const Int /* fullscreen window */
SDL_WINDOW_OPENGL       : extern const Int /* window usable with OpenGL context */
SDL_WINDOW_SHOWN        : extern const Int /* window is visible */
SDL_WINDOW_HIDDEN       : extern const Int /* window is not visible */
SDL_WINDOW_BORDERLESS   : extern const Int /* no window decoration */
SDL_WINDOW_RESIZABLE    : extern const Int /* window can be resized */
SDL_WINDOW_MINIMIZED    : extern const Int /* window is minimized */
SDL_WINDOW_MAXIMIZED    : extern const Int /* window is maximized */
SDL_WINDOW_INPUT_GRABBED: extern const Int /* window has grabbed input focus */
SDL_WINDOW_INPUT_FOCUS  : extern const Int /* window has input focus */
SDL_WINDOW_MOUSE_FOCUS  : extern const Int /* window has mouse focus */
SDL_WINDOW_FOREIGN      : extern const Int /* window not created by SDL */

SDL_WINDOWPOS_UNDEFINED: extern const Int
SDL_WINDOWPOS_CENTERED : extern const Int

/* SDL_RendererFlags */
SDL_RENDERER_SOFTWARE     : extern const Int /* The renderer is a software fallback */ 
SDL_RENDERER_ACCELERATED  : extern const Int /* The renderer uses hardware acceleration */
SDL_RENDERER_PRESENTVSYNC : extern const Int /* Present is synchronized with the refresh rate */
SDL_RENDERER_TARGETTEXTURE: extern const Int /* The renderer supports rendering to texture */

/* SDL_TextureAccess */
SDL_TEXTUREACCESS_STATIC   : extern const Int /* rarely: Changes, not lockable */
SDL_TEXTUREACCESS_STREAMING: extern const Int /* frequently: Changes, lockable */
SDL_TEXTUREACCESS_TARGET   : extern const Int /* Texture can be used as a render target */

/* SDL_RendererFlip */
SDL_FLIP_NONE      : extern const Int /* Do not flip */
SDL_FLIP_HORIZONTAL: extern const Int /* flip horizontally */
SDL_FLIP_VERTICAL  : extern const Int /* flip vertically */


/* SDL_GLattr */
SDL_GL_RED_SIZE                  : extern const Int
SDL_GL_GREEN_SIZE                : extern const Int
SDL_GL_BLUE_SIZE                 : extern const Int
SDL_GL_ALPHA_SIZE                : extern const Int
SDL_GL_BUFFER_SIZE               : extern const Int
SDL_GL_DOUBLEBUFFER              : extern const Int
SDL_GL_DEPTH_SIZE                : extern const Int
SDL_GL_STENCIL_SIZE              : extern const Int
SDL_GL_ACCUM_RED_SIZE            : extern const Int
SDL_GL_ACCUM_GREEN_SIZE          : extern const Int
SDL_GL_ACCUM_BLUE_SIZE           : extern const Int
SDL_GL_ACCUM_ALPHA_SIZE          : extern const Int
SDL_GL_STEREO                    : extern const Int
SDL_GL_MULTISAMPLEBUFFERS        : extern const Int
SDL_GL_MULTISAMPLESAMPLES        : extern const Int
SDL_GL_ACCELERATED_VISUAL        : extern const Int
SDL_GL_RETAINED_BACKING          : extern const Int
SDL_GL_CONTEXT_MAJOR_VERSION     : extern const Int
SDL_GL_CONTEXT_MINOR_VERSION     : extern const Int
SDL_GL_CONTEXT_EGL               : extern const Int
SDL_GL_CONTEXT_FLAGS             : extern const Int
SDL_GL_CONTEXT_PROFILE_MASK      : extern const Int
SDL_GL_SHARE_WITH_CURRENT_CONTEXT: extern const Int

/* SDL_GLprofile */
SDL_GL_CONTEXT_PROFILE_CORE         : extern const Int
SDL_GL_CONTEXT_PROFILE_COMPATIBILITY: extern const Int
SDL_GL_CONTEXT_PROFILE_ES           : extern const Int

/* SDL_GLcontextFlag */
SDL_GL_CONTEXT_DEBUG_FLAG              : extern const Int
SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG : extern const Int
SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG      : extern const Int
SDL_GL_CONTEXT_RESET_ISOLATION_FLAG    : extern const Int

/* SDL_BlendMode */
SDL_BLENDMODE_NONE : extern const Int /* No blending */
SDL_BLENDMODE_BLEND: extern const Int /* dst = (src * A) + (dst * (1-A)) */
SDL_BLENDMODE_ADD  : extern const Int /* dst = (src * A) + dst */
SDL_BLENDMODE_MOD  : extern const Int /* dst = src * dst */

SdlRect: cover from SDL_Rect {
	x, y: extern Int16
	w, h: extern UInt16
}

SdlPoint: cover from SDL_Point {
	x, y: extern Int
}

SdlSurface: cover from SDL_Surface {
	w: extern Int
	h: extern Int
	pixels: extern Pointer
	format: extern SdlPixelFormat*
	pitch: UInt16
}

SdlRendererInfo: cover from SDL_RendererInfo {
	name: extern const Char*
	flags: extern UInt32 /* See SDL_RenderFlags */
	numTextureFormats: extern(num_texture_formats) UInt32
	textureFormats: extern(texture_formats) UInt32*
	maxTextureWidth: extern(max_texture_width) Int
	maxTextureHeight: extern(max_texture_height) Int
}

SdlDisplayMode: cover from SDL_DisplayMode {
	format: extern UInt32  /* pixel format */
	w: extern Int
	h: extern Int
	refreshRate: extern(refresh_rate) Int
	driverdata:extern  Void*
}

SdlWindow: cover from SDL_Window* 
SdlRenderer: cover from SDL_Renderer*
SdlTexture: cover from SDL_Texture*

SdlColor: cover from SDL_Color {
	r, g, b, unused: extern UInt8
}

SdlPalette: cover from SDL_Palette {
	ncolors: extern Int
	colors: SdlColor*
}

SdlPixelFormat: cover from SDL_PixelFormat {
	palette: extern SdlPalette*
	bitsPerPixel: extern(BitsPerPixel) UInt8
	bytesPerPixel: extern(BytesPerPixel) UInt8
	rLoss: extern(Rloss) UInt8
	gLoss: extern(Gloss) UInt8
	bLoss: extern(Bloss) UInt8
	aLoss: extern(Aloss) UInt8
	rShift: extern(Rshift) UInt8
	gShift: extern(Gshift) UInt8
	bShift: extern(Bshift) UInt8
	aShift: extern(Ashift) UInt8
	rMask: extern(Rmask) UInt8
	gMask: extern(Gmask) UInt8
	bMask: extern(Bmask) UInt8
	aMask: extern(Amask) UInt8
	colorKey: extern(colorkey) UInt32
	alpha: extern UInt8
}

SdlGlContext: cover from SDL_GLContext* {}

SDL_QUIT: extern const Int
SDL_KEYDOWN: extern const Int
SDL_KEYUP: extern const Int
SDL_ENABLE: extern const Int
SDL_DISABLE: extern const Int
SDL_GRAB_ON: extern const Int

SDL: cover {
	
	/* Some general methods for sdl */
	init: extern(SDL_Init) static func (UInt32) -> Int
	initSubSystem: extern(SDL_InitSubSystem) static func (UInt32) -> Int
	quitSubSystem: extern(SDL_QuitSubSystem) static func (UInt32)
	quit: extern(SDL_Quit) static func
	wasInit: extern (SDL_WasInit) static func (UInt32) -> Int
	getError: extern(SDL_GetError) static func -> String
	setError: extern(SDL_SetError) static func (const String, ...)
	//error: extern(SDL_Error) static func (extern(SDL_errorcode))
	clearError: extern(SDL_ClearError) static func
	loadObject: extern(SDL_LoadObject) static func (const String) -> Void*
	loadFunction: extern(SDL_LoadFunction) static func (Void* , const String) -> Void*
	unloadObject: extern(SDL_UnloadObject) static func (Void*)
	getTicks: extern(SDL_GetTicks) static func -> Int
	showCursor: extern(SDL_ShowCursor) static func (Bool)
	getRelativeMouseState: extern(SDL_GetRelativeMouseState) static func (Int*, Int*) -> UInt8
        setRelativeMouseMode: extern(SDL_SetRelativeMouseMode) static func (Bool) -> Int
	delay: extern(SDL_Delay) static func (UInt32)
	
	mapRgb: extern(SDL_MapRGB) static func (SdlPixelFormat*, r, g, b: UInt8) -> UInt32
	
	
	/* Video */
	getNumVideoDrivers: extern(SDL_GetNumVideoDrivers) static func -> Int
	getVideoDriver: extern(SDL_GetVideoDriver) static func (index: Int) -> const Char*
	videoInit: extern(SDL_VideoInit) static func (driver_name: const Char*) -> Int
	videoQuit: extern(SDL_VideoQuit) static func
	getCurrentVideoDriver: extern(SDL_GetCurrentVideoDriver) static func -> const Char*
	getNumVideoDisplays: extern(SDL_GetNumVideoDisplays) static func -> Int
	getDisplayBounds: extern(SDL_GetDisplayBounds) static func (displayIndex: Int, rect: SdlRect*) -> Int
	getNumDisplayModes: extern(SDL_GetNumDisplayModes) static func (displayIndex: Int) -> Int
	getDisplayMode: extern(SDL_GetDisplayMode) static func (displayIndex: Int, modeIndex: Int, mode: SdlDisplayMode*) -> Int
	getDesktopDisplayMode: extern(SDL_GetDesktopDisplayMode) static func (displayIndex: Int, mode: SdlDisplayMode*) -> Int
	getCurrentDisplayMode: extern(SDL_GetCurrentDisplayMode) static func (displayIndex: Int, mode: SdlDisplayMode*) -> Int
	getClosestDisplayMode: extern(SDL_GetClosestDisplayMode) static func (displayIndex: Int, mode: const SdlDisplayMode*, closest: SdlDisplayMode*) -> SdlDisplayMode*
	
	/* Window */
	getWindowDisplay: extern(SDL_GetWindowDisplay) static func (window: SdlWindow) -> Int
	setWindowDisplayMode: extern(SDL_SetWindowDisplayMode) static func (window: SdlWindow, mode: const SdlDisplayMode*) -> Int
	getWindowDisplayMode: extern(SDL_GetWindowDisplayMode) static func (window: SdlWindow, mode: SdlDisplayMode*) -> Int
	getWindowPixelFormat: extern(SDL_GetWindowPixelFormat) static func (window: SdlWindow) -> UInt32
	createWindow: extern(SDL_CreateWindow) static func (title: const Char*, x, y, w, h: Int, flags: UInt32) -> SdlWindow
	createWindowFrom: extern(SDL_CreateWindowFrom) static func (data: const Void*) -> SdlWindow
	getWindowID: extern(SDL_GetWindowID) static func (window: SdlWindow) -> UInt32
	getWindowFromID: extern(SDL_GetWindowFromID) static func (id: UInt32) -> SdlWindow
	getWindowFlags: extern(SDL_GetWindowFlags) static func (window: SdlWindow) -> UInt32
	setWindowTitle: extern(SDL_SetWindowTitle) static func (window: SdlWindow, title: const Char*)
	getWindowTitle: extern(SDL_GetWindowTitle) static func (window: SdlWindow) -> const Char*
	setWindowIcon: extern(SDL_SetWindowIcon) static func (window: SdlWindow, icon: SdlSurface*)
	setWindowData: extern(SDL_SetWindowData) static func (window: SdlWindow, name: const Char*, userdata: Void*) -> Void*
	getWindowData: extern(SDL_GetWindowData) static func (window: SdlWindow, name: const Char*) -> Void*
	setWindowPosition: extern(SDL_SetWindowPosition) static func (window: SdlWindow, x, y: Int)
	getWindowPosition: extern(SDL_GetWindowPosition) static func (window: SdlWindow, x, y: Int*)
	setWindowSize: extern(SDL_SetWindowSize) static func (window: SdlWindow, w, h: Int)
	getWindowSize: extern(SDL_GetWindowSize) static func (window: SdlWindow, w, h: Int*)
	setWindowMinimumSize: extern(SDL_SetWindowMinimumSize) static func (window: SdlWindow, min_w, min_h: Int)
	getWindowMinimumSize: extern(SDL_GetWindowMinimumSize) static func (window: SdlWindow, w, h: Int*)
	setWindowBordered: extern(SDL_SetWindowBordered) static func (window: SdlWindow, bordered: Bool)
	showWindow: extern(SDL_ShowWindow) static func (window: SdlWindow)
	hideWindow: extern(SDL_HideWindow) static func (window: SdlWindow)
	raiseWindow: extern(SDL_RaiseWindow) static func (window: SdlWindow)
	maximizeWindow: extern(SDL_MaximizeWindow) static func (window: SdlWindow)
	minimizeWindow: extern(SDL_MinimizeWindow) static func (window: SdlWindow)
	restoreWindow: extern(SDL_RestoreWindow) static func (window: SdlWindow)
	setWindowFullscreen: extern(SDL_SetWindowFullscreen) static func (window: SdlWindow, fullscreen: Bool) -> Int
	getWindowSurface: extern(SDL_GetWindowSurface) static func (window: SdlWindow) -> SdlSurface*
	updateWindowSurface: extern(SDL_UpdateWindowSurface) static func (window: SdlWindow) -> Int
	updateWindowSurfaceRects: extern(SDL_UpdateWindowSurfaceRects) static func (window: SdlWindow, rects: SdlRect*, numrects: Int) -> Int
	setWindowGrab: extern(SDL_SetWindowGrab) static func (window: SdlWindow, grabbed: Bool)
	getWindowGrab: extern(SDL_GetWindowGrab) static func (window: SdlWindow) -> Bool
	setWindowBrightness: extern(SDL_SetWindowBrightness) static func (window: SdlWindow, brightness: Float) -> Int
	getWindowBrightness: extern(SDL_GetWindowBrightness) static func (window: SdlWindow) -> Float
	setWindowGammaRamp: extern(SDL_SetWindowGammaRamp) static func (window: SdlWindow, r, g, b: const UInt16*) -> Int
	getWindowGammaRamp: extern(SDL_GetWindowGammaRamp) static func (window: SdlWindow, r, g, b: UInt16*) -> Int
	destroyWindow: extern(SDL_DestroyWindow) static func (window: SdlWindow)
	
	isScreenSaverEnabled: extern(SDL_IsScreenSaverEnabled) static func -> Bool
	enableScreenSaver: extern(SDL_EnableScreenSaver) static func
	disableScreenSaver: extern(SDL_DisableScreenSaver) static func

	glLoadLibrary: extern(SDL_GL_LoadLibrary) static func (path: const Char*) -> Int
	glGetProcAddress: extern(SDL_GL_GetProcAddress) static func (proc: const Char*) -> Void*
	glUnloadLibrary: extern(SDL_GL_UnloadLibrary) static func
	glExtensionSupported: extern(SDL_GL_ExtensionSupported) static func (extension: const Char*) -> Bool
	glSetAttribute: extern(SDL_GL_SetAttribute) static func (attr: Int, value: Int) -> Int
	glGetAttribute: extern(SDL_GL_GetAttribute) static func (attr: Int, value: Int*) -> Int
	glCreateContext: extern(SDL_GL_CreateContext) static func (window: SdlWindow) -> SdlGlContext
	glMakeCurrent: extern(SDL_GL_MakeCurrent) static func (window: SdlWindow, context: SdlGlContext) -> Int
	glSetSwapInterval: extern(SDL_GL_SetSwapInterval) static func (Interval: Int) -> Int
	glGetSwapInterval: extern(SDL_GL_GetSwapInterval) static func -> Int
	glSwapWindow: extern(SDL_GL_SwapWindow) static func (window: SdlWindow)
	glDeleteContext: extern(SDL_GL_DeleteContext) static func (context: SdlGlContext)
	
	/* Renderer */
	getNumRenderDrivers: extern(SDL_GetNumRenderDrivers) static func -> Int
	getRenderDriverInfo: extern(SDL_GetRenderDriverInfo) static func (index: Int, info: SdlRendererInfo*) -> Int
	createWindowAndRenderer: extern(SDL_CreateWindowAndRenderer) static func (width, height: Int, windowFlags: UInt32, window: SdlWindow, renderer: SdlRenderer) -> Int
	createRenderer: extern(SDL_CreateRenderer) static func (window: SdlWindow, index: Int, flags: UInt32) -> SdlRenderer 
	createSoftwareRenderer: extern(SDL_CreateSoftwareRenderer) static func (surface: SdlSurface*) -> SdlRenderer 
	getRenderer: extern(SDL_GetRenderer) static func (window: SdlWindow) -> SdlRenderer 
	getRendererInfo: extern(SDL_GetRendererInfo) static func (renderer: SdlRenderer, info: SdlRendererInfo*) -> Int
	createTexture: extern(SDL_CreateTexture) static func (renderer: SdlRenderer, format: UInt32, access, w, h: Int) -> SdlTexture 
	createTextureFromSurface: extern(SDL_CreateTextureFromSurface) static func (renderer: SdlRenderer, surface: SdlSurface*) -> SdlTexture 
	queryTexture: extern(SDL_QueryTexture) static func (texture: SdlTexture, format: UInt32*, access, w, h: Int*) -> Int
	setTextureColorMod: extern(SDL_SetTextureColorMod) static func (texture: SdlTexture, r, g, b: UInt8) -> Int
	getTextureColorMod: extern(SDL_GetTextureColorMod) static func (texture: SdlTexture, r, g, b: UInt8*) -> Int
	setTextureAlphaMod: extern(SDL_SetTextureAlphaMod) static func (texture: SdlTexture, alpha: UInt8) -> Int
	getTextureAlphaMod: extern(SDL_GetTextureAlphaMod) static func (texture: SdlTexture, alpha: UInt8*) -> Int
	setTextureBlendMode: extern(SDL_SetTextureBlendMode) static func (texture: SdlTexture, blendMode: Int) -> Int
	getTextureBlendMode: extern(SDL_GetTextureBlendMode) static func (texture: SdlTexture, blendMode: Int*) -> Int
	updateTexture: extern(SDL_UpdateTexture) static func (texture: SdlTexture, rect: const SdlRect*, pixels: const Void*, pitch: Int) -> Int
	lockTexture: extern(SDL_LockTexture) static func (texture: SdlTexture, rect: const SdlRect*, pixels: Void*, pitch: Int*) -> Int
	unlockTexture: extern(SDL_UnlockTexture) static func (texture: SdlTexture)
	renderTargetSupported: extern(SDL_RenderTargetSupported) static func (renderer: SdlRenderer) -> Bool
	setRenderTarget: extern(SDL_SetRenderTarget) static func (renderer: SdlRenderer, texture: SdlTexture) -> Int
	getRenderTarget: extern(SDL_GetRenderTarget) static func (renderer: SdlRenderer) -> SdlTexture 
	renderSetLogicalSize: extern(SDL_RenderSetLogicalSize) static func (renderer: SdlRenderer, w, h: Int) -> Int
	renderGetLogicalSize: extern(SDL_RenderGetLogicalSize) static func (renderer: SdlRenderer, w, y: Int*)
	renderSetViewport: extern(SDL_RenderSetViewport) static func (renderer: SdlRenderer, rect: const SdlRect*) -> Int
	renderGetViewport: extern(SDL_RenderGetViewport) static func (renderer: SdlRenderer, rect: SdlRect*)
	renderSetScale: extern(SDL_RenderSetScale) static func (renderer: SdlRenderer, scaleX, scaleY: Float) -> Int
	renderGetScale: extern(SDL_RenderGetScale) static func (renderer: SdlRenderer, scaleX, scaleY: Float*)
	setRenderDrawColor: extern(SDL_SetRenderDrawColor) static func (renderer: SdlRenderer, r, g, b, a: UInt8) -> Int
	getRenderDrawColor: extern(SDL_GetRenderDrawColor) static func (renderer: SdlRenderer, r, g, b, a: UInt8*) -> Int
	setRenderDrawBlendMode: extern(SDL_SetRenderDrawBlendMode) static func (renderer: SdlRenderer, blendMode: Int) -> Int
	getRenderDrawBlendMode: extern(SDL_GetRenderDrawBlendMode) static func (renderer: SdlRenderer, blendMode: Int*) -> Int
	renderClear: extern(SDL_RenderClear) static func (renderer: SdlRenderer) -> Int
	renderDrawPoint: extern(SDL_RenderDrawPoint) static func (renderer: SdlRenderer, x, y: Int) -> Int
	renderDrawPoints: extern(SDL_RenderDrawPoints) static func (renderer: SdlRenderer, points: const SdlPoint*, count: Int) -> Int
	renderDrawLine: extern(SDL_RenderDrawLine) static func (renderer: SdlRenderer, x1, y1, x2, y2: Int) -> Int
	renderDrawLines: extern(SDL_RenderDrawLines) static func (renderer: SdlRenderer, points: const SdlPoint*, count: Int) -> Int
	renderDrawRect: extern(SDL_RenderDrawRect) static func (renderer: SdlRenderer, rect: const SdlRect*) -> Int
	renderDrawRects: extern(SDL_RenderDrawRects) static func (renderer: SdlRenderer, rects: const SdlRect*, count: Int) -> Int
	renderFillRect: extern(SDL_RenderFillRect) static func (renderer: SdlRenderer, rect: const SdlRect*) -> Int
	renderFillRects: extern(SDL_RenderFillRects) static func (renderer: SdlRenderer, rects: const SdlRect*, count: Int) -> Int
	renderCopy: extern(SDL_RenderCopy) static func (renderer: SdlRenderer, texture: SdlTexture, srcrect, dstrect: const SdlRect*) -> Int
	renderCopyEx: extern(SDL_RenderCopyEx) static func (renderer: SdlRenderer, texture: SdlTexture, srcrect, dstrect: const SdlRect*, angle: const Double, center: const SdlPoint*, flip: const Int) -> Int
	renderReadPixels: extern(SDL_RenderReadPixels) static func (renderer: SdlRenderer, rect: const SdlRect*, format: UInt32, pixels: Void*, pitch: Int) -> Int
	renderPresent: extern(SDL_RenderPresent) static func (renderer: SdlRenderer)
	destroyTexture: extern(SDL_DestroyTexture) static func (texture: SdlTexture)
	destroyRenderer: extern(SDL_DestroyRenderer) static func (renderer: SdlRenderer)
	glBindTexture: extern(SDL_GL_BindTexture) static func (texture: SdlTexture, texw, texh: Float*) -> Int
	
	/* Surfaces */
	createRGBSurface: extern(SDL_CreateRGBSurface) static func (flags: UInt32, width, height, depth: Int, rMask, gMask, bMask, aMask: UInt32) -> SdlSurface*
	createRGBSurfaceFrom: extern(SDL_CreateRGBSurfaceFrom) static func (pixels: Void*, width, height, depth, pitch:Int, rMask, gMask, bMask, aMask: UInt32) -> SdlSurface*
	freeSurface: extern(SDL_FreeSurface) static func (SdlSurface*)
	setSurfacePalette: extern(SDL_SetSurfacePalette) static func (SdlSurface*, palette: SdlPalette*) -> Int
	lockSurface: extern(SDL_LockSurface) static func (SdlSurface*) -> Int
	unlockSurface: extern(SDL_UnlockSurface) static func (SdlSurface*)
	loadBMP: extern(SDL_LoadBMP) static func (CString) -> SdlSurface*
	saveBMP: extern(SDL_SaveBMP) static func (SdlSurface*, CString) -> Int
	setSurfaceRLE: extern(SDL_SetSurfaceRLE) static func (SdlSurface*, flag: Int) -> Int
	setColorKey: extern(SDL_SetColorKey) static func (SdlSurface*, flag: Bool, key: UInt32) -> Int
	getColorKey: extern(SDL_GetColorKey) static func (SdlSurface*, key: UInt32*) -> Int
	setSurfaceColorMod: extern(SDL_SetSurfaceColorMod) static func (SdlSurface*, r, g, b: UInt8) -> Int
	getSurfaceColorMod: extern(SDL_GetSurfaceColorMod) static func (SdlSurface*, r, g, b: UInt8*) -> Int
	setSurfaceAlphaMod: extern(SDL_SetSurfaceAlphaMod) static func (SdlSurface*, alpha: UInt8) -> Int
	getSurfaceAlphaMod: extern(SDL_GetSurfaceAlphaMod) static func (SdlSurface*, alpha: UInt8*) -> Int
	setSurfaceBlendMode: extern(SDL_SetSurfaceBlendMode) static func (SdlSurface*, blendMode:Int) -> Int
	getSurfaceBlendMode: extern(SDL_GetSurfaceBlendMode) static func (SdlSurface*, blendMode:Int*) -> Int
	setClipRect: extern(SDL_SetClipRect) static func (SdlSurface*, const SdlRect*) -> Bool
	getClipRect: extern(SDL_GetClipRect) static func (SdlSurface*, SdlRect*)
	convertSurface: extern(SDL_ConvertSurface) static func (SdlSurface*, SdlPixelFormat*, flags: UInt32) -> SdlSurface*
	convertSurfaceFormat: extern(SDL_ConvertSurfaceFormat) static func (SdlSurface*, pixel_format: UInt32, flags: UInt32) -> SdlSurface*
	convertPixels: extern(SDL_ConvertPixels) static func (width, height: Int, src_format: UInt32, src: const Void*, src_pitch: Int, dst_format: UInt32, dst: Void*, dst_pitch: Int) -> Int
	fillRect: extern(SDL_FillRect) static func (dst: SdlSurface*, rect: const SdlRect*, color: UInt32) -> Int
	fillRects: extern(SDL_FillRects) static func (dst: SdlSurface*, rects: const SdlRect*, count: Int, color: UInt32) -> Int
	blitSurface: extern(SDL_BlitSurface) static func (src: SdlSurface*, srcrect: const SdlRect*, dst: SdlSurface*, dstrect: SdlRect*) -> Int
	softStretch: extern(SDL_SoftStretch) static func (src: SdlSurface*, srcrect: const SdlRect*, dst: SdlSurface*, dstrect: const SdlRect*) -> Int
	blitScaled: extern(SDL_BlitScaled) static func (src: SdlSurface*, srcrect: const SdlRect*, dst: SdlSurface*, dstrect: SdlRect*) -> Int
	
	/* Keyboard */
	getKeyboardFocus: extern(SDL_GetKeyboardFocus) static func -> SdlWindow
	getKeyboardState: extern(SDL_GetKeyboardState) static func(numkeys: Int*) -> UInt8*
	getModState: extern(SDL_GetModState) static func -> Int
	setModState: extern(SDL_SetModState) static func(modstate: Int)
	getKeyFromScancode: extern(SDL_GetKeyFromScancode) static func(scancode: Int) -> Int
	getScancodeFromKey: extern(SDL_GetScancodeFromKey) static func(key: Int) -> Int
	getScancodeName: extern(SDL_GetScancodeName) static func(scancode: Int) -> const Char*
	getScancodeFromName: extern(SDL_GetScancodeFromName) static func(name: const Char*) -> Int
	getKeyName: extern(SDL_GetKeyName) static func(key: Int) -> const Char*
	getKeyFromName: extern(SDL_GetKeyFromName) static func(name: const Char*) -> Int
	startTextInput: extern(SDL_StartTextInput) static func
	isTextInputActive: extern(SDL_IsTextInputActive) static func -> Bool
	stopTextInput: extern(SDL_StopTextInput) static func
	setTextInputRect: extern(SDL_SetTextInputRect) static func(rect: SdlRect*)
	hasScreenKeyboardSupport: extern(SDL_HasScreenKeyboardSupport) static func -> Bool
	isScreenKeyboardShown: extern(SDL_IsScreenKeyboardShown) static func(window: SdlWindow) -> Bool

}
