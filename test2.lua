-- Join @SIXTIININE for more codes and scripts

PS = L0_0
function L0_0(A0_3, A1_4, A2_5)
  PS("Modify address value (address, numeric type, value to be modified)")
  ;({
    [1] = {}
  })[1].address = A0_3
  ;({
    [1] = {}
  })[1].flags = A1_4
  ;({
    [1] = {}
  })[1].value = A2_5
  gg.setValues({
    [1] = {}
  })
end

setvalue = L0_0
function L0_0(A0_6, A1_7)
  local L2_8, L3_9, L4_10
  L2_8 = 1
  L3_9 = 1
  L4_10 = {}
  while true do
    if not string.find(A0_6, A1_7, L2_8) then
      L4_10[L3_9] = string.sub(A0_6, L2_8, string.len(A0_6))
      break
    end
    L4_10[L3_9] = string.sub(A0_6, L2_8, string.find(A0_6, A1_7, L2_8) - 1)
    L2_8 = string.find(A0_6, A1_7, L2_8) + string.len(A1_7)
    L3_9 = L3_9 + 1
  end
  return L4_10
end

split = L0_0
function L0_0(A0_11, A1_12)
  local L2_13, L3_14, L4_15, L5_16
  L2_13 = 1
  L3_14 = #A1_12
  for _FORV_5_ = 1, #A1_12 do
    xgpy = A0_11 + A1_12[_FORV_5_].offset
    xglx = A1_12[_FORV_5_].type
    xgsz = A1_12[_FORV_5_].value
    xgdj = A1_12[_FORV_5_].freeze
    if xgdj == nil or xgdj == "" then
      gg.setValues({
        [1] = {
          address = xgpy,
          flags = xglx,
          value = xgsz
        }
      })
    else
      gg.addListItems({
        [1] = {
          address = xgpy,
          flags = xglx,
          freeze = xgdj,
          value = xgsz
        }
      })
    end
    xgsl = xgsl + 1
    xgjg = true
  end
end

xgxc = L0_0
function L0_0(A0_17)
  gg.clearResults()
  gg.setVisible(false)
  gg.setRanges(A0_17[1].memory)
  gg.searchNumber(A0_17[3].value, A0_17[3].type)
  if gg.getResultCount() == 0 then
    gg.toast(A0_17[2].name .. " Failed")
  else
    gg.refineNumber(A0_17[3].value, A0_17[3].type)
    gg.refineNumber(A0_17[3].value, A0_17[3].type)
    gg.refineNumber(A0_17[3].value, A0_17[3].type)
    xxx = gg.getResultCount()
    if gg.getResultCount() == 0 then
      gg.toast(A0_17[2].name .. " Failed")
    else
      sl = gg.getResults(10099)
      sz = gg.getResultCount()
      xgsl = 0
      if 10099 < sz then
        sz = 10099
      end
      for _FORV_4_ = 1, sz do
        pdsz = true
        for _FORV_8_ = 4, #A0_17 do
          if pdsz == true then
            pysz = {}
            pysz[1] = {}
            pysz[1].address = sl[_FORV_4_].address + A0_17[_FORV_8_].offset
            pysz[1].flags = A0_17[_FORV_8_].type
            szpy = gg.getValues(pysz)
            pdpd = A0_17[_FORV_8_].lv .. ";" .. szpy[1].value
            szpd = split(pdpd, ";")
            tzszpd = szpd[1]
            pyszpd = szpd[2]
            if tzszpd == pyszpd then
              pdjg = true
              pdsz = true
            else
              pdjg = false
              pdsz = false
            end
          end
        end
        if pdjg == true then
          szpy = sl[_FORV_4_].address
          xgxc(szpy, qmxg)
        end
      end
      if xgjg == true then
        gg.toast(A0_17[2].name ..[[

Found: ]] .. xxx .. " Edited: " .. xgsl .. "")
      else
        gg.toast(A0_17[2].name .. " Failed")
      end
    end
  end
  gg.clearResults()
