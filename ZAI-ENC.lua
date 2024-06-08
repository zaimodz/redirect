local g = {}
g.last = gg.getFile()
g.info = nil
g.config = gg.EXT_CACHE_DIR .. "/" .. gg.getFile():match("[^/]+$") .. "cfg"
g.DATA = loadfile(g.config)
if g.DATA ~= nil then g.info = g.DATA() g.DATA = nil end
if g.info == nil then g.info = {g.last, g.last:gsub("/[^/]+$", "")} end
while true do
gg.alert("[ - ᴘᴏᴡᴇʀ 1.0 - ]\n\n{ New } - Assign local\n{ New } - Fake Assign local\n{ New } - Encode Byte\n{ New } - Fake Key\n{ New } - Hide GG\n{ New } - Blocker Hook Log","[ START ]")
g.info = gg.prompt({
"🔥 sᴇʟᴇᴄᴛ sᴄʀɪᴘᴛ",
"🔥 sᴇʟᴇᴄᴛ ᴏᴜᴛᴘᴜᴛ"
},g.info,{"file","path"})
if g.info == nil then 
return gg.alert("ᴘʟᴇᴀsᴇ ʀᴇ ʟᴏᴀᴅ sᴄʀɪᴘᴛ")
end
gg.saveVariable(g.info, g.config)
if loadfile(g.info[1]) == nil then 
return gg.alert("ɴᴏᴛ ғᴏᴜɴᴅ ғɪʟᴇ")
else
g.out = g.info[1] :match("[^/]+$")
g.out = g.out:gsub(".lua", ".zai")
g.out = g.out:gsub(".txt", ".zai")
g.out = g.info[2] .. "/" .. g.out .. ".lua"
info = {g.out}
gg.alert("📁 File Origin : \n" .. g.info[1].. "\n\n📂 File Saved : \n" .. g.out .. "", "")
end 
DATA = io.input(g.info[1] ):read('*a')

function HideType(str)
local memory,memorys = {
"gg.REGION_C_ALLOC","gg.REGION_CODE_APP","gg.REGION_ANONYMOUS","gg.REGION_C_DATA","gg.REGION_CODE_SYS","gg.REGION_ASHMEM","gg.REGION_BAD","gg.REGION_C_BSS","gg.REGION_C_HEAP","gg.REGION_JAVA","gg.REGION_JAVA_HEAP","gg.REGION_OTHER","gg.REGION_PPSSPP","gg.REGION_STACK","gg.REGION_VIDEO","gg.TAB_MEMORY_EDITOR"
},{4,16384,32,8,32768,524288,131072,16,1,65536,2,-2080896,262144,64,1048576,3}
str = str:gsub(memory[1],memorys[1]):gsub(memory[2],memorys[2]):gsub(memory[3],memorys[3]):gsub(memory[4],memorys[4]):gsub(memory[5],memorys[5]):gsub(memory[6],memorys[6]):gsub(memory[7],memorys[7]):gsub(memory[8],memorys[8]):gsub(memory[9],memorys[9]):gsub(memory[10],memorys[10]):gsub(memory[11],memorys[11]):gsub(memory[12],memorys[12]):gsub(memory[13],memorys[13]):gsub(memory[14],memorys[14]):gsub(memory[15],memorys[15]):gsub(memory[16],memorys[16])
local Type,Types = {"gg.TYPE_DWORD","gg.TYPE_AUTO","gg.TYPE_BYTE","gg.TYPE_DOUBLE","gg.TYPE_FLOAT","gg.TYPE_QWORD","gg.TYPE_WORD","gg.TYPE_XOR"
},{4,127,1,64,16,32,2,8}
str = str:gsub(Type[1],Types[1]):gsub(Type[2],Types[2]):gsub(Type[3],Types[3]):gsub(Type[4],Types[4]):gsub(Type[5],Types[5]):gsub(Type[6],Types[6]):gsub(Type[7],Types[7]):gsub(Type[8],Types[8])
return str 
end

-- Key Encode
local Base = {}
Base[1] = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}
Base[2] = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}
function new()
Base[3] = Base[1][math.random(1,26)]
Base[4] = Base[2][math.random(1,26)] 
str = Base[3]..Base[4]
local b = ""
for i = 1,#str do 
b = b ..string.byte(str,i).."+"
cc = b.."+"
cc = cc:gsub("++","")
end
return cc + 100
end

