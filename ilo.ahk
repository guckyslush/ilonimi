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
			ToggleNiColon := false ; get ready for a lot of ToggleNiColons lol there has got to be a better way to do this
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
		
   Else IfEqual keys,ad, {
			if ToggleNiColon
			{
				Send {U+FE01} ; point ni to the right
			}
			Send {U+F199D} ; colon 
			ToggleNiColon := false
		}
   Else IfEqual keys,ade, {
			 Send {U+F196E}
			ToggleNiColon := false
		} ; tu
   Else IfEqual keys,ades, {
			 Send {U+F1973}
			ToggleNiColon := false
		} ; wan
   Else IfEqual keys,adesw, {
			 Send {U+F1938}
			ToggleNiColon := false
		} ; monsi
   Else IfEqual keys,adeswx, {
			 Send {U+F191A}
			ToggleNiColon := false
		} ; kili
   Else IfEqual keys,adeswxz, {
			 Send {U+F1904}
			ToggleNiColon := false
		} ; ale
   Else IfEqual keys,adeswz, {
			 Send {U+F194B}
			ToggleNiColon := false
		} ; pan
   Else IfEqual keys,adesx, {
			 Send {U+F190E}
			ToggleNiColon := false
		} ; ilo
   Else IfEqual keys,adesxz, {
			 Send {U+F1910}
			ToggleNiColon := false
		} ; jaki
   Else IfEqual keys,adesz, {
			 Send {U+F190A}
			ToggleNiColon := false
		} ; en
   Else IfEqual keys,adew, {
			 Send {U+F1970}
			ToggleNiColon := false
		} ; uta
   Else IfEqual keys,adewx, {
			 Send {U+F1929}
			ToggleNiColon := false
		} ; linja
   Else IfEqual keys,adewxz, {
			 Send {U+F1958}
			ToggleNiColon := false
		} ; selo
   Else IfEqual keys,adewz, {
			 Send {U+F191E}
			ToggleNiColon := false
		} ; kule
   Else IfEqual keys,adex, {
			 Send {U+F1957}
			ToggleNiColon := false
		} ; seli
   Else IfEqual keys,adexz, {
			 Send {U+F196D}
			ToggleNiColon := false
		} ; tomo
   Else IfEqual keys,adez, {
			 Send {U+F193D}
			ToggleNiColon := false
		} ; nanpa
   Else IfEqual keys,ads, {
			 Send {U+F194A}
			ToggleNiColon := false
		} ; palisa
   Else IfEqual keys,adsw, {
			 Send {U+F1912}
			ToggleNiColon := false
		} ; jelo
   Else IfEqual keys,adswx, {
			 Send {U+F1923}
			ToggleNiColon := false
		} ; laso
   Else IfEqual keys,adswxz, {
			 Send {U+F1980}
			ToggleNiColon := false
		} ; kijetesantakalu
   Else IfEqual keys,adswz, {
			 Send {U+F1974}
			ToggleNiColon := false
		} ; waso
   Else IfEqual keys,adsx, {
			 Send {U+F1960}
			ToggleNiColon := false
		} ; sitelen
   Else IfEqual keys,adsxz, {
			 Send {U+F195F}
			ToggleNiColon := false
		} ; sinpin
   Else IfEqual keys,adsz, {
			 Send {U+F196F}
			ToggleNiColon := false
		} ; unpa
   Else IfEqual keys,adw, {
			 Send {U+F1932}
			ToggleNiColon := false
		} ; mani
   Else IfEqual keys,adwx, {
			 Send {U+F196A}
			ToggleNiColon := false
		} ; telo
   Else IfEqual keys,adwxz, {
			 Send {U+F193A}
			ToggleNiColon := false
		} ; mun
   Else IfEqual keys,adwz, {
			 Send {U+F1908}
			ToggleNiColon := false
		} ; awen
   Else IfEqual keys,adx, {
			 Send {U+F1931}
			ToggleNiColon := false
		} ; mama
   Else IfEqual keys,adxz, {
			 Send {U+F1920}
			ToggleNiColon := false
		} ; kute
   Else IfEqual keys,adz, {
			 Send {U+F190B}
			ToggleNiColon := false
		} ; esun
   Else IfEqual keys,ae, {
			 Send {U+F1968}
			ToggleNiColon := false
		} ; taso
   Else IfEqual keys,aes, {
			 Send {U+F1930}
			ToggleNiColon := false
		} ; ma
   Else IfEqual keys,aesw, {
			 Send {U+F1952}
			ToggleNiColon := false
		} ; poka
   Else IfEqual keys,aeswx, {
			 Send {U+F1914}
			ToggleNiColon := false
		} ; kala
   Else IfEqual keys,aeswxz, {
			 Send {U+F1937}
			ToggleNiColon := false
		} ; moli
   Else IfEqual keys,aeswz, {
			 Send {U+F1972}
			ToggleNiColon := false
		} ; walo
   Else IfEqual keys,aesx, {
			 Send {U+F1907}
			ToggleNiColon := false
		} ; anu
   Else IfEqual keys,aesxz, {
			 Send {U+F1951}
			ToggleNiColon := false
		} ; pipi
   Else IfEqual keys,aesz, {
			 Send {U+F1965}
			ToggleNiColon := false
		} ; supa
   Else IfEqual keys,aew, {
			 Send {U+F1936}
			ToggleNiColon := false
		} ; moku
   Else IfEqual keys,aewx, {
			 Send {U+F1926}
			ToggleNiColon := false
		} ; lete
   Else IfEqual keys,aewxz, {
			 Send {U+F192F}
			ToggleNiColon := false
		} ; lupa
   Else IfEqual keys,aewz, {
			 Send {U+F1943}
			ToggleNiColon := false
		} ; noka
   Else IfEqual keys,aex, {
			 Send {U+200D}
			ToggleNiColon := false
		} ; zero width joiner
   Else IfEqual keys,aexz, {
			 Send {U+F1976}
			ToggleNiColon := false
		} ; weka
   Else IfEqual keys,aez, {
			 Send {U+F1919}
			ToggleNiColon := false
		} ; kepeken
   Else IfEqual keys,as, {
			 Send {U+F1902}
			ToggleNiColon := false
		} ; ala
   Else IfEqual keys,asw, {
			 Send {U+F1977}
			ToggleNiColon := false
		} ; wile
   Else IfEqual keys,aswx, {
			 Send {U+F192B}
			ToggleNiColon := false
		} ; loje
   Else IfEqual keys,aswxz, {
			 Send {U+F194F}
			ToggleNiColon := false
		} ; pimeja
   Else IfEqual keys,aswz, {
			 Send {U+F1905}
			ToggleNiColon := false
		} ; anpa
   Else IfEqual keys,asx, {
			 Send {U+F1950}
			ToggleNiColon := false
		} ; pini
   Else IfEqual keys,asxz, {
			 Send {U+F1953}
			ToggleNiColon := false
		} ; poki
   Else IfEqual keys,asz, {
			 Send {U+F1961}
			ToggleNiColon := false
		} ; sona
   Else IfEqual keys,aw, {
			 Send {U+F194D}
			ToggleNiColon := false
		} ; pi
   Else IfEqual keys,awx, {
			 Send {U+F193E}
			ToggleNiColon := false
		} ; nasa
   Else IfEqual keys,awxz, {
			 Send {U+F192D}
			ToggleNiColon := false
		} ; luka
   Else IfEqual keys,awz, {
			 Send {U+F1948}
			ToggleNiColon := false
		} ; pakala
   Else IfEqual keys,ax, {
			 Send {U+F194C}
			ToggleNiColon := false
		} ; pana
   Else IfEqual keys,axz, {
			 Send {U+F1949}
			ToggleNiColon := false
		} ; pali
   Else IfEqual keys,az, {
			 Send {U+F1959}
			ToggleNiColon := false
		} ; seme
   Else IfEqual keys,d, {
			 Send {U+F195E}
			ToggleNiColon := false
		} ; sina
   Else IfEqual keys,de, {
			 Send {U+F193C}
			ToggleNiColon := false
		} ; mute
   Else IfEqual keys,des, {
			 Send {U+F196C}
			ToggleNiColon := false
		} ; toki
   Else IfEqual keys,desw, {
			 Send {U+F190F}
			ToggleNiColon := false
		} ; insa
   Else IfEqual keys,deswx, {
			 Send {U+F191C}
			ToggleNiColon := false
		} ; ko
   Else IfEqual keys,deswxz, {
			 Send {U+F1964}
			ToggleNiColon := false
		} ; suno
   Else IfEqual keys,deswz, {
			 Send {U+F1901}
			ToggleNiColon := false
		} ; akesi
   Else IfEqual keys,desx, {
			 Send {U+F195A}{U+FE01}
			ToggleNiColon := false
		} ; sewi (secular)
   Else IfEqual keys,desxz, {
			 Send {U+F191B}
			ToggleNiColon := false
		} ; kiwen
   Else IfEqual keys,desz, {
			 Send {U+F1917}
			ToggleNiColon := false
		} ; kasi
   Else IfEqual keys,dew, {
			 Send {U+F1915}
			ToggleNiColon := false
		} ; kalama
   Else IfEqual keys,dewx, {
			 Send {U+F195B}
			ToggleNiColon := false
		} ; sijelo
   Else IfEqual keys,dewxz, {
			 Send {U+F1940}
			ToggleNiColon := false
		} ; nena
   Else IfEqual keys,dewz, {
			 Send {U+F1971}
			ToggleNiColon := false
		} ; utala
   Else IfEqual keys,dex, {
			 Send {U+F1939}{U+FE01}
			ToggleNiColon := false
		} ; mu (emitter)
   Else IfEqual keys,dexz, {
			 Send {U+F1924}
			ToggleNiColon := false
		} ; lawa
   Else IfEqual keys,dez, {
			 Send {U+F195D}
			ToggleNiColon := false
		} ; sin
   Else IfEqual keys,ds, {
			 Send {U+F1941}
			ToggleNiColon := true
		} ; ni
   Else IfEqual keys,dsw, {
			 Send {U+F1947}
			ToggleNiColon := false
		} ; open
   Else IfEqual keys,dswx, {
			 Send {U+F1925}
			ToggleNiColon := false
		} ; len
   Else IfEqual keys,dswxz, {
			 Send {U+F1962}
			ToggleNiColon := false
		} ; soweli
   Else IfEqual keys,dswz, {
			 Send {U+F1945}
			ToggleNiColon := false
		} ; olin
   Else IfEqual keys,dsx, {
			 Send {U+F194E}
			ToggleNiColon := false
		} ; pilin
   Else IfEqual keys,dsxz, {
			 Send {U+F192A}
			ToggleNiColon := false
		} ; lipu
   Else IfEqual keys,dsz, {
			 Send {U+F196B}
			ToggleNiColon := false
		} ; tenpo
   Else IfEqual keys,dw, {
			 Send {U+F1916}
			ToggleNiColon := false
		} ; kama
   Else IfEqual keys,dwx, {
			 Send {U+F190C}
			ToggleNiColon := false
		} ; ijo
   Else IfEqual keys,dwxz, {
			 Send {U+F1903}
			ToggleNiColon := false
		} ; alasa
   Else IfEqual keys,dwz, {
			 Send {U+F191F}
			ToggleNiColon := false
		} ; kulupu
   Else IfEqual keys,dx, {
			 Send {BackSpace}
			ToggleNiColon := false
		} ; 
   Else IfEqual keys,dxz, {
			 Send {U+F1911}
			ToggleNiColon := false
		} ; jan
   Else IfEqual keys,dz, {
			 Send {U+F1969}
			ToggleNiColon := false
		} ; tawa
   Else IfEqual keys,e, {
			 Send {U+F1946}
			ToggleNiColon := false
		} ; ona
   Else IfEqual keys,es, {
			 Send {U+F1967}
			ToggleNiColon := false
		} ; tan
   Else IfEqual keys,esw, {
			 Send {U+F1918}
			ToggleNiColon := false
		} ; ken
   Else IfEqual keys,eswx, {
			 Send {U+F195C}
			ToggleNiColon := false
		} ; sike
   Else IfEqual keys,eswxz, {
			 Send {U+F1975}
			ToggleNiColon := false
		} ; wawa
   Else IfEqual keys,eswz, {
			 Send {U+F1922}
			ToggleNiColon := false
		} ; lape
   Else IfEqual keys,esx, {
			 Send {U+F1954}
			ToggleNiColon := false
		} ; pona
   Else IfEqual keys,esxz, {
			 Send {U+F1966}
			ToggleNiColon := false
		} ; suwi
   Else IfEqual keys,esz, {
			 Send {U+F1942}
			ToggleNiColon := false
		} ; nimi
   Else IfEqual keys,ew, {
			 Send {U+F1921}
			ToggleNiColon := false
		} ; la
   Else IfEqual keys,ewx, {
			 Send {U+F193B}
			ToggleNiColon := false
		} ; musi
   Else IfEqual keys,ewxz, {
			 Send {U+F191D}
			ToggleNiColon := false
		} ; kon
   Else IfEqual keys,ewz, {
			 Send {U+F1963}
			ToggleNiColon := false
		} ; suli
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
			ToggleNiColon := false
		}
   Else IfEqual keys,exz, {
			 Send {U+F1906}
			ToggleNiColon := false
		} ; ante
   Else IfEqual keys,ez, {
			 Send {U+F1956}
			ToggleNiColon := false
		} ; sama
   Else IfEqual keys,s, {
			 Send {Enter}
			ToggleNiColon := false
		} ; 
   Else IfEqual keys,sw, {
			 Send {U+F192C}
			ToggleNiColon := false
		} ; lon
   Else IfEqual keys,swx, {
			 Send {U+F193F}
			ToggleNiColon := false
		} ; nasin
   Else IfEqual keys,swxz, {
			 Send {U+F192E}
			ToggleNiColon := false
		} ; lukin
   Else IfEqual keys,swz, {
			 Send {U+F190D}
			ToggleNiColon := false
		} ; ike
   Else IfEqual keys,sx, {
			 Send {U+F1944}
			ToggleNiColon := false
		} ; o
   Else IfEqual keys,sxz, {
			 Send {U+F1913}
			ToggleNiColon := false
		} ; jo
   Else IfEqual keys,sz, {
			 Send {U+F1986}
			ToggleNiColon := false
		} ; n
   Else IfEqual keys,w, {
			 Send {U+F1934}
			ToggleNiColon := false
		} ; mi
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
			ToggleNiColon := false
		}
   Else IfEqual keys,wxz, {
			 Send {U+F1928}
			ToggleNiColon := false
		} ; lili
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
			ToggleNiColon := false
		}
   Else IfEqual keys,x, {
			 Send {U+F1927}
			ToggleNiColon := false
		} ; li
   Else IfEqual keys,xz, {
			 Send {U+F1900}
			ToggleNiColon := false
		} ; a
   Else IfEqual keys,z, {
			 Send {U+F1909}
			ToggleNiColon := false
		} ; e

    ; Special "temporary" or alternate indices (3 and 2 used)
   Else IfEqual keys,ex3, {
			 Send {U+F1991}
			ToggleNiColon := false
		} ; close cartouche
   Else IfEqual keys,wz3, {
			 Send {U+F1998}
			ToggleNiColon := false
		} ; close container
   Else IfEqual keys,wx3, {
			 Send {U+300D}
			ToggleNiColon := false
		} ; to
   Else IfEqual keys,3, {
			 Send {U+FE01}
			ToggleNiColon := false
		} ; alternate glyph selector
   Else IfEqual keys,2, {
			 Send {U+F199C}
			ToggleNiColon := false
		} ; interpunct
   
	;; Direction keys
   Else IfEqual keys,d3, {
			 Send {Up}
			ToggleNiColon := false
		} ; 
   Else IfEqual keys,a3, {
			 Send {Down}
			ToggleNiColon := false
		} ; 
   Else IfEqual keys,w3, {
			 Send {Left}
			ToggleNiColon := false
		} ; 
   Else IfEqual keys,z3, {
			 Send {Right}
			ToggleNiColon := false
		} ; 

   Else SetEnv SentTick, 0    ; when no key sent
Return

f1::Suspend,Toggle