end

xqmnb = L0_0
function L0_0(A0_18, A1_19, A2_20)
  local L3_21
  L3_21 = {}
  L3_21[1] = {}
  L3_21[1].address = A0_18
  L3_21[1].flags = A1_19
  L3_21[1].value = A2_20
  gg.setValues(L3_21)
end

setvalue = L0_0
L0_0 = {}
function patch(A0_22, A1_23, A2_24, A3_25)
  ;({
    [1] = {}
  })[1].address = gg.getRangesList(A0_22)[1].start + A1_23
  ;({
    [1] = {}
  })[1].flags = A3_25
  ;({
    [1] = {}
  })[1].value = A2_24
  gg.setValues({
    [1] = {}
  })
end

function setvalue(A0_26, A1_27, A2_28)
  local L3_29
  L3_29 = {}
  L3_29[1] = {}
  L3_29[1].address = A0_26
  L3_29[1].flags = A1_27
  L3_29[1].value = A2_28
  gg.setValues(L3_29)
end

function WriteBaseAddress_DWORD(A0_30, A1_31, A2_32)
  if gg.getRangesList(A0_30) and #gg.getRangesList(A0_30) > 0 then
    ;({
      [1] = {}
    })[1].address = gg.getRangesList(A0_30)[1].start + A1_31
    ;({
      [1] = {}
    })[1].value = A2_32
    ;({
      [1] = {}
    })[1].flags = 4
    ;({
      [1] = {}
    })[1].freeze = true
    gg.setValues({
      [1] = {}
    })
  end
end

if os.date("%Y%m%d") > "20330919" then
  hh = gg.alert("⚠⚠Script expired⚠⚠")
  os.exit()
end
function alert()
  X = gg.alert("    🔸Zᴀɪ ᴍᴏᴅᴢ ᴏɴʟɪɴᴇ ʟᴏᴀᴅᴇʀ🔸\n            🔸ᴠᴀʟɪᴅᴀᴛɪᴏɴ : 3ᴅᴀʏꜱ🔸\n\n            🔸ʙʏᴘᴀꜱꜱ ᴍᴇɴᴜ [ ᴠɪᴘ ]🔸\n                🔸ɴᴏ ᴋɪʟʟꜱ ʟɪᴍɪᴛ🔸\n\n                 🔸ᴄʜᴀɴɢᴇ ʟᴏɢꜱ:🔸\n  🔸ᴍᴀɢɪᴄ ʙᴜʟʟᴇᴛ ᴀᴜᴛᴏʜᴇᴀᴅ ʟᴏᴏᴘ🔸\n              🔸ɪᴍᴘʀᴏᴠᴇᴅ ʙʏᴘᴀꜱꜱ🔸\n\n   🔸ꜱᴇɴᴅ ꜰᴇᴇᴅʙᴀᴄᴋ ᴀꜰᴛᴇʀ ᴜꜱɪɴɢ 🔸\n 🔸ɪꜰ ᴛʜᴇʀᴇ'ꜱ ᴀɴʏ ʙᴜɢ ᴅᴍ ᴍᴇ ꜰᴀꜱᴛ🔸\n", "[🔸ᴏᴘᴇɴ sᴄʀɪᴘᴛ🔸]", "[🔸ᴇxɪᴛ sᴄʀɪᴘᴛ🔸]")
  if X == 1 then
    return
  end
  if X == 2 then
    os.exit()
  end
end

