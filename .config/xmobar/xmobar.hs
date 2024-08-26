Config { font = "JetBrainsMono Nerd Font, Bold, 16"
    , bgColor = "#000000"
        , fgColor = "white"
        , position = TopH 30
        , lowerOnStart = True
        , commands = [ Run Cpu ["-t", "<total>%"] 10
        , Run Uptime ["-t", "up: <hours>h <minutes>m"] 10
        , Run DynNetwork ["--", "--devices", "enp3s0f3u2,enp3s0f4u1,enp3s0f3u2,enp3s0f3u4"] 10
        , Run Memory [ "-t", "<used>/<total> GB", "-d", "1", "--", "--scale", "1024" ] 20
        , Run Battery [ "--template", "<acstatus>", "--Low"     , "15", "--", "--off"     , "<left>%"] 100
        , Run Volume "default" "Master" ["-t", "<volume>%"] 10
        , Run DiskU [("/", "<used>/<size>"), ("nvme0n1p6", "<used>/<size>")] [ "-L", "20", "-H", "50", "-m", "1", "-p", "3", "-S", "GB", "-d", "1"] 20
        , Run Com "/bin/sh" ["-c","~/scripts/spotify.sh"] "music" 10
        , Run Com "/bin/sh" ["-c","~/scripts/todos.sh"] "todos" 500
        , Run Com "/bin/sh" ["-c","~/scripts/temperature.sh"] "temp" 100
        , Run UnsafeStdinReader
        -- , Run Date "%a %d-%m-%Y <fc=#8be9fd>%H:%M</fc> " "date" 10
        , Run Date "%b %_d ~ %I:%M %p" "date" 10
        ]
        , sepChar = "%"
        , alignSep = "}{"
        -- , template = "%UnsafeStdinReader% }{ <fc=#6699CC> %disku% </fc><fc=#E23D28> %cpu% </fc><fc=#fabd2f> %memory% </fc><fc=#b8bb26> %battery% </fc><fc=#83a598> %date% </fc>"
        -- , template = "%UnsafeStdinReader% } %date% { %default:Master%| %cpu% | %memory% | %battery% "
        -- , template = "%UnsafeStdinReader% }{ <fc=#16161D,#1ED55F>%music%</fc> <fc=#DCD7BA,#9F2B68> TODO </fc><fc=#DCD7BA,#AA336A> %todos% </fc> <fc=#16161D,#E46876> VOL </fc><fc=#16161D,#D27E88> %default:Master% </fc> <fc=#16161D,#318CE7> DISK </fc><fc=#16161D,#6699CC> %disku% </fc> <fc=#16161D,#DD571C> TEMP </fc><fc=#16161D,#FC6A03> %temp% </fc> <fc=#16161D,#FF9E3B> CPU </fc><fc=#16161D,#DCA561> %cpu% </fc> <fc=#16161D,#957FB8> MEM </fc><fc=#16161D,#938AA9> %memory% </fc> <fc=#DCD7BA,#E82424> BAT </fc><fc=#DCD7BA,#C34043> %battery% </fc> <fc=#16161D,#658594> 󰥔 </fc><fc=#16161D,#7E9CD8> %date% </fc>"
        , template = "%UnsafeStdinReader% }{ <fc=#16161D,#1ED55F>%music%</fc> <fc=#DCD7BA,#9F2B68> TODO </fc><fc=#DCD7BA,#AA336A> %todos% </fc> <fc=#16161D,#E46876> VOL </fc><fc=#16161D,#D27E88> %default:Master% </fc> <fc=#16161D,#318CE7> DISK </fc><fc=#16161D,#6699CC> %disku% </fc> <fc=#16161D,#FF9E3B> CPU </fc><fc=#16161D,#DCA561> %cpu% </fc> <fc=#16161D,#957FB8> MEM </fc><fc=#16161D,#938AA9> %memory% </fc> <fc=#DCD7BA,#E82424> BAT </fc><fc=#DCD7BA,#C34043> %battery% </fc> <fc=#16161D,#658594> 󰥔 </fc><fc=#16161D,#7E9CD8> %date% </fc>"
}
