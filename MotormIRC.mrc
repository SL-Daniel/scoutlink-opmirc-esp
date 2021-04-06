;Partes de este Addon fueron tomadas del Script original realizado por Leon, leon@scoutlink.net
;Partes escritas y actualizadas por Aciago en versiones anteriores a esta.
;Esta versión (4.0 opmirc (chanop)) ha sido actualizada y escrita por daniel_13, daniel_13@scoutlink.net
;Con la ayuda del actual equipo Técnico y de Operadores de #espanol (2015)
;Si tiene problemas con el mirc email: ayuda@espanol.scoutlink.net / asunto: #espanol - opmirc
;__________________________________________________________________________________________________
;
;SE RECOMIENDA NO BORRAR O EDITAR ALGUNA INFORMACIÓN YA ESCRITA; SE PUEDE DESCONFIGURAR LA VERSIÓN.
;__________________________________________________________________________________________________

on *:START:{
  .timeridleserv 0 60 idle3
  .play -se adds\inic.txt 80
} 
on: *:connect:{
  .timertitle 0 1 nextitle
  .titlebar ; Tu estado actual: CONECTADO a ScoutLink; (Tienes EN LÍNEA: $uptime(mirc,2) $+ ) (Tienes IDLE: $duration($idle) $+ )
}
on *:disconnect: {
  unset %i | unset %pxsc.* | unset %§anti.caps.*
}
on 1:NOSOUND:/echo 4 $active *** Presione F8 para solicitar $filename de $Nick | /set %znick $nick | /set %zfile $filename
on 1:FILERCVD:*.wav:/splay $filename | /notice $nick Gracias por el archivo! | /echo 12 Recibido 4 $filename 12 de 13 $nick $address
on 1:FILESENT:*.*: echo 12 Enviado 4 $filename 12 a 13 $nick $address
on 1:SENDFAIL:*.*: echo 12 Ha fallado el envio de 4 $filename 12 a  13 $nick $address
on 1:GETFAIL:*.*: echo 12 Ha fallado la recepcion de 4 $filename 12 de 13 $nick $address
on *:op:*:/splay $scriptdir/sounds/op.wav 
on *:deop:*: { if ($opnick == $me)  splay $scriptdir/sounds/deop.wav }
on *:JOIN:#espanol-opers:/splay sounds/online.wav
alias -l nextitle { 
  titlebar ; Tu estado actual: CONECTADO a ScoutLink; (Tienes EN LÍNEA: $uptime(mirc,2) $+ ) (Tienes IDLE: $duration($idle) $+ )
} 
alias reglas {
  play -se adds\inirules.txt 32
}
CTCP 1:VERSION:.ctcpreply $nick VERSION (ScoutLink Operador v4.0)
alias mod { cs op $active $me | say 1,15 $active $+ : Estamos teniendo problemas, el canal permanecerá cerrado y en silencio por un momento. | mode $active +mi }
alias nomod { say 1,15 $active $+ : Muy bien, ya podemos seguir disfrutando del chat. | mode $active -mi } 
alias -l im_config /.timerimgmirc_tryconfigure -mio 0 100 /dll imgmirc.dll configure
alias -l im_preload /dll imgmirc.dll preload
alias -l scoutlink {
  server chat.scoutlink.net:6667
}
on *:OPEN:?: {
  if ($nick isin $active) { goto halt }
  else {
    splay $scriptdir/sounds/chat.wav
    set %mnick $nick
    echo $active 4 $nick está intentando tener una conversación privada contigo, presiona F9 para aceptar o F10 para cancelar
  }
}
alias uptime {
  var  %ut = $uptime(system)
  if ($_vr(uptime,record) == $null) {  _vw uptime record $uptime(system) | _vw uptime date $date(mmm dd yyyy) } 
  else { if ($uptime(system) > $_vr(uptime,record)) { _vw uptime record $uptime(system) | _vw uptime date $date(mmm dd yyyy) } }
  say 12 $+ Windows $+ $os [uptime]12 $uptime(system,1) [record uptime]12 $duration($calc($_vr(uptime,record) / 1000)) on $_vr(uptime,date) 
}
alias online {
  var  %ut = $uptime(mirc,1)
  if ($_vr(online,record) == $null) || ($_vr(online,record) == <= 0) {  _vw online record $online | _vw online date $date(mmm dd yyyy) } 
  if ($uptime(mirc,1) > $_vr(online,record)) { _vw online record $uptime(mirc,1) | _vw online date $date(mmm dd yyyy) } 
  say 12 $+ mIRC [online]12 $uptime(mirc,1) [record online]12 $_vr(online,record) on $_vr(online,date) 
}
alias AGENDA {
  var %agendia = $1 | if $1 == $null { %agendia = $date }
  var %agenda = $readini adds\agenda.txt citas %agendia | if %agenda != $null echo -ase 0,2 Agenda para8 %agendia  %agenda
  %agendia = $left(%agendia,6) $+ ****
  %agenda = $readini adds\agenda.txt citas %agendia | if %agenda != $null echo -ase 0,2 Agenda para8 %agendia  %agenda
}
alias f8 /msg %znick ! $+ %znick %zfile | /unset %znick | /unset %zfile

