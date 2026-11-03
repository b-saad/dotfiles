local mPrimary = 0xffcba6f7
local mSurface = 0xff1e1e2e
local mSecondary = 0xffab387
local mError = 0xfff38ba8
local mTertiary = 0xff94e2d5
local mSurface_lowest = 0xff212232

hl.config({
  general = {
    ["col.active_border"] = mPrimary, 
    ["col.inactive_border"] = mSurface,
  },

  group = {
      ["col.border_active"] = mSecondary,
      ["col.border_inactive"] = mSurface,
      ["col.border_locked_active"] = mError,
      ["col.border_locked_inactive"] = mSurface,

      groupbar = {
          ["col.active"] = mSecondary,
          ["col.inactive"] = mSurface,
          ["col.locked_active"] = mError,
          ["col.locked_inactive"] = mSurface,
      },
  },
})
