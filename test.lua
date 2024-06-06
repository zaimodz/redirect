function setValue(address, flags, value) gg.setValues({[1] = {address = address, flags = flags, value = value}}) end

PRT = 1

function home()
  A = gg.prompt({
    "⏹ʙʏᴘᴀss ʟᴏɢᴏ [ᴛɪᴍɪ ʟᴏɢᴏ]",
    "⏹ʜᴀᴄᴋ ᴍᴇɴᴜ",
    "⏹ᴇxɪᴛ"
  }, nil, {
    "checkbox",
    "checkbox",
    "checkbox",
  })
  if A == nil then
  else
    if A[1] == true then
      logo()
    end
    if A[2] == true then
      moremenu()
    end
    if A[3] == true then
      exit()
    end
  end
  PRT = -1
end

function logo()
anogs = gg.getRangesList("libanogs.so")[1].start
setValue(anogs + 0x1149480, 4, "h00 00 80 D2")
setValue(anogs + 0x1149484, 4, "hC0 03 5F D6")
setValue(anogs + 0x1265400, 4, "h00 00 80 D2")
setValue(anogs + 0x1265404, 4, "hC0 03 5F D6")
setValue(anogs + 0x1902792, 4, "h00 00 80 D2")
setValue(anogs + 0x1902796, 4, "hC0 03 5F D6")
setValue(anogs + 0x17E640, 32, "h00 00 80 D2 C0 03 5F D6")
gg.toast("𝙱𝚈𝙿𝙰𝚂𝚂 𝙻𝙾𝙶𝙾 [𝙰𝙲𝚃𝙸𝚅𝙰𝚃𝙴]")
end


function moremenu()
  C = gg.prompt({
    "⏹ɴᴏ ʀᴇᴄᴏɪʟ [ʟᴏʙʙʏ]",
    "⏹ʀᴇᴅʟɪɴᴇ [ʟᴏʙʙʏ]",
    "⏹ᴀɪᴍ ᴀssɪsᴛ [ᴀᴅᴊᴜsᴛᴀʙʟᴇ]",
    "❎ʙᴀᴄᴋ",
  }, nil, {
    "checkbox",
    "checkbox",
    "checkbox",
    "checkbox",
  })
  if C == nil then
  else
    if C[1] == true then
      recoil()
    end
    if C[2] == true then
      red()
    end
    if C[3] == true then
      aim()
    end
    if C[4] == true then
      home()
    end
  end
  PRT = -1
end

function recoil()
il2cpp=gg.getRangesList("libil2cpp.so")[1].start
setValue(il2cpp + 0x6DFA738, 32, "h20 4C 40 BC C0 03 5F D6")
gg.toast("𝙽𝙾 𝚁𝙴𝙲𝙾𝙸𝙻 [𝙰𝙲𝚃𝙸𝚅𝙰𝚃𝙴]")
end

function red()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("4575657222490554368;1065353216:9", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("4575657222490554368;1065353216", 32, false, 536870912, 0, -1, 0)
gg.getResults(9999)
gg.editAll("4575657222520438784;1133903872", gg.TYPE_QWORD)
gg.clearResults()
gg.toast("𝚁𝙴𝙳𝙻𝙸𝙽𝙴 [𝙰𝙲𝚃𝙸𝚅𝙰𝚃𝙴]")
end

function aim()
il2cpp=gg.getRangesList("libil2cpp.so")[1].start
setValue(il2cpp + 0x73EC7A0, 4, "~A8 LDR  S0, [PC,#0x8]")
setValue(il2cpp + 0x73EC7A0 + 0x4, 4, "~A8 RET")
setValue(il2cpp + 0x73EC7A0 + 0x8, 16, 0.5)
il2cpp=gg.getRangesList("libil2cpp.so")[1].start
setValue(il2cpp + 0x73ECC64, 4, "~A8 LDR  S0, [PC,#0x8]")
setValue(il2cpp + 0x73ECC64 + 0x4, 4, "~A8 RET")
aim =gg.prompt({"ᴀɪᴍ ᴀᴅᴊᴜsᴛᴀʙʟᴇ 5~50"},nil,{"number"})
setValue(il2cpp + 0x73ECC64 + 0x8, 16, aim[1])
gg.toast("𝙰𝙸𝙼 𝙰𝚂𝚂𝙸𝚂𝚃 [𝙰𝙲𝚃𝙸𝚅𝙰𝚃𝙴]")
end

function exit()
os.exit()
end

while true do
  if gg.isVisible(true) then
PRT = 1
gg.setVisible(false)
  end
if PRT == 1 then
home()
  end
  end
