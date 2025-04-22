-- Chat commands
local wk = require("which-key")
wk.add({
  group = "Gpt prompt",
  {
    group = "Chat",
    {
      mode = { "n", "i" },
      {
        "<Leader>gpc",
        "<cmd>GpChatNew<cr>",
        desc = "Gpt Propmt New Chat",
        group = "Gpt prompt",
      },
      {
        "<Leader>gpt",
        "<cmd>GpChatToggle<cr>",
        desc = "Gpt Propmt Toggle Chat",
      },
      {
        "<Leader>gpf",
        "<cmd>GpChatFinder<cr>",
        desc = "Gpt Propmt Chat Finder",
      },
      {
        "<Leader>gp<CR>",
        "<cmd>GpChatRespond<cr>",
        desc = "Gpt Propmt get response",
      },
      {
        "<C-s>",
        "<cmd>GpChatRespond<cr>",
        desc = "Gpt Propmt get response",
      },
    },
    {
      mode = "v",
      {
        "<Leader>gpc",
        ":<C-u>'<,'>GpChatNew<cr>",
        desc = "Gpt Propmt Visual Chat New",
      },
      {
        "<Leader>gpp",
        ":<C-u>'<,'>GpChatPaste<cr>",
        desc = "Gpt Propmt Visual Chat Paste",
      },
      {
        "<Leader>gpt",
        ":<C-u>'<,'>GpChatToggle<cr>",
        desc = "Gpt Propmt Visual Toggle Chat",
      },
    },

    -- {
    --   { "n", "i" },
    --   "<Leader>gp<C-x>",
    --   "<cmd>GpChatNew split<cr>",
    --    desc = "Gpt Propmt New Chat split"
    -- },
    -- {
    --   { "n", "i" },
    --   "<Leader>gp<C-v>",
    --   "<cmd>GpChatNew vsplit<cr>",
    --    desc = "Gpt Propmt New Chat vsplit"
    -- },
    -- {
    --   { "n", "i" },
    --   "<Leader>gp<C-t>",
    --   "<cmd>GpChatNew tabnew<cr>",
    --    desc = "Gpt Propmt New Chat tabnew"
    -- },
    --
    -- {
    --   "v",
    --   "<Leader>gp<C-x>",
    --   ":<C-u>'<,'>GpChatNew split<cr>",
    --    desc = "Gpt Propmt Visual Chat New split"
    -- },
    -- {
    --   "v",
    --   "<Leader>gp<C-v>",
    --   ":<C-u>'<,'>GpChatNew vsplit<cr>",
    --    desc = "Gpt Propmt Visual Chat New vsplit"
    -- },
    -- {
    --   "v",
    --   "<Leader>gp<C-t>",
    --   ":<C-u>'<,'>GpChatNew tabnew<cr>",
    --    desc = "Gpt Propmt Visual Chat New tabnew"
    -- },
    --
  },
  -- Prompt commands
  {
    group = "Propmt",
    {
      mode = { "n", "i" },
      {
        "<Leader>gpr",
        "<cmd>GpRewrite<cr>",
        desc = "Gpt Propmt Inline Rewrite",
      },
      {
        "<Leader>gpa",
        "<cmd>GpAppend<cr>",
        desc = "Gpt Propmt Append (after)",
      },
      {
        "<Leader>gpb",
        "<cmd>GpPrepend<cr>",
        desc = "Gpt Propmt Prepend (before)",
      },
    },

    {
      mode = { "v" },
      {
        "<Leader>gpr",
        ":<C-u>'<,'>GpRewrite<cr>",
        desc = "Gpt Propmt Visual Rewrite",
      },
      {
        "<Leader>gpa",
        ":<C-u>'<,'>GpAppend<cr>",
        desc = "Gpt Propmt Visual Append (after)",
      },
      {
        "<Leader>gpb",
        ":<C-u>'<,'>GpPrepend<cr>",
        desc = "Gpt Propmt Visual Prepend (before)",
      },
    },
    -- {
    --   "v",
    --   "<Leader>gpi",
    --   ":<C-u>'<,'>GpImplement<cr>",
    --    desc = "Gpt Propmt Implement selection"
    -- },
    --
    -- {
    --   { "n", "i" },
    --   "<Leader>gpgp",
    --   "<cmd>GpPopup<cr>",
    --    desc = "Gpt Propmt Popup"
    -- },
    -- {
    --   { "n", "i" },
    --   "<Leader>gpge",
    --   "<cmd>GpEnew<cr>",
    --    desc = "Gpt Propmt GpEnew"
    -- },
    -- {
    --   { "n", "i" },
    --   "<Leader>gpgn",
    --   "<cmd>GpNew<cr>",
    --    desc = "Gpt Propmt GpNew"
    -- },
    -- {
    --   { "n", "i" },
    --   "<Leader>gpgv",
    --   "<cmd>GpVnew<cr>",
    --    desc = "Gpt Propmt GpVnew"
    -- },
    -- {
    --   { "n", "i" },
    --   "<Leader>gpgt",
    --   "<cmd>GpTabnew<cr>",
    --    desc = "Gpt Propmt GpTabnew"
    -- },
    --
    -- {
    --   "v",
    --   "<Leader>gpgp",
    --   ":<C-u>'<,'>GpPopup<cr>",
    --    desc = "Gpt Propmt Visual Popup"
    -- },
    -- {
    --   "v",
    --   "<Leader>gpge",
    --   ":<C-u>'<,'>GpEnew<cr>",
    --    desc = "Gpt Propmt Visual GpEnew"
    -- },
    -- {
    --   "v",
    --   "<Leader>gpgn",
    --   ":<C-u>'<,'>GpNew<cr>",
    --    desc = "Gpt Propmt Visual GpNew"
    -- },
    -- {
    --   "v",
    --   "<Leader>gpgv",
    --   ":<C-u>'<,'>GpVnew<cr>",
    --    desc = "Gpt Propmt Visual GpVnew"
    -- },
    -- {
    --   "v",
    --   "<Leader>gpgt",
    --   ":<C-u>'<,'>GpTabnew<cr>",
    --    desc = "Gpt Propmt Visual GpTabnew"
    -- },
    --
    -- {
    --   { "n", "i" },
    --   "<Leader>gpx",
    --   "<cmd>GpContext<cr>",
    --    desc = "Gpt Propmt Toggle Context"
    -- },
    -- {
    --   "v",
    --   "<Leader>gpx",
    --   ":<C-u>'<,'>GpContext<cr>",
    --    desc = "Gpt Propmt Visual Toggle Context"
    -- },
    --
  },
  {
    "<Leader>gps",
    "<cmd>GpStop<cr>",
    desc = "Gpt Propmt Stop",
    mode = { "n", "i", "v", "x" },
  },
  -- {
  --   { "n", "i", "v", "x" },
  --   "<Leader>gpn",
  --   "<cmd>GpNextAgent<cr>",
  --    desc = "Gpt Propmt Next Agent"
  -- },
  --
  -- -- optional Whisper commands with prefix <Leader>gpw
  -- {
  --   { "n", "i" },
  --   "<Leader>gpww",
  --   "<cmd>GpWhisper<cr>",
  --    desc = "Gpt Propmt Whisper"
  -- },
  -- {
  --   "v",
  --   "<Leader>gpww",
  --   ":<C-u>'<,'>GpWhisper<cr>",
  --    desc = "Gpt Propmt Visual Whisper"
  -- },
  --
  -- {
  --   { "n", "i" },
  --   "<Leader>gpwr",
  --   "<cmd>GpWhisperRewrite<cr>",
  --    desc = "Gpt Propmt Whisper Inline Rewrite"
  -- },
  -- {
  --   { "n", "i" },
  --   "<Leader>gpwa",
  --   "<cmd>GpWhisperAppend<cr>",
  --    desc = "Gpt Propmt Whisper Append (after)"
  -- },
  -- {
  --   { "n", "i" },
  --   "<Leader>gpwb",
  --   "<cmd>GpWhisperPrepend<cr>",
  --    desc = "Gpt Propmt Whisper Prepend (before) "
  -- },
  --
  -- {
  --   "v",
  --   "<Leader>gpwr",
  --   ":<C-u>'<,'>GpWhisperRewrite<cr>",
  --    desc = "Gpt Propmt Visual Whisper Rewrite"
  -- },
  -- {
  --   "v",
  --   "<Leader>gpwa",
  --   ":<C-u>'<,'>GpWhisperAppend<cr>",
  --    desc = "Gpt Propmt Visual Whisper Append (after)"
  -- },
  -- {
  --   "v",
  --   "<Leader>gpwb",
  --   ":<C-u>'<,'>GpWhisperPrepend<cr>",
  --    desc = "Gpt Propmt Visual Whisper Prepend (before)"
  -- },
  --
  -- {
  --   { "n", "i" },
  --   "<Leader>gpwp",
  --   "<cmd>GpWhisperPopup<cr>",
  --    desc = "Gpt Propmt Whisper Popup"
  -- },
  -- {
  --   { "n", "i" },
  --   "<Leader>gpwe",
  --   "<cmd>GpWhisperEnew<cr>",
  --    desc = "Gpt Propmt Whisper Enew"
  -- },
  -- {
  --   { "n", "i" },
  --   "<Leader>gpwn",
  --   "<cmd>GpWhisperNew<cr>",
  --    desc = "Gpt Propmt Whisper New"
  -- },
  -- {
  --   { "n", "i" },
  --   "<Leader>gpwv",
  --   "<cmd>GpWhisperVnew<cr>",
  --    desc = "Gpt Propmt Whisper Vnew"
  -- },
  -- {
  --   { "n", "i" },
  --   "<Leader>gpwt",
  --   "<cmd>GpWhisperTabnew<cr>",
  --    desc = "Gpt Propmt Whisper Tabnew"
  -- },
  --
  -- {
  --   "v",
  --   "<Leader>gpwp",
  --   ":<C-u>'<,'>GpWhisperPopup<cr>",
  --    desc = "Gpt Propmt Visual Whisper Popup"
  -- },
  -- {
  --   "v",
  --   "<Leader>gpwe",
  --   ":<C-u>'<,'>GpWhisperEnew<cr>",
  --    desc = "Gpt Propmt Visual Whisper Enew"
  -- },
  -- {
  --   "v",
  --   "<Leader>gpwn",
  --   ":<C-u>'<,'>GpWhisperNew<cr>",
  --    desc = "Gpt Propmt Visual Whisper New"
  -- },
  -- {
  --   "v",
  --   "<Leader>gpwv",
  --   ":<C-u>'<,'>GpWhisperVnew<cr>",
  --    desc = "Gpt Propmt Visual Whisper Vnew"
  -- },
  -- {
  --   "v",
  --   "<Leader>gpwt",
  --   ":<C-u>'<,'>GpWhisperTabnew<cr>",
  --    desc = "Gpt Propmt Visual Whisper Tabnew"
  -- },
})
