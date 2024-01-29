local type = type
local require = require
local vim = vim
local g = vim.g
local api = vim.api
local opts = vim.opt
local cmd = api.nvim_command
local hl = api.nvim_set_hl

local schedule = vim.schedule
local autocmd = api.nvim_create_autocmd
local augroup = api.nvim_create_augroup

local PLUG_NAME = "stinvimui"

local util = require("stinvimui.util")
local COLOR_DIR = "stinvimui.colors."
local EXTRA_THEME_HIGHLIGHT = "stinvimui.theme.extra."

local M = {}

M.setup = function(configs)
	local group = augroup(PLUG_NAME, { clear = true })

	if vim.fn.exists("syntax_on") then
		cmd("syntax reset")
	end
	if g.colors_name then
		cmd("hi clear")
	end
	opts.termguicolors = true
	g.colors_name = PLUG_NAME

	autocmd("ColorSchemePre", {
		group = group,
		callback = function()
			api.nvim_del_augroup_by_id(group)
		end,
	})

	local colors = M.setup_colors(configs)

	M.terminal(colors)

	schedule(function()
		M.load_highlight(colors, configs)
	end, 100)

	local extra = configs.theme.extra
	if next(extra) ~= nil then
		--support for table and array
		for name, enabled in pairs(extra) do
			if type(name) == "number" then
				name = enabled
				enabled = true
			end
			if enabled then
				local ok, module = pcall(require, EXTRA_THEME_HIGHLIGHT .. name)
				if ok then
					M.load_highlight(colors, configs, module)
				end
			end
		end
	end
end

M.setup_colors = function(configs)
	local theme_conf = configs.theme
	local valid, colors = pcall(require, COLOR_DIR .. theme_conf.style)
	if not valid then
		require("stinvimui.util.notify").warn(
			"Theme " .. theme_conf.style .. " not found. Using default theme" .. theme_conf.default
		)
		theme_conf.style = theme_conf.default
		colors = require(COLOR_DIR .. theme_conf.default)
	end

	if type(theme_conf.on_highlight) == "function" then
		theme_conf.on_highlight(theme_conf.style, colors, {})
	end

	return colors, theme_conf.style
end

M.load_highlight = function(colors, configs, module)
	local theme_conf = configs.theme

	local syntax = module == nil and M.syntax(colors, theme_conf.style) or module.syntax(colors, theme_conf.style)

	if type(theme_conf.on_highlight) == "function" then
		theme_conf.on_highlight(theme_conf.style, colors, syntax)
	end

	for highlight_name, options in pairs(syntax) do
		hl(0, highlight_name, options)
	end
end

M.terminal = function(colors)
	-- Set the color for normal and bright black.
	g.terminal_color_0 = colors.black
	g.terminal_color_8 = colors.gray

	-- Set the color for normal and bright white.
	g.terminal_color_7 = colors.fg
	g.terminal_color_15 = colors.fg_dark

	-- Set the color for red and bright red.
	g.terminal_color_1 = colors.red
	g.terminal_color_9 = colors.red

	-- Set the color for green and bright green.
	g.terminal_color_2 = colors.term_green
	g.terminal_color_10 = colors.term_green

	-- Set the color for yellow and bright yellow.
	g.terminal_color_3 = colors.yellow
	g.terminal_color_11 = colors.yellow

	-- Set the color for blue and bright blue.
	g.terminal_color_4 = colors.blue
	g.terminal_color_12 = colors.blue

	-- Set the color for magenta and bright magenta.
	g.terminal_color_5 = colors.magenta
	g.terminal_color_13 = colors.magenta

	-- Set the color for cyan and bright cyan.
	g.terminal_color_6 = colors.cyan
	g.terminal_color_14 = colors.cyan
end

