use sdl2-ttf
import sdl2/Core

TTF_MAJOR_VERSION: extern const Int
TTF_MINOR_VERSION: extern const Int
TTF_PATCHLEVEL: extern const Int
UNICODE_BOM_NATIVE: extern const Int
UNICODE_BOM_SWAPPED: extern const Int
TTF_STYLE_NORMAL: extern const Int
TTF_STYLE_BOLD: extern const Int
TTF_STYLE_ITALIC: extern const Int
TTF_STYLE_UNDERLINE: extern const Int
TTF_STYLE_STRIKETHROUGH: extern const Int
TTF_HINTING_NORMAL: extern const Int
TTF_HINTING_LIGHT: extern const Int
TTF_HINTING_MONO: extern const Int
TTF_HINTING_NONE: extern const Int

TtfFont: cover from TTF_Font*{
    getStyle: extern(TTF_GetFontStyle) func -> Int
    setStyle: extern(TTF_SetFontStyle) func(Int)

    getOutline: extern(TTF_GetFontOutline) func -> Int
    setOutline: extern(TTF_SetFontOutline) func(Int)

    getHinting: extern(TTF_GetFontHinting) func -> Int
    setHinting: extern(TTF_SetFontHinting) func(Int)

    getKerning: extern(TTF_GetFontKerning) func -> Int
    setKerning: extern(TTF_SetFontKerning) func -> Int

    height: extern(TTF_FontHeight) func -> Int
    ascent: extern(TTF_FontAscent) func -> Int
    descent: extern(TTF_FontDescent) func -> Int
    lineSkip: extern(TTF_FontLineSkip) func -> Int
    faces: extern(TTF_FontFaces) func -> Long
    isFixedWidth: extern(TTF_FontFaceIsFixedWidth) func -> Int
    familyName: extern(TTF_FontFaceFamilyName) func -> CString
    styleName: extern(TTF_FontFaceStyleName) func -> CString
    isProvided: extern(TTF_GlyphIsProvided) func(UInt16) -> Int
    glyphMetrics: extern(TTF_GlyphMetrics) func(UInt16, Int, Int, Int, Int, Int) -> Int
    sizeText: extern(TTF_SizeText) func(CString, Int*, Int*) -> Int
    sizeTextUTF8: extern(TTF_SizeTextUTF8) func(CString, Int*, Int*) -> Int
    sizeTextUnicode: extern(TTF_SizeTextUNICODE) func(CString, Int*, Int*) -> Int

    renderTextSolid: extern(TTF_RenderText_Solid) func(CString, SdlColor) -> SdlSurface*
    renderUTF8Solid: extern(TTF_RenderUTF8_Solid) func(CString, SdlColor) -> SdlSurface*
    renderUnicodeSolid: extern(TTF_RenderUNICODE_Solid) func(CString, SdlColor) -> SdlSurface*
    renderGlyphSolid: extern(TTF_RenderGlyph_Solid) func(UInt16, SdlColor)
    renderTextShaded: extern(TTF_RenderText_Shaded) func(CString, SdlColor, SdlColor) -> SdlSurface*
    renderUTF8Shaded: extern(TTF_RenderUTF8_Shaded) func(CString, SdlColor, SdlColor) -> SdlSurface*
    renderUnicodeShaded: extern(TTF_RenderUNICODE_Shaded) func(CString, SdlColor, SdlColor) -> SdlSurface*
    renderGlyphShaded: extern(TTF_RenderGlyph_Shaded) func(UInt16, SdlColor, SdlColor)
    renderTextBlended: extern(TTF_RenderText_Blended) func(CString, SdlColor) -> SdlSurface*
    renderUTF8Blended: extern(TTF_RenderUTF8_Blended) func(CString, SdlColor) -> SdlSurface*
    renderUnicodeBlended: extern(TTF_RenderUNICODE_Blended) func(CString, SdlColor) -> SdlSurface*
    renderGlyphBlended: extern(TTF_RenderGlyph_Blended) func(UInt16, SdlColor)

    close: extern(TTF_CloseFont) func
}

TTF: cover {
    init: extern(TTF_Init) static func -> Int
    wasInit: extern(TTF_WasInit) static func -> Int
    quit: extern(TTF_Quit) static func
    getError: extern(TTF_GetError) static func -> CString
    setError: extern(TTF_SetError) static func(const CString, ...)

    open: extern(TTF_OpenFont) static func(const CString, Int) -> TtfFont
    openRW: extern(TTF_OpenFontRW) static func(Pointer, Int, Int) -> TtfFont
    openIndex: extern(TTF_OpenFontIndex) static func(CString, Int, Long) -> TtfFont
    openIndexRW: extern(TTF_OpenFontIndexRW) static func(Pointer, Int, Long) -> TtfFont

    byteSwappedUnicode: extern(TTF_ByteSwappedUNICODE) static func(Int)

    getLinkedVersion: extern(TTF_Linked_version) static func -> SdlVersion*
    getCompiledVersion: extern(SDL_TTF_VERSION) static func(ver: SdlVersion*)
}

