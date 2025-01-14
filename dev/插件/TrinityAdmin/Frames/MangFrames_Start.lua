﻿-------------------------------------------------------------------------------------------------------------
--
-- TrinityAdmin Version 3.x
-- TrinityAdmin is a derivative of MangAdmin.
--
-- Copyright (C) 2007 Free Software Foundation, Inc.
-- License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
-- This is free software: you are free to change and redistribute it.
-- There is NO WARRANTY, to the extent permitted by law.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--
-- Official Forums: http://groups.google.com/group/trinityadmin
-- GoogleCode Website: http://code.google.com/p/trinityadmin/
-- Subversion Repository: http://trinityadmin.googlecode.com/svn/
-- Dev Blog: http://trinityadmin.blogspot.com/
-------------------------------------------------------------------------------------------------------------

-- Initializing dynamic frames with LUA and FrameLib
-- This script must be listed in the .toc after "MangAdmin.lua"
-- Also some variables are globally taken from MangAdmin.lua

function MangAdmin:CreateStartFrames()
  local transparency = {
    bg = MangAdmin.db.account.style.transparency.backgrounds,
    btn = MangAdmin.db.account.style.transparency.buttons,
    frm = MangAdmin.db.account.style.transparency.frames
  }
  local color = {
    bg = MangAdmin.db.account.style.color.backgrounds,
    btn = MangAdmin.db.account.style.color.buttons,
    frm = MangAdmin.db.account.style.color.frames
  }
  
  -- [[ Main Elements ]]
  FrameLib:BuildFrame({
    name = "ma_bgframe",
    group = "bg",
    parent = UIParent,
    texture = {
      color = {color.bg.r, color.bg.g, color.bg.b, transparency.bg}
    },
    draggable = true,
    size = {
      width = 750,
      height = 440
    },
    setpoint = {
      pos = "CENTER"
    },
    inherits = nil
  })

  FrameLib:BuildFrame({
    name = "ma_menubgframe",
    group = "bg",
    parent = ma_bgframe,
    texture = {
      color = {color.frm.r, color.frm.g, color.frm.b, transparency.frm}
    },
    size = {
      width = 750,
      height = 22
    },
    setpoint = {
      pos = "TOPLEFT",
      offY = 22,
      offX = 0
    },
    inherits = nil
  })

  FrameLib:BuildFrame({
    name = "ma_topframe",
    group = "bg",
    parent = ma_bgframe,
    texture = {
      color = {color.frm.r, color.frm.g, color.frm.b, transparency.frm}
    },
    size = {
      width = 750,
      height = 80
    },
    setpoint = {
      pos = "TOP",
      offY = -2
    },
    inherits = nil
  })

  FrameLib:BuildFrame({
    name = "ma_midframe",
    group = "bg",
    parent = ma_bgframe,
    texture = {
      color = {color.frm.r, color.frm.g, color.frm.b, transparency.frm}
    },
    size = {
      width = 750,
      height = 254
    },
    setpoint = {
      pos = "TOP",
      offY = -83
    },
    inherits = nil
  })

  FrameLib:BuildFrame({
    name = "ma_leftframe",
    group = "bg",
    parent = ma_bgframe,
    texture = {
      color = {color.frm.r, color.frm.g, color.frm.b, transparency.frm}
    },
    size = {
      width = 409,
      height = 100
    },
    setpoint = {
      pos = "TOP",
      offX = -168.5,
      offY = -338
    },
    inherits = nil
  })

  FrameLib:BuildFrame({
    name = "ma_rightframe",
    group = "bg",
    parent = ma_bgframe,
    texture = {
      color = {color.frm.r, color.frm.g, color.frm.b, transparency.frm}
    },
    size = {
      width = 335,
      height = 100
    },
    setpoint = {
      pos = "TOP",
      offX = 205.5,
      offY = -338
    },
    inherits = nil
  })

  FrameLib:BuildFrame({
    name = "ma_logoframe",
    group = "bg",
    parent = ma_topframe,
    texture = {
      file = ROOT_PATH.."Textures\\logo.tga"
    },
    size = {
      width = 512,
      height = 64
    },
    setpoint = {
      pos = "LEFT",
      offX = 10
    },
    inherits = nil
  })

  FrameLib:BuildFontString({
    name = "ma_toptext",
    group = "bg",
    parent = ma_topframe,
    text = "toptext, you should not see this!",
    setpoint = {
      pos = "BOTTOMRIGHT",
      offX = -10,
      offY = 24
    }
  })

    FrameLib:BuildFontString({
    name = "ma_revtext",
    group = "bg",
    parent = ma_topframe,
    text = MAJOR_VERSION.." "..MINOR_VERSION,
    setpoint = {
      pos = "BOTTOMLEFT",
      offX = 15,
      offY = 2
    }
  })

  FrameLib:BuildFontString({
    name = "ma_top2text",
    group = "bg",
    parent = ma_topframe,
    text = "toptext, you should not see this!",
    setpoint = {
      pos = "BOTTOMRIGHT",
      offX = -10,
      offY = 10
    }
  })
  
  FrameLib:BuildFontString({
    name = "ma_infoonlinetext",
    group = "bg",
    parent = ma_rightframe,
    text = "在线玩家: ...",
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -10
    }
  })
  
  FrameLib:BuildFontString({
    name = "ma_infomaxonlinetext",
    group = "bg",
    parent = ma_rightframe,
    text = "最大在线: ...",
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -25
    }
  })
  
  FrameLib:BuildFontString({
    name = "ma_infouptimetext",
    group = "bg",
    parent = ma_rightframe,
    text = "服务器正常运行时间: ...",
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -40
    }
  })
  
  FrameLib:BuildFontString({
    name = "ma_inforevisiontext",
    group = "bg",
    parent = ma_rightframe,
    text = "TrinityCore 修订: ...",
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -55
    }
  })
  
--  FrameLib:BuildFontString({
--    name = "ma_infoplatformtext",
--    group = "bg",
--    parent = ma_rightframe,
--    text = "Server Platform: ...",
--    setpoint = {
--      pos = "TOPLEFT",
--      offX = 10,
--      offY = -70
--    }
--  })
  
  FrameLib:BuildButton({
    name = "ma_inforefreshbutton",
    group = "bg",
    parent = ma_rightframe,
    texture = {
      name = "ma_inforefreshbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 60,
      height = 20
    },
    setpoint = {
      pos = "TOPRIGHT",
      offX = -10,
      offY = -10
    },
    text = "刷新"
  })

  FrameLib:BuildFrame({
    name = "ma_languagedropdown",
    group = "bg",
    parent = ma_topframe,
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPRIGHT",
      offX = -200,
      offY = -10
    },
    inherits = "UIDropDownMenuTemplate"
  })

  FrameLib:BuildButton({
    name = "ma_languagebutton",
    group = "bg",
    parent = ma_topframe,
    texture = {
      name = "ma_languagebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 120,
      height = 20
    },
    setpoint = {
      pos = "TOPRIGHT",
      offX = -10,
      offY = -14
    },
    text = Locale["ma_LanguageButton"]
  })
end
