-- Omarchy transparent background (from the omarchy-nvim package). Kept at this path because
-- Omarchy's theme hot reload re-sources stdpath("config")/plugin/after/transparency.lua.
local omarchy_transparency = "/etc/skel/.config/nvim/plugin/after/transparency.lua"

if vim.uv.fs_stat(omarchy_transparency) then
  dofile(omarchy_transparency)
end
