local luasnip = require 'luasnip'

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "../snippets/" } })

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
--icon


local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
--load vsc style snippet

ls.add_snippets("all", {
	s("ternary", {
		-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
		i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
	}),
	s("td", {
		t("TODO:"), i(1, "txt")
	})
}

)
ls.add_snippets("all", {
	s("ef", {
		-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
		t("export default function "), i(1, " name"), t("(){ return( <div>"), i(2, "something"), t("</div>)}")
	}),
	s("td", {
		t("TODO:"), i(1, "txt")
	})
}

)
ls.add_snippets("all", {
	s("ucl", {
		-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
		t("'use client'; const"), i(1, "id"), t("=()=>{return()}")
	}),
	s("td", {
		t("TODO:"), i(1, "txt")
	})
}

)
---
ls.add_snippets("rust", {
	s(
		"il",
		fmt(
			[[let mut input_line = String::new();
              io::stdin().read_line(&mut input_line).expect("Failed to read line");
              let x: i32 = input_line.trim().parse().expect("Input not an integer");]], {}
		)
	)

})


ls.add_snippets(nil, {
	all = {
		s({
			trig = "ddd",
			namr = "D?",
			dscr = "Dat??e in the form of YYYY-MM-DD",
		}, {
			i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")

		}),
	},
})
