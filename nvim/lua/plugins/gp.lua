-- using avante now
return {
  "robitx/gp.nvim",
  config = function()
    local conf = {
      -- For customization, refer to Install > Configuration in the Documentation/Readme
      --
      providers = {
        googleai = {
          endpoint = "https://generativelanguage.googleapis.com/v1beta/models/{{model}}:streamGenerateContent?key={{secret}}",
          --secret = os.getenv("GOOGLEAI_API_KEY"),
          secret = os.getenv("GEMINI_API_KEY"),
        },
        openai = {
          endpoint = "https://api.openai.com/v1/chat/completions",
          secret = os.getenv("OPENAI_API_KEY"),
        },
      },
      agents = {
        {
          provider = "googleai",
          name = "ChatGemini",
          chat = true,
          command = true,
          -- string with model name or table with model name and parameters
          model = { model = "gemini-2.0-flash", temperature = 1.1, top_p = 1 },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = require("gp.defaults").chat_system_prompt,
        },
      },
    }
    require("gp").setup(conf)

    -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
  end,
}
