return {
  { "nvim-neotest/neotest-plenary" },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "marilari88/neotest-vitest",
      "nvim-neotest/neotest-jest",
    },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      table.insert(opts.adapters, require("neotest-plenary"))
      table.insert(opts.adapters, require("neotest-vitest"))
      table.insert(
        opts.adapters,
        require("neotest-jest")({
          jestCommand = "npm test --",
          cwd = vim.fn.getcwd(),
          jestConfigFile = function(path)
            -- Use async-safe vim.fs.find instead of vim.fn.glob
            local dir = vim.fs.dirname(path)
            local configs = vim.fs.find(
              { "jest.config.js", "jest.config.ts", "jest.config.mjs", "jest.config.cjs" },
              { path = dir, upward = true }
            )
            if #configs > 0 then
              return configs[1]
            end
            -- Fallback to package.json
            local pkg = vim.fs.find("package.json", { path = dir, upward = true })
            if #pkg > 0 then
              return pkg[1]
            end
            return nil
          end,
        })
      )
    end,
  },
}
