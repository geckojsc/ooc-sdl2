[![Build Status](https://travis-ci.org/geckojsc/ooc-sdl2.png?branch=master)](https://travis-ci.org/geckojsc/ooc-sdl2)

## ooc-sdl

SDL 2.0 bindings for ooc. SDL is a thin layer to handle windowing, basic
pixel operations, and event handling in a cross-platform manner.

It has various extensions for image loading, sound mixing, font loading,
networking, etc.

SDL 2.0 improves on SDL 1.2 by adding support for multiple windows, fully
hardware accelerated rendering, and improved input capabilities.

These bindings are fairly incomplete, currently sdl2/Core, sdl2/Event and
sdl2/Image have been updated, and may still be missing some types and
functions. Please contribute!

### Todo

  * Fix .travis.yml
  * Update bindings for SDL2_mixer (maybe rename some stuff for consitency
    with sdl2/Image and sdl2/Event)?
  * Change sdl2.use to utilise sdl2-config, instead of linking with library files
    explicitly (e.g. so people don't have to add -lmingw32 to build on Windows)
  * Create bindings for SDL2_ttf
  * Verify that the SDL_gfx bindings work with SDL 2.0, and add bindings for the
    new SDL2_gfx library (which should work alongside it too?)

### Authors

  * Peter Lichard
  * Amos Wenger
  * Jeremy Clarke

### Links

  * SDL: http://www.libsdl.org/
  * SDL 2.0 Docs: http://wiki.libsdl.org/moin.cgi/FrontPage
  * 1.2 to 2.0 Migration Guide: http://wiki.libsdl.org/moin.cgi/MigrationGuide