alert()
function HOME()
  MN = gg.choice({
    "🔸╔═══🔸•ೋ° °ೋ•🔸═══╗🔸\n                 𝐁𝐘𝐏𝐀𝐒𝐒 𝐌𝐄𝐍𝐔\n🔸╚═══🔸•ೋ° °ೋ•🔸═══╝🔸",
    "🔸╔═══🔸•ೋ° °ೋ•🔸═══╗🔸\n               𝐌𝐄𝐌𝐎𝐑𝐘 𝐇𝐀𝐂𝐊\n🔸╚═══🔸•ೋ° °ೋ•🔸═══╝🔸",
    "🔸╔═══🔸•ೋ° °ೋ•🔸═══╗🔸\n                           𝐄𝐗𝐈𝐓\n🔸╚═══🔸•ೋ° °ೋ•🔸═══╝🔸"
  }, nil, "  ")
  if MN == nil then
  else
    if MN == 1 then
      Bypass()
    end
    if MN == 2 then
      Memory()
    end
    if MN == 3 then
      Exit()
    end
  end
  HOMEDM = -1
end

function Bypass()
  MN1 = gg.choice({
    " ╔═══━━━━━━━━━━━━━━═══╗\n  ʙʏᴘᴀꜱꜱ ʟᴏɢᴏ {ᴅɪꜱᴀʙʟᴇ ᴅᴇᴛᴇᴄᴛɪᴏɴꜱ}\n ╚═══━━━━━━━━━━━━━━═══╝",
    " ╔═══━━━━━━━━━━━━━━═══╗\n💠ʙʏᴘᴀꜱꜱ ʟᴏʙʙʏ {ᴀɴᴛɪ ʙᴏᴛ ʟᴏʙʙʏ}💠\n ╚═══━━━━━━━━━━━━━━═══╝",
    " ╔═══━━━━━━━━━━━━━━═══╗\n                 💠ᴀɴᴛɪ ʀᴇᴘᴏʀᴛ💠\n ╚═══━━━━━━━━━━━━━━═══╝",
    " ╔═══━━━━━━━━━━━━━━═══╗\n             💠ʙʟᴏᴄᴋ ꜱᴘᴇᴄᴛᴀᴛᴇ💠\n ╚═══━━━━━━━━━━━━━━═══╝",
    " ╔═══━━━━━━━━━━━━━━═══╗\n           💠ᴀɴᴛɪᴄʜᴇᴀᴛ ᴄʜᴇᴄᴋᴇʀ💠\n ╚═══━━━━━━━━━━━━━━═══╝",
    " ╔════════════════════╗\n                        🔰ʙᴀᴄᴋ🔰\n ╚════════════════════╝"
  }, nil, "")
  if MN1 == nil then
  else
    if MN1 == 1 then
      logo()
    end
    if MN1 == 2 then
      lobby()
    end
    if MN1 == 3 then
      report()
    end
    if MN1 == 4 then
      spectate()
    end
    if MN1 == 5 then
      checker()
    end
    if MN1 == 6 then
      HOME()
    end
  end
  HOMEDM = -1
end

