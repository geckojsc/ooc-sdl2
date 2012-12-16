use sdl-mixer

MixFormat: enum {
    default: extern(MIX_DEFAULT_FORMAT)
}

MixMusic: cover from Mix_Music* {

    play: extern(Mix_PlayMusic) func (channel: Int)

}

Mix: class {

    openAudio: static extern(Mix_OpenAudio) func (rate: Int, format: MixFormat,
        channels: Int, bufferSize: Int) -> Int

    allocateChannels: static extern(Mix_AllocateChannels) func (numChannels: Int)

    loadMus: static extern(Mix_LoadMUS) func (path: CString) -> MixMusic

}

