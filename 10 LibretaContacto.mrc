;Adaptado y traducido del original de Queen_Amidala, por Aciago, aciago@scoutlink.net
on *:START:{ 
  if (!$hget(q-ainfo-manager)) { 
    hmake q-ainfo-manager 100 
  }
  if ($exists(" $+ $scriptdirq-ainfo-manager.hsh")) { 
    hload q-ainfo-manager " $+ $scriptdirq-ainfo-manager.hsh"
  }
}
dialog Q-Ainfo-manager {
  title "Libreta de Contactos"
  size -1 -1 209 145
  option dbu
  tab "Contactos", 1, 4 4 201 137
  box "Nicks", 4, 9 22 74 112, tab 1
  list 9, 16 33 59 86, tab 1 sort size
  text "Nombre Real", 90, 87 25 31 8, tab 1
  text "Rol en ScoutLink", 91, 87 47 39 7, tab 1
  edit "", 14, 87 34 113 10, tab 1 read autohs
  edit "", 16, 87 55 113 23, tab 1 read multi
  button "Whois", 50, 137 85 28 12, tab 1
  button "Memo", 52, 166 85 32 12, tab 1
  button "Copiar Info", 64, 137 99 61 12, tab 1
  button "GRABAR", 13, 170 21 30 8, tab 1
  button "Borrar", 8, 16 122 36 8, tab 1
  icon 54, 88 82 43 34,  " $+ $scriptdirnpaicon.jpg", 0, tab 1
  tab "Direcciones / Teléfonos", 2
  box "Nicks", 5, 9 22 74 112, tab 2
  list 10, 16 33 59 86, tab 2 sort size
  text "Correo-E", 93, 87 24 40 8, tab 2
  text "Correo-E", 94, 88 50 41 8, tab 2
  text "Teléfono", 95, 90 111 21 7, tab 2
  text "Alternativo", 96, 90 123 27 7, tab 2
  text "País/Región", 42, 88 87 40 8, tab 2
  edit "", 20, 87 33 114 10, tab 2 read autohs
  button "Enviar Mail", 65, 164 44 37 9, tab 2
  edit "", 22, 88 60 113 22, tab 2 read multi
  edit "", 44, 128 86 73 10, tab 2 read autohs
  edit "", 24, 120 108 68 10, tab 2 read autohs
  edit "", 26, 120 120 68 10, tab 2 read autohs
  button "Grabar", 27, 170 21 30 8, tab 2
  button "Borrar", 107, 16 122 36 8, tab 2
  tab "Otra Info", 3
  box "Nicks", 6, 9 22 74 112, tab 3
  list 11, 16 33 59 86, tab 3 sort size
  text "Info/Notas:", 97, 87 24 37 8, tab 3
  text "www", 15, 96 80 18 7, tab 3
  text "Cumpleaños", 92, 86 93 230 7, tab 3
  text "Canales Regulares", 46, 86 105 44 8, tab 3
  edit "", 28, 87 33 114 42, tab 3 read multi
  edit "", 17, 109 78 92 10, tab 3 read autohs
  edit "", 18, 120 91 73 10, tab 3 read autohs
  edit "", 48, 86 114 97 20, tab 3 read multi
  button "Grabar", 34, 170 21 30 8, tab 3
  button "Borrar", 108, 16 122 36 8, tab 3
  tab "Editar/Agregar", 35
  box "Editar/Agregar un contacto", 36, 9 20 193 117, tab 35
  text "Nickname", 98, 12 31 24 8, tab 35
  text "Cumpleaños", 99, 107 42 29 8, tab 35
  text "Nombre Real ", 100, 12 42 26 8, tab 35
  text "Correo-E", 101, 12 64 13 8, tab 35
  text "Rol", 102, 12 53 24 8, tab 35
  text "www", 19, 115 54 18 7, tab 35
  text "Tel.", 103, 12 75 16 7, tab 35
  text "Tel. Alt.", 104, 12 86 26 7, tab 35
  text "Correo-E", 105, 107 65 40 7, tab 35
  text "Otra Info", 106, 12 109 26 6, tab 35
  text "País/Región", 30, 107 87 41 7, tab 35
  text "Canales", 38, 12 97 25 7, tab 35
  edit "", 39, 38 29 67 10, tab 35 autohs
  edit "", 43, 38 40 67 10, tab 35 autohs
  edit "", 41, 138 40 61 10, tab 35
  edit "", 47, 38 51 67 10, tab 35 autohs
  edit "", 21, 130 51 69 10, tab 35 autohs
  edit "", 45, 38 62 67 10, tab 35 autohs
  edit "", 49, 38 73 67 10, tab 35 autohs
  edit "", 53, 107 73 92 10, tab 35 autohs
  edit "", 51, 38 84 67 10, tab 35 autohs
  edit "", 40, 38 95 67 10, tab 35 autohs
  combo 29, 107 95 92 39, tab 35 size drop
  edit "", 55, 38 106 161 10, tab 35 autohs
  button "Agregar Foto", 57, 11 121 40 12, tab 35
  button "Editar / Agregar", 37, 148 27 50 11, tab 35
  button "Nuevo", 67, 120 27 26 11, tab 35
  button "Borrar Foto", 69, 52 121 35 12, tab 35
}
dialog q-aim-memo {
  title "Enviar Memo"
  size 1 1 166 87
  option dbu
  box "Enviar Memo a:", 1, 3 3 159 81
  text "Mensaje:", 3, 9 24 55 8
  edit "", 4, 9 34 147 30, multi limit 255
  button "Enviar", 5, 84 65 35 12
  button "Borrar", 6, 121 65 35 12
  edit "", 2, 9 11 70 10, read autohs
  text "Los Memos no deben pasar de 255 caracteres.", 7, 10 67 66 14, center
}
dialog q-aim-whois {
  title "WHOIS"
  size 1 1 157 117
  option dbu
  box "Resultados del Whois para:", 1, 6 4 146 110
  edit "", 3, 12 25 135 84, read multi return autovs
  edit "", 2, 12 12 70 10, read autohs
}
on *:dialog:Q-Ainfo-manager:init:*: { 
  filter -o " $+ $scriptdircountries.txt" q-ainfo-manager 29
  did -c $dname 29 1
  fillInfoNicks $dname
}
on *:dialog:Q-Ainfo-manager:sclick:8: {  
  hdel q-ainfo-manager NICK. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager RN. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager AN. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager BDAY. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager EMAIL. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager MA. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager PH. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager AP. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager OI. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager PIC. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager WEB. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager REGCHAN. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager CR. $+ $did(q-ainfo-manager,9).seltext
  did -g $dname 54 " $+ $iif($hget(q-ainfo-manager, PIC. $+ $did(q-ainfo-manager,9).seltext) && $isfile($hget(q-ainfo-manager, PIC. $+ $did(q-ainfo-manager,9).seltext)),$hget(q-ainfo-manager, PIC. $+ $did(q-ainfo-manager,9).seltext),$scriptdirnpaicon.jpg) $+ "
  fillInfoNicks $dname
  did -r $dname 14,16,17,18,20,22,24,26,28,40,44
  did -r $dname 21,29,39,41,43,45,47,48,49,51,53,55
}
on *:dialog:Q-Ainfo-manager:sclick:9: {
  did -c $dname 10,11 $did(q-ainfo-manager,9,1).sel
  updateNickInfo $dname
  fillAdd $dname
}
on *:dialog:Q-Ainfo-manager:sclick:52:{ 
  dialog -m q-aim-memo q-aim-memo
}

