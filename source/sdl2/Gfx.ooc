use sdl, sdl-gfx
import sdl/Core
include SDL

FpsManager: cover from FPSmanager {
	
	_setRate: extern(SDL_setFramerate) func@(rate:UInt32) -> Int
	_getRate: extern(SDL_getFramerate) func@ -> Int
	_getCount: extern(SDL_getFramecount) func@ -> Int
	_init: extern(SDL_initFramerate) func@
	
	init: func@ {
		_init()
	}
	init: func@~withRate (rate:UInt32) {
		_init()
		_setRate(rate)
	}
	
	delay: extern (SDL_framerateDelay) func@ -> UInt32
	
	rate: UInt32 {
		get { _getRate() as UInt32 }
		set (r) { _setRate(r) }
	}
	
	count: Int {
		get { _getCount() }
	}
	
}

Rotozoom: cover {
	//SMOOTHING_OFF: static Int = 0
	//SMOOTHING_ON: static Int = 1  // extern not working?
	
	rotozoom: extern(rotozoomSurface) static func(src:SdlSurface*, angle, zoom:Double, smooth:Int) -> SdlSurface*
	rotozoomXY: extern(rotozoomSurfaceXY) static func(src:SdlSurface*, angle, zoomx, zoomy:Double, smooth:Int) -> SdlSurface*

	rotozoomSize: extern(rotozoomSurfaceSize) static func(width, height:Int, angle, zoom:Double, dstwidth, dstheight:Int*)
	rotozoomSizeXY: extern(rotozoomSurfaceSizeXY) static func(width, height:Int, angle, zoomx, zoomy:Double, dstwidth, dstheight:Int*)
	
	zoom: extern(zoomSurface) static func(src:SdlSurface*, zoomx, zoomy:Double, smooth:Int) -> SdlSurface*
	zoomSize: extern(zoomSurfaceSize) static func(width, height:Int, zoomx, zoomy:Double, dstwidth, dstheight:Int*)

	shrink: extern(shrinkSurface) static func(src:SdlSurface*, factorx, factory:Int) -> SdlSurface*

	rotate90Degrees: extern(rotateSurface90Degrees) static func(src:SdlSurface*, numClockwiseTurns:Int) -> SdlSurface* 
}

