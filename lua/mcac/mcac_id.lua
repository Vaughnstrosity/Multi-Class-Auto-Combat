--[[
mcac/mcac_id.lua -- which server and character is playing

Library module (not a plugin): per-character files are keyed by server AND
character, so the same character name on two servers keeps separate settings.

  M.server()                 raw server name ('' when unknown)
  M.serverTag()              filename-safe server name ('unknown' when unknown)
  M.migrateFile(old, new)    copy `old` to `new` when `new` does not exist yet
]]

local M = {}

local function tlo(fn)
    local ok, v = pcall(fn)
    if ok and v ~= nil then return tostring(v) end
    return ''
end

function M.server()
    local okMq, mq = pcall(require, 'mq')
    if not okMq or type(mq) ~= 'table' or not mq.TLO then return '' end
    local s = tlo(function() return mq.TLO.EverQuest.ServerName() end)
    if s == '' then s = tlo(function() return mq.TLO.Zone.Server() end) end
    return s
end

function M.tag(s)
    s = tostring(s or ''):gsub('[^%w%_-]', '_')
    return s
end

function M.serverTag()
    local s = M.server()
    if s == '' then return 'unknown' end
    return M.tag(s)
end

local function exists(path)
    local f = io.open(path, 'rb')
    if f then f:close() return true end
    return false
end

-- Pre-server-tag installs saved these files per character name only. The first
-- server a character logs in on claims a COPY of that file (the original is
-- left untouched, so a second server's first start copies it too).
function M.migrateFile(old, new)
    if old == new or exists(new) or not exists(old) then return false end
    local fi = io.open(old, 'rb')
    if not fi then return false end
    local data = fi:read('*a')
    fi:close()
    local fo = io.open(new, 'wb')
    if not fo then return false end
    fo:write(data)
    fo:close()
    return true
end

return M