M.syntax = function(colors, theme_style)
	local highlight = {
		-- normal text
		Normal = { fg = colors.fg, bg = colors.bg },
		-- normal text in non-current windows
		NormalNC = { fg = colors.fg, bg = colors.bg },
		-- Normal text in floating windows.
		NormalFloat = { fg = colors.fg_dark, bg = colors.bg_dark },
		FloatBorder = { fg = colors.border, bg = colors.bg_dark },
		FloatTitle = { fg = colors.fg_dark, bg = colors.bg_dark },
		-- Popup menu: normal item.
		Pmenu = { bg = colors.bg_dark, fg = colors.fg_dark },
		-- Popup menu: selected item.
		PmenuSel = { bg = colors.bg_highlight },
		-- Popup menu: scrollbar.
		PmenuSbar = { bg = colors.light_gray },
		-- Popup menu: Thumb of the scrollbar.
		PmenuThumb = { bg = colors.fg_gutter },
		-- Visual mode selection
		Visual = { bg = colors.bg_visual },
		-- Visual mode selection when vim is "Not Owning the Selection".
		VisualNOS = { bg = colors.bg_visual },
		-- |hit-enter| prompt and yes/no questions
		Question = { fg = colors.blue },

		QuickFixLine = { bg = colors.bg_visual, bold = true },

		-- Foo = { bg = colors.magenta1, fg = colors.fg },

		-- Current |quickfix| item in the quickfix window.
		-- Combined with |hl-CursorLine| when the cursor is there.
		-- Last search pattern highlighting (see 'hlsearch').
		-- Also used for similar items that need to stand out.
		Search = { bg = colors.light_orange, fg = colors.black },
		-- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		IncSearch = { bg = colors.orange, fg = colors.black },
		CurSearch = { link = "IncSearch" },

		-- health check
		healthError = { fg = colors.error },
		healthSuccess = { fg = colors.green },
		healthWarning = { fg = colors.warn },

		-- These groups are for the native LSP client. Some other LSP clients may
		-- use these groups, or use their own. Consult your LSP client's
		-- documentation.
		LspReferenceText = { bg = colors.bg_gutter }, -- used for highlighting "text" references
		LspReferenceRead = { bg = colors.bg_gutter }, -- used for highlighting "read" references
		LspReferenceWrite = { bg = colors.bg_gutter }, -- used for highlighting "write" references

		LspSignatureActiveParameter = { bg = colors.bg_gutter, bold = true },
		LspCodeLens = { fg = colors.gray },
		LspInfoBorder = { fg = colors.border, bg = colors.bg_dark },
		LspCodeLensSeparator = { fg = colors.border },

		-- ALEErrorSign = { fg = colors.error },
		-- ALEWarningSign = { fg = colors.warn },

		-- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticError = { fg = colors.error },
		DiagnosticWarn = { fg = colors.warn },
		DiagnosticInfo = { fg = colors.info },
		DiagnosticHint = { fg = colors.hint },
		DiagnosticUnnecessary = { fg = colors.unnecessary },

		-- Used for "Error", "Warning", "Information", and "Hint" diagnostics virtual text
		DiagnosticVirtualTextError = { fg = colors.error },
		DiagnosticVirtualTextWarn = { fg = colors.warn },
		DiagnosticVirtualTextInfo = { fg = colors.info },
		DiagnosticVirtualTextHint = { fg = colors.hint },

		-- Used to underline "Error" , "Warning", "Information", and "Hint" diagnostics.
		DiagnosticUnderlineError = { undercurl = true, sp = colors.error },
		DiagnosticUnderlineWarn = { undercurl = true, sp = colors.warn },
		DiagnosticUnderlineInfo = { undercurl = true, sp = colors.info },
		DiagnosticUnderlineHint = { undercurl = true, sp = colors.hint },

		-- used for the columns set with 'colorcolumn'
		-- ColorColumn = { bg = colors.black },
		-- placeholder characters substituted for concealed text (see 'conceallevel')
		Conceal = { fg = colors.orange2 },
		-- character under the cursor
		Cursor = { fg = colors.bg, bg = colors.fg },
		-- -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		lCursor = { fg = colors.bg, bg = colors.fg },
		-- -- like Cursor, but used when in IME mode |CursorIM|
		CursorIM = { fg = colors.bg, bg = colors.fg },
		-- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorColumn = { bg = colors.bg_highlight },
		-- Screen-line at the cursor, when 'cursorline' is set.
		-- Low-priority if foreground (ctermfg OR guifg) is not set.
		CursorLine = { bg = colors.bg_highlight },
		-- directory names (and other special names in listings)
		Directory = { fg = colors.blue },
		-- diff mode: Added line |diff.txt|
		DiffAdd = { fg = colors.green },
		-- diff mode: Changed line |diff.txt|
		DiffChange = { fg = colors.orange },
		-- diff mode: Deleted line |diff.txt|
		DiffDelete = { fg = colors.red },
		-- diff mode: Changed text within a changed line |diff.txt|
		DiffText = { fg = colors.fg_dark },
		-- filler lines (~) after the end of the buffer.
		-- TermCursor = {}, -- cursor in a focused terminal
		-- TermCursorNC = {}, -- cursor in an unfocused terminal

		-- error messages on the command line
		ErrorMsg = { fg = colors.error },
		-- warning messages
		WarningMsg = { fg = colors.warn },
		-- 'showmode' message (e.g., "-- INSERT -- ")
		ModeMsg = { fg = colors.fg_dark },
		-- Area for messages and cmdline
		MsgArea = { fg = colors.fg_dark },
		-- Separator for scrolled messages, `msgsep` flag of 'display'
		MsgSeparator = { fg = colors.border },
		-- |more-prompt|
		MoreMsg = { fg = colors.blue },

		-- the column separating vertically split windows
		VertSplit = { fg = colors.dark_border },
		-- the column separating vertically split windows
		WinSeparator = { fg = colors.dark_border },
		-- line used for closed folds
		Folded = { fg = colors.blue, bg = colors.bg_gutter },
		-- 'foldcolumn'
		FoldColumn = { bg = colors.bg, fg = colors.comment },
		-- column where |signs| are displayed
		SignColumn = {},
		-- |:substitute| replacement text highlighting
		Substitute = { bg = colors.red, fg = colors.black },
		-- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		LineNr = { fg = colors.light_gray },
		-- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		CursorLineNr = { fg = colors.pink },
		-- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		MatchParen = { fg = colors.orange, bold = true },

		-- Word that is not recognized by the spellchecker.
		-- |spell| Combined with the highlighting used otherwise.
		SpellBad = { sp = colors.error, undercurl = true },
		-- Word that should start with a capital.
		-- |spell| Combined with the highlighting used otherwise.
		SpellCap = { sp = colors.warn, undercurl = true },
		-- Word that is recognized by the spellchecker as one that is used in another region.
		-- |spell| Combined with the highlighting used otherwise.
		SpellLocal = { sp = colors.info, undercurl = true },
		-- Word that is recognized by the spellchecker as one that is hardly ever used.
		-- |spell| Combined with the highlighting used otherwise.
		SpellRare = { sp = colors.hint, undercurl = true },

		-- status line of current window
		StatusLine = { fg = colors.fg, bg = colors.bg_line },
		-- status lines of not-current windows Note: if this is equal to "StatusLine"
		-- Vim will use "^^^" in the status line of the current window.
		StatusLineNC = { fg = colors.fg, bg = util.darken(colors.bg_line, 0.95) },
		TabLine = { fg = colors.fg, bg = colors.bg_line }, -- tab pages line, not active tab page label
		-- TabLineFill = { bg = colors.black }, -- tab pages line, where there are no labels
		-- TabLineSel = { fg = colors.black, bg = colors.blue }, -- tab pages line, active tab page label

		-- titles for output from ":set all", ":autocmd" etcolors.
		Title = { fg = colors.orange1, bold = true },
		-- "nbsp", "space", "tab" and "trail" in 'listchars'
		Whitespace = { fg = colors.light_gray },
		-- '@' at the end of the window, characters from 'showbreak' and other characters
		-- that do not really exist in the text (e.g., ">" displayed when a double-wide character
		-- doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		NonText = { fg = colors.gray },
		-- By default, this is highlighted like |hl-NonText|.
		-- EndOfBuffer = { fg = colors.gray },

		-- Unprintable characters: text displayed differently from what it really is.
		-- But not 'listchars' whitespace. |hl-Whitespace|
		SpecialKey = { fg = colors.gray },
		WildMenu = { bg = colors.bg_visual }, -- current match in 'wildmenu' completion
		WinBar = { link = "StatusLine" }, -- window bar
		WinBarNC = { link = "StatusLineNC" }, -- window bar in inactive windows

		helpCommand = { fg = colors.blue },

		-- These groups are not listed as default vim groups,
		-- but they are default standard group names for syntax highlighting.
		-- commented out groups should chain up to their "preferred" group by default,
		-- Uncomment and edit if you want more specific syntax highlighting.

		-- Any comment
		Comment = { fg = colors.comment, italic = true },
		-- (preferred) any constant
		Constant = { fg = colors.orange },
		-- A string constant: "this is a string"
		String = { fg = colors.string },
		-- A character constant: 'c', '\n'
		Character = { fg = colors.string },
		-- A number constant: 234, 0xff
		Number = { fg = colors.orange1 },
		--  a boolean constant: TRUE, false
		Boolean = { fg = colors.red2, italic = true },
		-- A floating point constant: 2.3e10
		-- Float = {},

		-- (preferred) any variable name
		Identifier = { fg = colors.magenta },

		-- function name (also: methods for classes)
		Function = { fg = colors.blue },
		-- (preferred) any statement
		Statement = { fg = colors.magenta },
		-- if, then, else, endif, switch, etcolors.
		Conditional = { fg = colors.magenta },
		-- for, do, while, etcolors.
		Repeat = { fg = colors.magenta },
		--    case, default, etcolors.
		Label = { fg = colors.brown },
		-- Exception = { fg = colors.magenta }, --  try, catch, throw
		Keyword = { fg = colors.magenta },
		-- (preferred) generic Preprocessor
		PreProc = { fg = colors.cyan1, bg = "NONE" },
		-- Include = { fg = colors.orange }, --  preprocessor #include
		-- Macro = {},
		-- PreCondit = {}, --  preprocessor #if, #else, #endif, etcolors.

		Type = { fg = colors.cyan }, -- (preferred) int, long, char, etcolors.
		-- StorageClass  = { }, -- static, register, volatile, etcolors.
		-- Structure     = { }, --  struct, union, enum, etcolors.
		-- Typedef       = { }, --  A typedef

		Special = { fg = colors.orange2 }, -- (preferred) any special symbol
		-- SpecialChar   = { }, --  special character in a constant
		-- Tag           = { }, --    you can use CTRL-] on this
		-- Delimiter     = { }, --  character that needs attention
		-- SpecialComment= { }, -- special things inside a comment
		Debug = { fg = colors.orange }, --    debugging statements

		Underlined = { underline = true },
		Bold = { bold = true },
		Italic = { italic = true },
		-- (preferred) left blank, hidden  |hl-Ignore|
		-- Ignore = {},
		-- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
		Todo = { bg = colors.yellow, fg = colors.bg },
		-- Error = { fg = colors.error }, -- (preferred) any erroneous construct

		dosIniLabel = { link = "@property" },

		-- These groups are for the Neovim tree-sitter highlights.
		-- default link: will be comment by default
		["@annotation"] = { link = "PreProc" },
		-- For any operator: `+`, but also `->` and `*` in C.
		["@operator"] = { fg = colors.operator },
		["@attribute"] = { link = "PreProc" },
		-- ["@boolean"] = { link = "Boolean" },
		-- ["@character"] = { link = "Character" },
		-- ["@character.special"] = { link = "SpecialChar" },
		["@keyword.conditional"] = { link = "Conditional" },
		-- ["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { link = "Special" },
		-- ["@constant.macro"] = { link = "Macro" },
		["@keyword.debug"] = { link = "Debug" },
		["@keyword.directive.define"] = { link = "Macro" },
		["@keyword.exception"] = { link = "Exception" },
		["@number.float"] = { link = "Float" },
		["@function"] = { link = "Function" },
		["@function.builtin"] = { link = "Special" },
		["@function.call"] = { link = "Function" },
		["@function.macro"] = { link = "Macro" },
		["@keyword.import"] = { link = "Include" },
		["@keyword.coroutine"] = { link = "Keyword" },
		["@keyword.operator"] = { link = "@operator" },
		["@keyword.return"] = { link = "Keyword" },
		["@function.method"] = { link = "Function" },
		["@function.method.call"] = { link = "Function" },
		["@namespace.builtin"] = { link = "@variable.builtin" },
		["@module"] = { link = "Include" },
		["@none"] = {},
		-- ["@number"] = { link = "Number" },
		--- Keywords
		-- For keywords that don't fall in previous categories.
		-- For keywords used to define a fuction.
		-- ["@keyword.function"] = { fg = colors.magenta1 },
		["@keyword.directive"] = { link = "PreProc" },
		["@keyword.repeat"] = { link = "Repeat" },
		["@keyword.storage"] = { link = "StorageClass" },
		-- ["@string"] = { link = "String" },
		-- ["@tag"] = { link = "Label" },
		["@tag.attribute"] = { link = "Identifier" },
		["@tag.delimiter"] = { link = "Delimiter" },

		-- ["@comment"] = { link = "Comment" },
		["@comment.note"] = { fg = colors.hint },
		["@comment.error"] = { fg = colors.error },
		["@comment.hint"] = { fg = colors.hint },
		["@comment.info"] = { fg = colors.info },
		["@comment.warning"] = { fg = colors.warn },
		["@comment.todo"] = { fg = colors.todo },
		-- ["@type"] = { link = "Type" },
		-- ["@type.definition"] = { link = "Typedef" },
		["@type.qualifier"] = { link = "Keyword" },

		-- ["@comment.documentation"] = { },

		--- Literals
		["@string.documentation"] = { fg = colors.yellow },
		-- For regexes.
		["@string.regexp"] = { fg = colors.blue },
		-- For escape characters within a string.
		["@string.escape"] = { fg = colors.magenta1 },

		--- Functions
		-- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
		["@constructor"] = { fg = colors.red },
		["@variable.parameter"] = { fg = colors.yellow1 }, -- For parameters of a function.
		-- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]
		["@variable.parameter.builtin"] = { fg = colors.yellow },

		--- Types
		["@type.builtin"] = { fg = colors.blue2 },
		-- For fields.
		["@variable.member"] = { fg = colors.teal },
		["@property"] = { fg = colors.teal },

		--- Identifiers
		-- Any variable name that does not have another highlight.
		["@variable"] = { fg = colors.fg },
		-- Variable names that are defined by the languages, like `this` or `self`.
		["@variable.builtin"] = { fg = colors.red1 },
		-- Variable names that are defined by the languages, like `this` or `self`.
		["@module.builtin"] = { fg = colors.red1 },

		--- Markdown
		["@markup"] = { link = "@none" },
		-- For special punctutation that does not fall in the catagories before.
		["@markup.list"] = { fg = colors.blue },
		["@markup.list.markdown"] = { fg = colors.orange, bold = true },
		["@markup.raw"] = { link = "String" },
		["@markup.raw.markdown"] = { fg = colors.orange },
		["@markup.raw.markdown_inline"] = { fg = colors.red1, bg = colors.bg },
		["@markup.link"] = { fg = colors.link },
		["@markup.link.url"] = { link = "Underlined" },
		["@markup.link.label.markdown_inline"] = { fg = colors.pink1 },
		["@markup.link.label"] = { link = "SpecialChar" },
		["@markup.link.label.symbol"] = { link = "Identifier" },
		["@markup.environment"] = { link = "Macro" },
		["@markup.environment.name"] = { link = "Type" },
		["@markup.math"] = { link = "Special" },
		["@markup.strong"] = { bold = true },
		["@markup.emphasis"] = { italic = true },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.underline"] = { underline = true },
		["@markup.heading"] = { link = "Title" },
		-- For brackets and parens.
		["@markup.list.checked"] = { fg = colors.green },
		-- For brackets and parens.
		["@markup.list.unchecked"] = { fg = colors.red },

		--- Punctuation
		-- For delimiters ie: `.`
		["@punctuation.delimiter"] = { fg = colors.blue },
		-- For brackets and parens.
		["@punctuation.bracket"] = { fg = colors.fg_dark },
		-- For special symbols (e.g. `{}` in string interpolation)
		["@punctuation.special"] = { fg = colors.blue },
		-- For special symbols (e.g. `{}` in string interpolation)
		["@punctuation.special.markdown"] = { fg = colors.border },

		["@diff.plus"] = { link = "DiffAdd" },
		["@diff.minus"] = { link = "DiffDelete" },
		["@diff.delta"] = { link = "DiffChange" },

		-- tsx
		["@tag.tsx"] = { fg = colors.red },
		["@constructor.tsx"] = { fg = colors.blue1 },
		["@tag.delimiter.tsx"] = { fg = colors.blue2 },

		-- LSP Semantic Token Groups
		["@lsp.type.boolean"] = { link = "Boolean" },
		["@lsp.type.builtinType"] = { link = "@type.builtin" },
		["@lsp.type.comment"] = { link = "Comment" },
		["@lsp.type.decorator"] = { link = "@attribute" },
		["@lsp.type.deriveHelper"] = { link = "@attribute" },
		["@lsp.type.enum"] = { link = "Type" },
		["@lsp.type.enumMember"] = { link = "Constant" },
		["@lsp.type.escapeSequence"] = { link = "@string.escape" },
		["@lsp.type.formatSpecifier"] = { link = "@markup.list" },
		["@lsp.type.generic"] = { link = "@variable" },
		["@lsp.type.interface"] = { fg = colors.blue2 },
		["@lsp.type.keyword"] = { link = "Keyword" },
		["@lsp.type.lifetime"] = { link = "@keyword.storage" },
		["@lsp.type.namespace"] = { link = "@module" },
		["@lsp.type.number"] = { link = "Number" },
		["@lsp.type.operator"] = { link = "@operator" },
		["@lsp.type.parameter"] = { link = "@variable.parameter" },
		["@lsp.type.property"] = { link = "@property" },
		["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
		["@lsp.type.selfTypeKeyword"] = { link = "@variable.builtin" },
		["@lsp.type.string"] = { link = "@string" },
		["@lsp.type.typeAlias"] = { link = "@type.definition" },
		["@lsp.type.unresolvedReference"] = { undercurl = true, sp = colors.error },
		["@lsp.type.variable"] = {}, -- use treesitter styles for regular variables
		["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
		["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
		["@lsp.typemod.keyword.injected"] = { link = "@keyword" },
		["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.operator.injected"] = { link = "@operator" },
		["@lsp.typemod.string.injected"] = { link = "@string" },
		["@lsp.typemod.struct.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.type.defaultLibrary"] = { fg = colors.blue2 },
		["@lsp.typemod.typeAlias.defaultLibrary"] = { fg = colors.blue2 },
		["@lsp.typemod.variable.callable"] = { link = "@function" },
		["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
		["@lsp.typemod.variable.injected"] = { link = "Identifier" },
		["@lsp.typemod.variable.static"] = { link = "Constant" },
		["@lsp.typemod.variable.globalScope"] = { fg = colors.magenta },

		-- rainbow-delimiters
		RainbowDelimiterRed = { fg = colors.red },
		RainbowDelimiterOrange = { fg = colors.orange },
		RainbowDelimiterYellow = { fg = colors.bright_yellow },
		RainbowDelimiterGreen = { fg = colors.green },
		RainbowDelimiterBlue = { fg = colors.blue },
		RainbowDelimiterViolet = { fg = colors.purple },
		RainbowDelimiterCyan = { fg = colors.cyan },

		-- GitSigns
		GitSignsAdd = { link = "DiffAdd" },
		GitSignsChange = { link = "DiffChange" },
		GitSignsDelete = { link = "DiffDelete" },
		GitSignsCurrentLineBlame = { link = "NonText" },

		-- Lazy
		LazyProgressDone = { bold = true, fg = colors.magenta1 },
		LazyProgressTodo = { bold = true, fg = colors.bg_gutter },

		-- Telescope
		TelescopeBorder = { fg = colors.border, bg = colors.bg_dark },
		TelescopeNormal = { fg = colors.fg_dark, bg = colors.bg_dark },
		-- TelescopePromptBorder = { fg = colors.border },
		-- TelescopePromptNormal = { fg = colors.fg, bg = colors.bg_dark },
		-- TelescopePromptTitle = { fg = colors.red, bg = colors.bg_dark },
		-- TelescopeResultsNormal = { fg = colors.fg_dark, bg = colors.bg_dark },

		-- NvimTree
		NvimTreeNormal = { fg = colors.fg_sidebar or colors.fg_dark, bg = colors.bg_sidebar or colors.bg_dark },
		NvimTreeWinSeparator = { fg = colors.dark_border, bg = colors.bg_sidebar or colors.bg_dark },
		NvimTreeNormalNC = { fg = colors.fg_sidebar or colors.fg_dark, bg = colors.bg_sidebar or colors.bg_dark },
		NvimTreeRootFolder = { fg = colors.cyan1, bold = true },
		NvimTreeGitDirty = { link = "DiffChange" },
		NvimTreeGitNew = { link = "DiffAdd" },
		NvimTreeGitDeleted = { link = "DiffDelete" },
		NvimTreeSpecialFile = { fg = colors.magenta1, underline = true },
		NvimTreeIndentMarker = { fg = colors.border },
		NvimTreeImageFile = { bg = "NONE", fg = colors.pink1 },
		NvimTreeSymlink = { fg = colors.blue },
		NvimTreeFolderIcon = { bg = "NONE", fg = colors.graphite },
		NvimTreeOpenedFolderName = { bg = "NONE", fg = colors.orange1 },
		NvimTreeFolderName = { fg = colors.blue1 },
		-- NvimTreeOpenedFile = { bg = colors.bg_highlight, fg = colors.blue },
		-- NvimTreeOpenedHL = { bg = colors.bg_highlight, fg = colors.blue },
		NvimTreeLiveFilterPrefix = { fg = colors.pink },

		-- WhichKey
		WhichKey = { fg = colors.cyan },
		WhichKeyGroup = { fg = colors.blue },
		WhichKeyDesc = { fg = colors.magenta },
		WhichKeySeperator = { fg = colors.comment },
		WhichKeySeparator = { fg = colors.comment },
		WhichKeyFloat = { bg = colors.bg_dark },
		WhichKeyValue = { fg = colors.fg_dark },

		-- Indent Blankline v3
		IblIndent = { fg = colors.graphite_border, nocombine = true },
		IblScope = { fg = colors.purple, nocombine = true },

		-- LspSaga
		SagaVirtLine = { fg = colors.dark_border, bg = colors.bg_dark },
		CodeActionNumber = { fg = colors.purple },
		DiagnosticShowBorder = { fg = colors.border, bg = colors.bg_dark },

		-- Cmp
		CmpDocumentation = { fg = colors.fg_dark, bg = colors.bg_dark },
		CmpDocumentationBorder = { fg = colors.border, bg = colors.bg_dark },
		CmpGhostText = { fg = colors.light_gray },
		CmpItemAbbr = { fg = colors.fg_dark },
		CmpItemAbbrDeprecated = { fg = colors.graphite, strikethrough = true },
		CmpItemAbbrMatch = { link = "Special" },
		CmpItemAbbrMatchFuzzy = { link = "Special" },
		CmpItemMenu = { fg = colors.comment },
		CmpItemKindDefault = { fg = colors.fg_dark },
		CmpItemKindCodeium = { fg = colors.teal },
		CmpItemKindCopilot = { fg = colors.teal },
		CmpItemKindTabNine = { fg = colors.teal },

		-- TreesitterContext = { bg = colors.bg_gutter },
	}

	local kinds = require("stinvimui.theme.kind")
	for kind, hl_opts in pairs(kinds) do
		highlight["LspKind" .. kind] = hl_opts
		highlight["CmpItemKind" .. kind] = hl_opts
	end

	return highlight
end

M.link_kind = function(highlight, prefixs, kinds)
	highlight = highlight or {}
	kinds = type(kinds) == "table" and kinds or require("stinvimui.theme.kind")

	if type(prefixs) == "string" then
		for kind, hl_opts in pairs(kinds) do
			highlight[prefixs .. kind] = hl_opts
		end
	elseif type(prefixs) == "table" then
		for _, prefix in ipairs(prefixs) do
			for kind, hl_opts in pairs(kinds) do
				highlight[prefix .. kind] = { link = hl_opts }
			end
		end
	end

	return highlight
end

return M
