; Dictionary and tweaks by Solomon Kimrey, initial code from Laszlo https://www.autohotkey.com/board/topic/6426-chording-keyboard-strings-sent-at-key-combinations/
#MaxThreadsPerHotkey 10
#MaxThreadsBuffer ON
#MaxHotkeysPerInterval 999
#UseHook
StringCaseSense On
Process Priority,,Realtime
SetKeyDelay -1
BlockInput Send

Low = ``1234567890-=qwertyuiop[]\asdfghjkl`'zxcvbnm,./;
Shft= ~!@#$`%^&*()_+QWERTYUIOP{}|ASDFGHJKL`"ZXCVBNM<>?:
KeySet = ``1234567890-=qwertyuiop[]\asdfghjkl`'zxcvbnm,./;
Loop Parse, KeySet
{
   AllKeys := AllKeys "%x" Asc(A_LoopField) "%"
   HotKey  %A_LoopField%,  KeyDown, B
   HotKey  %A_LoopField% up, KeyUp, B
   HotKey +%A_LoopField%, CKeyDown, B
   HotKey +%A_LoopField% up, KeyUp, B
}
SentTick = 0
SetTimer Action, 10                    ; handle key repeat
RI = 0
Loop                                   ; self healing missed key releases
{                                      ; to prevent infinite repeat
   Sleep 10
   RI := Mod(RI, StrLen(KeySet)) + 1
   StringMid r, KeySet, RI, 1
   If GetKeyState(r,"P")
      Continue
   r := "x" Asc(r)
   %r% =
}
Return

KeyDown:                               ; register keys pressed
   key := "x" Asc(A_ThisHotKey)
   %key% = %A_ThisHotKey%
GoTo Tick

CKeyDown:                              ; register shifted keys pressed
   StringRight k, A_ThisHotKey, 1      ; remove "+"
   StringMid U,Shft,InStr(Low,k,1),1   ; convert k to Shift-%k%
   key := "x" Asc(k)
   %key% = %U%
GoTo Tick
KeyUp:                                 ; register key release
   StringReplace k, A_ThisHotKey, +    ; remove "+"
   key := "x" Asc(k)
   %key% =

Tick:                                  ; register time of key event
   KeyTick = %A_TickCount%
Action:
   Transform keys, Deref, %AllKeys%
   IfNotEqual keys, %key0%, {          ; KEYS CHANGED keys <> key0
      If (keyn = 0 and len0 = 1 and len1 = 0 and keys = "")
            GoSub  SEND1
            
              ; short single key press
      Else If (keyn = 1 and len0 = 1 and len1 = 2 and keys = "" and SentKeys <> key0 and StrLen(SentKeys) = 1)
            GoSub  SEND1   
            
                       ; overlapping keys
      len1:= StrLen(key0)
      len0:= StrLen(keys)
      key0 = %keys%                    ; previous key combination
      keyn = 0                         ; the number of repetitions
   }
   Else {                              ; NO KEY CHANGE keys == key0
      if (keys = ""
       or A_TickCount - KeyTick  < 20  and keyn = 0
       or A_TickCount - SentTick < 360 and keyn = 1
       or A_TickCount - SentTick < 37 and keyn > 1)
         Return
      keyn++
      GoTo SEND
   }
Return

SEND:
   IfLess len0,%len1%
    str = {}         ; no send at releasing keys
SEND1:
   SentTick = %A_TickCount%            ; remember time of send
   SentKeys = %key0%

SENDSEMICOLON:
   SentTick = %A_TickCount%            
   SentKeys = %key0%
Return

If (key0 = "e" or key0 = "e;" or key0 = "E")
    str = 󱥆
Else if (key0 = "d" or key0 = "d;" or key0 = "D")
    str = 󱥞
Else if (key0 = "de" or key0 = "de;" or key0 = "DE")
    str = 󱤼
Else if (key0 = "x" or key0 = "x;" or key0 = "X")
    str = 󱤧
Else if (key0 = "ex" or key0 = "ex;" or key0 = "EX")
    str = 󱦐
Else if (key0 = "dx" or key0 = "dx;" or key0 = "DX")
    str = {BackSpace}
Else if (key0 = "dex" or key0 = "dex;" or key0 = "DEX")
    str = 󱤹︁
Else if (key0 = "s" or key0 = "s;" or key0 = "S")
    str = {Enter}
Else if (key0 = "es" or key0 = "es;" or key0 = "ES")
    str = 󱥧
