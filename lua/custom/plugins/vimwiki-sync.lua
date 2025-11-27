return {
  {
    'michal-h21/vimwiki-sync',
    dependencies = { 'vimwiki/vimwiki' },

    -- only needs globals, so `init` is fine
    init = function()
      -- Disable Taskwarrior integration (unless you use it)
      vim.g.sync_taskwarrior = 0

      -- Optional: pick a branch to sync against
      vim.g.vimwiki_sync_branch = 'main'

      -- Optional: custom commit message (strftime-style)
      vim.g.vimwiki_sync_commit_message = 'Auto commit + push. %c'
    end,
  },
}
