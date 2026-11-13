---@type Palette
-- ============================================================================
-- UMBER FOCUS v4.1
-- UVEITIS-AWARE HIGH-READABILITY DARK DEVELOPER PALETTE
--
-- Warm espresso / readable foregrounds / colorful semantic syntax.
--
-- PRIORITY 1: PHOTOPHOBIA-AWARE DESIGN
--   * Avoid pure black and pure white.
--   * Avoid unnecessarily bright large surfaces.
--   * Use a consistent warm-neutral background hierarchy.
--   * Keep interactive highlights restrained.
--   * Avoid excessive saturation and neon-like colors.
--
-- PRIORITY 2: CODE READABILITY
--   * Maintain readable essential and secondary text.
--   * Preserve syntax contrast on selected and highlighted code.
--   * Keep comments and punctuation distinguishable.
--   * Avoid unnecessary luminance competition.
--
-- PRIORITY 3: SEMANTIC COLOR DIFFERENTIATION
--   * Strings: botanical green.
--   * Functions: warm gold.
--   * Types: cyan.
--   * Keywords: blue.
--   * Numbers: orange.
--   * Booleans: rose.
--   * Constants: violet.
--   * Properties: teal.
--   * Variables: warm neutral.
--
-- CONTRAST:
--   Calculated using WCAG relative luminance in sRGB.
--   Main foreground: approximately 7.34:1 against bg.
--   Main syntax colors: at least 4.6:1 across tested coding surfaces.
--   Disabled and invisible elements are intentional exceptions.
--
-- Medical limitation:
--   Accessibility-oriented design experiment.
--   Not a clinically validated treatment for uveitis.
-- ============================================================================

