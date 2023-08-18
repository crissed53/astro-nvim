return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    -- local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    local null_ls = require "null-ls"

    local formatting = null_ls.builtins.formatting
    local linter = null_ls.builtins.diagnostics
    config.sources = {
      formatting.prettierd,
      formatting.black.with {
        extra_args = { "--preview", "-l", "80" },
      },
      formatting.stylua,
      formatting.shellharden,
      formatting.isort.with {
        extra_args = { "--profile", "black" },
      },

      linter.ruff,
      linter.eslint,
    }
    return config -- return final config table
  end,
}