GfxPrimitive: cover {
	// Note: color vaues are in 0xRRGGBBAA format
	
	pixel: extern(pixelColor) static func(dst:SdlSurface*, x, y: Int16, color:UInt32) -> Int
	pixelRGBA: extern(pixelRGBA) static func(dst:SdlSurface*, x, y: Int16, r, g, b, a: UInt8) -> Int

	hline: extern(hlineColor) static func(dst:SdlSurface*, x1, x2, y: Int16, color:UInt32) -> Int
	hlineRGBA: extern(hlineRGBA) static func(dst:SdlSurface*, x1, x2, y: Int16, r, g, b, a: UInt8) -> Int

	vline: extern(vlineColor) static func(dst:SdlSurface*, x, y1, y2: Int16, color:UInt32) -> Int
	vlineRGBA: extern(vlineRGBA) static func(dst:SdlSurface*, x, y1, y2: Int16, r, g, b, a: UInt8) -> Int

	rectangle: extern(rectangleColor) static func(dst:SdlSurface*, x1, y1, x2, y2: Int16, color:UInt32) -> Int
	rectangleRGBA: extern(rectangleRGBA) static func(dst:SdlSurface*, x1, y1, x2, y2: Int16, r, g, b, a: UInt8) -> Int

	roundedRectangle: extern(roundedRectangleColor) static func(dst:SdlSurface*, x1, y1, x2, y2, rad: Int16, color:UInt32) -> Int
	roundedRectangleRGBA: extern(roundedRectangleRGBA) static func(dst:SdlSurface*, x1, y1, x2, y2, rad: Int16, r, g, b, a: UInt8) -> Int

	box: extern(boxColor) static func(dst:SdlSurface*, x1, y1, x2, y2: Int16, color:UInt32) -> Int
	boxRGBA: extern(boxRGBA) static func(dst:SdlSurface*, x1, y1, x2, y2:Int16, r, g, b, a: UInt8) -> Int

	roundedBox: extern(roundedBoxColor) static func(dst:SdlSurface*, x1, y1, x2, y2, rad: Int16, color:UInt32) -> Int
	roundedBoxRGBA: extern(roundedBoxRGBA) static func(dst:SdlSurface*, x1, y1, x2, y2, rad: Int16, r, g, b, a: UInt8) -> Int

	line: extern(lineColor) static func(dst:SdlSurface*, x1, y1, x2, y2: Int16, color:UInt32) -> Int
	lineRGBA: extern(lineRGBA) static func(dst:SdlSurface*, x1, y1, x2, y2: Int16, r, g, b, a: UInt8) -> Int

	aaline: extern(aalineColor) static func(dst:SdlSurface*, x1, y1, x2, y2: Int16, color:UInt32) -> Int
	aalineRGBA: extern(aalineRGBA) static func(dst:SdlSurface*, x1, y1, x2, y2: Int16, r, g, b, a: UInt8) -> Int
	thickLine: extern(thickLineColor) static func(dst:SdlSurface*, x1, y1, x2, y2: Int16, width:UInt8, color:UInt32) -> Int
	thickLineRGBA: extern(thickLineRGBA) static func(dst:SdlSurface*, x1, y1, x2, y2: Int16, width, r, g, b, a: UInt8) -> Int

	circle: extern(circleColor) static func(dst:SdlSurface*, x, y, rad: Int16, color:UInt32) -> Int
	circleRGBA: extern(circleRGBA) static func(dst:SdlSurface*, x, y, rad: Int16, r, g, b, a: UInt8) -> Int

	arc: extern(arcColor) static func(dst:SdlSurface*, x, y, rad, start, end: Int16, color:UInt32) -> Int
	arcRGBA: extern(arcRGBA) static func(dst:SdlSurface*, x, y, rad, start, end: Int16, r, g, b, a: UInt8) -> Int

	aacircle: extern(aacircleColor) static func(dst:SdlSurface*, x, y, rad: Int16, color:UInt32) -> Int
	aacircleRGBA: extern(aacircleRGBA) static func(dst:SdlSurface*, x, y, rad:Int16, r, g, b, a: UInt8) -> Int

	filledCircle: extern(filledCircleColor) static func(dst:SdlSurface*, x, y, r: Int16, color:UInt32) -> Int
	filledCircleRGBA: extern(filledCircleRGBA) static func(dst:SdlSurface*, x, y, rad:Int16, r, g, b, a: UInt8) -> Int

	ellipse: extern(ellipseColor) static func(dst:SdlSurface*, x, y, rx, ry: Int16, color:UInt32) -> Int
	ellipseRGBA: extern(ellipseRGBA) static func(dst:SdlSurface*, x, y, rx, ry: Int16, r, g, b, a: UInt8) -> Int

	aaellipse: extern(aaellipseColor) static func(dst:SdlSurface*, x, y, rx, ry: Int16, color:UInt32) -> Int
	aaellipseRGBA: extern(aaellipseRGBA) static func(dst:SdlSurface*, x, y, rx, ry: Int16, r, g, b, a: UInt8) -> Int

	filledEllipse: extern(filledEllipseColor) static func(dst:SdlSurface*, x, y, rx, ry: Int16, color:UInt32) -> Int
	filledEllipseRGBA: extern(filledEllipseRGBA) static func(dst:SdlSurface*, x, y, rx, ry: Int16, r, g, b, a: UInt8) -> Int

	pie: extern(pieColor) static func(dst:SdlSurface*, x, y, rad, start, end: Int16, color:UInt32) -> Int
	pieRGBA: extern(pieRGBA) static func(dst:SdlSurface*, x, y, rad, start, end: Int16, r, g, b, a: UInt8) -> Int

	filledPie: extern(filledPieColor) static func(dst:SdlSurface*, x, y, rad, start, end: Int16, color:UInt32) -> Int
	filledPieRGBA: extern(filledPieRGBA) static func(dst:SdlSurface*, x, y, rad, start, end: Int16, r, g, b, a: UInt8) -> Int

	trigon: extern(trigonColor) static func(dst:SdlSurface*, x1, y1, x2, y2, x3, y3: Int16, color:UInt32) -> Int
	trigonRGBA: extern(trigonRGBA) static func(dst:SdlSurface*, x1, y1, x2, y2, x3, y3: Int16, r, g, b, a: UInt8) -> Int

	aatrigon: extern(aatrigonColor) static func(dst:SdlSurface*, x1, y1, x2, y2, x3, y3: Int16, color:UInt32) -> Int
	aatrigonRGBA: extern(aatrigonRGBA) static func(dst:SdlSurface*, x1, y1, x2, y2, x3, y3: Int16, r, g, b, a: UInt8) -> Int

	filledTrigon: extern(filledTrigonColor) static func(dst:SdlSurface*, x1, y1, x2, y2, x3, y3: Int16, color:UInt32) -> Int
	filledTrigonRGBA: extern(filledTrigonRGBA) static func(dst:SdlSurface*, x1, y1, x2, y2, x3, y3: Int16, r, g, b, a: UInt8) -> Int

	polygon: extern(polygonColor) static func(dst:SdlSurface*, vx, vy:const Int16*, n:Int, color:UInt32) -> Int
	polygonRGBA: extern(polygonRGBA) static func(dst:SdlSurface*, vx, vy:const Int16*, n:Int, r, g, b, a: UInt8) -> Int

	aapolygon: extern(aapolygonColor) static func(dst:SdlSurface*, vx, vy:const Int16*, n:Int, color:UInt32) -> Int
	aapolygonRGBA: extern(aapolygonRGBA) static func(dst:SdlSurface*, vx, vy:const Int16*, n:Int, r, g, b, a: UInt8) -> Int

	filledPolygon: extern(filledPolygonColor) static func(dst:SdlSurface*, vx, vy:const Int16*, n:Int, color:UInt32) -> Int
	filledPolygonRGBA: extern(filledPolygonRGBA) static func(dst:SdlSurface*, vx, vy:const Int16*, n:Int, r, g, b, a: UInt8) -> Int
	texturedPolygon: extern(texturedPolygon) static func(dst:SdlSurface*, vx:const Int16*, vy:const Int16*, n:Int, texture:SdlSurface*,texture_dx:Int,texture_dy:Int) -> Int

	filledPolygonColorMT: extern(filledPolygonColorMT) static func(dst:SdlSurface*, vx, vy:const Int16*, n:Int, color:UInt32, polyInts:Int**, polyAllocated:Int*) -> Int
	filledPolygonRGBAMT: extern(filledPolygonRGBAMT) static func(dst:SdlSurface*, vx, vy:const Int16*, n:Int, r, g, b, a: UInt8, polyInts:Int**, polyAllocated:Int*) -> Int
	texturedPolygonMT: extern(texturedPolygonMT) static func(dst:SdlSurface*, vx, vy:const Int16*, n:Int, texture:SdlSurface*, texture_dx:Int, texture_dy, polyInts: Int**, polyAllocated:Int*) -> Int

	bezier: extern(bezierColor) static func(dst:SdlSurface*, vx, vy:const Int16*, n, s: Int, color:UInt32) -> Int
	bezierRGBA: extern(bezierRGBA) static func(dst:SdlSurface*, vx, vy:const Int16*, n, s: Int, r, g, b, a: UInt8) -> Int

	setFont: extern(gfxPrimitivesSetFont) static func(fontdata:const Void*, cw, ch: UInt32)
	setFontRotation: extern(gfxPrimitivesSetFontRotation) static func(rotation:UInt32)
	character: extern(characterColor) static func(dst:SdlSurface*, x, y: Int16, c:Char, color:UInt32) -> Int
	characterRGBA: extern(characterRGBA) static func(dst:SdlSurface*, x, y: Int16, c:Char, r, g, b, a: UInt8) -> Int
	string: extern(stringColor) static func(dst:SdlSurface*, x, y: Int16, s:const Char*, color:UInt32) -> Int
	stringRGBA: extern(stringRGBA) static func(dst:SdlSurface*, x, y: Int16, s:const Char*, r, g, b, a: UInt8) -> Int
}
