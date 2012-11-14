use sdl
import sdl/Core

main: func (argc: Int, argv: CString*) {
  SDL init(SDL_INIT_EVERYTHING)
  screen := SDL setMode(640, 480, 0, SDL_HWSURFACE | SDL_DOUBLEBUF)
  SDL wmSetCaption("", null)

  SDL fillRect(screen, null, SDL mapRgb(screen@ format, 72, 60, 50))
  SDL flip(screen)

  SDL delay(2000)

  SDL quit()
}
