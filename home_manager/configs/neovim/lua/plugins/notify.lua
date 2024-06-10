require("notify").setup({
    icons = {
        DEBUG = "[DEBUG]",
        ERROR = "[ERROR]",
        INFO = "[INFO]",
        TRACE = "[TRACE]",
        WARN = "[WARN]"
    },
    stages = "static",
    render = "compact",
})
