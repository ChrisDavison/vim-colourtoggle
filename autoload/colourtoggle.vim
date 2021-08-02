function colourtoggle#time()
    let time_morning=8
    let time_evening=21
    if exists('g:colour_times')
        let time_morning=g:colour_times[0]
        let time_evening=g:colour_times[1]
    end
    if strftime("%H") >= l:time_evening || strftime("%H") < l:time_morning
        call colourtoggle#dark()
    else
        call colourtoggle#light()
    end
endfunction

function colourtoggle#toggle()
    if &bg == "dark"
        call colourtoggle#light()
    else
        call colourtoggle#dark()
    endif
endfunction

function colourtoggle#dark()
    if !exists('g:dark_scheme')
        echo "Need to define g:dark_scheme"
        return
    end
    exec "colorscheme " . g:dark_scheme
    set bg=dark
endfunction

function colourtoggle#light()
    if !exists('g:light_scheme')
        echo "Need to define g:light_scheme"
        return
    end
    exec "colorscheme " . g:light_scheme
    set bg=light
endfunction

