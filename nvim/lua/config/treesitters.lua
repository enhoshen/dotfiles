require("nvim-treesitter").setup({
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {
    "typescript",
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {
      "kanata",
      -- "markdown",
      -- "markdown_inline",
    },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    --disable = function(lang, buf)
    --    local max_filesize = 100 * 1024 -- 100 KB
    --    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --    if ok and stats and stats.size > max_filesize then
    --        return true
    --    end
    --end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  autotag = {
    enable = true,
  },
})

-- vim.api.nvim_create_autocmd("User", {
--   pattern = "TSUpdate",
--   callback = function()
--     require("nvim-treesitter.parsers").kanata = {
--       install_info = {
--         url = "https://github.com/postsolar/tree-sitter-kanata",
--         -- revision = "af53b4c", -- commit hash for revision to check out; HEAD if missing
--         -- optional entries:
--         branch = "master", -- only needed if different from default branch
--         --location = "parser", -- only needed if the parser is in subdirectory of a "monorepo"
--         --generate = true, -- only needed if repo does not contain pre-generated `src/parser.c`
--         -- generate_from_json = false, -- only needed if repo does not contain `src/grammar.json` either
--         --queries = "queries", -- also install queries from given directory
--       },
--     }
--   end,
-- })
vim.filetype.add({ extension = { kbd = "kanata" } })
vim.treesitter.language.register("kanata", { "kanata" })
