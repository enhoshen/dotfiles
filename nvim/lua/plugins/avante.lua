return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = {
    -- add any opts here
    -- for example
    --provider = "openai",
    provider = "gemini",
    cursor_applying_provider = "gemini",
    behaviour = {
      enable_cursor_planning_mode = true,
    },
    -- TODO before fixing apply behavior, I may call avante.diff.setup_buffer_mappings
    -- myself
    -- see avante.nvim/lua/avante/diff.lua:L354
    mappings = {
      diff = {
        ours = "<Leader>axo",
        theirs = "<Leader>axt",
        all_theirs = "<Leader>axa",
        both = "<Leader>axb",
        cursor = "<Leader>axc",
        next = "<Leader>a]x",
        prev = "<Leader>a[x",
      },
    },
    windows = {
      width = 50,
    },
    -- TODO i'm using gemini but why does it only work with openai???
    gemini = {
      --endpoint = "https://api.openai.com/v1",
      --endpoint = "https://generativelanguage.googleapis.com/v1beta/models/{{model}}:streamGenerateContent?key={{secret}}",
      endpoint = "https://generativelanguage.googleapis.com/v1beta/models/",
      --model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
      --model = model = "gemini-2.0-flash", temperature = 1.1, top_p = 1 },
      model = "gemini-2.5-pro",
      timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
      temperature = 0,
      max_tokens = 8192,
      --max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
      --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
