;Esta versión de Notificación de usuarios ha sido modificada y traducida por Daniel Hernández - (daniel_13)
;Si tienes problemas clickea en "Ayuda > Leeme"
;__________________________________________________________________________________________________________

menu nicklist,query {
  -
  &Notify
  .&Configurar:notifylista
  .-
  .&Agregar:.notify $$1 
  .&Remover:.notify -r $$1
  -
}
on *:load: {
  if ($version >= 6.0) { echo -as Cargado correctamente. | echo -as Sistema de notificación de usuarios en IRC | notifylista }
  else { .unload -rs Notify\notify.mrc }
}
on *:unload: {
  echo -as Descargado correctamente. | echo -as Sistema de notificación de usuarios en IRC 
}
alias -l n.whois { 
  if ($status) {
    did -i notify 2 1 page event
    tokenize 32 $did(notify,2,1,1)
    if (!$5) halt
    else .whois $notify($calc($5 - 1))
  }
}
alias -l n.query { 
  if ($status) {
    did -i notify 2 1 page event
    tokenize 32 $did(notify,2,1,1)
    if (!$5) halt
    else msg $notify($calc($5 - 1)) $$?="Escriba mensaje:"
  }
}
alias -l rem.contact2 { .notify -r $$?="Nick del contacto a remover?" | echo -as 6Has removido al contacto correctamente de tu lista. | did -r notify 2 | .timermsn.notify 1 1 msn.notify }
alias -l rem.contact {
  did -i notify 2 1 page event
  tokenize 32 $did(notify,2,1,1)
  if (!$5) halt
  else {
    .notify -r $notify($calc($5 - 1))
    echo -as 6Has removido al contacto correctamente de tu lista.
    did -r notify 2
    .timermsn.notify 1 1 msn.notify
  }
}
on *:dialog:notify:sclick:1:{ set %notify.not.icon $gettok($did(1),5,32) | msn.notify }
alias msn.notify {
  if ($dialog(notify)) {
    var %on = 0
    var %off = 0
    var %n = 1
    while (%n <= $notify(0)) {
      if ($notify(%n).ison == $true) { inc %on }
      elseif ($notify(%n).ison == $false) { inc %off }
      inc %n
    }
    did -r notify 2
    var %y = 1
    while (%y <= $scid(0)) {
      scon %y
      did -a notify 2 Conectados ( $+ %on $+ / $+ $notify(0) $+ ) $chr(9) $+ Usuarios Conectados
      var %x = 1
      while (%x <= $notify(0)) {
        if ($notify(%x).ison) { did -a notify 2 $notify(%x) }
        inc %x
      }
      did -a notify 2 Desconectados ( $+ %off $+ / $+ $notify(0) $+ ) $chr(9) $+ Usuarios Desconectados
      var %x = 1
      while (%x <= $notify(0)) {
        if (!$notify(%x).ison) { did -a notify 2 $notify(%x) }
        inc %x
      }
      inc %y
    }
  }
}








alias -l baca.file { if ($isfile($+(",$scriptdirsettings.ini,"))) return $readini $+(",$scriptdirsettings.ini,") $1 $2- }
alias -l tulis.file { writeini $+(",$scriptdirsettings.ini,") $$1- }
alias pop tokenize 32 $dll($pdll.notify,Popup,$1-) | if ($isid) return $1- | $iif($4- != did not select a menu item,$4-)
alias popup return $shortfn($scriptdirdll\popups.dll)
alias -l aboutmsn if (!$dialog(aboutmsn)) dialog -m aboutmsn aboutmsn
alias -l add.contact { .notify $$?="Ingresa el nick:" | echo -as 6Has agregado al contacto correctamente a lista. | did -r notify 2 | .timermsn.notify  1 1 msn.notify }
alias -l pdll.notify { return $+(",$scriptdirdll\popups.dll,") }
alias -l mdx.notify { return $+(",$scriptdirdll\mdx.dll,") }
alias -l views.notify { return Notify\dll\views.mdx }
alias -l ddll.notify { return Notify\dll\dialog.mdx }
alias notifylista { if (!$dialog(notify)) dialog -m notify notify }







dialog notify {
  title "v1.5 [ /nlist ]"
  option dbu
  size -1 -1 120 160
  icon $scriptdiricons\msn.ico
  list 2, 1 2 119 158
  menu "&Archivo", 20
  item "&Refrescar", 12, 20
  item "&Notificar con Sonido?",14,20
  item "break", 13, 20
  item "&Cerrar", 11, 20
  menu "&Acciones", 30
  item "&Ver web de ScoutLink - espanol", 21, 30
  item "&Ver web de JOTAJOTI oficial", 23, 30
  menu "&Más Opciones", 40
  item "&Agregar contacto...", 31, 40
  item "&Remover contacto...", 32, 40
  item "&Whois a...", 42, 40
  item "&Privado a...", 44, 40
  menu "&Ayuda/Leeme", 50
  item "&Leeme", 41, 50
  item "Break", 43, 50
  item "&Acerca de...", 45, 50
  button ok,1, 0 0 0 0,cancel
  button positioner,10, 0 0 0 0
}

