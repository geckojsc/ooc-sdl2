use sdl2
import sdl2/[Core, RW]


// SDL_AudioFormat
AUDIO_U8     : extern const UInt16  // Unsigned 8-bit samples
AUDIO_S8     : extern const UInt16  // Signed 8-bit samples
AUDIO_U16LSB : extern const UInt16  // Unsigned 16-bit samples
AUDIO_S16LSB : extern const UInt16  // Signed 16-bit samples
AUDIO_U16MSB : extern const UInt16  // As above, but big-endian byte order
AUDIO_S16MSB : extern const UInt16  // As above, but big-endian byte order
AUDIO_U16    : extern const UInt16  // Defaults to little-endian
AUDIO_S16    : extern const UInt16  // Defaults to little-endian

// SDL_AudioStatus
SDL_AUDIO_STOPPED : extern const Int
SDL_AUDIO_PLAYING : extern const Int
SDL_AUDIO_PAUSED  : extern const Int


SDL_MIX_MAXVOLUME : extern const Int

/**
 *  A structure to hold a set of audio conversion filters and buffers.
 */
SdlAudioConverter: cover from SDL_AudioCVT {
    needed: extern Int         // Set to 1 if conversion possible
    src_format: extern UInt16  // Source audio format
    dst_format: extern UInt16  // Target audio format
    rate_incr: extern Double   // Rate conversion increment
    buf: extern UInt8*         // Buffer to hold entire audio data
    len: extern Int            // Length of original audio buffer
    len_cvt: extern Int        // Length of converted audio buffer
    len_mult: extern Int       // buffer must be len*len_mult big
    len_ratio: extern Double   // Given len, final size is len*len_ratio
    filters: extern Pointer*   // Func(cvt:SdlAudioConverter*, format:UInt8)
    filter_index: extern Int   // Current audio conversion function
}

/**
 *  The calculated values in this structure are calculated by SDL_OpenAudio().
 */
SdlAudioSpec: cover from SDL_AudioSpec {
	freq: extern Int          // Samples per second
	format: extern UInt16     // Audio data format
	channels: extern UInt8    // 1 mono, 2 stereo
	silence: extern UInt8     // Audio buffer silence value (calculated)
	samples: extern UInt16    // Audio buffer size in samples (power of 2)
	padding: extern UInt16    // Necessary for some compile environments
	size: extern UInt32       // Audio buffer size in bytes (calculated)
	callback: extern Pointer  // Func(userdata:Pointer, stream:UInt8*, len:Int)
}


// note: the word 'audio' has beed emitted from the functions due to the name of the class
// some functions (pauseAudio, pauseAudioDevice, buildAudioCVT) have been renamed for user-friendliness

SdlAudio: cover {
		
	// called internally by SDL init and SDL quit:
	init: extern(SDL_AudioInit) static func (driverName:const CString) -> Int
	quit: extern(SDL_AudioQuit) static func
	
	getNumDrivers: extern(SDL_GetNumAudioDrivers) static func -> Int
	getDriver: extern(SDL_GetAudioDriver) static func (index:Int) -> const CString
	
	getCurrentDriver: extern(SDL_GetCurrentAudioDriver) static func -> const CString
	open: extern(SDL_OpenAudio) static func (desired, obtained: SdlAudioSpec*) -> Int
	openDevice: extern(SDL_OpenAudioDevice) static func (device:const CString, iscapture:Int, desired:const SdlAudioSpec*, obtained:SdlAudioSpec*, allowed_changes:Int) -> UInt32
	getNumDevices: extern(SDL_GetNumAudioDevices) static func (iscapture:Int) -> Int
	getDeviceName: extern(SDL_GetAudioDeviceName) static func (index, iscapture: Int) -> const CString
	
	getStatus: extern(SDL_GetAudioStatus) static func -> Int
	getDeviceStatus: extern(SDL_GetAudioDeviceStatus) static func (deviceID:UInt32) -> Int
	
	setPaused: extern(SDL_PauseAudio) static func (paused:Bool)
	setDevicePaused: extern(SDL_PauseAudioDevice) static func (deviceID:UInt32, paused:Bool)
	
	loadWAV_RW: extern(SDL_LoadWAV_RW) static func (src:RWops, freesrc:Int, spec:SdlAudioSpec*, audio_buf:UInt8**, audio_len:UInt32*) -> SdlAudioSpec*
	loadWAV: extern(SDL_LoadWAV) static func (file:CString, spec:SdlAudioSpec*, audio_buffer:UInt8**, audio_len:UInt32*) -> SdlAudioSpec*
	freeWAV: extern(SDL_FreeWAV) static func (audio_buf:UInt8*)
	
	buildConverter: extern(SDL_BuildAudioCVT) static func (cvt:SdlAudioConverter*, src_format:UInt32, src_channels:UInt8, src_rate:Int, dst_format:UInt32, dst_channels:UInt8, dst_rate:Int) -> Int
	convert: extern(SDL_ConvertAudio) static func (cvt:SdlAudioConverter*) -> Int
	
	mix: extern(SDL_MixAudio) static func (dst:UInt8*, src:const UInt8*, len:UInt32, volume:Int)
	mixFormat: extern(SDL_MixAudioFormat) static func (dst:UInt8*, src:const UInt8*, format:UInt16, len:UInt32, volume:Int)
	
	unlock: extern(SDL_UnlockAudio) static func
	lock: extern(SDL_LockAudio) static func
	lockDevice: extern(SDL_LockAudioDevice) static func (deviceID:UInt32)
	unlockDevice: extern(SDL_UnlockAudioDevice) static func (deviceID:UInt32)
	
	close: extern(SDL_CloseAudio) static func
	closeDevice: extern(SDL_CloseAudioDevice) static func (deviceID:UInt32)
	
	deviceConnected: extern(SDL_AudioDeviceConnected) static func (deviceID:UInt32) -> Int
}
