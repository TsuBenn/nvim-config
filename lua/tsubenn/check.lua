local M = {}

M.check_prerequisites = function()
  local missing = {}
  
  -- Check for Node.js (needed for tsserver, eslint)
  if vim.fn.executable("node") ~= 1 then
    table.insert(missing, "Node.js")
  end
  
  -- Check for Python (needed for pyright)
  if vim.fn.executable("python") ~= 1 and vim.fn.executable("python3") ~= 1 then
    table.insert(missing, "Python")
  end
  
  -- Show warning if prerequisites are missing
  if #missing > 0 then
    vim.schedule(function()
      vim.notify(
        "Missing prerequisites: " .. table.concat(missing, ", ") .. "\n" ..
        "Please install them for full LSP functionality:\n" ..
        "- Node.js: winget install OpenJS.NodeJS\n" ..
        "- Python: winget install Python.Python.3\n" ..
        "- Ruby: winget install RubyInstallerTeam.Ruby",
        vim.log.levels.WARN,
        { title = "LSP Prerequisites", timeout = 10000 }
      )
    end)
  end
end

return M
