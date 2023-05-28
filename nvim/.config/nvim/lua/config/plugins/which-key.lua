local which_key = require("which-key")

which_key.setup {
    icons = {
        breadcrumb = "+",
        separator = "→",
        group = "[+] "
    },
    window = {
        border = "single"
    },
    plugins = {
        marks = false,
        registers = false,
    }
}
