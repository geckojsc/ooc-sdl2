use sdl2, sdl2-image
import sdl2/Core

SDLImage: cover {
	load: extern(IMG_Load) static func (path: CString) -> SdlSurface*
}
