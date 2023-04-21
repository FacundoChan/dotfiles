return {
  "L3MON4D3/LuaSnip",
  event = "VeryLazy",
  config = function()
    local ls = require("luasnip")
    local types = require("luasnip.util.types")

    local s = ls.snippet
    local sn = ls.snippet_node
    local isn = ls.indent_snippet_node

    --  Multiple lines are by passing a table of strings.
    --  t { "line 1", "line 2" }
    local t = ls.text_node

    -- Insert Node
    --  Creates a location for the cursor to jump to.
    --      Possible options to jump to are 1 - N
    --      If you use 0, that's the final place to jump to.
    --
    --  To create placeholder text, pass it as the second argument
    --      i(2, "this is placeholder text")
    local i = ls.insert_node

    -- Function Node
    --  Takes a function that returns text
    local f = ls.function_node

    -- This a choice snippet. You can move through with <c-l> (in my config)
    --   c(1, { t {"hello"}, t {"world"}, }),
    --
    -- The first argument is the jump position
    -- The second argument is a table of possible nodes.
    --  Note, one thing that's nice is you don't have to include
    --  the jump position for nodes that normally require one (can be nil)
    local c = ls.choice_node
    local d = ls.dynamic_node

    local events = require("luasnip.util.events")
    local extras = require("luasnip.extras")
    -- TODO: Document what I've learned about lambda
    local l = extras.lambda
    local fmt = require("luasnip.extras.fmt").fmt
    local parse = require("luasnip.util.parser").parse_snippet

    ls.config.set_config({
      -- This tells LuaSnip to remember to keep around the last snippet.
      -- You can jump back into it even if you move outside of the selection
      history = false,
      -- This one is cool cause if you have dynamic snippets, it updates as you type!
      updateevents = "TextChanged,TextChangedI",

      -- Autosnippets:
      enable_autosnippets = true,

      -- Crazy highlights!!
      -- #vid3
      -- ext_opts = nil,
      ext_opts = {
        [types.choiceNode] = {
          active = {
            virt_text = { { " « ", "NonTest" } },
          },
        },
      },
    })
    -- markdown
    ls.add_snippets("markdown", {
      s({ trig = "addLink", dscr = "Create markdown link [txt](url)" }, {
        t("["),
        i(1, "description"),
        t("]"),
        t("("),
        i(2, "url"),
        t(")"),
      }),
    })

    -- go
    ls.add_snippets("go", {
      s({ trig = "err", dscr = "Handle regular failure condition" }, {
        t({ "if err != nil {", "  " }),
        i(1),
        t({ "", "}", "" }),
        i(2),
      }),
    })
  end,
}
