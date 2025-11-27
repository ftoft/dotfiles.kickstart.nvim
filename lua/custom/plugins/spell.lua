-- lua/custom/plugins/spell.lua

-- 1. Enable Spell Checking
vim.opt.spell = true

-- 2. Set Languages (English US first, then Danish)
vim.opt.spelllang = 'en_us,da'

-- 3. Optional: Configure how speller suggestions appear
-- This limits the popup menu height to 10 items
vim.opt.pumheight = 10

-- 4. Keymaps (Optional but recommended)
-- Toggle spelling with <leader>s
vim.keymap.set('n', '<leader>s', function()
  vim.opt.spell = not (vim.opt.spell:get())
end, { desc = 'Toggle [S]pell checking' })

-- Add word to dictionary with <leader>za
-- (Standard vim is 'zg', but this maps it to a leader key for consistency)
vim.keymap.set('n', '<leader>za', 'zg', { desc = 'Add word to dictionary' })

-- RETURN AN EMPTY TABLE
-- This is crucial. Kickstart/Lazy expects a plugin spec here.
-- By returning {}, we tell Lazy "there are no external plugins to install here,"
-- but the code above still executes on startup.
return {}
