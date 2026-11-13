---@type Palette
-- ============================================================================
-- UMBER FOCUS
-- UVEITIS-AWARE DARK DEVELOPER PALETTE
--
-- Warm espresso / controlled luminance / distinct mineral syntax colors.
--
-- Design priorities:
--   1. Prioritize photophobia-aware visual restraint.
--   2. Avoid pure black, pure white and unnecessary bright surfaces.
--   3. Preserve distinct syntax hues with controlled chroma.
--   4. Maintain readable essential and secondary information.
--   5. Minimize luminance differences between editor surfaces.
--   6. Avoid duplicated colors across important syntax categories.
--   7. Keep diagnostic and interaction highlights localized.
--
-- Color design:
--   * Syntax accents use approximately balanced perceptual lightness.
--   * Chroma is moderated to avoid excessive color intensity.
--   * Hue separation provides semantic identification.
--   * Important foregrounds maintain sufficient luminance contrast.
--
-- Contrast ratios use WCAG relative luminance calculations.
-- These are legibility references, NOT medical comfort thresholds.
--
-- Medical limitation:
--   Accessibility-oriented design experiment.
--   No color palette is clinically validated as a treatment for uveitis.
-- ============================================================================

return {
    -- ========================================================================
    -- 1. UI SURFACES
    -- ========================================================================

    -- Main editor surfaces
    bg        = 0x24221f,
    bg_gutter = 0x26241f,
    bg_float  = 0x292721,
    bg_panel  = 0x282620,
    bg_bar    = 0x1e1c18,

    -- Editor interaction
    bg_visual       = 0x2a2721,
    bg_cursorline   = 0x28251f,
    bg_cursorcolumn = 0x26231f,
    bg_match        = 0x2a2721,

    -- Popup / completion
    bg_popup           = 0x292721,
    bg_popup_sel       = 0x2a2721,
    bg_popup_selected  = 0x2a2721,
    bg_popup_scrollbar = 0x25231f,
    bg_popup_thumb     = 0x5e5345,

    -- LSP references / signature help
    bg_reference = 0x292721,
    bg_signature = 0x292721,

    -- Diff surfaces
    bg_diff_add    = 0x232922,
    bg_diff_change = 0x29261f,
    bg_diff_delete = 0x2d2422,
    bg_diff_text   = 0x2a2721,

    -- Search surfaces
    bg_search        = 0x302b23,
    bg_search_active = 0x383027,

    -- ========================================================================
    -- 2. TEXT HIERARCHY
    -- ========================================================================

    -- Essential text
    fg        = 0xa0998e,
    fg_strong = 0xada69b,

    -- Secondary information
    fg_muted  = 0x969084,
    fg_subtle = 0x857e73,

    -- Nonessential information
    fg_disabled  = 0x706a61,
    fg_invisible = 0x5d5850,

    -- Selection foreground
    selection_fg = 0xb7afa3,

    -- Cursor
    cursor      = 0xbb966c,
    cursor_text = 0x24221f,

    -- ========================================================================
    -- 3. BORDERS AND STRUCTURAL ELEMENTS
    -- ========================================================================

    border        = 0x4f493f,
    border_subtle = 0x37322c,
    border_focus  = 0x786650,

    -- ========================================================================
    -- 4. SYNTAX: COMMENTS AND LITERALS
    -- ========================================================================

    -- Comments
    comment = 0x969084,

    -- Strings
    string               = 0x999265,
    string_escape        = 0xb3886b,
    string_documentation = 0x969084,

    -- Literals
    number   = 0xbd8183,
    boolean  = 0xb78199,
    constant = 0xa187b0,

    -- ========================================================================
    -- 5. SYNTAX: LANGUAGE STRUCTURE
    -- ========================================================================

    keyword = 0x7493bc,
    preproc = 0xb083a4,

    operator  = 0xa0998e,
    delimiter = 0x969084,

    -- ========================================================================
    -- 6. SYNTAX: CALLABLE ENTITIES
    -- ========================================================================

    fn         = 0x6097b9,
    fn_builtin = 0x5098ab,

    -- ========================================================================
    -- 7. SYNTAX: TYPES
    -- ========================================================================

    type         = 0x7c9971,
    type_builtin = 0x66997f,

    -- ========================================================================
    -- 8. SYNTAX: VARIABLES AND MEMBERS
    -- ========================================================================

    variable         = 0xa0998e,
    variable_builtin = 0x829686,

    parameter = 0xa78d65,
    property  = 0x559a91,
    namespace = 0x8890a9,

    -- ========================================================================
    -- 9. SYNTAX: SPECIAL TOKENS
    -- ========================================================================

    special = 0xba8475,

    label = 0x89966a,
    tag   = 0x4e999f,
    macro = 0x8f8cb8,

    -- Links and references
    link = 0x6097b9,

    -- ========================================================================
    -- 10. MARKUP
    -- ========================================================================

    markup_heading = 0x7493bc,
    markup_code    = 0x999265,
    markup_link    = 0x6097b9,

    -- ========================================================================
    -- 11. DIAGNOSTICS
    -- ========================================================================

    -- Diagnostic foregrounds
    error        = 0xbb8091,
    warn         = 0xaa8b66,
    info         = 0x6097b9,
    hint         = 0x5b9d8c,
    todo         = 0xa985aa,
    unnecessary  = 0x706a61,

    -- Subtle diagnostic backgrounds
    -- Prefer undercurl and signs over large colored backgrounds.
    bg_diagnostic_error = 0x2d2422,
    bg_diagnostic_warn  = 0x29261f,
    bg_diagnostic_info  = 0x24292c,
    bg_diagnostic_hint  = 0x252b27,

    -- ========================================================================
    -- 12. SEARCH
    -- ========================================================================

    search           = 0xb7afa3,
    search_bg        = 0x302b23,

    search_active    = 0xc0a48d,
    search_active_bg = 0x383027,

    -- ========================================================================
    -- 13. SIGNATURE AND REFERENCES
    -- ========================================================================

    signature = 0xa78d65,
    reference = 0x559a91,

    -- ========================================================================
    -- 14. RAW ACCENTS
    --
    -- Distinct semantic hues.
    -- Moderate chroma and controlled visual intensity.
    -- ========================================================================

    red     = 0xbb8091,
    orange  = 0xb3886b,
    yellow  = 0x999265,
    green   = 0x7c9971,
    cyan    = 0x4e999f,
    blue    = 0x6097b9,
    purple  = 0x8f8cb8,
    magenta = 0xb083a4,
    pink    = 0xb78199,
    teal    = 0x5b9d8c,
    brown   = 0xa78d65,
    gray    = 0x969084,

    -- ========================================================================
    -- 15. TERMINAL ANSI
    -- ========================================================================

    -- Normal
    term_0 = 0x24221f,
    term_1 = 0xbb8091,
    term_2 = 0x7c9971,
    term_3 = 0x999265,
    term_4 = 0x6097b9,
    term_5 = 0x8f8cb8,
    term_6 = 0x5098ab,
    term_7 = 0xa0998e,

    -- Bright
    term_8  = 0x969084,
    term_9  = 0xc38899,
    term_10 = 0x84a178,
    term_11 = 0xa1996d,
    term_12 = 0x689fc2,
    term_13 = 0x9c93bf,
    term_14 = 0x58a0b3,
    term_15 = 0xada69b,
}
