;Partes de este remoto han sido escritas por Aciago.
;Posee modificaciones y partes adicionales realizadas por daniel_13

on *:connect: {
  if ($network == scoutlink) {
    .enable #opmenu
  }
}
on *:disconnect: {
  .disable #opmenu
}
#opmenu off
on 1:QUIT: {
  if (((.net isin $1) || (irc. isin $1) ) && ((.net isin $2) || (irc. isin $2)) && (($3- == $null) && (/ !isin $1-))) { 
    if ($1- == %split) { halt }
    .set %server1 $gettok($1,1,46) | .set %server2 $gettok($2,1,46)
    /echo 4 $active 15,15_14,14_ 0,1 NetSplit 14,14_15,15_ 15,15_14,14_ 12,1«15 $+ %server1 $+ 12» 12«15 $+ %server2 $+ 12» 14,14_15,15_
    set %split $1- 
    .timer 1 5 unset %split
    halt  
  }
}
On *:Join:#: { 
  if (espanol isin $chan || $chan == #espanol-manadas) {
    if ($chan == #espanol-opers) halt { 
      if (*.scoutlink.net iswm $site) || ($nick == $me) halt {
        if ($read(nick-antes.log, w,  * $+ $address($nick,2) $+ *) != $null ) {
          nick.gotchma $read(nick-antes.log, w,  * $+ $address($nick,2) $+ *) $nick $readn
        }
        if ( $read(nick-antes.log, w,  * $+ $address($nick,2) $+ *) == $null ) {
          write nick-antes.log $address($nick,2) $nick $chan
        }
      }
    }
  }
  else { halt }
}