function logo()
  function WriteSignatures(A0_33, A1_34)
    gg.setRanges(16384)
    gg.searchNumber("h" .. A0_33)
    gg.getResults(100)
    gg.editAll("h" .. A1_34, 1)
  end
  
  function split(A0_35, A1_36)
    local L2_37, L3_38, L4_39
    L2_37 = 1
    L3_38 = 1
    L4_39 = {}
    while true do
      if not string.find(A0_35, A1_36, L2_37) then
        L4_39[L3_38] = string.sub(A0_35, L2_37, string.len(A0_35))
        break
      end
      L4_39[L3_38] = string.sub(A0_35, L2_37, string.find(A0_35, A1_36, L2_37) - 1)
      L2_37 = string.find(A0_35, A1_36, L2_37) + string.len(A1_36)
      L3_38 = L3_38 + 1
    end
    return L4_39
  end
  
  function xgxc(A0_40, A1_41)
    local L2_42, L3_43, L4_44, L5_45
    L2_42 = 1
    L3_43 = #A1_41
    for _FORV_5_ = 1, #A1_41 do
      xgpy = A0_40 + A1_41[_FORV_5_].offset
      xglx = A1_41[_FORV_5_].type
      xgsz = A1_41[_FORV_5_].value
      xgdj = A1_41[_FORV_5_].freeze
      if xgdj == nil or xgdj == "" then
        gg.setValues({
          [1] = {
            address = xgpy,
            flags = xglx,
            value = xgsz
          }
        })
      else
        gg.addListItems({
          [1] = {
            address = xgpy,
            flags = xglx,
            freeze = xgdj,
            value = xgsz
          }
        })
      end
      xgsl = xgsl + 1
      xgjg = true
    end
  end
  
  function xqmnb(A0_46)
    gg.setRanges(A0_46[1].memory)
    gg.searchNumber(A0_46[3].value, A0_46[3].type)
    if gg.getResultCount() == 0 then
      gg.toast(A0_46[2].name .. "开启失败")
    else
      gg.refineNumber(A0_46[3].value, A0_46[3].type)
      gg.refineNumber(A0_46[3].value, A0_46[3].type)
      gg.refineNumber(A0_46[3].value, A0_46[3].type)
      if gg.getResultCount() == 0 then
        gg.toast(A0_46[2].name .. "开启失败")
      else
        sl = gg.getResults(10099)
        sz = gg.getResultCount()
        xgsl = 0
        if 10099 < sz then
          sz = 10099
        end
        for _FORV_4_ = 1, sz do
          pdsz = true
          for _FORV_8_ = 4, #A0_46 do
            if pdsz == true then
              pysz = {}
              pysz[1] = {}
              pysz[1].address = sl[_FORV_4_].address + A0_46[_FORV_8_].offset
              pysz[1].flags = A0_46[_FORV_8_].type
              szpy = gg.getValues(pysz)
              pdpd = A0_46[_FORV_8_].lv .. ";" .. szpy[1].value
              szpd = split(pdpd, ";")
              tzszpd = szpd[1]
              pyszpd = szpd[2]
              if tzszpd == pyszpd then
                pdjg = true
                pdsz = true
              else
                pdjg = false
                pdsz = false
              end
            end
          end
          if pdjg == true then
            szpy = sl[_FORV_4_].address
            xgxc(szpy, qmxg)
          end
        end
        if xgjg == true then
          gg.toast(A0_46[2].name .. "开启成功,共修改" .. xgsl .. "条数据")
        else
          gg.toast(A0_46[2].name .. "开启失败")
        end
      end
    end
  end
  
  WriteSignatures("00 76 61 70", "00 00 A0 E3 1E")
  gg.clearResults()
  function ZAIB1(A0_47, A1_48, A2_49, A3_50, A4_51)
    lib2 = A0_47
    A0_47 = {
      pcall(gg.getRangesList, lib2)
    }
    if A0_47[1] then
      if A0_47[2][1] == nil then
        A0_47 = lib2
      else
        A0_47 = A0_47[2][1].start
      end
    else
      A0_47 = lib2
    end
    gg.setValues({
      {
        address = A0_47 + A1_48,
        flags = A2_49,
        value = A3_50,
        freeze = A4_51
      }
    })
    gg.addListItems({
      {
        address = A0_47 + A1_48,
        flags = A2_49,
        value = A3_50,
        freeze = A4_51
      }
    })
    return true
  end
  
  ZAIB1("libanogs.so", 7620, gg.TYPE_DWORD, "h 00 20 70 47")
  ZAIB1("libanogs.so", 7624, gg.TYPE_DWORD, "h 00 20 70 47")
  ZAIB1("libanogs.so", 7628, gg.TYPE_DWORD, "h 00 20 70 47")
  ZAIB1("libanogs.so", 7632, gg.TYPE_DWORD, "h 00 20 70 47")
  ZAIB1("libanogs.so", 7636, gg.TYPE_DWORD, "h 00 20 70 47")
  ZAIB1("libanogs.so", 7640, gg.TYPE_DWORD, "h 00 20 70 47")
  ZAIB1("libanogs.so", 7644, gg.TYPE_DWORD, "h 00 20 70 47")
  ZAIB1("libanogs.so", 7648, gg.TYPE_DWORD, "h 00 20 70 47")
  ZAIB1("libanogs.so", 7652, gg.TYPE_DWORD, "h 00 20 70 47")
  ZAIB1("libanogs.so", 7656, gg.TYPE_DWORD, "h 00 20 70 47")
  ZAIB1("libanogs.so", 7660, gg.TYPE_DWORD, "h 00 20 70 47")
  ZAIB1("libanogs.so", 8168, gg.TYPE_DWORD, "h 00 20 70 47")
  ZAIB1("libanogs.so", 8980, gg.TYPE_DWORD, "h 00 20 70 47")
  gg.alert("🔸ʙʏᴘᴀꜱꜱ ʟᴏɢᴏ [ ᴅɪꜱᴀʙʟᴇ ᴅᴇᴛᴇᴄᴛɪᴏɴꜱ ]🔸 \n🔸ɢᴀᴍᴇ ᴀɴᴛɪᴄʜᴇᴀᴛ ᴋɪʟʟᴇᴅ🔸\n🔸ᴅᴏɴᴇ🔸")
