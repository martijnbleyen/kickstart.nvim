-- lua/custom/docker_status.lua
local M = {}

local cache = {
  status = nil,
  last_check = 0,
  interval = 10, -- seconds between checks
}

function M.get(container_name)
  local currentTime = os.time()

  if (currentTime - cache.last_check) > cache.interval then
    local handle = io.popen('docker ps | grep ' .. container_name .. ' 2>/dev/null')
    if handle then
      local result = handle:read '*a'
      handle:close()

      if result ~= nil and result ~= '' then
        cache.status = '%#StatuslineDockerUp# ● Docker up'
      else
        cache.status = '%#StatuslineDockerDown# ● Docker down'
      end
    else
      cache.status = '%#StatuslineDockerDown# Docker ?'
    end

    cache.last_check = currentTime
  end

  return cache.status
end

vim.api.nvim_set_hl(0, 'StatuslineDockerUp', { fg = '#00ff00' })
vim.api.nvim_set_hl(0, 'StatuslineDockerDown', { italic = true, fg = '#ff0000' })

return M
