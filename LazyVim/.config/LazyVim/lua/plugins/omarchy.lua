-- Omarchy theme integration, loaded from the omarchy-nvim package so it stays in sync
-- with Omarchy updates. No-op outside Omarchy (e.g. macOS).
--   all-themes.lua: installs every Omarchy colorscheme (lazy) so themes can switch live
--   omarchy-theme-hotreload.lua: reapplies plugins/theme.lua on lazy's LazyReload event
-- The theme spec itself is plugins/theme.lua, symlinked in config/lazy.lua.
local skel = "/etc/skel/.config/nvim/lua/plugins/"
-- The package ships these theme plugins prebuilt; use them instead of cloning (some
-- upstreams, e.g. gthelding/monokai-pro.nvim, are gone from GitHub)
local cache = "/etc/skel/.local/share/nvim/lazy/"

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
  local plugin = type(spec[1]) == "string" and (spec.name or spec[1]:match("[^/]+$"))
  if plugin and vim.uv.fs_stat(cache .. plugin) then
    spec.dir = cache .. plugin
  end
end

return specs