end

function lobby()
  function ZAIB2(A0_52, A1_53, A2_54, A3_55, A4_56)
    lib2 = A0_52
    A0_52 = {
      pcall(gg.getRangesList, lib2)
    }
    if A0_52[1] then
      if A0_52[2][1] == nil then
        A0_52 = lib2
      else
        A0_52 = A0_52[2][1].start
      end
    else
      A0_52 = lib2
    end
    gg.setValues({
      {
        address = A0_52 + A1_53,
        flags = A2_54,
        value = A3_55,
        freeze = A4_56
      }
    })
    gg.addListItems({
      {
        address = A0_52 + A1_53,
        flags = A2_54,
        value = A3_55,
        freeze = A4_56
      }
    })
    return true
  end
  
  ZAIB2("libanogs.so", 2431216, gg.TYPE_DWORD, "h 00 20 70 47")
  ZAIB2("libanogs.so", 2431220, gg.TYPE_DWORD, "h 00 20 70 47")
  ZAIB2("libanogs.so", 2431224, gg.TYPE_DWORD, "h 00 20 70 47")
  ZAIB2("libanogs.so", 2431228, gg.TYPE_DWORD, "h 00 20 70 47")
  ZAIB2("libanogs.so", 2431232, gg.TYPE_DWORD, "h 00 20 70 47")
  ZAIB2("libanogs.so", 2431236, gg.TYPE_DWORD, "h 00 20 70 47")
  ZAIB2("libanogs.so", 2431240, gg.TYPE_DWORD, "h 00 20 70 47")
  ZAIB2("libanogs.so", 2431244, gg.TYPE_DWORD, "h 00 20 70 47")
  ZAIB2("libanogs.so", 2431248, gg.TYPE_DWORD, "h 00 20 70 47")
  gg.alert("🔸ʙʏᴘᴀꜱꜱ ʟᴏʙʙʏ [ ᴀɴᴛɪ ʙᴏᴛ ʟᴏʙʙʏ ]🔸\n🔸ɢᴀᴍᴇ ᴀɴᴛɪᴄʜᴇᴀᴛ ᴋɪʟʟᴇᴅ🔸\n🔸ᴅᴏɴᴇ🔸")
end

