return {
  {
    'vimwiki/vimwiki',

    -- Global config must go in `init` so it's set BEFORE the plugin loads
    init = function()
      vim.g.vimwiki_list = {
        {
          path = '~/notes/',
          syntax = 'markdown',
          ext = '.md',
        },
      }

      -- Only treat files in vimwiki_list as wikis
      vim.g.vimwiki_global_ext = 1

      -- (Optional) make sure .md is mapped to markdown
      vim.g.vimwiki_ext2syntax = {
        ['.md'] = 'markdown',
      }
    end,
  },
}