Else if (key0 = "ds" or key0 = "ds;" or key0 = "DS")
    str = 󱥁
Else if (key0 = "des" or key0 = "des;" or key0 = "DES")
    str = 󱥬
Else if (key0 = "sx" or key0 = "sx;" or key0 = "SX")
    str = 󱥄
Else if (key0 = "esx" or key0 = "esx;" or key0 = "ESX")
    str = 󱥔
Else if (key0 = "dsx" or key0 = "dsx;" or key0 = "DSX")
    str = 󱥎
Else if (key0 = "desx" or key0 = "desx;" or key0 = "DESX")
    str = 󱥚︁
Else if (key0 = "w" or key0 = "w;" or key0 = "W")
    str = 󱤴
Else if (key0 = "ew" or key0 = "ew;" or key0 = "EW")
    str = 󱤡
Else if (key0 = "dw" or key0 = "dw;" or key0 = "DW")
    str = 󱥨
Else if (key0 = "dew" or key0 = "dew;" or key0 = "DEW")
    str = 󱤕
Else if (key0 = "wx" or key0 = "wx;" or key0 = "WX")
    str = 「
Else if (key0 = "ewx" or key0 = "ewx;" or key0 = "EWX")
    str = 󱤻
Else if (key0 = "dwx" or key0 = "dwx;" or key0 = "DWX")
    str = 󱤌
Else if (key0 = "dewx" or key0 = "dewx;" or key0 = "DEWX")
    str = 󱥛
Else if (key0 = "sw" or key0 = "sw;" or key0 = "SW")
    str = 󱤬
Else if (key0 = "esw" or key0 = "esw;" or key0 = "ESW")
    str = 󱤘
Else if (key0 = "dsw" or key0 = "dsw;" or key0 = "DSW")
    str = 󱥇
Else if (key0 = "desw" or key0 = "desw;" or key0 = "DESW")
    str = 󱤏
Else if (key0 = "swx" or key0 = "swx;" or key0 = "SWX")
    str = 󱤿
Else if (key0 = "eswx" or key0 = "eswx;" or key0 = "ESWX")
    str = 󱥜
Else if (key0 = "dswx" or key0 = "dswx;" or key0 = "DSWX")
    str = 󱤥
Else if (key0 = "deswx" or key0 = "deswx;" or key0 = "DESWX")
    str = 󱤜
Else if (key0 = "a" or key0 = "a;" or key0 = "A")
    str = {Space}
Else if (key0 = "ae" or key0 = "ae;" or key0 = "AE")
    str = 󱤖
Else if (key0 = "ad" or key0 = "ad;" or key0 = "AD")
    str = 󱦝
Else if (key0 = "ade" or key0 = "ade;" or key0 = "ADE")
    str = 󱥮
Else if (key0 = "ax" or key0 = "ax;" or key0 = "AX")
    str = 󱥩
Else if (key0 = "aex" or key0 = "aex;" or key0 = "AEX")
    str = ‍
Else if (key0 = "adx" or key0 = "adx;" or key0 = "ADX")
    str = 󱤱
Else if (key0 = "adex" or key0 = "adex;" or key0 = "ADEX")
    str = 󱥗
Else if (key0 = "as" or key0 = "as;" or key0 = "AS")
    str = 󱤂
Else if (key0 = "aes" or key0 = "aes;" or key0 = "AES")
    str = 󱤰
Else if (key0 = "ads" or key0 = "ads;" or key0 = "ADS")
    str = 󱥊
Else if (key0 = "ades" or key0 = "ades;" or key0 = "ADES")
    str = 󱥳
Else if (key0 = "asx" or key0 = "asx;" or key0 = "ASX")
    str = 󱥐
Else if (key0 = "aesx" or key0 = "aesx;" or key0 = "AESX")
    str = 󱤇
Else if (key0 = "adsx" or key0 = "adsx;" or key0 = "ADSX")
    str = 󱥠
Else if (key0 = "adesx" or key0 = "adesx;" or key0 = "ADESX")
    str = 󱤎
Else if (key0 = "aw" or key0 = "aw;" or key0 = "AW")
    str = 󱥍
Else if (key0 = "aew" or key0 = "aew;" or key0 = "AEW")
    str = 󱤶
Else if (key0 = "adw" or key0 = "adw;" or key0 = "ADW")
    str = 󱤲
