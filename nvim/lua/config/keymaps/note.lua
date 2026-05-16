local num = 0
function add_note(desc)
  -- lua format string:
  -- string.format("Player: %s, Score: %.2f", name, score)
  vim.keymap.set("n", "<Leader>?" .. tostring(num), "", { desc = desc })
  num = num + 1
end
-- Use whickkey and empty keymap as notes
--

add_note("C-x C-O for omni completion, like in dap repl pane")
add_note("]s to jump to next misspelled word")