function report()
  gg.setVisible(false)
  gg.searchNumber("2621443;1;52;6;288;4;308;188;29616;16;37352;256;32514;5;4096;39648;35552;36360;40456", 4, false, 536870912, 0, -1, 0)
  gg.getResults(1009)
  gg.editAll(0, 4)
  gg.clearResults()
  gg.toast("🔸sᴇᴄᴜʀᴇᴅ ■□□□□□□□🔸")
  gg.toast("🔸sᴇᴄᴜʀᴇᴅ ■■□□□□□□🔸")
  gg.toast("🔸sᴇᴄᴜʀᴇᴅ ■■■□□□□□🔸")
  gg.toast("🔸sᴇᴄᴜʀᴇᴅ ■■■■□□□□🔸")
  gg.toast("🔸sᴇᴄᴜʀᴇᴅ ■■■■■□□□🔸")
  gg.toast("🔸sᴇᴄᴜʀᴇᴅ ■■■■■■□□🔸")
  gg.toast("🔸sᴇᴄᴜʀᴇᴅ ■■■■■■■□🔸")
  gg.toast("🔸sᴇᴄᴜʀᴇᴅ ■■■■■■■■🔸")
  gg.alert("🔸ꜰᴀʀʟɪɢʜᴛ ᴀɴᴛɪ ʀᴇᴘᴏʀᴛ ᴏɴ🔸\n🔸ʙʟᴏᴄᴋᴇᴅ ʀᴇᴘᴏʀᴛꜱ ɪɴɢᴀᴍᴇ🔸\n🔸ɴᴏ 10ʏᴇᴀʀꜱ ʙᴀɴ🔸\n🔸ɴᴏ 1ʏᴇᴀʀꜱ ʙᴀɴ🔸")
end

function spectate()
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169534870898
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569536068
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569536082
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569536100
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569536146
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569536320
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569536384
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569536388
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569536392
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569536406
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569538084
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569538184
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569538326
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569538336
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569538340
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569538344
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569538368
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569538368
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569538404
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569538450
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569538646
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569538824
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569538834
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569538888
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569539072
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569539090
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569539108
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569539158
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569539172
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569539176
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569539218
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569539350
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569539368
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569539400
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569539464
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569539464
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569539648
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569539648
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569539880
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569539922
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569540136
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569540160
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569540160
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569540232
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569540384
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569540388
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569540480
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569540488
  setvalue(so + py, 4, 0)
  so = gg.getRangesList("libanogs.so")[1].start
  py = 89169569542144
  setvalue(so + py, 4, 0)
  gg.toast("🔸sᴇᴄᴜʀᴇᴅ ■□□□□□□□🔸")
  gg.toast("🔸sᴇᴄᴜʀᴇᴅ ■■□□□□□□🔸")
  gg.toast("🔸sᴇᴄᴜʀᴇᴅ ■■■□□□□□🔸")
  gg.toast("🔸sᴇᴄᴜʀᴇᴅ ■■■■□□□□🔸")
  gg.toast("🔸sᴇᴄᴜʀᴇᴅ ■■■■■□□□🔸")
  gg.toast("🔸sᴇᴄᴜʀᴇᴅ ■■■■■■□□🔸")
  gg.toast("🔸sᴇᴄᴜʀᴇᴅ ■■■■■■■□🔸")
  gg.toast("🔸sᴇᴄᴜʀᴇᴅ ■■■■■■■■🔸")
  gg.alert("🔸ʙʟᴏᴄᴋ ꜱᴘᴇᴄᴛᴀᴛᴇ ᴏɴ🔸\n🔸ᴇɴᴇᴍɪᴇꜱ ᴄᴀɴ'ᴛ ꜱᴘᴇᴄᴛᴀᴛᴇ ʏᴏᴜ🔸")
end

