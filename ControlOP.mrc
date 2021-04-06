;addons escrito por Daniel, daniel_13@scoutlink.net


alias so1 {
  if ($dialog(so)) { dialog -c so }
  else { dialog -m so so }
}
dialog so {
  title "Saludos operador,"
  size -1 -1 100 40
  option dbu
  text "Cuando este de turno mantenga su: @",10,1 4 97 8
  edit "https://goo.gl/8aAxCU",20,17 14 61 11, read autohs
  button "&Leer",100,18 28 25 11, default
  button "&Ok",101,48 28 25 11, cancel
}
on *:dialog:so:sclick:*:{
  if ($did == 100) { run https://goo.gl/8aAxCU }
}
alias COP {
  if ($dialog(ControlOp)) { dialog -c ControlOp }
  else { dialog -m ControlOp ControlOp }
}
dialog ControlOp {
  size 470 100 415 303
  title "Base de Control para el Operador :)"
  icon 1, 5 2 220 40, adds/ControlOP.jpg, 0 noborder
  text "v4.0", 7, 390 25 100 20
  text "¡ScoutLink!", 8, 350 8 200 20
  tab "Regaños", 2, 2 50 344 253
  tab "Mensajes a Canal", 3
  tab "Otros", 40 
  button "Op", 20, 347 75 25 20
  button "Deop", 21, 371 75 33 20
  button "Cerrar", 4, 347 271 60 28, cancel
  button "Protec", 5, 347 100 60 20
  button "Idle 30" 6, 180 120 60 20, tab 40
  button "Idle 60" 9, 240 120 80 20, tab 40
  button "Poner +mi" 10, 347 145 60 20
  button "- mi" 18, 358 164 40 15
  button "Invitar a (nick)", 78, 100 90 80 20, tab 40 
  button "Unban", 11, 180 90 60 20, tab 40
  button "AutoInvite a #", 12, 240 90 80 20, tab 40 
  button "#opers", 13, 347 200 60 20
  button "#help", 61, 347 220 60 20
  button "#espanol", 48, 347 240 60 20
  box "Advertencia 1", 100, 5 75 80 195, tab 2
  button "idle", 104, 8 93 70 20, tab 2
  button "palabra", 105, 8 116 70 20, tab 2
  button "mayúscula", 106, 8 139 70 20, tab 2
  button "flood", 107, 8 162 70 20, tab 2
  button "spam", 108, 8 185 70 20, tab 2
  button "info", 109, 8 208 70 20, tab 2
  button "Otra razón", 110, 8 245 70 20, tab 2
  box "Advertencia 2", 101, 89 75 80 195, tab 2
  button "mayúscula", 111, 93 139 70 20, tab 2
  button "spam", 112, 93 185 70 20, tab 2
  button "info", 113, 93 208 70 20, tab 2
  button "Otra razón", 114, 93 245 70 20, tab 2
  box "Kick", 102, 171 75 80 195, tab 2
  button "idle", 115, 174 95 70 20, tab 2
  button "mayúscula", 116, 174 139 70 20, tab 2
  button "spam", 117, 174 185 70 20, tab 2
  button "info", 118, 174 208 70 20, tab 2
  button "Kick Otro", 119, 174 245 70 20, tab 2
  box "Kick/Ban",      103, 253 75 80 195, tab 2
  button "idle", 120, 257 95 70 20, tab 2
  button "palabra", 121, 257 116 70 20, tab 2
  button "mayúscula", 122, 257 139 70 20, tab 2
  button "flood", 123, 257 162 70 20, tab 2
  button "spam", 124, 257 185 70 20, tab 2
  button "info", 125, 257 208 70 20, tab 2
  button "Ban Perman.", 126, 257 245 70 20, tab 2
  text "NOTA: Seleccione un usuario de la NickList y haga clic al botón.", 150, 30 275 310 15, tab 2
  box "Mensajes al canal", 200, 5 75 320 197 , tab 3
  button "Datos Personales", 201, 20 95 130 20, tab 3
  button "SPAM, Webs sin autoriz.", 202, 20 120 130 20, tab 3
  button "FLOOD Prohibido", 203, 20 145 130 20, tab 3
  button "EL idle no es permitido", 204, 20 170 130 20, tab 3
  button "Ayudanos a cuidarte", 205, 20 195 130 20, tab 3
  button "Lea las normas de SL", 206, 180 95 130 20, tab 3
  button "ScoutLink 24h/365d", 207, 180 120 130 20, tab 3
  button "Nuevo nick", 208, 180 145 130 20, tab 3
  button "Como registro mi nick?", 209, 180 170 130 20, tab 3
  button "Como identificar un nick", 210, 180 195 130 20, tab 3
  button "¿Necesitas #Ayuda?", 211, 95 220 130 20, tab 3
  button "#Canal para Dirigentes", 212, 20 245 130 20, tab 3
  button "#Canal para Manadas", 213, 180 245 130 20, tab 3
  button "Carp E", 220, 255 30 40 20, 
  button "Fb", 221, 297 30 20 20,  
  button "Ig", 222, 317 30 18 20, 
  button "Tw", 223, 335 30 20 20,
  text "Son mensajes INFORMATIVOS enviados al canal, sin regaños o kicks.", 214, 7 275 335 15, tab 3
  box "Otros comandos", 41, 5 75 330 219 , tab 40
  button "hop", 42, 20 95 55 20, tab 40
  button "join", 43, 75 115 40 20, tab 40
  edit "", 44, 10 115 65 20, tab 40 autohs enter
  text "(incluya el #)", 45, 116 118 64 20, tab 40
  button "Salir del canal ACTUAL", 46, 12 135 120 20, tab 40
  text "Nick:", 49, 9 170 25 20, tab 40
  edit "", 50, 35 170 55 20, tab 40 autohs
  button "Op", 51, 95 170 35 20, tab 40
  text "Nick:", 52, 9 190 25 20, tab 40 
  edit "", 53, 35 190 55 20, tab 40 autohs
  button "Deop", 54, 95 190 35 20, tab 40 
  text "Nick:", 55, 9 210 25 20, tab 40 a
  edit "", 56, 35 210 55 20, tab 40 autohs
  button "Voice", 57, 95 210 50 20, tab 40
  text "Nick:", 58, 9 230 25 20, tab 40 
  edit "", 59, 35 230 55 20, tab 40 autohs
  button "Devoice", 60, 95 230 50 20, tab 40 
  text "Canal:(use #)", 62, 180 150 70 20, tab 40 
  edit "", 63, 250 150 45 20, tab 40 autohs
  button "ver", 64, 295 150 25 20, tab 40 
  box "", 65, 5 158 160 130, tab 40
  text "O también seleccione un nick de la nicklist y haga clic al botón", 66, 7 255 155 26, tab 40
  text "Info de nick:", 67, 180 170 70 20, tab 40
  edit "", 68, 250 170 45 20, tab 40 autohs
  button "ver", 69, 295 170 25 20, tab 40 
  text "CTCP-Versión:", 70, 180 190 90 20, tab 40
  edit "", 71, 250 190 45 20, tab 40 autohs
  button "ver", 72, 295 190 25 20, tab 40
  text "Lista de Flags en el canal actual", 73, 180 210 100 30, tab 40
  button "ver", 75, 295 210 25 20, tab 40
  button "Desconectar de ScoutLink", 76, 183 240 140 20, tab 40
  button "Desconectar y Cerrar OPmIRC", 77, 172 260 160 20, tab 40
}
;-
;Simpre debe seleccionar un nick en la NICKLIST. No lo olvide.
;-
on *:dialog:ControlOP:sclick:*:{
  if ($did == 5) { if ($group(#protec) == on) { disable #protec | echo -a 1 OPmIRC $+ :4 Protecciones apagadas } | else { enable #protec | echo -a 1 OPmIRC $+ :4 Protecciones encendidas, CUIDADO!!! - Consulte con sus compañeros Operadores del canal en el que se encuentra, si alguno tiene las protecciones activas. Si es así, desactive las suyas o infórmele a su compañero que usted las mantendrá encendidas para que él las apague. } }
  if ($did == 6) { echo -as 1 OPmIRC $+ : 4Anti-idle1 a 30m4 temporalmente inhabilitado }
  if ($did == 9) { echo -as 1 OPmIRC $+ : 4Anti-idle1 a 60m4 temporalmente inhabilitado }
  if ($did == 10) { cs op $active $me | msg $active 1,15 $active $+ : Estamos teniendo problemas, el canal permanecerá cerrado y en silencio por un momento. | mode $active +mi }
  if ($did == 18) { msg $active 1,15 $active $+ : Muy bien, ya podemos seguir disfrutando del chat. | mode $active -mi }
  if ($did == 11) { chanserv unban #$$?="Ingrese el nombre del canal donde este baneado" }
  if ($did == 12) { chanserv invite #$$?="Nombre del canal para autoinvitarse:" }
  if ($did == 13) { join #espanol-opers $$?="Por favor introduzca la clave para ingresar a #espanol-opers:" }
  if ($did == 61) { join #ayuda }
  if ($did == 48) { join #espanol }
  if ($did == 20) { cs op $active $me }
  if ($did == 21) { cs deop $active $me }
  if ($did == 42) { hop $active }  
  if ($did == 43) { join $did(44) }
  if ($did == 46) { part $active }
  if ($did == 51) { cs op $active $did(50) }
  if ($did == 54) { cs deop $active $did(53) }
  if ($did == 57) { cs voice $active $did(56) }
  if ($did == 60) { cs devoice $active $did(59) }
  if ($did == 64) { cs info $did(63) }
  if ($did == 69) { ns info $did(68) }
  if ($did == 72) { CTCP $did(71) version }
  if ($did == 75) { cs flags $active }
  if ($did == 76) { disconnect }
  if ($did == 77) { exit }
  if ($did == 220) { msg $active 6,15Carpeta Electrónica preparada por el equipo de #espanol para el JOTI: 1http://1drv.ms/1UM9cBM 0,0autorizado }
  if ($did == 221) { query $$?="Ingrese nick o #nombrecanal para envíar el enlace de la Pág-Oficial en Facebook" 6Nuestra página oficial en Facebook: 12http://facebook.com/scoutlinkespanol }
  if ($did == 222) { query $$?="Ingrese nick o #nombrecanal para envíar el enlace de la cuenta oficial en Instagram" 6Nuestra página oficial en Instagram: 12http://instagram.com/scoutlink.espanol }
  if ($did == 223) { query $$?="Ingrese nick o #nombrecanal para envíar el enlace de la cuenta oficial en Twitter" 6Síguenos en Twitter: 12http://twitter.com/scoutlespanol }
  if ($did == 78) { cs op $active $me | invite $$?="Ingrese nick a invitar" $active }
  if ($did == 104) { /notice $snick($active,1) 8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  $snick($active,1) $+ , llevas demasiado tiempo inactivo (idle) en $active $+ . Por favor, participa de la conversación del canal y evita ser retirado. 8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  }
  if ($did == 105) { /notice $snick($active,1) 8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  Por favor $snick($active,1) $+ , esa palabra no está permitida en ScoutLink, modera tu lenguaje.  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8 }
  if ($did == 106) { /notice $snick($active,1) 8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  $snick($active,1) $+ , el uso de mayúsculas equivale a gritar y se considera descortés. Por favor, desactiva las mayúsculas.  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8 }
  if ($did == 107) { /notice $snick($active,1) 8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  $snick($active,1) $+ , inundar la pantalla con un mensaje repetitivo, demasiado largo o sin sentido es considerado flood y está absolutamente prohibido en cualquier canal.  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8 }
  if ($did == 108) { /notice $snick($active,1) 8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  $snick($active,1) $+ , la publicidad no autorizada previamente por un operador (usuarios con una @ frente al nick) está prohibida, solicita la autorización de alguno de ellos antes de publicar tu página.  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8 }
  if ($did == 109) { /notice $snick($active,1) 8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  $snick($active,1) $+ , por razones de seguridad, ScoutLink recomienda evitar dar o solicitar información personal por canales públicos, usa un privado para eso.  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8 }
  if ($did == 110) { /notice $snick($active,1) 8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  $snick($active,1) $+ , $$?="Introduzca la razón que usted quiera para hacerle una Alerta de ScoutLink"  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8 }
  if ($did == 111) { /notice $snick($active,1) 8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  $snick($active,1) $+ , última advertencia, por favor desactiva las mayúsculas.  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8 }
  if ($did == 112) { /notice $snick($active,1) 8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  $snick($active,1) $+ , ya te advertimos que está prohibido publicar un sitio web sin ser previamente autorizado por un @Operador  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8 }
  if ($did == 113) { /notice $snick($active,1) 8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  $snick($active,1) $+ , si insistes en dar o solicitar información personal por canales públicos tendremos que retirarte del canal, por favor usa un privado.  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8 }
  if ($did == 114) { /notice $snick($active,1) 8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  $snick($active,1) $+ , $$?="Introduzca la razón para el regaño. Al final dirá: 2da advertencia" $+ , (2da advertencia)  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8 }
  if ($did == 201) { /notice $active 6,15Por razones de seguridad está prohibido dar y pedir información personal 10(Nombre completo, Facebook, Twitter, Skype, Teléfono, BB-Pin, Whatsapp o cualquier red social)6 en canales públicos. Por favor, utiliza los chats privados. }
  if ($did == 202) { /notice $active 6,15Recuerda que está prohibido publicar cualquier tipo de página web o enlace sin la autorización de un @operador 10(las personas con @ frente a su nick) }
  if ($did == 203) { /notice $active 6,15Enviar la misma línea varias veces o inundar la pantalla con un mensaje repetitivo es considerado 10FLOOD6 y está prohibido en este canal. }
  if ($did == 204) { /notice $active 6,15Ten en cuenta que estar inactivo en un canal durante10 30 minutos6 es considerado IDLE y está absolutamente prohibido en este canal. }
  if ($did == 205) { /notice $active 6,15Por favor ayúdanos a cuidarte: no compartas con cualquier persona información personal como: 10nombre completo, dirección, teléfono, redes sociales o páginas personales.6 El equipo de ScoutLink hace lo posible por mantener seguro el sistema pero nunca sabemos quién está detrás de un nick. }
  if ($did == 206) { /notice $active 6,15Para facilitar tu estadía en ScoutLink te invitamos a que revises las reglas del chat en: 12,15http://espanol.scoutlink.net/#reglas 0,0autorizado }
  if ($did == 207) { /notice $active 6,15Recuerden que ScoutLink está abierto todo el año no solamente durante el JOTI }
  if ($did == 208) { /notice $active 6,15Puedes cambiar tu nick. ¿Cómo? escribe 10,15/nick "nuevonick" 6,15solo cambia "10nuevonick6" por tu nick, por ejemplo yo escribí: 12,15/nick $me }
  if ($did == 209) { /notice $active 6,15Puedes registrar tu nick ¿cómo? Escribe 12/ns register "contraseña" "e-mail" 6solamente cambia "contraseña" por la clave que quieras usar y "e-mail" por tu correo electrónico. Este es un ejemplo 12/ns register estaesmiclave micorreo@dominio.com }
  if ($did == 210) { /notice $active 6,15Se te cambia el nick automáticamente a Guest**** o algo parecido?, es porque ya está registrado y debes identificarte como el propietario del nick. Para solucionarlo sigue los pasos. 121) Colocate nuevamente el nick (10/nick TUNICK12) y 2)Escribe: 10/ns identify tuclave6,15 (sustituyendo "10tuclave6,15" por la que usaste al registrarte, recuerda que tienes 90 segundos para identificarte) }
  if ($did == 211) { /notice $active 6,15¿Necesitas ayuda en el canal? ¿Quiéres obtener información de los distintos servicios? escribe 12/join #ayuda 6y atenderemos todos tus problemas. Si no recibes una respuesta en 10 minutos envía un email a 12hatt@scoutlink.net }
  if ($did == 212) { /notice $active 6,15¿Eres dirigente, scouter, guiadora, jefe, en fin adulto en el escultismo? ¿Mareado entre tanta gente? Entra al canal que tenemos para ti 12,15#espanol-dirigentes 6,15sandwiches y café gratis. Escribe 12,15/join #espanol-dirigentes }
  if ($did == 213) { /notice $active 6,15¿Eres lobato, lobezna, golondrina miembro de manada o rama menor? Tenemos un canal especial para ti entra ya a 12,15#espanol-manadas 6,15y platica con gente de tu edad. Escribe 12,15/join #espanol-manadas }
  if ($did == 1) {
    if ($me isop $active) {
      .flood
    }
  }
  if ($did == 115) {
    if ($me isop $active) {
      .kick $active $snick($active,1) 6inactividad (idle) en el canal superior a 30 minutos
    }
    else {
      .chanserv kick $active $snick($active,1) 6inactividad (idle) en el canal superior a 30 minutos
    }
  }
  if ($did == 116) {
    if ($me isop $active) {
      .kick $active $snick($active,1) 6Evita el uso de mayúsculas, es considerado gritar
    }
    else {
      .chanserv kick $active $snick($active,1) 6Evita el uso de mayúsculas, es considerado gritar
    }
  }
  if ($did == 117) {
    if ($me isop $active) {
      .kick $active $snick($active,1) 6Solicita autorización al @Operador de $chan antes de hacer publicidad
    }
    else {
      .chanserv kick $active $snick($active,1) 6Solicita autorización al @Operador de $chan antes de hacer publicidad
    }
  }
  if ($did == 118) {
    if ($me isop $active) {
      .kick $active $snick($active,1) 6Ya te advertimos sobre la información personal en el canal!!!
    }
    else {
      .chanserv kick $active $snick($active,1) 6Ya te advertimos sobre la información personal en el canal!!!
    }
  }
  if ($did == 119) {
    if ($me isop $active) {
      .kick $active $snick($active,1) 6 $$?="Introduzca la razón del Kick" $+ .
    }
    else {
      .chanserv kick $active $snick($active,1) 6 $$?="Introduzca la razón del Kick" $+ .
    }
  }
  if ($did == 120) {
    if ($me isop $active) {
      .cs op $active $me
      .ban -ku10 $active $snick($active,1) 6inactividad (idle) en el canal superior a 30 minutos
    }
    else {
      .chanserv OP $active $me | timero 1 2 ban -ku10 $active $snick($active,1) 6inactividad (idle) en el canal superior a 30 minutos 
    }
  }
  if ($did == 121) { if ($me isop $active) {
      .cs op $active $me
      .ban -ku60 $active $snick($active,1) 6Por favor modera tu lenguaje
    }
    else {
      .chanserv OP $active $me | timero 1 2 ban -ku60 $active $snick($active,1) 6Por favor modera tu lenguaje 
    }
  }
  if ($did == 122) { if ($me isop $active) {
      .cs op $active $me
      .ban -ku30 $active $snick($active,1) 6Te advertimos sobre el uso de mayúsculas...
    }
    else {
      .chanserv OP $active $me | timero 1 2 ban -ku30 $active $snick($active,1) 6Te advertimos sobre el uso de mayúsculas
    }
  }
  if ($did == 123) { if ($me isop $active) {
      .cs op $active $me
      .ban -ku30 $active $snick($active,1) 6No inundes la pantalla con tu Flood 
    }
    else {
      .chanserv OP $active $me | timero 1 2 ban -ku30 $active $snick($active,1) 6No inundes la pantalla con tu Flood
    }
  }
  if ($did == 124) { if ($me isop $active) {
      .cs op $active $me
      .ban -ku30 $active $snick($active,1) 6Publicidad no permitida en el canal 
    }
    else {
      .chanserv OP $active $me | timero 1 2 ban -ku30 $active $snick($active,1) 6Publicidad no permitida en el canal
    }
  }
  if ($did == 125) { if ($me isop $active) {
      .cs op $active $me
      .ban -ku30 $active $snick($active,1) 6La información personal es privada, ten cuidado al compartirla  
    }
    else {
      .chanserv OP $active $me | timero 1 2 ban -ku30 $active $snick($active,1) 6La información personal es privada, ten cuidado al compartirla
    }
  }
  if ($did == 126) { if ($me isop $active) {
      .cs op $active $me
      .mode $active +b $$?="Seleccione a alguien de la NICKLIST. Introduzca su ban (incluyendo * ? ! @) / Ejemplos / BAN NICK: nick!*@* // BAN USER: *!*username@* // BAN HOST: *@HostMask  /-/-/ nota: haga un whois al usuario y estudie las posibilidades de banearlo solo a el o a todo su grupo. Recuerde este ban quedará permanente y solo podrá ser removido manualmente por usted o algún IRCop."
      .kick $active $snick($active,1) 6 $$?="Ahora introduzca la razón de la expulsión para este usuario"
    }
  }
}


dialog -l error {
  size -1 -1 144 65
  title "Error!"
  text "Por favor escoje un nick!",  201,  13  12 150  20,
  button "OK",                       202,  33  35  75  20, ok
}
dialog -l errorOP {
  size -1 -1 150 65
  title "Error!"
  text "El nick escogido es un colega!",   203,   8  12 150  20,
  button "OK",                         204,  35  35  75  20, ok
}

alias -l nick.gotchma {
  if ($4 == $2) { halt }
  if ($me ison $3) {
    echo $3 4***12 $4 4era antes12 $2
    write -l $+ $5 nick-antes.log $address($nick,2) $nick $chan
  }
}

#---#espanol-opers
alias omrc1 {
  if ($dialog(omrc)) { dialog -c omrc }
  else { dialog -m omrc omrc }
}
dialog omrc {
  size 100 100 260 50
  text "Desea ingresar a #espanol-opers?", 1, 55 20 250 15 center
  button "si", 4, 220 385 70 30, center
}
#  size 200 100 240 40
#  title "¿quiere entrar a #espanol-opers?"
#  button "si", 888, 230 140 270 20,
#  button "si", 999,  7  65  70  20
#  button "no",    889,   190  130  70  20,
off *:dialog:omrc:sclick:*:{
  if ( espanol isin $active || $active == #espanol-manadas ) {
    if ( $snick($active,0) != 1 ) { dialog -m error error }
    elseif ( $snick($active,1) isop $active ) { dialog -m errorOP errorOP }
    else {
      if ($did == 101) { /notice $snick($active,1) 8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  $snick($active,1) $+ , Estás inactivo en el canal, Por favor únete a la conversación  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8 }
      if ($did == 102) { /notice $snick($active,1) 8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  Por favor $snick($active,1) $+ , Por favor modera tu lenguaje  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8 }
      if ($did == 103) { /notice $snick($active,1) 8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  $snick($active,1) $+ , En la Netiqueta el uso de mayúsculas es considerado gritar y por esa razón está prohibido en ScoutLink, Por Favor desactiva las mayúsculas  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8 }
    }
  }
}
