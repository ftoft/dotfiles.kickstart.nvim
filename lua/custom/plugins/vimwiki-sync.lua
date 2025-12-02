return {
  {
    'michal-h21/vimwiki-sync',
    dependencies = { 'vimwiki/vimwiki' },

    -- only needs globals + our autocmds
    init = function()
      -- vimwiki-sync settings
      vim.g.sync_taskwarrior = 0
      vim.g.vimwiki_sync_branch = 'main'
      vim.g.vimwiki_sync_commit_message = 'Auto commit + push. %c'

      -- === Auto-reload only for files under ~/notes ===
      vim.o.autoread = true

      local notes_dir = vim.fn.expand '~/notes'

      -- Check for external changes for buffers in ~/notes
      vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
        callback = function(opts)
          local bufname = vim.api.nvim_buf_get_name(opts.buf)
          if bufname == '' then
            return
          end

          -- Only act on files inside ~/notes
          if bufname:sub(1, #notes_dir) == notes_dir then
            -- Only check this buffer, not all
            vim.cmd('checktime ' .. opts.buf)
          end
        end,
      })
    end,
  },
}
