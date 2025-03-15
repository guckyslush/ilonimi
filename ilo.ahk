; Toki Pona Honeycomb Stenography Keyboard [2025-03-15]
;
;	Amalgamated by: jan Kukisulasu
;
;   Original scripts
;       Chording: Laszlo (https://www.autohotkey.com/board/topic/6426-chording-keyboard-strings-sent-at-key-combinations/)
;       Toggling: Boiler (https://www.autohotkey.com/boards/viewtopic.php?t=80473)
;		Doublepress: Gev (https://www.autohotkey.com/boards/viewtopic.php?t=30039)
;
;
; This script is quite volatile. It's essentially a reskin of
; someone else's script, AutoHotKey is not my field...
; 
; To output a word, you have to press each key in its configuration at the same time.
;
; KEYS (Turn your keyboard 90 degrees counterclockwise)
;     [d]
; [e]     [x]
;     [s]
; [w]     [z]
;     [a]
; 
; You might get issues with the script spamming an output but it's not that big of a deal haha
; Preferably, this script's input method would be holding each key down and only outputting on
; release like an actual stenography keyboard, probably by using KeyWait. If you're interested
; in helping, please feel free to message me! Even if it's been years since I wrote this, if
; this message is still here, then I'm still happy to edit this script with someone who
; actually knows how to use AHK (not me).
; 
; F1 key toggles this script on and off
; 




StringCaseSense Off
Process Priority,,High
#MaxHotkeysPerInterval 999
#UseHook
SetKeyDelay -1

SentTick = 0
keys = adeswxz32
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
    or A_TickCount - SentTick < 200 and key1 <> keys  ; first auto-repeat
    or A_TickCount - SentTick < 25  and key1 == keys) ; auto-repeat
       Return
   key1 = %key0%
   key0 = %keys%
   SentTick = %A_TickCount%
   IfEqual keys,a, {
			count++ 
			Send {U+3000} ; fullwidth space
			if (count=1)
				SetTimer Interpunct, -200
			return
			
				Interpunct:
			if (count=2) ; double-press
				Send {Backspace 2}{U+F199C} ; interpunct
			count:=0
			return
		}
   
   Else IfEqual keys,ad, Send {U+F199D} ; colon
   Else IfEqual keys,ade, Send {U+F196E} ; tu
   Else IfEqual keys,ades, Send {U+F1973} ; wan
   Else IfEqual keys,adesw, Send {U+F1938} ; monsi
   Else IfEqual keys,adeswx, Send {U+F191A} ; kili
   Else IfEqual keys,adeswxz, Send {U+F1904} ; ale
   Else IfEqual keys,adeswz, Send {U+F194B} ; pan
   Else IfEqual keys,adesx, Send {U+F190E} ; ilo
   Else IfEqual keys,adesxz, Send {U+F1910} ; jaki
   Else IfEqual keys,adesz, Send {U+F190A} ; en
   Else IfEqual keys,adew, Send {U+F1970} ; uta
   Else IfEqual keys,adewx, Send {U+F1929} ; linja
   Else IfEqual keys,adewxz, Send {U+F1958} ; selo
   Else IfEqual keys,adewz, Send {U+F191E} ; kule
   Else IfEqual keys,adex, Send {U+F1957} ; seli
   Else IfEqual keys,adexz, Send {U+F196D} ; tomo
   Else IfEqual keys,adez, Send {U+F193D} ; nanpa
   Else IfEqual keys,ads, Send {U+F194A} ; palisa
   Else IfEqual keys,adsw, Send {U+F1912} ; jelo
   Else IfEqual keys,adswx, Send {U+F1923} ; laso
   Else IfEqual keys,adswxz, Send {U+F1980} ; kijetesantakalu
   Else IfEqual keys,adswz, Send {U+F1974} ; waso
   Else IfEqual keys,adsx, Send {U+F1960} ; sitelen
   Else IfEqual keys,adsxz, Send {U+F195F} ; sinpin
   Else IfEqual keys,adsz, Send {U+F196F} ; unpa
   Else IfEqual keys,adw, Send {U+F1932} ; mani
   Else IfEqual keys,adwx, Send {U+F196A} ; telo
   Else IfEqual keys,adwxz, Send {U+F193A} ; mun
   Else IfEqual keys,adwz, Send {U+F1908} ; awen
   Else IfEqual keys,adx, Send {U+F1931} ; mama
   Else IfEqual keys,adxz, Send {U+F1920} ; kute
   Else IfEqual keys,adz, Send {U+F190B} ; esun
   Else IfEqual keys,ae, Send {U+F1968} ; taso
   Else IfEqual keys,aes, Send {U+F1930} ; ma
   Else IfEqual keys,aesw, Send {U+F1952} ; poka
   Else IfEqual keys,aeswx, Send {U+F1914} ; kala
   Else IfEqual keys,aeswxz, Send {U+F1937} ; moli
   Else IfEqual keys,aeswz, Send {U+F1972} ; walo
   Else IfEqual keys,aesx, Send {U+F1907} ; anu
   Else IfEqual keys,aesxz, Send {U+F1951} ; pipi
   Else IfEqual keys,aesz, Send {U+F1965} ; supa
   Else IfEqual keys,aew, Send {U+F1936} ; moku
   Else IfEqual keys,aewx, Send {U+F1926} ; lete
   Else IfEqual keys,aewxz, Send {U+F192F} ; lupa
   Else IfEqual keys,aewz, Send {U+F1943} ; noka
   Else IfEqual keys,aex, Send {U+200D} ; zero width joiner
   Else IfEqual keys,aexz, Send {U+F1976} ; weka
   Else IfEqual keys,aez, Send {U+F1919} ; kepeken
   Else IfEqual keys,as, Send {U+F1902} ; ala
   Else IfEqual keys,asw, Send {U+F1977} ; wile
   Else IfEqual keys,aswx, Send {U+F192B} ; loje
   Else IfEqual keys,aswxz, Send {U+F194F} ; pimeja
   Else IfEqual keys,aswz, Send {U+F1905} ; anpa
   Else IfEqual keys,asx, Send {U+F1950} ; pini
   Else IfEqual keys,asxz, Send {U+F1953} ; poki
   Else IfEqual keys,asz, Send {U+F1961} ; sona
   Else IfEqual keys,aw, Send {U+F194D} ; pi
   Else IfEqual keys,awx, Send {U+F193E} ; nasa
   Else IfEqual keys,awxz, Send {U+F192D} ; luka
   Else IfEqual keys,awz, Send {U+F1948} ; pakala
   Else IfEqual keys,ax, Send {U+F194C} ; pana
   Else IfEqual keys,axz, Send {U+F1949} ; pali
   Else IfEqual keys,az, Send {U+F1959} ; seme
   Else IfEqual keys,d, Send {U+F195E} ; sina
   Else IfEqual keys,de, Send {U+F193C} ; mute
   Else IfEqual keys,des, Send {U+F196C} ; toki
   Else IfEqual keys,desw, Send {U+F190F} ; insa
   Else IfEqual keys,deswx, Send {U+F191C} ; ko
   Else IfEqual keys,deswxz, Send {U+F1964} ; suno
   Else IfEqual keys,deswz, Send {U+F1901} ; akesi
   Else IfEqual keys,desx, Send {U+F195A}{U+FE01} ; sewi (secular)
   Else IfEqual keys,desxz, Send {U+F191B} ; kiwen
   Else IfEqual keys,desz, Send {U+F1917} ; kasi
   Else IfEqual keys,dew, Send {U+F1915} ; kalama
   Else IfEqual keys,dewx, Send {U+F195B} ; sijelo
   Else IfEqual keys,dewxz, Send {U+F1940} ; nena
   Else IfEqual keys,dewz, Send {U+F1971} ; utala
   Else IfEqual keys,dex, Send {U+F1939}{U+FE01} ; mu (emitter)
   Else IfEqual keys,dexz, Send {U+F1924} ; lawa
   Else IfEqual keys,dez, Send {U+F195D} ; sin
   Else IfEqual keys,ds, Send {U+F1941} ; ni
   Else IfEqual keys,dsw, Send {U+F1947} ; open
   Else IfEqual keys,dswx, Send {U+F1925} ; len
   Else IfEqual keys,dswxz, Send {U+F1962} ; soweli
   Else IfEqual keys,dswz, Send {U+F1945} ; olin
   Else IfEqual keys,dsx, Send {U+F194E} ; pilin
   Else IfEqual keys,dsxz, Send {U+F192A} ; lipu
   Else IfEqual keys,dsz, Send {U+F196B} ; tenpo
   Else IfEqual keys,dw, Send {U+F1916} ; kama
   Else IfEqual keys,dwx, Send {U+F190C} ; ijo
   Else IfEqual keys,dwxz, Send {U+F1903} ; alasa
   Else IfEqual keys,dwz, Send {U+F191F} ; kulupu
   Else IfEqual keys,dx, Send {BackSpace} ; 
   Else IfEqual keys,dxz, Send {U+F1911} ; jan
   Else IfEqual keys,dz, Send {U+F1969} ; tawa
   Else IfEqual keys,e, Send {U+F1946} ; ona
   Else IfEqual keys,es, Send {U+F1967} ; tan
   Else IfEqual keys,esw, Send {U+F1918} ; ken
   Else IfEqual keys,eswx, Send {U+F195C} ; sike
   Else IfEqual keys,eswxz, Send {U+F1975} ; wawa
   Else IfEqual keys,eswz, Send {U+F1922} ; lape
   Else IfEqual keys,esx, Send {U+F1954} ; pona
   Else IfEqual keys,esxz, Send {U+F1966} ; suwi
   Else IfEqual keys,esz, Send {U+F1942} ; nimi
   Else IfEqual keys,ew, Send {U+F1921} ; la
   Else IfEqual keys,ewx, Send {U+F193B} ; musi
   Else IfEqual keys,ewxz, Send {U+F191D} ; kon
   Else IfEqual keys,ewz, Send {U+F1963} ; suli
   Else IfEqual keys,ex, {
			ToggleCartouche := !ToggleCartouche ; cartouche
			if ToggleCartouche
			{
				Send {U+F1990} ; open cartouche
			}
			else
			{
				Send {U+F1991} ; close cartouche
			}
		}
   Else IfEqual keys,exz, Send {U+F1906} ; ante
   Else IfEqual keys,ez, Send {U+F1956} ; sama
   Else IfEqual keys,s, Send {Enter} ; 
   Else IfEqual keys,sw, Send {U+F192C} ; lon
   Else IfEqual keys,swx, Send {U+F193F} ; nasin
   Else IfEqual keys,swxz, Send {U+F192E} ; lukin
   Else IfEqual keys,swz, Send {U+F190D} ; ike
   Else IfEqual keys,sx, Send {U+F1944} ; o
   Else IfEqual keys,sxz, Send {U+F1913} ; jo
   Else IfEqual keys,sz, Send {U+F1986} ; n
   Else IfEqual keys,w, Send {U+F1934} ; mi
   Else IfEqual keys,wx, {
			ToggleQuote := !ToggleQuote ; quotes
			if ToggleQuote
			{
				Send {U+300C} ; te
			}
			else
			{
				Send {U+300D} ; to
			}
		}
   Else IfEqual keys,wxz, Send {U+F1928} ; lili
   Else IfEqual keys,wz, {
			ToggleContainer := !ToggleContainer ; container
			if ToggleContainer
			{
				Send {U+F1997} ; open container
			}
			else
			{
				Send {U+F1998} ; close container
			}
		}
   Else IfEqual keys,x, Send {U+F1927} ; li
   Else IfEqual keys,xz, Send {U+F1900} ; a
   Else IfEqual keys,z, Send {U+F1909} ; e
   
    ; Special "temporary" or alternate indices (3 and 2 used)
   Else IfEqual keys,ex3, Send {U+F1991} ; close cartouche
   Else IfEqual keys,wz3, Send {U+F1998} ; close container
   Else IfEqual keys,wx3, Send {U+300D} ; to
   Else IfEqual keys,3, Send {U+FE01} ; alternate glyph selector
   Else IfEqual keys,2, Send {U+F199C} ; interpunct
   
	;; Direction keys
   Else IfEqual keys,d3, Send {Up} ; 
   Else IfEqual keys,a3, Send {Down} ; 
   Else IfEqual keys,w3, Send {Left} ; 
   Else IfEqual keys,z3, Send {Right} ; 

   Else SetEnv SentTick, 0    ; when no key sent
Return

f1::Suspend,Toggle
