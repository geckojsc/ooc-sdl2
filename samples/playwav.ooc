use sdl2
import sdl2/[Core, Audio]

soundData: UInt8*
soundLength: UInt32 = 0
soundPos: UInt32 = 0

// called by SDL when it wants to recieve some sound data:

mix: func (userdata:Pointer, stream:UInt8*, len:Int) {
	memset(stream, 0, len)
	
	remaining := soundLength-soundPos
	if (remaining == 0) return
	if (remaining < len) len = remaining
	
	SdlAudio mix(stream, soundData[soundPos]&, len, SDL_MIX_MAXVOLUME)
	soundPos += len
}


main: func(argc:Int, argv:CString*) {
	
	SDL init(SDL_INIT_AUDIO)
	
	spec: SdlAudioSpec
	spec freq = 44100
	spec format = AUDIO_S16
	spec channels = 2
	spec samples = 512
	spec callback = mix
	
	// force SDL to use the desired spec
	if (SdlAudio open(spec&, null) < 0)
		Exception new("[Failed to open audio device!] %s" format(SDL getError())) throw()
	
	wav: SdlAudioSpec  // sample rate, depth, number of channels, etc.
	wavData: UInt8*
	wavLen: UInt32     // number of bytes
	
	SdlAudio loadWAV("assets/trololo3.wav", wav&, wavData&, wavLen&)
	
	// to convert wav data to the same format as used by the spec:
	converter: SdlAudioConverter
	SdlAudio buildConverter(
		converter&,
		wav format,
		wav channels,
		wav freq,
		spec format,
		spec channels,
		spec freq)
	
	// fill with unconverted data, with enough space to hold the converted data
	converter len = wavLen
	converter buf = gc_malloc(wavLen * converter len_mult)
	memcpy(converter buf, wavData, wavLen)
	
	SdlAudio convert(converter&)  // convert in-place
	SdlAudio freeWAV(wavData)     // free the old data
	
	
	// assign the sound data and start the audio!
	soundData = converter buf
	soundLength = converter len_cvt
	SdlAudio setPaused(false)
	
	while (soundPos < soundLength)
		SDL delay(50)
	
	SdlAudio close()
	SDL quit()
}
