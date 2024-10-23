require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

local chat = require "CopilotChat"
local hop = require "hop"
local directions = require("hop.hint").HintDirection

map("n", "<A-Up>", ":m .-2<CR>==")
map("i", "<A-Up>", "<Esc>:m .-2<CR>==gi")
map("v", "<A-Up>", ":m '<-2<CR>gv=gv")

map("n", "<A-Down>", ":m .+1<CR>==")
map("i", "<A-Down>", "<Esc>:m .+1<CR>==gi")
map("v", "<A-Down>", ":m '>+1<CR>gv=gv")

map("n", "<A-S-Up>", "yyp")
map("i", "<A-S-Up>", "<Esc>yypgi")
map("v", "<A-S-Up>", "y`>pgv")

map("n", "<A-S-Down>", "yyP")
map("i", "<A-S-Down>", "<Esc>yyPgi")
map("v", "<A-S-Down>", "y`<Pgv")

map("n", "<C-a>", "ggVG")
map("i", "<C-a>", "<Esc>ggVG")
map("v", "<C-a>", "ggVG")

map("n", "<leader>ct", function()
  chat.toggle()
end)

map("n", "<leader>co", function()
  chat.open()
end)

map("n", "<leader>cc", function()
  chat.close()
end)

map("n", "<leader>cr", function()
  chat.reset()
end)

map("n", "f", function()
  hop.hint_words()
end)

map("n", "fb", function()
  hop.hint_words { direction = directions.BEFORE_CURSOR }
end)

map("n", "fa", function()
  hop.hint_words { direction = directions.AFTER_CURSOR }
end)

map("n", "fl", function()
  hop.hint_lines()
end)

map("n", "f/", function()
  hop.hint_patterns()
end)