return {
    -- ========================================================================
    -- 1. UI SURFACES
    -- ========================================================================

    -- Main editor surfaces
    bg        = 0x292723,
    bg_gutter = 0x292723,
    bg_float  = 0x302d27,
    bg_panel  = 0x2e2b25,
    bg_block  = 0x383328,
    bg_bar    = 0x22201c,

    -- Editor interaction
    bg_visual       = 0x333027,
    bg_cursorline   = 0x302d27,
    bg_cursorcolumn = 0x2d2a24,
    bg_match        = 0x302d27,

    -- Popup / completion
    bg_popup           = 0x302d27,
    bg_popup_sel       = 0x333027,
    bg_popup_selected  = 0x333027,
    bg_popup_scrollbar = 0x292723,
    bg_popup_thumb     = 0x847660,

    -- LSP references / signature help
    bg_reference = 0x302d27,
    bg_signature = 0x302d27,

    -- Diff surfaces
    bg_diff_add    = 0x2c3127,
    bg_diff_change = 0x312e26,
    bg_diff_delete = 0x332827,
    bg_diff_text   = 0x333027,

    -- Search surfaces
    bg_search        = 0x353027,
    bg_search_active = 0x393127,

    -- ========================================================================
    -- 2. TEXT HIERARCHY
    -- ========================================================================

    -- Essential text
    fg        = 0xbdb5a8,
    fg_strong = 0xc7bfb2,

    -- Secondary information
    fg_muted  = 0xa9a194,
    fg_subtle = 0xa49c90,

    -- Nonessential information
    fg_disabled  = 0x81796e,
    fg_invisible = 0x686158,

    -- Selection foreground
    -- Preserve individual syntax foregrounds on Visual selections.
    selection_fg = 0xc7bfb2,

    -- Cursor
    cursor      = 0xc0a078,
    cursor_text = 0x292723,

    -- ========================================================================
    -- 3. BORDERS AND STRUCTURAL ELEMENTS
    -- ========================================================================

    border        = 0x554d43,
    border_subtle = 0x3d3932,
    border_focus  = 0x89785f,

    -- ========================================================================
    -- 4. SYNTAX: COMMENTS AND LITERALS
    -- ========================================================================

    -- Comments
    comment = 0xa69f8f,

    -- Strings
    string               = 0x9fba81,
    string_escape        = 0xc9a0b8,
    string_documentation = 0xa9a194,

    -- Literals
    number   = 0xd69b73,
    boolean  = 0xd18fab,
    constant = 0xb3a0d0,

    -- ========================================================================
    -- 5. SYNTAX: LANGUAGE STRUCTURE
    -- ========================================================================

    keyword = 0x8baad4,
    preproc = 0xc18fbf,

    operator  = 0xb9b2a6,
    delimiter = 0xaaa396,

    -- ========================================================================
    -- 6. SYNTAX: CALLABLE ENTITIES
    -- ========================================================================

    fn         = 0xceae69,
    fn_builtin = 0xc5916b,

    -- ========================================================================
    -- 7. SYNTAX: TYPES
    -- ========================================================================

    type         = 0x81b9c0,
    type_builtin = 0x88afc7,

    -- ========================================================================
    -- 8. SYNTAX: VARIABLES AND MEMBERS
    -- ========================================================================

    variable         = 0xbdb5a8,
    variable_builtin = 0x98b7ad,

    parameter = 0xc19d78,
    property  = 0x78b2a4,
    namespace = 0x9eaac8,

    -- ========================================================================
    -- 9. SYNTAX: SPECIAL TOKENS
    -- ========================================================================

    special = 0xce9688,

    label = 0xaeb17a,
    tag   = 0xcc8d91,
    macro = 0xb8a9d0,

    -- Links and references
    link = 0x8fb0c8,

    -- ========================================================================
    -- 10. MARKUP
    -- ========================================================================

    markup_heading = 0x8baad4,
    markup_code    = 0x9fba81,
    markup_link    = 0x8fb0c8,

    -- ========================================================================
    -- 11. DIAGNOSTICS
    -- ========================================================================

    -- Diagnostic foregrounds
    error        = 0xd4868b,
    warn         = 0xc8a36d,
    info         = 0x8fb0c8,
    hint         = 0x83b4a2,
    todo         = 0xb5a0cc,
    unnecessary  = 0x81796e,

    -- Subtle diagnostic backgrounds
    -- Prefer undercurl and signs over large colored backgrounds.
    bg_diagnostic_error = 0x302421,
    bg_diagnostic_warn  = 0x2b281f,
    bg_diagnostic_info  = 0x24292c,
    bg_diagnostic_hint  = 0x252b27,

    -- ========================================================================
    -- 12. SEARCH
    -- ========================================================================

    search           = 0xc5bba9,
    search_bg        = 0x353027,

    search_active    = 0xcbb093,
    search_active_bg = 0x393127,

    -- ========================================================================
    -- 13. SIGNATURE AND REFERENCES
    -- ========================================================================

    signature = 0xc19d78,
    reference = 0x78b2a4,

    -- ========================================================================
    -- 14. RAW ACCENTS
    -- ========================================================================

    red     = 0xd4868b,
    orange  = 0xd69b73,
    yellow  = 0xceae69,
    green   = 0x9fba81,
    cyan    = 0x81b9c0,
    blue    = 0x8baad4,
    purple  = 0xb3a0d0,
    magenta = 0xc18fbf,
    pink    = 0xd18fab,
    teal    = 0x78b2a4,
    brown   = 0xc19d78,
    gray    = 0xa9a194,

    -- ========================================================================
    -- 15. TERMINAL ANSI
    -- ========================================================================

    -- Normal
    term_0 = 0x292723,
    term_1 = 0xd4868b,
    term_2 = 0x9fba81,
    term_3 = 0xceae69,
    term_4 = 0x8baad4,
    term_5 = 0xb3a0d0,
    term_6 = 0x81b9c0,
    term_7 = 0xbdb5a8,

    -- Bright
    term_8  = 0xa9a194,
    term_9  = 0xd28f94,
    term_10 = 0xa5bd8a,
    term_11 = 0xd0b77b,
    term_12 = 0x96b5d9,
    term_13 = 0xbdaadd,
    term_14 = 0x8dbdc2,
    term_15 = 0xc7bfb2,
}
