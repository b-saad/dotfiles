return {
  -- Autopairs, integrates with both cmp and treesitter
  "windwp/nvim-autopairs",
  config = function()
    -- Setup nvim-autopairs
    local status_ok, npairs = pcall(require, "nvim-autopairs")
    if not status_ok then
      return
    end

    npairs.setup({
      check_ts = true,
      fast_wrap = {},
    })
  end
}
