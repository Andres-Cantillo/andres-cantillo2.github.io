(:Ejercicio 1:)
(:
for $baile in /bailes/baile
return <losbailes>{$baile/nombre/text()}</losbailes>
:)
(:Ejercicio 2:)
(:
for $baile in /bailes/baile
return <losbailes>{$baile/nombre/text()} ({$baile/plazas/text()})</losbailes>
:)
(:Ejercicio 3:)
(:
for $baile in /bailes/baile
where $baile/precio > 30
return $baile/nombre
:)
(:Ejercicio 4:)
(:
for $baile in /bailes/baile
where $baile/precio > 30 and $baile/precio/@moneda = "euro"
return $baile/nombre
:)
(:Ejercicio 5:)
(:
for $baile in /bailes/baile
where contains($baile/comienzo, "/1/")
return 
   <baile>
      {$baile/profesor}
      {$baile/comienzo}
   </baile>
:)
(:Ejercicio 6:)
(:
for $baile in /bailes/baile
order by $baile/sala
return 
   <baile>
      {$baile/profesor}
      {$baile/sala}
   </baile>
:)
(:Ejercicio 7:)
(:
for $profesor in distinct-values(/bailes/baile/profesor)
let $salas := /bailes/baile[profesor=$profesor]/sala
order by $profesor
return 
   <profesores>
     <nombre>{$profesor}</nombre>
     {$salas}
   </profesores>
:)
(:Ejercicio 8:)
(:
let $baile := /bailes/baile
return <media>{avg($baile/precio)}</media>
:)
(:Ejercicio 9:)
(:
let $baile := /bailes/baile[sala=1]
return <total_sala_1>{sum($baile/precio)}</total_sala_1>
:)
(:Ejercicio 10:)
(:
let $baile := /bailes/baile[profesor = "Jesus Lozano"]
return <plazas>{sum($baile/plazas)}</plazas>
:)
(:Ejercicio 11:)
(:
let $baile := /bailes/baile[profesor = "Laura Mendiola"]
return $baile/plazas * $baile/precio
:)
(:Ejercicio 12:)
(:
for $baile in /bailes/baile
where $baile/profesor = "Jesus Lozano"
return <beneficio>{$baile/plazas * $baile/precio}</beneficio>
:)
(:Ejercicio 13:)
(:
for $baile in /bailes/baile
where starts-with($baile/profesor, "Laura")
return <beneficio>{$baile/plazas * $baile/precio}</beneficio>
:)
(:Ejercicio 14:)
(:
for $baile in /bailes/baile
order by $baile/nombre
return 
   <baile>
      {$baile/nombre}
      <precio>{$baile/precio/text()}</precio>
      <fam_numerosa>{$baile/precio * 0.85}</fam_numerosa>
   </baile>
:)
(:Ejercicio 15:)
(:
for $baile in /bailes/baile
return <baile>{$baile/* except $baile/comienzo except $baile/fin}</baile>
:)
(:Ejercicio 16:)
(:
<table> {
  for $baile in /bailes/baile
  return <tr><td>{$baile/nombre/text()}</td><td>{$baile/profesor/text()}</td></tr>
} </table>
:)