on *:dialog:Q-Aim-memo:init:*: { 
  did -a $dname 2 $did(q-ainfo-manager,9).seltext
}
on *:dialog:Q-Aim-memo:sclick:5: {
  memoserv send $did(q-aim-memo,2) $did(q-aim-memo,4)
  did -r $dname 4
  .timerms_send 1 1 dialog -x q-aim-memo q-aim-memo
}
on *:dialog:Q-Aim-memo:sclick:6: {
  did -r $dname 4
}
on *:dialog:Q-Ainfo-manager:sclick:50:{ 
  dialog -m q-aim-whois q-aim-whois 
}
on *:dialog:Q-Aim-whois:init:*:{
  set %whoisnick $did(q-ainfo-manager,9).seltext
  did -a $dname 2 $did(q-ainfo-manager,9).seltext
  whois %whoisnick
  unset %whoisnick
  set %i-m.enabled $true
} 
raw 311:$($me %whoisnick *):{
  if (%i-m.enabled) {  
    did -a Q-Aim-whois 3 Nick: $2 $crlf
    did -a Q-Aim-whois 3 Dirección: $3 $+ @ $+ $4 $crlf
    did -a Q-Aim-whois 3 Nombre Real: $6- $crlf
  }
}
raw 319:$($me %whoisnick *):{
  if (%i-m.enabled) { 
    did -a Q-Aim-whois 3 Canales: $sorttok($3-,32,c) $crlf
  }
}
raw 312:$($me %whoisnick *):{
  if (%i-m.enabled) { 
    did -a Q-Aim-whois 3 Servidor: $3 $4- $crlf
  }
}
raw 307:$($me %whoisnick *):{
  if (%i-m.enabled) { 
    did -a Q-Aim-whois 3 Estado: $2 $3- $crlf
  }
}
raw 301:$($me %whoisnick *):{
  if (%i-m.enabled) { 
    did -a Q-Aim-whois 3 Away: $3 $crlf
  }
}
raw 301:$($me %whoisnick *):{
  if (%i-m.enabled) { 
    did -a Q-Aim-whois 3 Idle: $duration($3) $crlf
  }
}
raw 318:$($me %whoisnick *):{
  if (%i-m.enabled) { 
    did -a Q-Aim-whois 3 Fin del Whois: $2 $crlf
    unset %i-m.enabled
  }
}
on *:dialog:Q-Ainfo-manager:sclick:64: {
  clipboard -na $did(q-ainfo-manager,9).seltext
  clipboard -na $hget(q-ainfo-manager,RN. $+ $did(q-ainfo-manager,9).seltext)
  clipboard -na $hget(q-ainfo-manager,BDAY. $+ $did(q-ainfo-manager,9).seltext)
  clipboard -na $hget(q-ainfo-manager,ALT. $+ $did(q-ainfo-manager,9).seltext)
  clipboard -na $hget(q-ainfo-manager,EMAIL. $+ $did(q-ainfo-manager,9).seltext)
  clipboard -na $hget(q-ainfo-manager,REGCHAN. $+ $did(q-ainfo-manager,9).seltext)
  clipboard -na $hget(q-ainfo-manager,PH. $+ $did(q-ainfo-manager,9).seltext)
  clipboard -na $hget(q-ainfo-manager,AP. $+ $did(q-ainfo-manager,9).seltext)
  clipboard -na $hget(q-ainfo-manager,WEB. $+ $did(q-ainfo-manager,9).seltext)
  clipboard -na $hget(q-ainfo-manager,MA. $+ $did(q-ainfo-manager,9).seltext)
  clipboard -na $read($scriptdircountries.txt,$iif($hget(q-ainfo-manager,CR. $+ $did(q-ainfo-manager,10).seltext),$hget(q-ainfo-manager,CR. $+ $did(q-ainfo-manager,10).seltext),1))
  clipboard -na $hget(q-ainfo-manager,OI. $+ $did(q-ainfo-manager,9).seltext)
}
on *:dialog:Q-Ainfo-manager:sclick:13: {
  hsave q-ainfo-manager " $+ $scriptdirq-ainfo-manager.hsh"
}
on *:dialog:Q-Ainfo-manager:sclick:10: {
  did -c $dname 9,11 $did(q-ainfo-manager,10,1).sel  
  updateNickInfo $dname
  fillAdd $dname
}
on *:dialog:Q-Ainfo-manager:sclick:65: {
  run mailto: $+ $hget(q-ainfo-manager,EMAIL. $+ $did(q-ainfo-manager,10).seltext) $+ ?Subject=Email From mIRC
}
on *:dialog:Q-Ainfo-manager:sclick:27: {
  hsave q-ainfo-manager " $+ $scriptdirq-ainfo-manager.hsh"
}
on *:dialog:Q-Ainfo-manager:sclick:107: {  
  hdel q-ainfo-manager NICK. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager RN. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager AN. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager BDAY. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager EMAIL. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager MA. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager PH. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager AP. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager OI. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager PIC. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager WEB. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager REGCHAN. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager CR. $+ $did(q-ainfo-manager,9).seltext
  did -g $dname 54 " $+ $iif($hget(q-ainfo-manager, PIC. $+ $did(q-ainfo-manager,10).seltext) && $isfile($hget(q-ainfo-manager, PIC. $+ $did(q-ainfo-manager,10).seltext)),$hget(q-ainfo-manager, PIC. $+ $did(q-ainfo-manager,10).seltext),$scriptdirnpaicon.jpg) $+ "
  fillInfoNicks $dname
  did -r $dname 14,16,17,18,20,22,24,26,28,40,44
  did -r $dname 21,29,39,41,43,45,47,48,49,51,53,55
}