menu nicklist {
  $iif(espanol isin $chan || $chan == #manadas,Control Operador)
  .Advertencias:
  ..Idle:/notice $$1 8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  $snick($active,1) $+ , llevas demasiado tiempo inactivo (idle) en $active $+ . Por favor, participa de la conversación del canal y evita ser retirado. 8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  
  ..Malas Palabras:/notice $$1 8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  Por favor $snick($active,1) $+ , esa palabra no está permitida en ScoutLink, modera tu lenguaje.  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8 
  ..Mayúsculas 1:/notice $$1  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  $snick($active,1) $+ , el uso de mayúsculas equivale a gritar y se considera descortés. Por favor, desactiva las mayúsculas.  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8
  ..Mayúsculas 2:/notice $$1  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  $snick($active,1) $+ , última advertencia, por favor desactiva las mayúsculas.  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8 
  ..Flood:/notice $$1  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  $snick($active,1) $+ , inundar la pantalla con un mensaje repetitivo, demasiado largo o sin sentido es considerado flood y está absolutamente prohibido en cualquier canal.  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8 
  ..Spam 1:/notice $$1  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  $snick($active,1) $+ , la publicidad no autorizada previamente por un operador (usuarios con una @ frente al nick) está prohibida, solicita la autorización de alguno de ellos antes de publicar tu página.  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8 
  ..Spam 2:/notice $$1 8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  $snick($active,1) $+ , ya te advertimos que está prohibido publicar un sitio web sin ser previamente autorizado por un @Operador  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8 
  ..Info Personal 1:/notice $$1  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  $snick($active,1) $+ , por razones de seguridad, ScoutLink recomienda evitar dar o solicitar información personal por canales públicos, usa un privado para eso.  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8 
  ..Info personal 2:/notice $$1  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  $snick($active,1) $+ , si insistes en dar o solicitar información personal por canales públicos tendremos que retirarte del canal, por favor usa un privado.  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8 
  ..Ligar:/notice $$1 8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  $$1 $+ , esto no es un servicio de citas, es un chat para Scouts, comportate adecuadamente 8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8
  ..Otros:/notice $$1  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  $snick($active,1) $+ , $$?="Introduzca la razón que usted quiera para hacerle una Alerta de ScoutLink"  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8 
  ..Otros2:/notice $$1  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8  $snick($active,1) $+ , $$?="Introduzca la razón para el regaño. Al final dirá: 2da advertencia" $+ , (2da advertencia)  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8 
  ..Idiomas:
  ...Inglés: /say 6 $$1 $+ , this is a Spanish only channel, for English, please type /part $chan and /join #english
  ...Francés: /say 6 $$1 $+ , Pour communiquer en français, veuillez s'il vous plaît tapez /join #francais et /part $chan pour utiliser le canal #francais Merci!
  ...Alemán: /say 6 $$1 $+ , wenn du deutsch sprechen möchtest, bitte /part $chan und /join #deutsch
  ...Portugués: /say 6 $$1 $+ , Neste canal falamos apenas espanhol. Para português, vá ao #portugues, por favor digite /part $chan e /join #portuguese
  ...Italiano: /say 6 $$1 $+ , questo canale é per parlare en spagnolo, per italiano andare a #italiano (/part $chan /join #italiano)
  ...Noruego: /say 6 $$1 $+ , Dette er en spansktalende kanal, for Danks-talende, gå venligst til #scandinavia
  ...Sueco: /say 6 $$1 $+ , Om du vill prata svenska, lämna $chan och anslut till #scandinavia
  ...Chino: /say 6 $$1 $+ , ruguo ni yao shuo zhongwen, qing ni likai $chan $+ , lanhou zai jinru #chinese
  ...Holandés: /say 6 als je nederlands wilt praten /part $chan en /join #dutch
  .-
}

menu nicklist {
  $iif(($me isop $chan) && (espanol isin $chan || $chan == #manadas),Control Operador)
  .Castigos
  ..Idle kick:/KICK # $$1 6Idle superior a 30 minutos
  ..Idle BanKick: .ban -ku10 $$1 1 6Idle superior a 30 con autoentrada activada
  ..Malas Palabras: .ban -ku60 $$1 1 6Lenguaje Inapropiado 
  ..Mayúsculas Kick:/KICK # $$1 6Evita el uso de mayúsculas en este canal 
  ..Mayúsculas BanKick: .ban -ku30 $$1 1 6Ya que insistes en gritarnos tendremos que expulsarte.
  ..Flood BanKick: .ban -ku30 $$1 1 6Exceso de Flood 
  ..Spam Kick:/KICK # $$1 6Solicita autorización al Operador antes de hacer publicidad 
  ..Info Personal Kick:/KICK # $$1 6No queremos ni darte ni recibir información personal de tu parte 
  ..Ligar Kick:/KICK # $$1 6Este no es un chat de citas, comportate adecuadamente. 
  ..Kick Otra Razón:/KICK # $$1 6 $$?="Introduzca la razón del Kick" $+ . 
  ..BanKick Otra Razón (10s): .ban -ku10 $$1 1 6 $$?="Introduzca la razón" $+ .
  ..BanKick Otra Razón (30s): .ban -ku30 $$1 1 6 $$?="Introduzca la razón" $+ .
  ..BanKick Otra Razón (60s): .ban -ku60 $$1 1 6 $$?="Introduzca la razón" $+ .
  .-
}
menu nicklist {
  $iif(($me !isop $chan) && (espanol isin $chan || $chan == #espanol-manadas),Control Operador)
  .Castigos
  ..Idle kick: chanserv KICK # $$1 6Idle superior a 30 minutos
  ..Idle bankick: chanserv op # $me | timero 1 2 ban -u10 $address($$1,2) | timero1 1 4 kick # $$1 6Idle superior a 30 minutos | timero2 1 18 chanserv deop # $me
  ..Flood bankick: chanserv op # $me | timero 1 2 ban -u30 $address($$1,2) | timero1 1 4 kick # $$1 6No inundes la pantalla con tu Flood | timero2 1 38 chanserv deop # $me
  ..Mayúsculas kick:/chanserv KICK # $$1 6 El uso de mayúsculas no está permitido porque se considera de mala educación... equivale a gritar
  ..Mayúsculas BanKick: chanserv op # $me | timero 1 2 ban -u30 $address($$1,2) | timero1 1 4 kick # $$1 6Ya que insistes en gritarnos... | timero2 1 38 chanserv deop # $me
  ..Malas Palabras: chanserv op # $me | timero 1 2 ban -u60 $address($$1,2) | timero1 1 4 kick # $$1 6Uso de palabras indebidas en ScoutLink | timero2 1 68 chanserv deop # $me
  ..Spam:/chanserv KICK # $$1 6 Publicidad indeseada
  ..Info Personal:/chanserv KICK # $$1 6No queremos ni darte ni recibir información personal de tu parte
  ..Ligar:/chanserv KICK # $$1 6Este no es un chat de citas a ciegas.
  ..Otra Razón:/chanserv KICK # $$1 6 $$?="Razón del Kick:"
  ..Desde Afuera:/chanserv KICK #$$?="Nombre del Canal:" $$?="Ingresar Nick:" 6 $$?="Razón del Kick:"
  ..BanKick 10seg: chanserv op # $me | timero 1 2 ban -u10 $address($$1,2) | timero1 1 4 kick # $$1 6 $$?="Introduzca la razón" | timero2 1 18 chanserv deop # $me
  ..BanKick 30seg: chanserv op # $me | timero 1 2 ban -u30 $address($$1,2) | timero1 1 4 kick # $$1 6 $$?="Introduzca la razón" | timero2 1 38 chanserv deop # $me
  ..BanKick 60seg: chanserv op # $me | timero 1 2 ban -u60 $address($$1,2) | timero1 1 4 kick # $$1 6 $$?="Introduzca la razón" | timero2 1 68 chanserv deop # $me
  ..BanKick 120seg: chanserv op # $me | timero 1 2 ban -u120 $address($$1,2) | timero1 1 4 kick # $$1 6 $$?="Introduzca la razón" | timero2 1 68 chanserv deop # $me
}
menu nicklist {
  $iif(espanol isin $chan || $chan == #manadas, Control Operador)
  .Op/Deop $$1 en $chan $+ : { if ( $$1 isop $chan ) { chanserv deop $chan $$1 }
  else { chanserv op $chan $$1 } }
  .Voice/Devoice $$1 en $chan $+ : { if ( $$1 isvoice $chan ) { chanserv devoice $chan $$1 }
  else { chanserv voice $chan $$1 } }
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