Else if (key0 = "adew" or key0 = "adew;" or key0 = "ADEW")
    str = 󱥰
Else if (key0 = "awx" or key0 = "awx;" or key0 = "AWX")
    str = 󱤾
Else if (key0 = "aewx" or key0 = "aewx;" or key0 = "AEWX")
    str = 󱤦
Else if (key0 = "adwx" or key0 = "adwx;" or key0 = "ADWX")
    str = 󱥪
Else if (key0 = "adewx" or key0 = "adewx;" or key0 = "ADEWX")
    str = 󱤩
Else if (key0 = "asw" or key0 = "asw;" or key0 = "ASW")
    str = 󱥷
Else if (key0 = "aesw" or key0 = "aesw;" or key0 = "AESW")
    str = 󱥒
Else if (key0 = "adsw" or key0 = "adsw;" or key0 = "ADSW")
    str = 󱤒
Else if (key0 = "adesw" or key0 = "adesw;" or key0 = "ADESW")
    str = 󱤸
Else if (key0 = "aswx" or key0 = "aswx;" or key0 = "ASWX")
    str = 󱤫
Else if (key0 = "aeswx" or key0 = "aeswx;" or key0 = "AESWX")
    str = 󱤔
Else if (key0 = "adswx" or key0 = "adswx;" or key0 = "ADSWX")
    str = 󱤣
Else if (key0 = "adeswx" or key0 = "adeswx;" or key0 = "ADESWX")
    str = 󱤚
Else if (key0 = "z" or key0 = "z;" or key0 = "Z")
    str = 󱤉
Else if (key0 = "ez" or key0 = "ez;" or key0 = "EZ")
    str = 󱥖
Else if (key0 = "dz" or key0 = "dz;" or key0 = "DZ")
    str = 󱥌
Else if (key0 = "dez" or key0 = "dez;" or key0 = "DEZ")
    str = 󱥝
Else if (key0 = "xz" or key0 = "xz;" or key0 = "XZ")
    str = 󱦆
Else if (key0 = "exz" or key0 = "exz;" or key0 = "EXZ")
    str = 󱤆
Else if (key0 = "dxz" or key0 = "dxz;" or key0 = "DXZ")
    str = 󱤑
Else if (key0 = "dexz" or key0 = "dexz;" or key0 = "DEXZ")
    str = 󱤤
Else if (key0 = "sz" or key0 = "sz;" or key0 = "SZ")
    str = 󱤀
Else if (key0 = "esz" or key0 = "esz;" or key0 = "ESZ")
    str = 󱥂
Else if (key0 = "dsz" or key0 = "dsz;" or key0 = "DSZ")
    str = 󱥫
Else if (key0 = "desz" or key0 = "desz;" or key0 = "DESZ")
    str = 󱤗
Else if (key0 = "sxz" or key0 = "sxz;" or key0 = "SXZ")
    str = 󱤓
Else if (key0 = "esxz" or key0 = "esxz;" or key0 = "ESXZ")
    str = 󱥦
Else if (key0 = "dsxz" or key0 = "dsxz;" or key0 = "DSXZ")
    str = 󱤪
Else if (key0 = "desxz" or key0 = "desxz;" or key0 = "DESXZ")
    str = 󱤛
Else if (key0 = "wz" or key0 = "wz;" or key0 = "WZ")
    str = 󱦗
Else if (key0 = "ewz" or key0 = "ewz;" or key0 = "EWZ")
    str = 󱥣
Else if (key0 = "dwz" or key0 = "dwz;" or key0 = "DWZ")
    str = 󱤟
Else if (key0 = "dewz" or key0 = "dewz;" or key0 = "DEWZ")
    str = 󱥱
Else if (key0 = "wxz" or key0 = "wxz;" or key0 = "WXZ")
    str = 󱤨
Else if (key0 = "ewxz" or key0 = "ewxz;" or key0 = "EWXZ")
    str = 󱤝
Else if (key0 = "dwxz" or key0 = "dwxz;" or key0 = "DWXZ")
    str = 󱤃
Else if (key0 = "dewxz" or key0 = "dewxz;" or key0 = "DEWXZ")
    str = 󱥀
Else if (key0 = "swz" or key0 = "swz;" or key0 = "SWZ")
    str = 󱤍
Else if (key0 = "eswz" or key0 = "eswz;" or key0 = "ESWZ")
    str = 󱤢
Else if (key0 = "dswz" or key0 = "dswz;" or key0 = "DSWZ")
    str = 󱥅︁
