---@type Palette
-- ============================================================================
-- NOCTURNE
-- UVEITIS-AWARE DARK DEVELOPER PALETTE
--
-- Neutral graphite / muted mineral colors / balanced syntax accents.
--
-- Design priorities:
--   1. Controlled foreground luminance without pure-white text.
--   2. Readable syntax with sufficient foreground/background contrast.
--   3. Distinct semantic colors without neon-like saturation.
--   4. Quiet editor surfaces and reduced decorative competition.
--   5. Consistent visual hierarchy across editor components.
--   6. Preserve color identity across syntax, diagnostics and terminal ANSI.
--
-- Contrast ratios use WCAG relative luminance calculations.
-- They are legibility benchmarks, NOT clinical comfort thresholds.
--
-- This is an accessibility-oriented design experiment, not a clinically
-- validated treatment or medical recommendation for uveitis.
-- ============================================================================

return {
    -- ========================================================================
    -- 1. UI SURFACES
    -- ========================================================================

    -- Main editor surfaces
    bg         = 0x20242c,
    bg_gutter  = 0x232832,
    bg_float   = 0x292f39,
    bg_panel   = 0x262b35,
    bg_bar     = 0x1b1f27,
    bg_block   = 0x1b1f27,

    -- Editor interaction
    bg_visual       = 0x303947,
    bg_cursorline   = 0x252a34,
    bg_cursorcolumn = 0x222832,
    bg_match        = 0x333b47,

    -- Popup and completion
    bg_popup           = 0x292f39,
    bg_popup_sel       = 0x303a48,
    bg_popup_selected  = 0x303a48,
    bg_popup_scrollbar = 0x222832,
    bg_popup_thumb     = 0x667385,

    -- LSP references and signature help
    bg_reference = 0x2e3542,
    bg_signature = 0x292f3a,

    -- Diff surfaces
    bg_diff_add    = 0x26342f,
    bg_diff_change = 0x342f26,
    bg_diff_delete = 0x35282e,
    bg_diff_text   = 0x3a3932,

    -- Search surfaces
    bg_search        = 0x35342a,
    bg_search_active = 0x3d332c,

    -- ========================================================================
    -- 2. TEXT HIERARCHY
    -- ========================================================================

    -- Essential text
    fg        = 0x9ca6b4,
    fg_strong = 0xa7b0bd,

    -- Secondary information
    fg_muted  = 0x8f9aa8,
    fg_subtle = 0x8591a0,

    -- Nonessential information
    fg_disabled  = 0x6f7a89,
    fg_invisible = 0x596472,

    -- Selection foreground
    selection_fg = 0xc2c8d1,

    -- Cursor
    cursor      = 0xaab995,
    cursor_text = 0x20242c,

    -- ========================================================================
    -- 3. BORDERS AND STRUCTURAL ELEMENTS
    -- ========================================================================

    border        = 0x667385,
    border_subtle = 0x343b47,
    border_focus  = 0x72879e,

    -- ========================================================================
    -- 4. SYNTAX: COMMENTS AND LITERALS
    -- ========================================================================

    -- Comments
    comment = 0x8792a0,

    -- Strings
    string               = 0xbba57b,
    string_escape        = 0xbf8e75,
    string_documentation = 0x929dab,

    -- Literals
    number   = 0xc18f79,
    boolean  = 0xbd8ea0,
    constant = 0xb99685,

    -- ========================================================================
    -- 5. SYNTAX: LANGUAGE STRUCTURE
    -- ========================================================================

    keyword   = 0xa398c3,
    preproc   = 0x958bb7,

    operator  = 0xa0a8b4,
    delimiter = 0x8c97a5,

    -- ========================================================================
    -- 6. SYNTAX: CALLABLE ENTITIES
    -- ========================================================================

    fn         = 0x87a7c4,
    fn_builtin = 0x82b0ba,

    -- ========================================================================
    -- 7. SYNTAX: TYPES
    -- ========================================================================

    type         = 0x94aa8c,
    type_builtin = 0x81ab9e,

    -- ========================================================================
    -- 8. SYNTAX: VARIABLES AND MEMBERS
    -- ========================================================================

    variable         = 0x9ca6b4,
    variable_builtin = 0x83aa98,

    parameter = 0xbea477,
    property  = 0x83a99f,
    namespace = 0x8fa4be,

    -- ========================================================================
    -- 9. SYNTAX: SPECIAL TOKENS
    -- ========================================================================

    special = 0xae95b6,

    label = 0xbca077,
    tag   = 0x94aa8c,
    macro = 0xa398c3,

    -- Links and references
    link = 0x87a7c4,

    -- ========================================================================
    -- 10. MARKUP
    -- ========================================================================

    markup_heading = 0xa398c3,
    markup_code    = 0xbba57b,
    markup_link    = 0x87a7c4,

    -- ========================================================================
    -- 11. DIAGNOSTICS
    -- ========================================================================

    -- Diagnostic foregrounds
    error       = 0xc27f89,
    warn        = 0xb99b69,
    info        = 0x87a7c4,
    hint        = 0x81ab9e,
    todo        = 0xa398c3,
    unnecessary = 0x6f7a89,

    -- Subtle diagnostic backgrounds
    bg_diagnostic_error = 0x342a30,
    bg_diagnostic_warn  = 0x342f27,
    bg_diagnostic_info  = 0x29303a,
    bg_diagnostic_hint  = 0x29332f,

    -- ========================================================================
    -- 12. SEARCH
    -- ========================================================================

    search           = 0xc6cdd6,
    search_bg        = 0x35342a,

    search_active    = 0xd0c7b4,
    search_active_bg = 0x3d332c,

    -- ========================================================================
    -- 13. SIGNATURE AND REFERENCES
    -- ========================================================================

    signature = 0xbea477,
    reference = 0x83a99f,

    -- ========================================================================
    -- 14. RAW ACCENTS
    --
    -- Muted but recognizable semantic colors.
    -- Designed to preserve colorful coding without excessive intensity.
    -- ========================================================================

    red     = 0xc27f89,
    orange  = 0xbf8e75,
    yellow  = 0xbba57b,
    green   = 0x94aa8c,
    cyan    = 0x82b0ba,
    blue    = 0x87a7c4,
    purple  = 0xa398c3,
    magenta = 0xae95b6,
    pink    = 0xbd8ea0,
    teal    = 0x81ab9e,
    brown   = 0xb3977c,
    gray    = 0x8f9aa8,

    -- ========================================================================
    -- 15. TERMINAL ANSI
    -- ========================================================================

    -- Normal
    term_0 = 0x20242c,
    term_1 = 0xc27f89,
    term_2 = 0x94aa8c,
    term_3 = 0xbba57b,
    term_4 = 0x87a7c4,
    term_5 = 0xa398c3,
    term_6 = 0x82b0ba,
    term_7 = 0x9ca6b4,

    -- Bright
    term_8  = 0x8591a0,
    term_9  = 0xc98b95,
    term_10 = 0xa2b698,
    term_11 = 0xc5ad82,
    term_12 = 0x94b0ca,
    term_13 = 0xafa3c9,
    term_14 = 0x91bdc2,
    term_15 = 0xa7b0bd,
}
