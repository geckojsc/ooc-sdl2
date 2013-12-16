use sdl2
import sdl2/[Core, Image]

main: func (argc: Int, argv: CString*) {
	
	SDL init(SDL_INIT_EVERYTHING)
	
	window := SDL createWindow(
		"Loading a transparent PNG",
		SDL_WINDOWPOS_UNDEFINED,
		SDL_WINDOWPOS_UNDEFINED,
		600, 400, SDL_WINDOW_SHOWN)
	
	// Create a rendering target
	renderer := SDL createRenderer(window, -1, SDL_RENDERER_ACCELERATED)
	
	// Load a PNG as a surface
	podlySurface := SDLImage load("assets/translucent_podly.png")
	
	if (podlySurface == null) {
		"Error loading image, %s" printfln(SDL getError())
		exit(1)
	}
	
	// Create a hardware-accelerated image:
	podlyTexture := SDL createTextureFromSurface(renderer, podlySurface)
	SDL freeSurface(podlySurface)
	
	// Used for size and position on-screen
	targetRect:SdlRect
	targetRect x = 100
	targetRect y = 100
	targetRect w = 88
	targetRect h = 88
	
	// Clear the screen
	SDL setRenderDrawColor(renderer, 0, 40, 80, 255)
	SDL renderClear(renderer)
	
	// Draw the entire image
	SDL renderCopy(renderer, podlyTexture, null, targetRect&)
	
	// Update the screen
	SDL renderPresent(renderer)
	
	SDL delay(5000)
	
	// Clean up
	SDL destroyTexture(podlyTexture)
	SDL destroyRenderer(renderer)
	SDL destroyWindow(window)
	
	SDL quit()
}
