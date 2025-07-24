local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("all", {
  s("todo", {
    t "// TODO: ",
    i(1, "task"),
    t " (",
    t(os.date "%b %d, %Y"),
    t ", Nikita Sementsov",
    t ")",
  }),
})
