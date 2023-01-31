-- https://stackoverflow.com/a/72431176 (this is way over my knowledge level)
local function clamp(component)
    return math.min(math.max(component, 0), 255)
end

function change_brightness(hex_code, amount)
    local num = tonumber(hex_code, 16)
    local red = math.floor(num / 0x10000) + amount
    local green = (math.floor(num / 0x100) % 0x100) + amount
    local blue = (num % 0x100) + amount
    return string.format("%#x", clamp(red) * 0x10000 + clamp(green) * 0x100 + clamp(blue))
end

local colours = {
    -- base colours
    background = "#0b0d12",
    foreground = "#BEBAC6",
    white = "#BEBAC6",
    gray = "#585c67",
    red = "#EC5959",
    green = "#56d057",
    yellow = "#D2CE6B",
    orange = "#CC8400",
    blue = "#6494d4",
    magenta = "#9D82E8",
    teal = "#50b2c1",

    -- Backgrounds
    background_n1 = "#080A0E",
    background_01 = "#0b0d12",
    background_02 = "#191D27",
    background_03 = "#232937",
    background_04 = "#374056",
    background_05 = "#4B5775",

    -- LSP
    lsp_error = "#EC5959",
    lsp_hint = "#BEBAC6",
    lsp_info = "#6494d4",
    lsp_warn = "#9D82E8",
}

local base = { "red", "green", "yellow", "orange", "blue", "magenta", "teal" }

for _, c in pairs(base) do
    local hex_code = colours[c]:gsub("#", "")
    local dark_version = change_brightness(hex_code, -20)
    local light_version = change_brightness(hex_code, 20)
    colours[c .. "_darker"] = "#" .. dark_version:gsub("0x", "")
    colours[c .. "_lighter"] = "#" .. light_version:gsub("0x", "")
end

return colours
