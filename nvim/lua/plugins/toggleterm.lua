return {
  "akinsho/toggleterm.nvim",
  opts = {
    open_mapping = "<C-t>",
    direction = "float",
    size = function(term)
      if term.direction == "vertical" then
        return 80
      else
        return 12
      end
    end
  }
}
