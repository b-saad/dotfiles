return {
  "lukas-reineke/indent-blankline.nvim", -- Indent guides
  main = "ibl",
  config = function ()
    local ibl = require("ibl")
    ibl.setup({
     exclude = {
        buftypes = {
          "terminal",
          "nofile",
        },
        filetypes = {
          "help",
          "startify",
          "dashboard",
          "packer",
          "neogitstatus",
          "NvimTree",
          "Trouble",
        }
      },
    })
  end
}