function Obfuscate(results) 
return 'a(b(c(d(f(a(b(c(d(f(a(b(c(d(f(a(b(c(d(f(a(b(c(d(f(' .. '"' ..(results).. '"' .. ')))))))))))))))))))))))))' 
end

function Unluac(data, s)
local replace = {
"if nil then while (_(nil)> _(_(nil)) and (nil) < _((nil))) do;for i=1,10,100 do;local _={} ;local ii,iii,iiii=i;if (_(i) > _(ii) and _(iii) < _(iiii)) then;_[i]=_[i](_(i),_(ii)) _[i]=_[i](_(i),_(iii),_(iii),_(iiii)) _[i]=_[i](_(iiii),_(iii),_(iii),_(iiii))(i(iiiii)) _[iii]=_(iiii)_=_[iii];return i end end break end end;\n",
"do;local i={}if(i.i~=nil)then;i.i=(i.i(i))end;end;",
"local Concu = function(...) return (...)({'ChingChong { 1.0 }', 'Encrypt By ZAO'}) end"}
local replace = replace[1] .. replace[2] .. replace[3]
local z = {";s={}", ";p={}", ";a={}", ";m={}"}
Mison = string.format(replace .. "" .. z[math.random(1, 4)] .. ""):rep(s)
data =data:gsub("end", "end;" .. "" .. Mison .. ""):gsub("\ngg.editAll", "\n" .. Mison .. "\ngg.editAll"):gsub("\ngg.searchNumber","\n" .. Mison .. "\ngg.searchNumber"):gsub("\ngg.clearResults", "\n" .. Mison .. "\ngg.clearResults"):gsub("\ngg.refineNumber","\n" .. Mison .. "\ngg.refineNumber"):gsub("\ngg.getResults", "\n" .. Mison .. "\ngg.getResults"):gsub("end\n", "end\n" .. Mison)
return data
end
function Obfuscation(str)
local rand,ins = math.random,{}
for i = 1,str do
uz = Base[rand(1,2)][rand(1,26)]
uk = Base[rand(1,2)][rand(1,26)]
up = Base[rand(1,2)][rand(1,26)]
uo = Base[rand(1,2)][rand(1,26)]
ut = Base[rand(1,2)][rand(1,26)]
uzk = uz..uk..up..uo..ut:rep(str)
table.insert(ins,uzk)
end
return ins
end

local Alphabet = {
"或","放","是","加","从","那","来","阿","怕","平","静",
"地","把","这","家","或","快","捷","键"}
function Exbase()
local Buku,rand = {},math.random
for i = 1,10 do
Obf = (Alphabet[rand(1,3)] .. Alphabet[rand(4,6)] .. Alphabet[rand(7,9)] .. Alphabet[rand(10,13)]):rep(1)
Obf = ""..Alphabet[rand(14,16)].."" .. Obf .. ""..Alphabet[rand(17,18)]..""
table.insert(Buku,Obf)
end
return Buku 
end
local vvv,sss,bbb,nnn,ccc = new(),new(),new(),new(),new()
local Obf1,Obf2,Obf3,Obf4,Obf5,Obf6,Obf7,Obf8,Obf9,Obf10 = Exbase()[1],Exbase()[1],Exbase()[1],Exbase()[1],Exbase()[1],Exbase()[1],Exbase()[1],Exbase()[1],Exbase()[1],Exbase()[1]
function Encode(str)
str = str:gsub([[\n]],"\n"):gsub([[\t]],"\t"):gsub([[\]],"\n")
local Onichan = {}
Onichan["Baka"] = {str:byte(0,-1)}
for i = 1, #Onichan["Baka"] do
Onichan["Baka"][i] = (Onichan["Baka"][i] + vvv - sss + bbb - nnn + ccc) % 256
Onichan["Baka"][i] = '"' .. string.format("%02x",Onichan["Baka"][i])
Onichan["Baka"][i] = Onichan["Baka"][i] .. '"'
Onichan["Baka"][i] = string.reverse(Onichan["Baka"][i])
Onichan["Baka"][i] = string.upper(Onichan["Baka"][i])
Onichan["Baka"][i] = Onichan["Baka"][i]:gsub("B",Obf1):gsub("E",Obf2):gsub("C",Obf3):gsub("F",Obf4):gsub("D",Obf5):gsub("A",Obf6)
end
return "Dec({"..table.concat(Onichan["Baka"], ",").."})"
end

