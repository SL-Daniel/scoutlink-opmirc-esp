;Partes de este remoto han sido escritas por Aciago.
;Posee modificaciones realizadas por daniel_13

#opmenu off
off me:*:JOIN:#: {
  if (espanol isin $chan || $chan == #espanolmanada) {
    if ($chan == #espanol-opers) halt {
      COP
    }
  }
}
on 1:DISCONNECT: {
  write -c nick-antes.log
  unset %server*
  unset $+(%,§anti.caps.,$chan,.,$nick),2 
}
on 1:CONNECT: {
  write -c nick-antes.log
}
on me:QUIT: {
  var %a = 1, %b = $chan(0)
  while %a <= %b {
    $+(.timer,idleAB,.,$chan(%a)) off
    inc %a
  }
}
#opmenu end
#protec off
on 1!:TEXT:*autoriz*:#:$sitioweb(*autorizado*)
on 1!:TEXT:*http*:#:$sitioweb(*http://*)
on 1!:TEXT:*www.*:#:$sitioweb(*www*)
on 1!:TEXT:*www,*:#:$sitioweb(*www*)
on l!:TEXT:*http://espanol.scoutlink.net/#reglas*:#:$sitioweb(*scoutlink*)
alias -l sitioweb {
  if ($chan == #espanol-opers) halt {
    if ($1 == *autorizado*) halt {
      if ($l == *scoutlink*) halt {
        echo -a 1[ALERTA]4 $nick Esta publicando una pagina en #
        inc %link [ $+ [ $nick ] ]
        echo -a 4 Advertencias: %link [ $+ [ $nick ] ]
        /notice $nick 8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8   No publiques un enlace sin autorización de un Moderador, son los usuarios que tienen una @ en su nick 8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8 

      }
    }
  }
}
on *:disconnect: {
  unset %link*
}
#protec end

#protec off
on 1!:TEXT:*@gmail.com*:#:$correoe(*Email*)
on 1!:TEXT:*@hotmail*:#:$correoe(*Email*)
on 1!:TEXT:*@yahool*:#:$correoe(*Email*)
on 1!:TEXT:*@live*:#:$correoe(*Email*)
on 1!:TEXT:*@windowslivel*:#:$correoe(*Email*)
on 1!:TEXT:*@aol*:#:$correoe(*Email*)
on 1!:TEXT:*@mixmail*:#:$correoe(*Email*)
on 1!:TEXT:*@latinmail*:#:$correoe(*Email*)
on 1!:TEXT:*@mail*:#:$correoe(*Email*)
on 1!:TEXT:*@terra*:#:$correoe(*Email*)
on 1!:TEXT:*@msn*:#:$correoe(*Email*)
on 1!:TEXT:*@latam*:#:$correoe(*Email*)
on 1!:TEXT:*@*.org*:#:$correoe(*Email*)
on 1!:TEXT:*@*.com*:#:$correoe(*Email*)
on 1!:TEXT:*@*.net*:#:$correoe(*Email*)
on 1!:TEXT:*@*.cl*:#:$correoe(*Email*)
on 1!:TEXT:*@*.ar*:#:$correoe(*Email*)
on 1!:TEXT:*@*.edu*:#:$correoe(*Email*)
on 1!:TEXT:*@*.ve*:#:$correoe(*Email*)
on 1!:TEXT:*@*.pe*:#:$correoe(*Email*)
on 1!:TEXT:*@*.es*:#:$correoe(*Email*)
alias -l correoe {
  echo -a 1[ALERTA]4 $nick Esta publicando un Email en #
  inc %email [ $+ [ $nick ] ]
  if ($chan == #espanol-opers) halt {
    echo -a 4 Advertencias: %email [ $+ [ $nick ] ]
    /notice $nick 8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8   No publiques tu correo por el canal público, es por tu seguridad. 8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8 
  }
}
on *:disconnect: {
  unset %email*
}
#protec end