on *:dialog:notify:menu:*:{
  if ($did == 11) dialog -x notify
  if ($did == 12) msn.notify
  if ($did == 14) { 
    $iif($baca.file(sound,on),tulis.file sound on 0,tulis.file sound on 1) 
    if ($baca.file(sound,on)) did -c notify 14
    if (!$baca.file(sound,on)) did -u notify 14
  }
  ; if ($did == 22) list $$?="Que canal buscas?"
  if ($did == 31) add.contact
  if ($did == 32) rem.contact2
  if ($did == 41) run $+(",$scriptdirreadme.txt,")
  if ($did == 42) whois $$?="Escriba el nick para Whois"
  if ($did == 44) query $$?="Escriba el nick para abrir privado"
  if ($did == 45) aboutmsn
}
on *:dialog:notify:sclick:*:{
  if ($did == 10) {
    var %action = $gettok($did($dname,10),1,32)
    if (%action == size) {
      var %w = $dialog($dname).cw,%h = $dialog($dname).ch
      dll $mdx.notify MoveControl $dname 2 * * $calc(%w -6) $calc(%h -2)
    }
  }
  if ($did == 2) {
    if ($gettok($did($dname,2,1),1,32) != rclick) halt
    dll $popup New MSNnotify 16 16
    dll $popup LoadImg MSNnotify icon small $scriptdir/icons/add.ico
    dll $popup LoadImg MSNnotify icon small $scriptdir/icons/del.ico
    dll $popup LoadImg MSNnotify icon small $scriptdir/icons/whois.ico
    dll $popup LoadImg MSNnotify icon small $scriptdir/icons/query.ico
    dll $popup LoadImg MSNnotify icon small $scriptdir/icons/chat.ico
    dll $popup LoadImg MSNnotify icon small $scriptdir/icons/refresh.ico
    dll $popup LoadImg MSNnotify icon small $scriptdir/icons/about.ico
    dll $popup AddItem MSNnotify end 1 1 &Add $cr add.contact
    dll $popup AddItem MSNnotify end $iif($status,+,+d) 2 2 &Remove $cr rem.contact
    dll $popup AddItem MSNnotify end 
    dll $popup AddItem MSNnotify end $iif($status,+,+d) 3 3 &Whois $cr n.whois
    dll $popup AddItem MSNnotify end $iif($status,+,+d) 4 4 &Query $cr n.query
    dll $popup AddItem MSNnotify end $iif($status,+,+d) 5 5 &Chat $cr dccnick
    dll $popup AddItem MSNnotify end 
    dll $popup AddItem MSNnotify end 6 6 R&efresh $cr msn.notify
    dll $popup AddItem MSNnotify end 7 7 A&bout $cr aboutmsn 
    pop MSNnotify $mouse.dx $mouse.dy
  }
}
on *:dialog:notify:init:*:{
  dll $mdx.notify SetMircVersion $version
  dll $mdx.notify MarkDialog $dname
  dll $mdx.notify SetDialog $dname style border title sysmenu minbox
  dll $mdx.notify SetControlMDX $dname 10 positioner size minbox maxbox > $ddll.notify
  dll $mdx.notify SetControlMDX $dname 2 treeview hasbuttons showsel rowselect insertdroptarget > $views.notify
  if ($baca.file(sound,on)) did -c notify 14
  msn.notify
}
on *:NOTIFY:{
  if ($dialog(notify)) msn.notify
  echo -a %sign 6*** ( $+ $nick $+ ) está en IRC 
  if ($baca.file(sound,on)) splay -w $scriptdirsounds\online.wav
  halt 
}
on *:CONNECT:{ if ($dialog(notify)) msn.notify }
on *:DISCONNECT:{ if ($dialog(notify)) msn.notify }
on *:UNOTIFY:{ if ($dialog(notify)) msn.notify } 

###########################################################################################
alias -l aboutmsn.anim {
  if ((!$dialog(aboutmsn)) || (%.anim._i > 150)) { .timer_anim off | unset %.anim.tmp* %.anim._i | return }
  :1 | %.anim.tmpx = $calc(($window(-1).w / 2) - %.anim._i) | %.anim.tmpy = $calc(($window(-1).h / 2) - %.anim._i) | %.anim.tmpw = $calc(%.anim._i * 2) | %.anim.tmph = $calc(%.anim._i * 2)
  dialog -s aboutmsn %.anim.tmpx %.anim.tmpy %.anim.tmpw %.anim.tmph | inc %.anim._i 5
}

dialog aboutmsn {
  title "Lista de notificaciones de usuarios en IRC"
  size -1 -1 1 1
  icon $scriptdiricons\about.ico
  text "", 1, 50 20 250 15 
  icon 71, 10 8 32 32, " $+ $scriptdiricons\mirc.ico $+ "
  button "Hecho en 2012 para ScoutLink", 2, 50 70 200 30, center
  text "SitioWeb:", 3, 10 134 50 15
  edit "http://espanol.scoutlink.net", 4, 60 130 150 22, autohs read
  button "Visitar!!", 5, 220 130 50 22, center
  edit "", 6, 10 160 280 80, read multi return autohs autovs
  box "", 7, -10 40 320 210
  button "Close", 200, 120 260 60 30, ok
}
on *:dialog:aboutmsn:init:*: {
  did -o aboutmsn 6 1  Agradecimientos: $crlf | did -o aboutmsn 6 2 Especialmente a da^hype y Aciago, de ellos saque $crlf
  did -o aboutmsn 6 3 las ideas para actualizar/hacer este script. $crlf | did -o aboutmsn 6 4  $crlf Att. daniel_13
  did -a aboutmsn 1 Créditos, Sitio web y Agradecimientos. 
  %.anim._i = 0 | .timer_anim -m 0 1 aboutmsn.anim
}
on *:dialog:aboutmsn:sclick:2:.timerabout 1 0 echo -a 8,1 Para este scrip se uso la idea del Notify de Aciago, Este ha sido hecho y actualizado por Daniel Hernández - (daniel_13)  y está incluido a partir de las versiones 4.0 de mIRC para ScoutLink, te aconsejo que si tienes alguna duda o si algo no te funciona ponte en contacto con un Operador y pregunta por daniel_13. 
on *:dialog:aboutmsn:sclick:5:.url -n http://espanol.scoutlink.net
