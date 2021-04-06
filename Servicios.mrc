;Addon de Interfaces de Servicios de ScoutLink
;partes escritas por Owen Morris - leon@scoutlink.net
;Para esta version, se ha mantenido el addons se servicios de ScoutLink
;todas sus partes han sido traducidas y modificadas en versiones anteriores por Aciago.

on *:connect: {
  if ($network == scoutlink) .enable #servmenu
}
on *:disconnect: {
  .disable #servmenu
}

#servmenu off
alias nsgui {
  if ($dialog(nickserv)) { dialog -c nickserv }
  else { dialog -m nickserv nickserv }
}
alias modeL {
  if ($dialog(mode)) { dialog -c mode }
  else { dialog -m mode mode }
}
alias msp {
  if ($dialog(memoservp)) { dialog -c memoservp }
  else { dialog -m memoservp memoservp }
}
#servmenu end

dialog mode {
  size -1 -1 165 190
  icon 1, 1 0 165 50, adds/umodes.jpg, 0, noborder
  title "Modos de Usuario"
  box "Activar",               100,   2   40  80 105,
  button "invisible",          101,   7  57  70  20,
  button "privado",            102,   7  77  70  20,
  button "ignorar",            103,   7  97  70  20,
  button "wallops",            104,   7  117  70  20,
  box "Desactivar",            105,   82   40  80 105,
  button "invisible",          106,   85  57  70  20,
  button "privado",            107,   85  77  70  20,
  button "ignorar",            108,   85  97  70  20,
  button "wallops",            109,   85  117  70  20,
  button "Ver Modos Activos",  110,   4 145 155  20,
  button "Cerrar",             307,   4 165 155  20,
}
on *:dialog:mode:sclick:*:{
  if ($did == 101) { /mode $me +i }
  if ($did == 102) { /mode $me +p }
  if ($did == 103) { /mode $me +R }
  if ($did == 104) { /mode $me +w }
  if ($did == 106) { /mode $me -i }
  if ($did == 107) { /mode $me -p }
  if ($did == 108) { /mode $me -R }
  if ($did == 109) { /mode $me -w }
  if ($did == 110) { /mode $me }
  if ($did == 307) { dialog.anim1 | dialog -c mode }
}
on *:SOCKOPEN:servers:{
  .sockwrite -n servers GET /serverstats/servers.php HTTP/1.0 $+ $crlf
  .sockwrite -n servers Accept: */* $+ $crlf
  .sockwrite -n servers User-Agent: ScoutLink mIRC $+ $crlf
  .sockwrite -n servers Host: www.scoutlink.net $+ $crlf
  .sockwrite -n servers $crlf
  echo 4 -s Actualizando la lista de Servidores de ScoutLink
}
on *:SOCKREAD:servers:{
  if ($sockerr > 0) return
  :nextread
  sockread %temp
  if ($sockbr == 0) {
    .server -s
    return
  }
  if (%temp == $null) goto nextread
  tokenize 32 %temp
  if (($1 != +) && ($1 != -) && ($1 != Actualizado:) && ($1 != POR FAVOR)) goto nextread
  if ($1 == +) {
    .server -a $2 -p 6667-6668 -g ScoutLink -d ScoutLink: $3-
  }
  elseif ($1 == -) {
    .server -r $2
  }
  else {
    echo 4 -s $1-
  }
  goto nextread
}
on *:SOCKCLOSE:servers:{
  echo 4 -s Lista de Servidores Actualizada
}
alias serverupdate {
  sockopen servers www.scoutlink.net 80
}
dialog nickserv {
  title "NickServ"
  size -1 -1 351 400
  tab "Registro", 2, 2 73 349 300
  tab "Establecer", 4
  icon 1, 1 0 349 60, nickserv.jpg, 0 noborder
  text "", 5, 8 319 337 41
  button "Cerrar", 6, 290 375 60 20, cancel
  text "Comandos Principales:", 201, 7 108 80 15, tab 2
  text "Para registrar tu Nick y Dirección de Correo-E actuales, ingresa tu clave y presiona el botón REGISTRAR.", 202, 7 128 337 40, tab 2
  text "Correo-E:", 203, 7 168 100 20, tab 2
  edit "", 204, 107 168 200 20, tab 2
  text "Clave:", 205, 7 188 100 20, tab 2
  edit "", 206, 107 188 200 20, tab 2 pass limit 20
  text "Confirmar Clave:", 207, 7 208 100 20, tab 2
  edit "", 208, 107 208 200 20, tab 2 pass limit 20
  button "Registrar", 209, 7 230 62 20, tab 2
  button "Descartar", 210, 73 230 62 20, tab 2
  text "Correo-E:", 18, 61 119 55 17, tab 4
  text "Web:", 19, 83 144 33 17, tab 4
  text "Messenger:", 20, 51 170 65 17, tab 4
  text "Pais:", 21, 86 194 30 17, tab 4
  text "Nueva Clave:", 22, 43 218 73 17, tab 4
  edit "", 23, 121 118 100 20, tab 4 autohs
  edit "", 24, 121 143 100 20, tab 4 autohs
  edit "", 25, 121 169 100 20, tab 4 autohs
  edit "", 26, 121 193 100 20, tab 4 autohs
  edit "", 27, 121 217 100 20, tab 4 pass limit 8
  button "Modificar", 28, 222 117 67 20, tab 4 disable
  button "Establecer", 29, 222 143 67 20, tab 4 disable
  button "Establecer", 30, 222 168 67 20, tab 4 disable
  button "Establecer", 31, 222 192 67 20, tab 4 disable
  button "Cambiar", 32, 222 228 67 20, tab 4 disable
  text "Confirmar Clave:", 33, 28 241 88 17, tab 4
  edit "", 34, 121 240 100 20, tab 4 pass limit 16
  edit "", 3, 138 274 100 20, tab 2 pass
  button "Recuperar", 7, 241 274 67 20, tab 2 disable
  edit "", 8, 37 274 100 20, tab 2
  box "Recuperar Nick", 9, 8 256 336 44, tab 2
}
on *:dialog:nickserv:init:0: {
  .enable #nickserv
}
on *:dialog:nickserv:sclick:2,4: {
  did -r nickserv 5
}
on *:dialog:nickserv:sclick:6: {
  dialog.anim1 | dialog -c nickserv
}
on *:dialog:nickserv:sclick:209: {
  if (!$did(206) || !$did(208)) {
    did -o nickserv 5 1 No ha ingresado una clave. Por favor escribe una clave e intenta de nuevo.
    halt
  }
  if ($did(206) != $did(208)) {
    did -o nickserv 5 1 Las claves no coinciden. Por favor re-escribe tus claves.
    halt
  }
  if ($len($did(206)) < 5) {
    did -o nickserv 5 1 Tu clave debe tener un mínimo de 5 caracteres, intentalo de nuevo.
    halt
  }
  .nickserv register $did(204) $did(208)
}
on *:dialog:nickserv:sclick:210: {
  .nickserv drop
}
on *:dialog:nickserv:edit:3: did -e nickserv 7
on *:dialog:nickserv:sclick:7: {
  .nickserv login $did(8) $did(3)
}
on *:dialog:nickserv:edit:23: did -e nickserv 28
on *:dialog:nickserv:edit:24: did -e nickserv 29
on *:dialog:nickserv:edit:25: did -e nickserv 30
on *:dialog:nickserv:edit:26: did -e nickserv 31
on *:dialog:nickserv:edit:34: did -e nickserv 32
on *:dialog:nickserv:sclick:28: {
  .nickserv set email $did(23)
}
on *:dialog:nickserv:sclick:29: {
  .nickserv set url $did(24)
}
on *:dialog:nickserv:sclick:30: {
  .nickserv set imid $did(25)
}
on *:dialog:nickserv:sclick:31: {
  .nickserv set location $did(26)
}
on *:dialog:nickserv:sclick:32: {
  if (!$did(27) || !$did(34)) {
    did -o nickserv 5 1 No ha ingresado una clave. Por favor escribe una clave e intenta de nuevo.
    halt
  }
  if ($did(27) != $did(34)) {
    did -o nickserv 5 1 Las claves no coinciden. Por favor re-escribe tus claves.
    halt
  }
  if ($len($did(27)) < 5) {
    did -o nickserv 5 1 Tu clave debe tener un mínimo de 5 caracteres, intentalo de nuevo.
    halt
  }
  .nickserv set password $did(34)
}
dialog nickserv1 {
  title "NickServ"
  size -1 -1 350 251
  icon 1, 1 0 349 60, adds/nickserv.jpg, 0 noborder
  text "El Nick que estás usando está registrado en NickServ. Si tu eres el propietario del Nick ingresa la clave ahora. De lo contrario escoge otro Nick.", 2, 6 60 337 48
  text "Clave:", 3, 7 130 100 20, tab 2
  edit "", 4, 107 130 200 20, tab 2 pass limit 20
  button "Identificar", 5, 46 150 70 20, tab  disable ok
  text "Nuevo Nick:", 6, 7 180 100 20, tab 2
  edit "", 7, 107 180 200 20, tab 2 
  button "Cambiar Nick", 8, 46 200 70 20, tab  disable
}
on *:dialog:nickserv1:init:0: {
  .disable #nickserv
}
on *:dialog:nickserv1:edit:4: did -e nickserv1 5
on *:dialog:nickserv1:edit:7: did -e nickserv1 8
on *:dialog:nickserv1:sclick:5: {
  .nickserv login $me $did(4)
  dialog.anim1
  dialog -x nickserv1
}
on *:dialog:nickserv1:sclick:8: {
  .nick $did(7)
  dialog.anim1
  dialog -x nickserv1
}

#nickserv off
on ^*:notice:*:?: {
  if ($nick == nickserv) {
    did -s nickserv 5 $strip($1-,b)
    halt
  }
}
#nickserv end

on *:notice:*:?: {
  if ($nick == nickserv && $network == scoutlink) {
    if (This nickname is registered isin $1-) {
      dialog -m nickserv1 nickserv1
      halt
    }
    elseif (This nick is not registered isin $1-) {
      dialog -m nickserv2 nickserv2
      halt
    }
    elseif (Incorrect password isin $1-) {
      dialog -m nickserv3 nickserv3
      halt
    }
    elseif (Password accepted isin $1-) {
      .memoserv list
      halt
    }
    elseif (Contrasena aceptada isin $1-) {
      .nickserv set language en_us
      .memoserv list
      halt
    }
    else {
      halt
    }
  }
}
dialog nickserv2 {
  title "NickServ"
  size -1 -1 351 120
  icon 1, 1 0 349 60, adds/nickserv.jpg, 0 noborder
  text "Este nick no está registrado. ¿Deseas registrarlo ahora?", 2, 35 64 285 20, center
  button "Si", 3, 78 90 60 20, ok
  button "No", 4, 210 90 63 20, cancel
}
on *:dialog:nickserv2:init:0: {
  .disable #nickserv
}
on *:dialog:nickserv2:sclick:3: { dialog -m nickserv nickserv }
dialog nickserv3 {
  title "NickServ"
  size -1 -1 450 300
  icon 1, 1 0 349 60, adds/nickserv.jpg, 0 noborder
  text "Por favor escribe la clave de nuevo o cambia tu nick.", 2, 39 83 271 20, tab 30 center
  text "Clave:", 3, 7 130 100 20, tab 2
  edit "", 4, 107 130 200 20, tab 2 pass limit 20
  button "Identificar", 5, 46 150 70 20, tab  disable ok
  text "CLAVE INCORRECTA!!!", 9, 109 64 121 17, center
}

on *:dialog:nickserv3:edit:4: did -e nickserv1 5
on *:dialog:nickserv3:edit:7: did -e nickserv1 8
on *:dialog:nickserv3:sclick:5: {
  .nickserv identify $did(4)
  dialog.anim1
  dialog -x nickserv1
}
on *:dialog:nickserv3:sclick:8: {
  .nick $did(7)
  dialog.anim1
  dialog -x nickserv1
}