#protec off
on *:text:*:#: {
  if (espanol isin $chan || $chan == #manada) { 
    if ($chan == #espanol-opers) halt { 
      if ($nick !isop $chan) && ($len($1-) > 4) {
        if ($anticaps($1-,$chan) == $true) { 
          inc -u360 $+(%,§anti.caps.,$chan,.,$nick)
          if ($eval($+(%,§anti.caps.,$chan,.,$nick),2) < 2) {
            notice $nick 8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8   En la Netiqueta el uso de mayúsculas es considerado gritar y por esa razón está prohibido en ScoutLink. Por favor $nick $+ , desactiva las mayúsculas... Gracias  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8
          echo -a 4 Estás regañando a $nick por uso de mayúsculas en $chan }
          if ($eval($+(%,§anti.caps.,$chan,.,$nick),2) == 2) {
            notice $nick 8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8   Desactiva las mayúsculas, será el último aviso  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8 
          echo -a 4 Estás regañando a $nick por uso de mayúsculas en $chan $+ , segundo aviso }
          if ($eval($+(%,§anti.caps.,$chan,.,$nick),2) == 3) {
            chanserv kick $chan $nick 6Desactiva las mayúsculas, fuiste advertid@
          echo -a 4 Pateaste a $nick por uso de mayúsculas en $chan }
          if ($eval($+(%,§anti.caps.,$chan,.,$nick),2) > 3) {
            if ($me isop $chan) {
              .ban -ku30 $chan $nick 6Por última vez, Por Favor desactiva las mayúsculas
            }
            else {
              .chanserv OP $chan $me
              timerop 1 2 ban -ku30 $chan $nick 6Por última vez, Por favor desactiva las mayúsculas
              echo -a 4 Acabas de patear y banear a $nick por uso de mayúsculas en $chan
            }
          }
        }
      }
    }
  }
}
on *:action:*:#: {
  if (espanol isin $chan || $chan == #espanol-manada) {
    if ($chan == #espanol-opers) halt { 
      if ($nick !isop $chan) && ($len($1-) > 4) {
        if ($anticaps($1-,$chan) == $true) { 
          inc -u360 $+(%,§anti.caps.,$chan,.,$nick)
          if ($eval($+(%,§anti.caps.,$chan,.,$nick),2) < 2) {
            notice $nick  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8   En la Netiqueta el uso de mayúsculas es considerado gritar y por esa razón está prohibido en ScoutLink. Por favor $nick $+ , desactiva las mayúsculas... Gracias   8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8 
          echo -a 4 Estás regañando a $nick por uso de mayúsculas en $chan }
          if ($eval($+(%,§anti.caps.,$chan,.,$nick),2) == 2) {
            notice $nick  8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8   $nick Desactiva las mayúsculas, último aviso   8,1A1,8L8,1E1,8R8,1T1,8A8,1 1,8D8,1E1,8 8,1S1,8C8,1O1,8U8,1T1,8L8,1I1,8N8,1K1,8!8,1!1,8 
          echo -a 4 Estás regañando a $nick por uso de mayúsculas en $chan $+ , segunda advertencia }
          if ($eval($+(%,§anti.caps.,$chan,.,$nick),2) == 3) {
            chanserv kick $chan $nick 8,1Desactiva las mayúsculas, fuiste advertid@
          echo -a 4 Acabas de patear a $nick por uso de mayúsculas en $chan }
          if ($eval($+(%,§anti.caps.,$chan,.,$nick),2) > 3) {
            if ($me isop $chan) {
              .ban -ku30 $chan $nick 6Por última vez, desactiva las mayúsculas
            }
            else {
              .chanserv OP $chan $me
              timerop 1 2 ban -ku30 $chan $nick 6Por última vez, desactiva las mayúsculas
              echo -a 4 Acabas de patear y banear a $nick por uso de mayúsculas en $chan
            }
          }
        }
      }
    }
  }
}
#protec end

alias -l paranoid { return $calc($1 * 100 / $len($2)) }
alias -l anticaps {
  var %i = 1
  while ($gettok($1,%i,32)) {
    var %f = $ifmatch
    if ($mid(%f,2,$calc($len(%f) - 2)) !ison $2) && ($strip(%f) !ison $2) { 
      var %textfinal $instok(%textfinal,$ifmatch,1,32) 
      inc %i 
    }
    else { inc %i }
  }
  var %i = 1,%d = $remove(%textfinal,$chr(32)),%maynum
  while ($mid(%d,%i,1)) {
    if ($asc($ifmatch) isnum 65-90) { 
      inc %maynum  
      inc %i
    }
    else { inc %i }
  }
  if ($paranoid(%maynum,%d) >= 60) { return $true }
  return $false
}
dialog -l cerror {
  size -1 -1 144 65
  title "Error!"
  text "Por favor escribe un canal!",  201,  13  12 150  20,
  button "OK",                       202,  33  35  75  20, ok
}
dialog -l cerror1 {
  size -1 -1 144 65
  title "Error!"
  text "Debes escribir un límite de Usuarios!",  201,  13  12 150  45,
  button "OK",                       202,  33  40  75  20, ok
}
dialog -l cerror2 {
  size -1 -1 144 65
  title "Error!"
  text "Olvidaste escribir la clave!",  201,  13  12 150  20,
  button "OK",                       202,  33  35  75  20, ok
}
dialog -l cerror3 {
  size -1 -1 160 65
  title "Error!"
  text "Debe establecer un límite en lineas:segundos!",  201,  13  12 200  40,
  button "OK",                       202,  33  45  80  20, ok
}
#clonmenu on
on *:JOIN:#: {
  if (espanol isin $chan || $chan == #espanol-manada) {
    if (*.scoutlink.net iswm $site) halt {
      if ($ialchan($wildsite,$chan,0) > 1) {
        var %i = 2
        while (%i <= $ialchan($wildsite,$chan,0)) {
          echo 4 $chan $ialchan($wildsite,$chan,1).nick - Clon Encontrado: $ialchan($wildsite,$chan,%i).nick ( $wildsite )
          inc %i
        }
      }
    }
  }
}
#clonmenu end
