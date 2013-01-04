use sdl2, sdl2-image
import sdl2/Core
include SDL

SDLImage: cover {
	load: extern(IMG_Load) static func (path: CString) -> SdlSurface*
}
