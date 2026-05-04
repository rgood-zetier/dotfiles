return {
  "echasnovski/mini.icons",
  lazy = true,
  opts = {},
  init = function()
    -- Make mini.icons masquerade as nvim-web-devicons for plugins
    -- that haven't been updated to know about mini.icons yet
    package.preload["nvim-web-devicons"] = function()
      require("mini.icons").mock_nvim_web_devicons()
      return package.loaded["nvim-web-devicons"]
    end
  end,
}