alias passmIRC {
  if ($dialog(passmIRC)) {
    dialog -ve passmIRC passmIRC
  }
  else { dialog -mdao passmIRC passmIRC }
}
dialog passmIRC {
  title "Protección SLmIRC"
  size -1 -1 70 65
  option dbu
  box "Opciones", 1, 0 0 70 30
  check "Activar al iniciar mIRC", 2, 5 10 60 10, flat
  check "Activar al Conectar", 3, 5 20 90 10, flat
  button "Establecer Clave", 4, 5 35 60 10, flat
  button "Close", 6, 40 50 25 10, flat ok
}
on *:dialog:passmirc:init:*: {
  if ($readini(LockmIRC.ini,Settings,onStart) == 1) {
    did -c $dname 2
  }
  if ($readini(LockmIRC.ini,Settings,onConnect) == 1) {
    did -c $dname 3
  }
}
on *:dialog:passmIRC:sclick:*: {
  if ($did == 2) {
    if ($did(2).state == 1) {
      writeini LockmIRC.ini Settings onStart 1
    }
  }
  if ($did(2).state == 0) {
    writeini LockmIRC.ini Settings onStart 0
  }
  if ($did == 3) {
    if ($did(3).state == 1) {
      writeini LockmIRC.ini Settings onConnect 1
    }
  }
  if ($did(3).state == 0) {
    writeini LockmIRC.ini Settings onConnect 0
  }
  if ($did == 4) {
    dialog -c passmirc pasmirc
    var %i $input(Ingrese su clave,p,mIRC Lock)
    if (%i != $null) {
      writeini LockmIRC.ini Settings Password %i
    }
    passmirc
  }
}

alias credit {
  if ($dialog(creditdan)) { dialog -c creditdan }
  else { dialog -m creditdan creditdan }
}
alias -l creditdan.anim {
  if ((!$dialog(creditdan)) || (%.anim._i > 215)) { .timer_anim off | unset %.anim.tmp* %.anim._i | return }
  :1 | %.anim.tmpx = $calc(($window(-1).w / 2) - %.anim._i) | %.anim.tmpy = $calc(($window(-1).h / 2) - %.anim._i) | %.anim.tmpw = $calc(%.anim._i * 2) | %.anim.tmph = $calc(%.anim._i * 2)
  dialog -s creditdan %.anim.tmpx %.anim.tmpy %.anim.tmpw %.anim.tmph | inc %.anim._i 5
}
dialog creditdan {
  title "ScoutLink - Operador de Canal v4.0"
  size -1 -1 1 1
  icon $scriptdiricons\mirc.ico
  text "", 1, 55 20 250 15 center
  icon 71, 10 8 32 32, " $+ $scriptdiricons\query.ico $+ "
  button "Visitar web", 4, 220 385 70 30, center
  button "MemoServ - HATT-es", 52, 20 387 115 27
  edit "", 10, 10 55 410 310, read multi return autohs autovs center
  box "", 7, -10 40 450 340
  button "Cerrar!", 200, 300 385 70 30, ok
}
on *:dialog:creditdan:init:*: {
  did -o creditdan 10 1  $crlf | did -o creditdan 10 2 "Es mucho lo que se puede hacer con un poco de ayuda, he aquí un ejemplo." $crlf 
  did -o creditdan 10 3  $crlf | did -o creditdan 10 4  $crlf | did -o creditdan 10 5  Realizada para los Operadores de ScoutLink #espanol. $crlf | did -o creditdan 10 6  Esta versión de mIRC ha sido actualizacida y modificada por daniel_13 $crlf
  did -o creditdan 10 7  Posee adaptaciones realizadas por Aciago de versiones anteriores. $crlf | did -o creditdan 10 8  Agradecimientos a todos los miembros de #espanol-opers $crlf | did -o creditdan 10 9 quienes ayudaron a completar esta actualización v4.0 de OPmIRC. $crlf 
  did -o creditdan 10 10 ____________________________________________________________________________ $crlf | did -o creditdan 10 11 $crlf |  did -o creditdan 10 12 $crlf | did -o creditdan 10 13 ScoutLink - #espanol $crlf | did -o creditdan 10 14 hatt@scoutlink.net $crlf | did -o creditdan 10 15 http://espanol.scoutlink.net $crlf
  did -o creditdan 10 16  $crlf | did -o creditdan 10 17 $crlf | did -o creditdan 10 18 $crlf | did -o creditdan 10 19 Equipo de $crlf
  did -o creditdan 10 20 ScoutLink #espanol $crlf | did -o creditdan 10 21 $crlf | did -o creditdan 10 22 $crlf | did -o creditdan 10 23 OPmIRC; ScoutLink #espanol - Operadores ChanServ Edición v4.0
  did -a creditdan 1 Créditos y agradecimientos para OPmIRC. 
  %.anim._i = 0 | .timer_anim -m 0 1 creditdan.anim
}
on *:dialog:creditdan:sclick:4:.url -n http://espanol.scoutlink.net
on *:dialog:creditdan:sclick:52:{ 
  dialog -m credmemo credmemo 
}
dialog credmemo {
  title "Enviar Mensaje"
  size -1 -1 166 87
  option dbu
  box "Enviar mensaje a:", 1, 3 3 159 81
  edit "daniel_13, elguayanes, Danniels, NiTrOx", 2, 9 11 105 10, read
  text "Mensaje:", 3, 9 24 55 8
  edit "", 4, 9 34 147 30, multi limit 255
  button "Enviar", 5, 84 65 35 12
  button "Cancel", 6, 121 65 35 12, cancel
  text "Los Memos no deben pasar de 255 caracteres.", 7, 10 67 66 14, center
}
on *:dialog:credmemo:sclick:5: {
  memoserv send daniel_13 $did(credmemo,4)
  memoserv send elguayanes $did(credmemo,4)
  memoserv send Danniels $did(credmemo,4)
  memoserv send nitrox $did(credmemo,4)
  did -r $dname 4
  .timerms_send 1 1 dialog -x credmemo credmemo
}

