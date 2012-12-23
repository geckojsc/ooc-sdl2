use sdl2
import sdl2/Core

main: func (argc: Int, argv: CString*) {
	
	SDL init(SDL_INIT_EVERYTHING)
	
	// create a 600x400 window, in no specific place
	window := SDL createWindow(
		"Hello SDL2!",
		SDL_WINDOWPOS_UNDEFINED,
		SDL_WINDOWPOS_UNDEFINED,
		600, 400, SDL_WINDOW_SHOWN)
	
	// create a hardware-accelerated rendering target
	renderer := SDL createRenderer(window, -1, SDL_RENDERER_ACCELERATED)
	
	// clear the screen to black, and apply the changes
	SDL setRenderDrawColor(renderer, 0, 0, 0, 255)
	SDL renderClear(renderer)
	SDL renderPresent(renderer)
	
	SDL delay(1000)
	
	SDL destroyRenderer(renderer)
	SDL destroyWindow(window)
	SDL quit()
}
