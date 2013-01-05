use sdl2
import sdl2/[Core, Event]

main: func (argc: Int, argv: CString*) {
	SDL init(SDL_INIT_EVERYTHING)
	
	window := SDL createWindow(
		"Hello SDL2!",
		SDL_WINDOWPOS_UNDEFINED,
		SDL_WINDOWPOS_UNDEFINED,
		600, 400, SDL_WINDOW_SHOWN)
	
	renderer := SDL createRenderer(window, -1, SDL_RENDERER_ACCELERATED)
	
	// load an image and make the background transparent
	podlySurface := SDL loadBMP("podly.bmp")
	SDL setColorKey(podlySurface, true, SDL mapRgb(podlySurface@ format, 255, 0, 255))
	
	// create a hardware accelerated version of the image
	podlyTexture := SDL createTextureFromSurface(renderer, podlySurface)
	
	SDL freeSurface(podlySurface) // the old surface is no longer needed
	
	targetRect := (100, 100, 110, 110) as SdlRect // used for size and position on-screen
	angle := 0.0
	
	done := false
	
	while (!done) {
		
		e: SdlEvent
		while (SdlEvent poll(e&)) {
			if (e type == SDL_QUIT)
				done = true
		}
		
		angle += 4
		
		SDL setRenderDrawColor(renderer, 255, 100, 100, 255)
		SDL renderClear(renderer)
		
		// draw the image with transformations applied
		SDL renderCopyEx(renderer, podlyTexture, null, targetRect&, angle, null, SDL_FLIP_NONE)
		
		SDL renderPresent(renderer)
		SDL delay(1000/60)
	}
	
	SDL destroyTexture(podlyTexture)
	SDL destroyRenderer(renderer)
	SDL destroyWindow(window)
	
	SDL quit()
}
