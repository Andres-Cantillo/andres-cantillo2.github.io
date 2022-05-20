(: Ejercico 2 :)
(:
for $libro in doc("book.xml")/bookstore/book
where $libro/price > 30
order by $libro/title
return $libro/title
:)
(:Ejercico 3:)
(:
<book>{
for $libro in doc("book.xml")/bookstore/book[price <=30]
order by $libro/title
return <preciotitulo>{$libro/title, $libro/price}</preciotitulo>
}</book>
:)
(:Ejercico 4:)
(:
<book>{
for $libro in doc("book.xml")/bookstore/book
where $libro/year=2005
return <lib2005>{$libro/title, $libro/author}</lib2005>
}</book>
:)
(:Ejercico 5:)
(:
<book>{
for $libro in doc("book.xml")/bookstore/book
return <publicacion>{$libro/year}</publicacion>
}</book>
:)
(:Ejercico 6:)
(:
<book>{
let $libro := doc("book.xml")/bookstore/book
return <publicacion>{$libro/year}</publicacion>
}</book>
:)
(:Ejercico 7:)
(:
for $libro in doc("book.xml")/bookstore/book
order by $libro/@category,  $libro/title
return $libro
:)

(:Ejercicio 9:)
(:
<book>{(
for $libro in doc("book.xml")/bookstore/book
return <publicacion>{$libro/title}</publicacion>
)(
<totallibros>
let $items := doc("book.xml")/bookstore/book
let $suma := sum($items)
return $suma
</totallibros>)
}</book>
:)
(:9. Mostrar los títulos de los libros y al final una etiqueta con el número total de libros.:)
(:
for $libros in doc("book.xml")/bookstore/book
return <titulo>{data($libros/title)}</titulo>,
let $numlibros := count( doc("bookstore.xml")/bookstore/book)
return <num_total>{data($numlibros)}</num_total>
:)
(: 10.Mostrar el precio mínimo y máximo de los libros.:)
(:
let $max := max(doc("book.xml")/bookstore/book/price), 
    $min := min(doc("book.xml")/bookstore/book/price)
return <precio>
<max>{$max}</max>
<min>{$min}</min>
</precio> 
:)
(: Ejercicio 11:)
(:
for $libro in doc("book.xml")/bookstore/book
let $precio_iva := $libro/price*1.21
order by $precio_iva
return
<libro>
<titulo>{$libro/title/text()}</titulo>
<precio>{$libro/price/text()}</precio>
<preciofinal>{$precio_iva}</preciofinal>
</libro>
:)
(:12.Mostrar la suma total de los precios de los libros con la etiqueta "total".:)
(:
let $suma := doc("book.xml")/bookstore/book/price
return <total>{sum($suma)}</total>
:)
(:13.Mostrar cada uno de los precios de los libros, y al final una nueva etiqueta con la suma de los precios.:)
(:
<libros>
{for $libro in doc("book.xml")/bookstore/book
  return $libro/price}
{let $libros := doc("book.xml")/bookstore/book
 return <total>{sum($libros/price)}</total>}
</libros>
:)
(:Ejercicio 14:)
(:
for $libro in doc("book.xml")/bookstore/book
return
<libro>
<titulo>{$libro/title/text()}</titulo>
<numautores>{count($libro/author)}</numautores>
</libro>
:)
(:15.Mostrar en la misma etiqueta el título y entre paréntesis el número de autores
que tiene ese título.:)
(:
for $libro in doc("book.xml")/bookstore/book
return 
  <libro>
    {$libro/title/text()}
   ({count($libro/author)})
  </libro>
:)
(:16.Mostrar los libros escritos en años que terminen en "3".:)
(:
for $libro in doc("ejercicio1.xml")/bookstore/book
where ends-with($libro/year,"3")
return $libro
:)
(:Ejercicio 17:)
(:
for $libro in /bookstore/book
where starts-with($libro/@category, "C")
return $libro
:)
(:Ejercicio 18:)
(:
for $libro in /bookstore/book
where contains($libro/title, "x") or contains($libro/title, "X")
order by $libro/title descending
return $libro
:)
(:Ejercicio 19:)
(:
for $libro in /bookstore/book
return 
  <libro>
    {$libro/title}
    <length>{string-length($libro/title)}</length>
  </libro>
:)
(:Ejercicio 20:)
(:
for $año in distinct-values(/bookstore/book/year)
return <año>{$año}</año>
:)
(:Ejercicio 21:)
(:
for $autor in distinct-values(/bookstore/book/author)
order by string-length($autor)
return <autor>{$autor}</autor>
:)
(:Ejercicio 22:)
(:
<table>
{
  for $libro in /bookstore/book
  return 
    <tr>
      <td>{$libro/title/text()}</td>
    </tr>
}
</table>
:)