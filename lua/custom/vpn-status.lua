local M = {}

local cache = {
  status = nil,
  last_check = 0,
  interval = 10, -- seconds between checks
}

function M.check()
  local currentTime = os.time()

  if (currentTime - cache.last_check) > cache.interval then
    local handle = io.popen "ps aux | grep -i 'Azure VPN Client' | grep -i MacTunnelExtension | grep -v grep 2>/dev/null"
    if handle then
      local result = handle:read '*a'
      handle:close()

      if result ~= nil and result ~= '' then
        cache.status = '%#StatuslineVpnUp# ● VPN up'
      else
        cache.status = '%#StatuslineVpnDown# ● VPN down'
      end
    else
      cache.status = '%#StatuslineVpnDown# VPN ?'
    end

    cache.last_check = currentTime
  end

  return cache.status
end

vim.api.nvim_set_hl(0, 'StatuslineVpnUp', { fg = '#00ff00' })
vim.api.nvim_set_hl(0, 'StatuslineVpnDown', { italic = true, fg = '#ff0000' })

return M
