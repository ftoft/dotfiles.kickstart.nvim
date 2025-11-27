-- lua/custom/plugins/spell.lua

-- ========================================================================
-- 1. SPELL LANGUAGE AND AUTOCMD SETUP
-- ========================================================================

-- Set Global Language Preference (Fallback)
vim.opt.spelllang = 'en_us,da'

local spell_group = vim.api.nvim_create_augroup('CustomSpell', { clear = true })

-- Enable Spell Checking for Specific Filetypes
vim.api.nvim_create_autocmd('FileType', {
  group = spell_group,
  -- List your text/prose filetypes here
  pattern = { 'markdown', 'text', 'gitcommit', 'tex' },
  callback = function()
    -- Enable spell checking locally for this buffer
    vim.opt_local.spell = true
  end,
})

-- ========================================================================
-- 2. LANGUAGE SWITCHING FUNCTION
-- ========================================================================
local function change_spell_language()
  -- Retrieve the current spelllang value. It often returns a table (list)
  -- of strings, e.g., {'en_us', 'da'}.
  local current_lang_list = vim.opt_local.spelllang:get()

  -- Join the list into a comma-separated string to use as the prompt's default value.
  -- Lua's table.concat is used for this.
  local current_lang_str = table.concat(current_lang_list, ',')

  -- Prompt the user for a new language code
  local new_lang = vim.fn.input('Set Spell Language (e.g., en_us, da, none): ', current_lang_str)

  if new_lang == '' then
    return
  end

  -- Strip all whitespace (%s) globally from the user input
  new_lang = new_lang:gsub('%s', '')

  -- Special case: turn spell checking off locally
  if new_lang:lower() == 'none' then
    vim.opt_local.spell = false
    print '✅ Spell checking disabled for this buffer.'
    return
  end

  -- Set the new language and ensure spell checking is enabled
  vim.opt_local.spelllang = new_lang
  vim.opt_local.spell = true
  print('🌐 Spell language set to: ' .. new_lang)
end
-- ========================================================================
-- 3. KEYMAPS
-- ========================================================================

-- A. The new map for changing language
vim.keymap.set('n', '<leader>zl', change_spell_language, { desc = 'Set Spell Language' })

-- B. Toggle spelling manually (Existing map)
vim.keymap.set('n', '<leader>s', function()
  vim.opt.spell = not (vim.opt.spell:get())
end, { desc = 'Toggle [S]pell checking' })

-- C. Add word to dictionary (Existing map)
vim.keymap.set('n', '<leader>za', 'zg', { desc = 'Add word to dictionary' })

return {}