on *:dialog:Q-Ainfo-manager:sclick:11: {
  did -c $dname 9,10 $did(q-ainfo-manager,11,1).sel
  updateNickInfo $dname
  fillAdd $dname
}
on *:dialog:Q-Ainfo-manager:sclick:34: {
  hsave q-ainfo-manager " $+ $scriptdirq-ainfo-manager.hsh"
}
OTHER INFO DELETE BUTTON 108
on *:dialog:Q-Ainfo-manager:sclick:108: {  
  hdel q-ainfo-manager NICK. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager RN. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager AN. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager BDAY. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager EMAIL. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager MA. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager PH. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager AP. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager OI. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager PIC. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager WEB. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager REGCHAN. $+ $did(q-ainfo-manager,9).seltext
  hdel q-ainfo-manager CR. $+ $did(q-ainfo-manager,9).seltext
  did -g $dname 54 " $+ $iif($hget(q-ainfo-manager, PIC. $+ $did(q-ainfo-manager,11).seltext) && $isfile($hget(q-ainfo-manager, PIC. $+ $did(q-ainfo-manager,11).seltext)),$hget(q-ainfo-manager, PIC. $+ $did(q-ainfo-manager,11).seltext),$scriptdirnpaicon.jpg) $+ "
  fillInfoNicks $dname
  did -r $dname 14,16,17,18,20,22,24,26,28,40,44
  did -r $dname 21,29,39,41,43,45,47,48,49,51,53,55
}
on *:dialog:Q-Ainfo-manager:sclick:37: {
  if ($did(q-ainfo-manager,39)) {
    hadd q-ainfo-manager NICK. $+ $did(q-ainfo-manager,39)
    hadd q-ainfo-manager BDAY. $+ $did(q-ainfo-manager,39) $did(q-ainfo-manager,41)
    hadd q-ainfo-manager RN. $+ $did(q-ainfo-manager,39) $did(q-ainfo-manager,43)
    hadd q-ainfo-manager EMAIL. $+ $did(q-ainfo-manager,39) $did(q-ainfo-manager,45) 
    hadd q-ainfo-manager AN. $+ $did(q-ainfo-manager,39) $did(q-ainfo-manager,47)
    hadd q-ainfo-manager WEB. $+ $did(q-ainfo-manager,39) $did(q-ainfo-manager,21)
    hadd q-ainfo-manager PH. $+ $did(q-ainfo-manager,39) $did(q-ainfo-manager,49)
    hadd q-ainfo-manager AP. $+ $did(q-ainfo-manager,39) $did(q-ainfo-manager,51)
    hadd q-ainfo-manager MA. $+ $did(q-ainfo-manager,39) $did(q-ainfo-manager,53)
    hadd q-ainfo-manager OI. $+ $did(q-ainfo-manager,39) $did(q-ainfo-manager,55)
    hadd q-ainfo-manager REGCHAN. $+ $did(q-ainfo-manager,39) $did(q-ainfo-manager,40)
    hadd q-ainfo-manager CR. $+ $did(q-ainfo-manager,39) $did(q-ainfo-manager,29).sel
    did -r $dname 14,16,17,18,20,22,24,26,28,40,44
    did -r $dname 21,39,41,43,45,47,48,49,51,53,55
    did -c $dname 29 1
    did -g $dname 54 " $+ $scriptdirnpaicon.jpg"
    fillInfoNicks $dname
  }
  else { echo -s 14[13Q-Ainfo-manager V1.114] 13ERROR: You must specify a nickname to associate this information with in order to add/edit new information. }
}
on *:dialog:Q-Ainfo-manager:sclick:67: {
  did -r $dname 21,39,40,41,43,45,47,48,49,51,53,55
  did -c $dname 29 1
}
on *:dialog:Q-Ainfo-manager:sclick:57: {
  if ($did(q-ainfo-manager,39)) && ($sfile($scriptdir,Choose A Picture For This User,Add It!)) {
    hadd q-ainfo-manager PIC. $+ $did(q-ainfo-manager,39) $ifmatch
    if (!$hget(q-ainfo-manager,NICK. $+ $did(q-ainfo-manager,39))) { 
      hadd q-ainfo-manager NICK. $+ $did(q-ainfo-manager,39) 
      fillInfoNicks $dname
    }
  }
  did -g $dname 54 " $+ $iif($hget(q-ainfo-manager, PIC. $+ $did(q-ainfo-manager,11).seltext) && $isfile($hget(q-ainfo-manager, PIC. $+ $did(q-ainfo-manager,11).seltext)),$hget(q-ainfo-manager, PIC. $+ $did(q-ainfo-manager,11).seltext),$scriptdirnpaicon.jpg) $+ "
}
on *:dialog:Q-Ainfo-manager:sclick:69: {
  hdel q-ainfo-manager PIC. $+ $did(q-ainfo-manager,11).seltext
  did -g $dname 54 " $+ $scriptdirnpaicon.jpg"
}
alias -l fillInfoNicks {
  did -r $$1 9,10,11
  var %i = 1  
  while ($hfind(q-ainfo-manager,nick.*,%i,w)) { 
    did -a $$1 9,10,11 $gettok($ifmatch,2,46)
    inc %i 
  }
}
alias -l updateNickInfo {
  did -ar $1 14 $hget(q-ainfo-manager,RN. $+ $did(q-ainfo-manager,9).seltext)
  did -ar $1 16 $hget(q-ainfo-manager,AN. $+ $did(q-ainfo-manager,9).seltext)
  did -g $1 54 " $+ $iif($hget(q-ainfo-manager,PIC. $+ $did(q-ainfo-manager,9).seltext) && $isfile($hget(q-ainfo-manager, PIC. $+ $did(q-ainfo-manager,9).seltext)),$hget(q-ainfo-manager, PIC. $+ $did(q-ainfo-manager,9).seltext),$scriptdirnpaicon.jpg) $+ "
  did -ar $1 20 $hget(q-ainfo-manager,EMAIL. $+ $did(q-ainfo-manager,10).seltext)
  did -ar $1 22 $hget(q-ainfo-manager,MA. $+ $did(q-ainfo-manager,10).seltext)
  did -ar $1 24 $hget(q-ainfo-manager,PH. $+ $did(q-ainfo-manager,10).seltext)
  did -ar $1 26 $hget(q-ainfo-manager,AP. $+ $did(q-ainfo-manager,10).seltext)
  did -ar $1 28 $hget(q-ainfo-manager,OI. $+ $did(q-ainfo-manager,11).seltext)
  did -ar $1 17 $hget(q-ainfo-manager,WEB. $+ $did(q-ainfo-manager,11).seltext)
  did -ar $1 18 $hget(q-ainfo-manager,BDAY. $+ $did(q-ainfo-manager,11).seltext)
  did -ar $1 48 $hget(q-ainfo-manager,REGCHAN. $+ $did(q-ainfo-manager,11).seltext)
  did -ar $1 44 $read($scriptdircountries.txt,$iif($hget(q-ainfo-manager,CR. $+ $did(q-ainfo-manager,10).seltext),$hget(q-ainfo-manager,CR. $+ $did(q-ainfo-manager,10).seltext),1))
}
alias -l fillAdd {
  did -ar $1 39 $did(q-ainfo-manager,9).seltext
  did -ar $1 41 $hget(q-ainfo-manager, BDAY. $+ $did(q-ainfo-manager,9).seltext)
  did -ar $1 43 $hget(q-ainfo-manager, RN. $+ $did(q-ainfo-manager,9).seltext)
  did -ar $1 45 $hget(q-ainfo-manager, EMAIL. $+ $did(q-ainfo-manager,9).seltext)
  did -ar $1 47 $hget(q-ainfo-manager, AN. $+ $did(q-ainfo-manager,9).seltext)
  did -ar $1 21 $hget(q-ainfo-manager, WEB. $+ $did(q-ainfo-manager,9).seltext)
  did -ar $1 53 $hget(q-ainfo-manager,MA. $+ $did(q-ainfo-manager,9).seltext)
  did -ar $1 49 $hget(q-ainfo-manager,PH. $+ $did(q-ainfo-manager,9).seltext)
  did -ar $1 51 $hget(q-ainfo-manager,AP. $+ $did(q-ainfo-manager,9).seltext)
  did -ar $1 55 $hget(q-ainfo-manager, OI. $+ $did(q-ainfo-manager,9).seltext)
  did -ar $1 40 $hget(q-ainfo-manager, REGCHAN. $+ $did(q-ainfo-manager,9).seltext) 
  did -c $1 29 $iif($hget(q-ainfo-manager, CR. $+ $did(q-ainfo-manager,9).seltext),$hget(q-ainfo-manager, CR. $+ $did(q-ainfo-manager,9).seltext),1)
}
alias libreta {
  if ($dialog(Q-Ainfo-manager)) { dialog -c Q-Ainfo-manager }
  else { dialog -mod Q-Ainfo-manager Q-Ainfo-manager }
}
on *:EXIT:{ 
  hsave q-ainfo-manager " $+ $scriptdirq-ainfo-manager.hsh" 
  hsave q-ainfo-manager " $+ $scriptdirq-ainfo-manager.backup"
}
