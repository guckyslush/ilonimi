; Dictionary and tweaks by Solomon Kimrey, initial code from Laszlo https://www.autohotkey.com/board/topic/6426-chording-keyboard-strings-sent-at-key-combinations/
StringCaseSense On
Process Priority,,High
#MaxHotkeysPerInterval 999
#UseHook
SetKeyDelay -1

SentTick = 0
keys = adeswxz
Loop Parse, keys
{
   AllKeys = %AllKeys%`%%A_LoopField%`%
   HotKey  %A_LoopField%,  KeyDown
   HotKey +%A_LoopField%, CKeyDown
   HotKey  %A_LoopField% up, KeyUp
   HotKey +%A_LoopField% up,CKeyUp
}
SetTimer Action, 15
Return

KeyDown:
   KeyTick = %A_TickCount%
   %A_ThisHotKey% = %A_ThisHotKey%
Return

CKeyDown:
   KeyTick = %A_TickCount%
   StringRight key, A_ThisHotKey, 1
   StringUpper key, Key
   %key% = %key%
Return

KeyUp:
   StringLeft key, A_ThisHotKey, 1
   %key% =
Return

CKeyUp:
   StringMid key, A_ThisHotKey, 2, 1
   %key% =
Return

Action:
   Transform keys, Deref, %AllKeys%
   If (A_TickCount - KeyTick  < 50                    ; wait for 2nd key
    or A_TickCount - SentTick < 500 and key1 <> keys  ; first auto-repeat
    or A_TickCount - SentTick < 50  and key1 == keys) ; auto-repeat
       Return
   key1 = %key0%
   key0 = %keys%
   SentTick = %A_TickCount%
   IfEqual keys,a, Send {Space}
   Else IfEqual keys,ad, Send {U+F199D}
   Else IfEqual keys,ade, Send {U+F196E}
   Else IfEqual keys,ades, Send {U+F1973}
   Else IfEqual keys,adesw, Send {U+F1938}
   Else IfEqual keys,adeswx, Send {U+F191A}
   Else IfEqual keys,adeswxz, Send {U+F1904}
   Else IfEqual keys,adeswz, Send {U+F194B}
   Else IfEqual keys,adesx, Send {U+F190E}
   Else IfEqual keys,adesxz, Send {U+F1910}
   Else IfEqual keys,adesz, Send {U+F190A}
   Else IfEqual keys,adew, Send {U+F1970}
   Else IfEqual keys,adewx, Send {U+F1929}
   Else IfEqual keys,adewxz, Send {U+F1958}
   Else IfEqual keys,adewz, Send {U+F191E}
   Else IfEqual keys,adex, Send {U+F1957}
   Else IfEqual keys,adexz, Send {U+F196D}
   Else IfEqual keys,adez, Send {U+F193D}
   Else IfEqual keys,ads, Send {U+F194A}
   Else IfEqual keys,adsw, Send {U+F1912}
   Else IfEqual keys,adswx, Send {U+F1923}
   Else IfEqual keys,adswxz, Send {U+F1980}
   Else IfEqual keys,adswz, Send {U+F1974}
   Else IfEqual keys,adsx, Send {U+F1960}
   Else IfEqual keys,adsxz, Send {U+F195F}
   Else IfEqual keys,adsz, Send {U+F196F}
   Else IfEqual keys,adw, Send {U+F1932}
   Else IfEqual keys,adwx, Send {U+F196A}
   Else IfEqual keys,adwxz, Send {U+F193A}
   Else IfEqual keys,adwz, Send {U+F1908}
   Else IfEqual keys,adx, Send {U+F1931}
   Else IfEqual keys,adxz, Send {U+F1920}
   Else IfEqual keys,adz, Send {U+F190B}
   Else IfEqual keys,ae, Send {U+F1916}
   Else IfEqual keys,aes, Send {U+F1930}
   Else IfEqual keys,aesw, Send {U+F1952}
   Else IfEqual keys,aeswx, Send {U+F1914}
   Else IfEqual keys,aeswxz, Send {U+F1937}
   Else IfEqual keys,aeswz, Send {U+F1972}
   Else IfEqual keys,aesx, Send {U+F1907}
   Else IfEqual keys,aesxz, Send {U+F1951}
   Else IfEqual keys,aesz, Send {U+F1965}
   Else IfEqual keys,aew, Send {U+F1936}
   Else IfEqual keys,aewx, Send {U+F1926}
   Else IfEqual keys,aewxz, Send {U+F192F}
   Else IfEqual keys,aewz, Send {U+F1943}
   Else IfEqual keys,aex, Send {U+200D}
   Else IfEqual keys,aexz, Send {U+F1976}
   Else IfEqual keys,aez, Send {U+F1919}
   Else IfEqual keys,as, Send {U+F1902}
   Else IfEqual keys,asw, Send {U+F1977}
   Else IfEqual keys,aswx, Send {U+F192B}
   Else IfEqual keys,aswxz, Send {U+F194F}
   Else IfEqual keys,aswz, Send {U+F1905}
   Else IfEqual keys,asx, Send {U+F1950}
   Else IfEqual keys,asxz, Send {U+F1953}
   Else IfEqual keys,asz, Send {U+F1961}
   Else IfEqual keys,aw, Send {U+F194D}
   Else IfEqual keys,awx, Send {U+F193E}
   Else IfEqual keys,awxz, Send {U+F192D}
   Else IfEqual keys,awz, Send {U+F1948}
   Else IfEqual keys,ax, Send {U+F1969}
   Else IfEqual keys,axz, Send {U+F1949}
   Else IfEqual keys,az, Send {U+F1959}
   Else IfEqual keys,d, Send {U+F195E}
   Else IfEqual keys,de, Send {U+F193C}
   Else IfEqual keys,des, Send {U+F196C}
   Else IfEqual keys,desw, Send {U+F190F}
   Else IfEqual keys,deswx, Send {U+F191C}
   Else IfEqual keys,deswxz, Send {U+F1964}
   Else IfEqual keys,deswz, Send {U+F1901}
   Else IfEqual keys,desx, Send {U+F195A}{U+FE01}
   Else IfEqual keys,desxz, Send {U+F191B}
   Else IfEqual keys,desz, Send {U+F1917}
   Else IfEqual keys,dew, Send {U+F1915}
   Else IfEqual keys,dewx, Send {U+F195B}
   Else IfEqual keys,dewxz, Send {U+F1940}
   Else IfEqual keys,dewz, Send {U+F1971}
   Else IfEqual keys,dex, Send {U+F1939}{U+FE01}
   Else IfEqual keys,dexz, Send {U+F1924}
   Else IfEqual keys,dez, Send {U+F195D}
   Else IfEqual keys,ds, Send {U+F1941}
   Else IfEqual keys,dsw, Send {U+F1947}
   Else IfEqual keys,dswx, Send {U+F1925}
   Else IfEqual keys,dswxz, Send {U+F1962}
   Else IfEqual keys,dswz, Send {U+F1945}{U+FE01}
   Else IfEqual keys,dsx, Send {U+F194E}
   Else IfEqual keys,dsxz, Send {U+F192A}
   Else IfEqual keys,dsz, Send {U+F196B}
   Else IfEqual keys,dw, Send {U+F1968}
   Else IfEqual keys,dwx, Send {U+F190C}
   Else IfEqual keys,dwxz, Send {U+F1903}
   Else IfEqual keys,dwz, Send {U+F191F}
   Else IfEqual keys,dx, Send {BackSpace}
   Else IfEqual keys,dxz, Send {U+F1911}
   Else IfEqual keys,dz, Send {U+F194C}
   Else IfEqual keys,e, Send {U+F1946}
   Else IfEqual keys,es, Send {U+F1967}
   Else IfEqual keys,esw, Send {U+F1918}
   Else IfEqual keys,eswx, Send {U+F195C}
   Else IfEqual keys,eswxz, Send {U+F1975}
   Else IfEqual keys,eswz, Send {U+F1922}
   Else IfEqual keys,esx, Send {U+F1954}
   Else IfEqual keys,esxz, Send {U+F1966}
   Else IfEqual keys,esz, Send {U+F1942}
   Else IfEqual keys,ew, Send {U+F1921}
   Else IfEqual keys,ewx, Send {U+F193B}
   Else IfEqual keys,ewxz, Send {U+F191D}
   Else IfEqual keys,ewz, Send {U+F1963}
   Else IfEqual keys,ex, Send {U+F1990}
   Else IfEqual keys,exz, Send {U+F1906}
   Else IfEqual keys,ez, Send {U+F1956}
   Else IfEqual keys,s, Send {Enter}
   Else IfEqual keys,sw, Send {U+F192C}
   Else IfEqual keys,swx, Send {U+F193F}
   Else IfEqual keys,swxz, Send {U+F192E}
   Else IfEqual keys,swz, Send {U+F190D}
   Else IfEqual keys,sx, Send {U+F1944}
   Else IfEqual keys,sxz, Send {U+F1913}
   Else IfEqual keys,sz, Send {U+F1900}
   Else IfEqual keys,w, Send {U+F1934}
   Else IfEqual keys,wx, Send {U+300C}
   Else IfEqual keys,wxz, Send {U+F1928}
   Else IfEqual keys,wz, Send {U+F1997}
   Else IfEqual keys,x, Send {U+F1927}
   Else IfEqual keys,xz, Send {U+F1986}
   Else IfEqual keys,z, Send {U+F1909}
   Else SetEnv SentTick, 0    ; when no key sent
Return