alias flood {
  chanserv Op $chan $me
  timerflood1 1 1 flood2
}
alias -l flood2 {
  mode $chan +mi
  msg $chan 1,15 $active $+ : Estamos siendo atacados por flood, el canal permanecerá cerrado y en silencio por un momento.
  timerflood 1 20 unflood
}
alias -l unflood {
  mode $chan -mi
  msg $chan 1,15 $active $+ : Muy bien, ya podemos seguir disfrutando del chat.
}
raw 307:*:{ wholine $bold(nick registrado e identificado:) si | halt }
raw 310:*:{ wholine $bold(útil:) parece que... | halt }
raw 311:*:{ echo -a  | wholine $bold(whois) de $bold($2) | wholine $bold(dirección:) $3 $+ @ $+ $4 $5- | halt }
raw 312:*:{ wholine $bold(servidor:) $3 | halt }
raw 313:*:{ wholine $bold(oper:) $5- | halt }
raw 317:*:{ wholine $bold(tiempo idle:) $duration($3) | halt }
raw 319:*:{ wholine $bold(canales:) $3- | halt }
raw 318:*:{ echo -a  | halt }
alias bold { return  $+ $1- $+  }
alias wholine { echo -a 2( $+ $1- $+ 2) }
alias dialog.anim1 {
  var %x = $dialog($dname).x
  var %y = $dialog($dname).y 
  var %w = $dialog($dname).cw
  var %h = $dialog($dname).ch
  while (0 < %y) { dec %y | dialog -s $dname %x %y %w %h }
}
dialog notcap {
  title Cuidado!!!
  size -1 -1 135 50
  option dbu
  text "El texto que intentas enviar está en mayúsculas, esto significa gritar y debes dar el ejemplo. ¿Realmente quieres hacerlo?", 1, 5 3 125 30
  button "Enviar", 3, 10 35 30 10, ok
  button "Hacer Minúsculas", 4, 43 35 50 10, ok
  button "Cancelar", 5, 95 35 30 10, cancel
}
on *:dialog:notcap:sclick:*:{
  if ($did == 3) { { msg $active %pxsc.temp } | dialog -x notcap notcap | unset %pxsc.* }
  if ($did == 4) { var %temp = $replace(%pxsc.temp,%pxsc.temp,$lower(%pxsc.temp)) | { msg $active %temp } | dialog -x notcap notcap | unset %pxsc.* | halt }
  if ($did == 5) { halt | dialog -x notcap notcap }
}
on *:INPUT:*:{ 
  if ($left($1,1) != /) && (!$ctrlenter) {
    var %x = 1,%y = $numtok($1-,32),%temp = $1-
    while (%x <= %y) {
      var %a = $gettok($1-,%x,32)
      inc %x  
    }  
    if (%temp == $null) { var %temp = $1- }
    if (%temp isletter) && (%temp isupper) {
      if ($right(%temp,1) == $chr(46)) { 
        var %temp = $left(%temp,$calc($len(%temp)-1)) 
        dlg notcap | set %pxsc.temp %temp | inc %pxsc.cntcap | halt 
      }
      else { dialog -m notcap notcap | set %pxsc.temp %temp | inc %pxsc.cntcap | halt }        
    }      
    msg $active %temp | halt
  }
}
alias idle3 { 
  if ($idle > 50000) { .quit 6Anti-Idle automático. }
}
alias estar {
  if ( $away == $true ) { regresar }
  else { ausente } 
}
alias -l ausente {
  away «« Disculpa, en este momento no puedo atenderte »» - Ausente desde las $asctime(HH:nn) 
  ame está ausente: $$?="MOTIVO DEL AWAY $crlf Se vera asi: * $+ $me está away: 'aqui el motivo' " $+ 
  set %awaytime $ctime
}
alias -l regresar {
  away
  set %atime $calc($ctime - %awaytime)
  ame ha regresado, estuvo ausente por $duration(%atime) $+ .
  unset %awaytime $ctime
  unset %atime
}