local numbers = 0
local function TableVL()
numbers = numbers + 1
return numbers
end

res = ''
ves = ''
local function AssignLocal(c)
local Ran = math.random
res = res:gsub('^(.-)', 'yuh = {};%1')
UwU = {}
c = {c:sub(0,-1,#c)}
results = "" .. table.concat(c) .. ""
ZLET = string.char(math.random(65, 90))..string.char(math.random(48, 57))..string.char(math.random(65, 90))..string.char(math.random(65, 90))..string.char(math.random(65, 90))..string.char(math.random(97, 122))..string.char(math.random(48, 57))
local ch = string.format 
UwU["_"] = ""
for i = 1,string.len(results) do 
UwU["_"] = UwU["_"] .. ch("0x%X",string.byte(results,i))..","
cc = UwU["_"] ..","
cc = cc:gsub(",,","")
end
Fake1 = 'string.char(0x'..Ran(1,70)..',0x'..Ran(1,70)..',0x'..Ran(1,70)..')'
Fake2 = 'string.char(0x'..Ran(1,70)..',0x'..Ran(1,70)..',0x'..Ran(1,70)..')'
Fake3 = 'string.char(0x'..Ran(1,70)..',0x'..Ran(1,70)..',0x'..Ran(1,70)..')'
res = res .. 'yuh.'..ZLET..' = {{{'..Fake3..'},{'..Fake2..'},string.char('.. cc .. ')},{'..Fake1..'}}\n'
ves = ves .. TableVL() 
zoz = 'yuh.'..ZLET..'[____][______]'
return zoz
end

function String(str)
local ch = string.format 
local b = "" for i = 1,string.len(str) do 
b = b .. ch("0x%X",string.byte(str,i))..","
cc = b .."," cc = cc:gsub(",,","")
end return ("string.char("..cc..")") end 
class_list = {"gg","io","os","string","table","math","utf8"}
for k, v in ipairs(class_list) do DATA = DATA:gsub(v .. "%.(%a+)%(", function(x)
return "_ENV[" .. String(v) .. "]" .. "[" .. String(x) .. "](" end)
end 

DATA =[=[

]=] .. DATA

Blocker =([===[

s = ("Log Đỵt Moẹ m")
Big = string.rep(s,999)
Res = ("0000000000000000000000000000000000000000000000000"):rep(100)
Spam = string.len(Res)
Hooker = {io,os, math,gg,utf8,debug,table,bit32,string }
for i = 1,#Hooker do
for i = 1,Spam do
debug.getinfo(1000,nil,Big)
debug.debug(1000,nil,Big) 
end
debug.traceback(1000,nil,Big)
if tostring(Hooker[i]):match('function: @(.-):') then
while true do gg.toast("") end
end
end

]===]):gsub('%".-(.-)%"', String):gsub("%'.-(.-)%'", String)


local Fake_Key = ([===[

local ]===]..Obfuscation(3)[2]..[===[ = ]===]..new()..[===[

]===]):rep(2)

Dec=[===[
local ]===]..Obfuscation(3)[2]..[===[ = ]===]..new()..[===[
]===]..Fake_Key..[===[
local ]===]..Obfuscation(3)[2]..[===[ = ]===]..new()..[===[
local vvv,sss,bbb,nnn,ccc = ]===]..vvv..[===[,]===]..sss..[===[,]===]..bbb..[===[,]===]..nnn..[===[,]===]..ccc..[===[
local ]===]..Obfuscation(3)[2]..[===[ = ]===]..new()..[===[
Obf1,Obf2,Obf3,Obf4,Obf5,Obf6,Obf7,Obf8,Obf9,Obf10 = "]===]..Obf1..[===[","]===]..Obf2..[===[","]===]..Obf3..[===[","]===]..Obf4..[===[","]===]..Obf5..[===[","]===]..Obf6..[===[","]===]..Obf7..[===[","]===]..Obf8..[===[","]===]..Obf9..[===[","]===]..Obf10..[===["
local function a(a) return a end local function b(a) return a end local function c(a) return a end local function d(a) return a end local function f(a) return a end;;local ]===]..Obfuscation(3)[2]..[===[ = ]===]..new()..[===[
local Dec = (function(c)
res = ""
for m in ipairs(c) do
c[m] = c[m]:gsub(Obf1,"B"):gsub(Obf2,"E"):gsub(Obf3,"C"):gsub(Obf4,"F"):gsub(Obf5,"D"):gsub(Obf6,"A")
c[m] = string.reverse(c[m]) 
c[m] = tonumber(c[m],16)
res = res..string.char((c[m] - vvv + sss - bbb + nnn - ccc) % 256) 
end 
return res 
end);

]===] 

DATA=DATA:gsub('%".-(.-)%"', Obfuscate):gsub('%".-(.-)%"', Encode):gsub("%'.-(.-)%'", Encode)

DATA = DATA:gsub('%".-(.-)%"', AssignLocal):gsub("%'.-(.-)%'", AssignLocal)


local next = TableVL()
function FakeAssignLocal(str)
local All,rand = {},math.random
Emoji = {"喔","或","来","啊","筽","我","人","平","关"}
ChinaText = {"里","此","吧","被","批","错","包","培","阿","家","看","一","腌","您","饿"}
for i = 1,str do
setall = (Emoji[rand(1,9)] .. ChinaText[rand(1,15)]..Emoji[rand(1,9)] .. ChinaText[rand(1,15)])
table.insert(All,setall) 
end 
return table.concat(All)
end

function Fake_AssignLocal(...)
res = ""
for i = 1,next do
res = res.."\n"..'yuh.'..string.char(math.random(65, 90))..string.char(math.random(48, 57))..string.char(math.random(65, 90))..string.char(math.random(65, 90))..string.char(math.random(65, 90))..string.char(math.random(97, 122))..string.char(math.random(48, 57)).." = '"..FakeAssignLocal(5).."[____][______]'\n"
end
return res
end

DATA=[==========[
local aa = {}
aa = {
1,2,3,4,5,6,7,8,9,10,
nil,nil,nil,nil,nil,nil,
nil,nil,nil,nil,nil,nil,
nil,nil,nil,nil,nil,nil,
nil,nil,nil,nil,nil,nil,
nil,nil,nil,nil,nil,nil,
}
bb = aa[1]
cc = bb
dd = cc 
pp = dd 
nn = aa[3]
ww = nn
ii = ww
ss = ii
zz = ss
________ = 7
__ = 9
____ = pp
______ = zz
_______ = 6
]==========]..res..[==========[

]==========]..Fake_AssignLocal()..[==========[ 
]==========]..DATA

DATA = HideType(DATA)
DATA = Unluac(DATA,5)
DATA=(""..Dec.."") .. (""..Blocker.."") .. ("_ENV['gg']['toast']('🔥 Eɴᴄʀʏᴘᴛɪᴏɴ Bʏ ZAI')"):gsub("%'.-(.-)%'", String) .. DATA
DATA=[[(function(...) 
]].. DATA..[[ 
end)([=[


 ["👾"] 𝚉𝙰𝙸 𝙴𝙽𝙲𝚁𝚈𝙿𝚃 { ᴘᴏᴡᴇʀ 1.0 } ["👾"]
•=•=•=•=•=•=••=•=•=•=•=•=••=•=•=•=•=•=•=•=•=•=•
Channel : https://t.me/zaiofficialch
Group Chat : https://t.me/zaiofficalgc
Telegram : @zaiofficial
•=•=•=•=•=•=••=•=•=•=•=•=••=•=•=•=•=•=•=•=•=•=•

]=])
]]

DATA = string.dump(load(DATA),true)
DATA = gg.internal2(load(DATA),g.out)
DATA = io.input(g.out):read("*a")
DATA = DATA:gsub("%.upval%s*v0*%s*nil%s*;%s*%w*",".upval v0 nil\n.upval u0 nil",1)
DATA = string.dump(load(DATA),true)
--gg.alert("Success Encrypt ✓ ","")
print("Encrypt By @zaiofficial")
io.open(g.out,"w"):write(DATA):close()
return
end