Else if (key0 = "deswz" or key0 = "deswz;" or key0 = "DESWZ")
    str = 󱤁
Else if (key0 = "swxz" or key0 = "swxz;" or key0 = "SWXZ")
    str = 󱤮
Else if (key0 = "eswxz" or key0 = "eswxz;" or key0 = "ESWXZ")
    str = 󱥵
Else if (key0 = "dswxz" or key0 = "dswxz;" or key0 = "DSWXZ")
    str = 󱥢
Else if (key0 = "deswxz" or key0 = "deswxz;" or key0 = "DESWXZ")
    str = 󱥤
Else if (key0 = "az" or key0 = "az;" or key0 = "AZ")
    str = 󱥙
Else if (key0 = "aez" or key0 = "aez;" or key0 = "AEZ")
    str = 󱤙
Else if (key0 = "adz" or key0 = "adz;" or key0 = "ADZ")
    str = 󱤋
Else if (key0 = "adez" or key0 = "adez;" or key0 = "ADEZ")
    str = 󱤽
Else if (key0 = "axz" or key0 = "axz;" or key0 = "AXZ")
    str = 󱥉
Else if (key0 = "aexz" or key0 = "aexz;" or key0 = "AEXZ")
    str = 󱥶
Else if (key0 = "adxz" or key0 = "adxz;" or key0 = "ADXZ")
    str = 󱤠
Else if (key0 = "adexz" or key0 = "adexz;" or key0 = "ADEXZ")
    str = 󱥭
Else if (key0 = "asz" or key0 = "asz;" or key0 = "ASZ")
    str = 󱥡
Else if (key0 = "aesz" or key0 = "aesz;" or key0 = "AESZ")
    str = 󱥥
Else if (key0 = "adsz" or key0 = "adsz;" or key0 = "ADSZ")
    str = 󱥯
Else if (key0 = "adesz" or key0 = "adesz;" or key0 = "ADESZ")
    str = 󱤊
Else if (key0 = "asxz" or key0 = "asxz;" or key0 = "ASXZ")
    str = 󱥓
Else if (key0 = "aesxz" or key0 = "aesxz;" or key0 = "AESXZ")
    str = 󱥑
Else if (key0 = "adsxz" or key0 = "adsxz;" or key0 = "ADSXZ")
    str = 󱥟
Else if (key0 = "adesxz" or key0 = "adesxz;" or key0 = "ADESXZ")
    str = 󱤐
Else if (key0 = "awz" or key0 = "awz;" or key0 = "AWZ")
    str = 󱥈
Else if (key0 = "aewz" or key0 = "aewz;" or key0 = "AEWZ")
    str = 󱥃
Else if (key0 = "adwz" or key0 = "adwz;" or key0 = "ADWZ")
    str = 󱤈
Else if (key0 = "adewz" or key0 = "adewz;" or key0 = "ADEWZ")
    str = 󱤞
Else if (key0 = "awxz" or key0 = "awxz;" or key0 = "AWXZ")
    str = 󱤭
Else if (key0 = "aewxz" or key0 = "aewxz;" or key0 = "AEWXZ")
    str = 󱤯
Else if (key0 = "adwxz" or key0 = "adwxz;" or key0 = "ADWXZ")
    str = 󱤺
Else if (key0 = "adewxz" or key0 = "adewxz;" or key0 = "ADEWXZ")
    str = 󱥘
Else if (key0 = "aswz" or key0 = "aswz;" or key0 = "ASWZ")
    str = 󱤅
Else if (key0 = "aeswz" or key0 = "aeswz;" or key0 = "AESWZ")
    str = 󱥲
Else if (key0 = "adswz" or key0 = "adswz;" or key0 = "ADSWZ")
    str = 󱥴
Else if (key0 = "adeswz" or key0 = "adeswz;" or key0 = "ADESWZ")
    str = 󱥋
Else if (key0 = "aswxz" or key0 = "aswxz;" or key0 = "ASWXZ")
    str = 󱥏
Else if (key0 = "aeswxz" or key0 = "aeswxz;" or key0 = "AESWXZ")
    str = 󱤷
Else if (key0 = "adswxz" or key0 = "adswxz;" or key0 = "ADSWXZ")
    str = 󱦀
Else if (key0 = "adeswxz" or key0 = "adeswxz;" or key0 = "ADESWXZ")
    str = 󱤄
Return
