return {
  'nvim-neorg/neorg',
  lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = '*', -- Pin Neorg to the latest stable release
  config = true,
  opts = {
    load = {
      ['core.defaults'] = {},
      ['core.concealer'] = {
        config = {
          icon_preset = 'varied',
        },
      },
      ['core.dirman'] = {
        config = {
          workspaces = {
            my_notes = '~/notes', -- Format: <name_of_workspace> = <path_to_workspace_root>
          },
          index = 'index.norg', -- The name of the main (root) .norg file
        },
      },
      ['core.itero'] = {},
      ['core.promo'] = {},
    },
  },
  init = function()
    vim.opt.conceallevel = 2
    vim.opt.concealcursor = 'nc'
  end,
}
