-- Omarchy theme integration, loaded from the omarchy-nvim package so it stays in sync
-- with Omarchy updates. No-op outside Omarchy (e.g. macOS).
--   all-themes.lua: installs every Omarchy colorscheme (lazy) so themes can switch live
--   omarchy-theme-hotreload.lua: reapplies plugins/theme.lua on lazy's LazyReload event
-- The theme spec itself is plugins/theme.lua, symlinked in config/lazy.lua.
-- Theme plugins are cloned into this profile's own data dir like any other plugin. Don't
-- point them at the package's prebuilt copies in /etc/skel/.local/share/nvim/lazy: those
-- are root-owned git repos, so :Lazy sync fails on git "dubious ownership" and helptags.
local skel = "/etc/skel/.config/nvim/lua/plugins/"

-- Upstream repos that no longer exist. all-themes.lua keeps them for Omarchy 3.8 themes
-- only; no Omarchy 4 theme uses them.
local gone = {
  ["gthelding/monokai-pro.nvim"] = true,
}

if not vim.uv.fs_stat(skel) then
  return {}
end

local specs = {}
for _, name in ipairs({ "all-themes.lua", "omarchy-theme-hotreload.lua" }) do
  local ok, spec = pcall(dofile, skel .. name)
  if ok and type(spec) == "table" then
    vim.list_extend(specs, spec)
  end
end

for _, spec in ipairs(specs) do
  if gone[spec[1]] then
    spec.enabled = false
  end
end

return specs
