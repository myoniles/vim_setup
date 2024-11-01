require('gitsigns').setup{
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']x', function()
      if vim.wo.diff then return ']x' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[x', function()
      if vim.wo.diff then return '[x' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    -- Default mappings use 'h' for hunk as in git hunk
    -- Change to 'x' because h is used by harpoon
    map('n', '<leader>xs', gs.stage_hunk)
    map('n', '<leader>xr', gs.reset_hunk)
    -- map('n', '<leader>xS', gs.stage_buffer)
    map('n', '<leader>xu', gs.undo_stage_hunk)
    -- map('n', '<leader>xR', gs.reset_buffer)
    map('n', '<leader>xp', gs.preview_hunk)
    map('n', '<leader>xb', function() gs.blame_line{full=true} end)
    -- map('n', '<leader>ctb', gs.toggle_current_line_blame)
    map('n', '<leader>xd', gs.diffthis)
    map('n', '<leader>xD', function() gs.diffthis('~') end)
    -- map('n', '<leader>ctd', gs.toggle_deleted) What does toggle delete even mean

    -- Visual
    map('v', '<leader>xs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('v', '<leader>xr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
