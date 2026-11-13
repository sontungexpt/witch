---@type Palette
-- ============================================================================
-- UMBER FOCUS
-- UVEITIS-AWARE DARK DEVELOPER PALETTE
--
-- Warm espresso / muted botanical / restrained earth tones.
--
-- Design priorities:
--   1. Readable essential text without pure-white foregrounds.
--   2. Low-luminance, low-saturation editor surfaces.
--   3. Distinct syntax categories with consistent luminance contrast.
--   4. Restrained selection, search, and diagnostic backgrounds.
--   5. Predictable focus and popup indicators.
--   6. Reduced visual competition from nonessential information.
--
-- Contrast ratios are measured against each actual background.
-- WCAG contrast is used as a design reference, not as a medical standard.
--
-- Medical limitation:
--   An accessibility-oriented design experiment, not a treatment
--   or medical recommendation for uveitis.
-- ============================================================================

return {
    -- ========================================================================
    -- 1. UI SURFACES
    -- ========================================================================

    -- Main editor surfaces
    bg       = 0x1c1a18,
    bg_gutter = 0x201e1b,
    bg_float = 0x282521,
    bg_panel = 0x282521,
    bg_bar   = 0x151412,

    -- Editor interaction
    bg_visual       = 0x302b25,
    bg_cursorline   = 0x29251f,
    bg_cursorcolumn = 0x25221e,
    bg_match        = 0x352e27,

    -- Popup / completion
    bg_popup          = 0x282521,
    bg_popup_sel      = 0x332d26,
    bg_popup_selected = 0x332d26,
    bg_popup_scrollbar = 0x211e1a,
    bg_popup_thumb     = 0x796956,

    -- LSP references / signature help
    bg_reference = 0x302b25,
    bg_signature = 0x282521,

    -- Diff surfaces: deliberately low-saturation
    bg_diff_add    = 0x252b23,
    bg_diff_change = 0x2d2922,
    bg_diff_delete = 0x302321,
    bg_diff_text   = 0x352e27,

    -- Search surfaces
    bg_search        = 0x393229,
    bg_search_active = 0x49352f,

    -- ========================================================================
    -- 2. TEXT HIERARCHY
    -- ========================================================================

    -- Essential text
    fg        = 0xaaa49a,
    fg_strong = 0xb6afa4,

    -- Secondary information
    fg_muted  = 0xa19b92,
    fg_subtle = 0x969087,

    -- Nonessential information
    fg_disabled  = 0x89837a,
    fg_invisible = 0x777168,

    -- Selection foreground
    selection_fg = 0xc0b9ae,

    -- Cursor foreground/background
    cursor      = 0xb89577,
    cursor_text = 0x1c1a18,

    -- ========================================================================
    -- 3. BORDERS AND STRUCTURAL ELEMENTS
    -- ========================================================================

    border        = 0x514c45,
    border_subtle = 0x38332d,
    border_focus  = 0x81705c,

    -- ========================================================================
    -- 4. SYNTAX: COMMENTS AND LITERALS
    -- ========================================================================

    comment = 0xa19b92,

    string               = 0xb9a27c,
    string_escape        = 0xc5a16f,
    string_documentation = 0xa19b92,

    number   = 0xc0aa7d,
    boolean  = 0xc3949b,
    constant = 0xc99b76,

    -- ========================================================================
    -- 5. SYNTAX: LANGUAGE STRUCTURE
    -- ========================================================================

    keyword = 0xb09fc0,
    preproc = 0xa596b5,

    operator  = 0xa69f94,
    delimiter = 0xaaa49a,

    -- ========================================================================
    -- 6. SYNTAX: CALLABLE ENTITIES
    -- ========================================================================

    fn         = 0x91a6b7,
    fn_builtin = 0x98afbf,

    -- ========================================================================
    -- 7. SYNTAX: TYPES
    -- ========================================================================

    type         = 0x96ad88,
    type_builtin = 0x8eafa5,

    -- ========================================================================
    -- 8. SYNTAX: VARIABLES AND MEMBERS
    -- ========================================================================

    variable         = 0xaaa49a,
    variable_builtin = 0x85a29b,

    parameter = 0xb89577,
    property  = 0x96b6ad,
    namespace = 0x8c9eab,

    -- ========================================================================
    -- 9. SYNTAX: SPECIAL TOKENS
    -- ========================================================================

    special = 0xbda18f,

    label = 0xb89476,
    tag   = 0x96ad88,
    macro = 0xa596b5,

    -- Links and references
    link = 0x91a6b7,

    -- ========================================================================
    -- 10. MARKUP
    -- ========================================================================

    markup_heading = 0xb09fc0,
    markup_code    = 0xb9a27c,
    markup_link    = 0x91a6b7,

    -- ========================================================================
    -- 11. DIAGNOSTICS
    -- ========================================================================

    -- Foregrounds
    error       = 0xd18b85,
    warn        = 0xc5a16f,
    info        = 0x91a6b7,
    hint        = 0x8eafa5,
    todo        = 0xb09fc0,
    unnecessary = 0x89837a,

    -- Optional diagnostic backgrounds
    -- Keep these subtle; prefer undercurl and signs.
    bg_diagnostic_error = 0x302321,
    bg_diagnostic_warn  = 0x302b22,
    bg_diagnostic_info  = 0x252a2e,
    bg_diagnostic_hint  = 0x252b28,

    -- ========================================================================
    -- 12. SEARCH
    -- ========================================================================

    search           = 0xb6afa4,
    search_bg        = 0x393229,

    search_active    = 0xc0b9ae,
    search_active_bg = 0x49352f,

    -- ========================================================================
    -- 13. SIGNATURE AND REFERENCES
    -- ========================================================================

    signature = 0xb89577,
    reference = 0x96b6ad,

    -- ========================================================================
    -- 14. RAW ACCENTS
    --
    -- Use these for semantic accents, not as arbitrary UI foregrounds.
    -- ========================================================================

    red     = 0xd18b85,
    orange  = 0xc99b76,
    yellow  = 0xb9a27c,
    green   = 0x96ad88,
    cyan    = 0x8eafa5,
    blue    = 0x91a6b7,
    purple  = 0xb09fc0,
    magenta = 0xb68b9a,
    pink    = 0xc3949b,
    teal    = 0x8eafa5,
    brown   = 0xb89476,
    gray    = 0xa19b92,

    -- ========================================================================
    -- 15. TERMINAL ANSI
    -- ========================================================================

    -- Normal
    term_0 = 0x1c1a18,
    term_1 = 0xd18b85,
    term_2 = 0x96ad88,
    term_3 = 0xb9a27c,
    term_4 = 0x91a6b7,
    term_5 = 0xb09fc0,
    term_6 = 0x8eafa5,
    term_7 = 0xaaa49a,

    -- Bright
    term_8  = 0xa19b92,
    term_9  = 0xd28f89,
    term_10 = 0x9cb38f,
    term_11 = 0xc0aa7d,
    term_12 = 0x98afbf,
    term_13 = 0xb8a6c7,
    term_14 = 0x96b6ad,
    term_15 = 0xb6afa4,
}
