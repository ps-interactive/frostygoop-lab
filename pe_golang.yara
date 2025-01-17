rule pe_golang {
    meta:
        author = "The Cyber Yeti"
        description = "Detect PE files written in GoLang"

    strings:
        $go_build_inf = { FF 20 47 6F 20 62 75 69 6C 64 69 6E 66 3A } //0xFF 0x20 Go buildinf:
        $go_build_id = { FF 20 47 6F 20 62 75 69 6C 64 20 49 44 3A 20 } //0xFF 0x20 Go build ID:<SPACE>
        $symtab = ".symtab"

    condition:
        (uint16(0) == 0x5a4d) and any of them
}
