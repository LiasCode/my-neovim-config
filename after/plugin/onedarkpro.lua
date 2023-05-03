require("onedarkpro").setup({
  options = {
    transparency = true,
    cursorline = true,
  },
  styles = {
    types = "NONE",
    methods = "NONE",
    numbers = "NONE",
    strings = "NONE",
    comments = "italic",
    keywords = "bold,italic",
    constants = "NONE",
    functions = "bold",
    operators = "NONE",
    variables = "NONE",
    parameters = "NONE",
    conditionals = "italic",
    virtual_text = "bold,italic",
  }
});

vim.cmd.colorscheme('onedark_vivid');
