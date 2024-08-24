Config { font = "JetBrainsMono Nerd Font, Bold, 16"
    , bgColor = "#000000"
        , fgColor = "white"
        , position = TopH 30
        , lowerOnStart = True
        , commands = [ Run Cpu ["-t", "cpu: <total>%"] 10
        , Run Uptime ["-t", "up: <hours>h <minutes>m"] 10
        , Run DynNetwork ["--", "--devices", "enp3s0f3u2,enp3s0f4u1,enp3s0f3u2,enp3s0f3u4"] 10
        , Run Memory [ "-t", "mem: <used>/<total> GB", "-d", "1", "--", "--scale", "1024" ] 20
        , Run Battery [ "--template", "<acstatus>", "--Low"     , "15", "--", "--off"     , "batt: <left>%"] 100
        , Run Volume "default" "Master" ["-t", "vol: <volume>% <status>"] 10
        , Run DiskU [("/", "<used>/<size>"), ("nvme0n1p6", "<used>/<size>")] [ "-L", "20", "-H", "50", "-m", "1", "-p", "3", "-S", "GB", "-d", "1"] 20
        , Run UnsafeStdinReader
        , Run Date "%a %d-%m-%Y <fc=#8be9fd>%H:%M</fc> " "date" 10
        ]
        , sepChar = "%"
        , alignSep = "}{"
        -- , template = "%UnsafeStdinReader% }{ <fc=#6699CC> %disku% </fc><fc=#E23D28> %cpu% </fc><fc=#fabd2f> %memory% </fc><fc=#b8bb26> %battery% </fc><fc=#83a598> %date% </fc>"
        , template = "%UnsafeStdinReader% } %date% { %default:Master%| %cpu% | %memory% | %battery% "
}