function checker()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.searchNumber("67109633", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  result = gg.getResultCount()
  if result > 15 then
    gg.alert("ғᴀʀʟɪɢʜᴛ ᴀɴᴛɪᴄʜᴇᴀᴛ: " .. result .. "\nꜱᴛᴀᴛᴜꜱ:  ᴅᴀɴɢᴇʀ! \nʀᴇsᴛᴀʀᴛ:  𝟷𝟻 ᴀʙᴏᴠᴇ ɪs ɴᴏᴛ sᴀғᴇ ")
  else
    gg.alert("ғᴀʀʟɪɢʜᴛ ᴀɴᴛɪᴄʜᴇᴀᴛ: " .. result .. "\nꜱᴛᴀᴛᴜꜱ:  ғᴀʀʟɪɢʜᴛ ᴀɴᴛɪᴄʜᴇᴀᴛ ꜱᴇᴄᴜʀᴇᴅ \nʀᴇsᴛᴀʀᴛ:  𝟷𝟻 ʀᴇsᴜʟᴛs ʙᴇʟᴏᴡ ɪғ sᴀғᴇ ")
  end
  gg.clearResults()
end

function Memory()
  MOD = gg.multiChoice({
    "🔸𝙼𝚊𝚐𝚒𝚌 𝙱𝚞𝚕𝚕𝚎𝚝 𝙰𝚞𝚝𝚘𝚑𝚎𝚊𝚍 𝙻𝚘𝚘𝚙🔸",
    "🔸𝙶𝚁𝙴𝙴𝙽 𝚆𝙰𝙻𝙻𝙷𝙰𝙲𝙺 𝚂𝙽𝙰𝙿𝙳𝚁𝙰𝙶𝙾𝙽🔸",
    "🔸𝙽𝙾𝚁𝙼𝙰𝙻 𝚆𝙰𝙻𝙻𝙷𝙰𝙲𝙺 𝚂𝙽𝙰𝙿𝙳𝚁𝙰𝙶𝙾𝙽🔸",
    "🔸𝙰𝙽𝚃𝙴𝙽𝙽𝙰 𝙱𝙾𝙳𝚈🔸",
    "🔸𝙱𝙻𝙰𝙲𝙺 𝙱𝙾𝙳𝚈 𝚂𝙽𝙰𝙿𝙳𝚁𝙰𝙶𝙾𝙽🔸",
    "🔸𝚆𝙷𝙸𝚃𝙴 𝙱𝙾𝙳𝚈 𝚂𝙽𝙰𝙿𝙳𝚁𝙰𝙶𝙾𝙽🔸",
    "🔸𝚆𝙸𝙳𝙴 𝚅𝙸𝙴𝚆🔸",
    "🔸𝙽𝙾 𝚁𝙴𝙲𝙾𝙸𝙻 // NO SPREAD🔸",
    "🔸𝙱𝙰𝙲𝙺🔸"
  }, nil, "")
  if MOD == nil then
  else
    if MOD[1] == true then
      lop()
    end
    if MOD[2] == true then
      wallhack()
    end
    if MOD[3] == true then
      wallhack2()
    end
    if MOD[4] == true then
      antenna()
    end
    if MOD[5] == true then
      blackbody()
    end
    if MOD[6] == true then
      whitebody()
    end
    if MOD[7] == true then
      wideview()
    end
    if MOD[8] == true then
      nospread()
    end
    if MOD[9] == true then
      HOME()
    end
  end
  HOMEDM = -1
end

function lop()
  function split(A0_57, A1_58)
    local L2_59, L3_60, L4_61
    L2_59 = 1
    L3_60 = 1
    L4_61 = {}
    while true do
      if not string.find(A0_57, A1_58, L2_59) then
        L4_61[L3_60] = string.sub(A0_57, L2_59, string.len(A0_57))
        break
      end
      L4_61[L3_60] = string.sub(A0_57, L2_59, string.find(A0_57, A1_58, L2_59) - 1)
      L2_59 = string.find(A0_57, A1_58, L2_59) + string.len(A1_58)
      L3_60 = L3_60 + 1
    end
    return L4_61
  end
  
  function xgxc(A0_62, A1_63)
    local L2_64, L3_65, L4_66, L5_67
    L2_64 = 1
    L3_65 = #A1_63
    for _FORV_5_ = 1, #A1_63 do
      xgpy = A0_62 + A1_63[_FORV_5_].offset
      xglx = A1_63[_FORV_5_].type
      xgsz = A1_63[_FORV_5_].edit
      xgdj = A1_63[_FORV_5_].freeze
      if xgdj == nil or xgdj == "" then
        gg.setValues({
          [1] = {
            address
