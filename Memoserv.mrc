;Partes de este remoto han sido escritas por Daniel, daniel_13@scoutlink.net

alias msp { if (!$dialog(memoservp)) dialog -m memoservp memoservp }

dialog memoservp {
  title "MemoServ"
  size -1 -1 351 400
  tab "Opciones", 2, 1 68 349 300
  tab "Enviar", 3
  icon 1, 1 0 349 60, adds/memoserv.jpg, 0 noborder
  button "Cerrar", 4, 285 372 60 20, cancel
  text "Haga clic y revise la ventana de STATUS", 203, 10 373 200 15, tab 2
  text "Ver memos recibidos", 204, 8 120 150 23, tab 2
  button "Lista de memos", 205, 158 118 90 23, tab 2
  text "Seleccione memo a leer:", 206, 8 150 150 23, tab 2
  button "MS-1", 207, 158 147 34 19, tab 2
  button "MS-2", 208, 196 147 34 19, tab 2
  button "MS-3", 209, 234 147 34 19, tab 2
  button "MS-4", 210, 272 147 34 19, tab 2
  button "MS-5", 211, 310 147 34 19, tab 2
  text "Seleccione memo a borrar:", 212, 8 178 150 23, tab 2
  button "MS-1", 213, 158 176 34 19, tab 2
  button "MS-2", 214, 196 176 34 19, tab 2
  button "MS-3", 215, 234 176 34 19, tab 2
  button "MS-4", 216, 272 176 34 19, tab 2
  button "MS-5", 217, 310 176 34 19, tab 2
  text "Borrar todos los memos:", 218, 8 206 150 23, tab 2
  button "Borrar Memos", 219, 158 202 90 23, tab 2 
  text "IGNORAR Memos", 220, 45 240 90 23, tab 2
  text "Lista de ignorados:", 221, 8 270 150 23, tab 2
  button "Ver lista", 222, 158 266 90 23, tab 2  
  text "Agregar/Borrar IGNORE:", 223, 8 298 125 23, tab 2
  edit "", 224, 158 298 100 19, tab 2 autohs
  text "(nick)", 225, 130 298 30 23, tab 2
  button "Add", 226, 265 298 34 19, tab 2 
  button "Del", 227, 305 298 34 19, tab 2 
  text "Borrar todos los ignores" 228, 8 328 150 23, tab 2
  button "Borrar Ignores" 229, 158 325 90 23, tab 2
  text "Para:", 301, 40 103 30 20, tab 3
  edit "", 302, 70 103 100 20, tab 3 autohs
  text "Escriba el memo:", 303, 6 132 160 20, tab 3
  edit "", 304, 6 153 337 80, tab 3 multi limit 255 
  button "Enviar", 305, 6 238 60 20, tab 3 disable
  text "Tiene un máximo de 255 caracteres", 306, 120 238 250 20, tab 3
  text "OPmIRC 4.0 ¡ScutLink!", 310, 220 372 60 40
}


## ENVIAR ##

on *:dialog:memoservp:edit:304: {
  did -e memoservp 305
}
on *:dialog:memoservp:sclick:305: {
  .memoserv send $did(302) $did(304)
}



## OPCIONES ##

on *:dialog:memoservp:sclick:205: {
  .memoserv list
}
on *:dialog:memoservp:sclick:207: {
  .memoserv read 1
}
on *:dialog:memoservp:sclick:208: {
  .memoserv read 2
}
on *:dialog:memoservp:sclick:209: {
  .memoserv read 3
}
on *:dialog:memoservp:sclick:210: {
  .memoserv read 4
}
on *:dialog:memoservp:sclick:211: {
  .memoserv read 5
}
on *:dialog:memoservp:sclick:213: {
  .memoserv del 1
}
on *:dialog:memoservp:sclick:214: {
  .memoserv del 2
}
on *:dialog:memoservp:sclick:215: {
  .memoserv del 3
}
on *:dialog:memoservp:sclick:216: {
  .memoserv del 4
}
on *:dialog:memoservp:sclick:217: {
  .memoserv del 5
}
on *:dialog:memoservp:sclick:219: {
  .memoserv del all
}
on *:dialog:memoservp:sclick:222: {
  .memoserv ignore list
}
on *:dialog:memoservp:edit:224: {
  did -e memoservp 226
}
on *:dialog:memoservp:sclick:226: {
  .memoserv IGNORE ADD $did(224)
}
on *:dialog:memoservp:edit:224: {
  did -e memoservp 227
}
on *:dialog:memoservp:sclick:227: {
  .memoserv IGNORE DEL $did(224)
}
on *:dialog:memoservp:sclick:229: {
  .memoserv IGNORE CLEAR
}
