{-
20 ekim
functions
-}
{-|
  
-}
f x = x^2+x+5
-- *Main> f 4
-- 25

-- Haskell'in şöyle bir güzelliği var kullandığınız parametrelerin type' ını kendi tahmin edebiliyor.

-- Texas ranges
{-
Texas range ile liste üretebiliyoruz.
Oluşturmak istediğimiz listenin ilk ve son elamanını veriyoruz. 
O aradaki kısım için sadeece iki nokta koyuyoruz.
Aradaki sayıları Haskell kendisi oluşturuyor.
*Main> [1..50]
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50]


1 den 50 ye kadar tek sayılar için? O zaman örüntü vermemiz gerekir.
*Main> [1,3..50]
[1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37,39,41,43,45,47,49]

*Main> [50..1]
[]
Peki burası neden boş geldi? Rangeler de artan bir yapı olduğu için burayı bu şekilde oluşturamaz. Azalan yapılarda örüntü vermemiz (azalan olduğunu bir şekilde belirtmeliyiz) gerekir.
*Main> [50,49..1]
[50,49,48,47,46,45,44,43,42,41,40,39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]

ghci> [0.1, 0.3 .. 1]  
[0.1,0.3,0.5,0.7,0.8999999999999999,1.0999999999999999]  

Sadece sayılar için geçerli değil, harfler içinde yapabiliriz.
ghci> ['a'..'z']  
"abcdefghijklmnopqrstuvwxyz"  
ghci> ['K'..'Z']  
"KLMNOPQRSTUVWXYZ"   


--------------------------------------------------------------
CYCLE: takes a list and cycles it into an infinite list. If you just try to display the result, it will go on forever so you have to slice it off somewhere.

ghci> take 10 (cycle [1,2,3])  
[1,2,3,1,2,3,1,2,3,1]  // 10 değer var.
ghci> take 12 (cycle "LOL ")  
"LOL LOL LOL "   // 12 değer var.


REPEAT: takes an element and produces an infinite list of just that element. It's like cycling a list with only one element.

ghci> take 10 (repeat 5)  
[5,5,5,5,5,5,5,5,5,5]  // 5 i tekrarla, 10 tane olana kadar.

Bu şekilde alt sınırı olup üst sınırı olmayan bir tanımlama yapabiliriz.
*Main> let numbers = [1..]
*Main> take 3 numbers
[1,2,3]
*Main> take 30 numbers
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
üst sınırla işimiz olmadığı için bu şekilde kullanabiliriz.

*Main> last numbers
--
Ama böyle bir kullanımda üst sınırımız belli olmadığı için Interrupted takılır :S Busted.




--------------------------------------------------------------
I'm a list comprehension

ghci> [x*2 | x <- [1..10]]  
[2,4,6,8,10,12,14,16,18,20]

--------------------------------------------------------------
Let's say we want only the elements which, doubled, are greater than or equal to 12.
ghci> [x*2 | x <- [1..10], x*2 >= 12]  
[12,14,16,18,20]  

Cool, it works. How about if we wanted all numbers from 50 to 100 whose remainder when divided with the number 7 is 3? Easy.
ghci> [ x | x <- [50..100], x `mod` 7 == 3]  
[52,59,66,73,80,87,94]  

--------------------------------------------------------------
Now for another example. 
Let's say we want a comprehension that replaces each odd number greater than 10 with "BANG!" and each odd number that's less than 10 with "BOOM!". 
If a number isn't odd, we throw it out of our list. 
For convenience, we'll put that comprehension inside a function so we can easily reuse it.
-}

boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]   

-- *Main> boomBangs [7..13]
-- ["BOOM!","BOOM!","BANG!","BANG!"] ?? bu kısıma tekrar bak koptum.

{-
*Main> [x^2+y| x <- [1..3], y <- [1..3], odd x]
[2,3,4,10,11,12]

x odd -> 1 3,
y -> 1 2 3,

1^2 + 1 = 2
1^2 + 2 = 3
1^2 + 3 = 4
3^2 + 1 = 10
3^2 + 2 = 11
3^2 + 3 = 12

yani demek istenen;

x ve y değerleri 1 ve 3 arasından olucak, x ekstra olarak tek olmalı. x in şartını 1. for y nin şartını 2. for döngüsü olarak düşün.



--------------------------------------------------------------
ghci> let xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]  
ghci> [ [ x | x <- xs, even x ] | xs <- xxs]  
[[2,2,4],[2,4,6,8],[2,4,2,6,2,6]]

-}

{-
Bir sıfat listesi ve isim listesini birleştiren bir liste anlayışına ne dersiniz? … for epic hilarity.

ghci> let nouns = ["hobo","frog","pope"]  
ghci> let adjectives = ["lazy","grouchy","scheming"]  
ghci> [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]  
["lazy hobo","lazy frog","lazy pope","grouchy hobo","grouchy frog", "grouchy pope","scheming hobo","scheming frog","scheming pope"]   

-}

removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]   
 
{-
ghci> removeNonUppercase "Hahaha! Ahahaha!"  
"HA"  
ghci> removeNonUppercase "IdontLIKEFROGS"  
"ILIKEFROGS" 
-}

length' xs = sum [1 | _ <- xs]   

{-
*Main> length' [1,2]
2

_ -> underscore, özel bir kavram. Bizim için anlamsız/önemsiz ve daha sonra kullanılmayacaklar için.
-}

{-
--------------------------------------------------------------
TUPLES

Listelerin homojen olduğundan ve farklı tipleri bir arada tutamadığından bahsetmiştim. İşte tuples böyle değil :)

pair : 2 elemandan oluşan tuples
triple : 3 elemandan oluşan tuples

Tuples can also be used to represent a wide variety of data. 
For instance, if we wanted to represent someone's name and age in Haskell, we could use a triple: 
("Christopher", "Walken", 55). As seen in this example, tuples can also contain lists.



--------------------------------------------------------------

fst takes a pair and returns its first component.

ghci> fst (8,11)  
8  
ghci> fst ("Wow", False)  
"Wow"



--------------------------------------------------------------

snd takes a pair and returns its second component. Surprise!

ghci> snd (8,11)  
11  
ghci> snd ("Wow", False)  
False

Note: these functions operate only on pairs. 
They won't work on triples, 4-tuples, 5-tuples, etc. We'll go over extracting data from tuples in different ways a bit later.




--------------------------------------------------------------
A cool function that produces a list of pairs: zip. It takes two lists and then zips them together into one list by joining the matching elements into pairs. 
It's a really simple function but it has loads of uses. It's especially useful for when you want to combine two lists in a way or traverse two lists simultaneously. 
Here's a demonstration.

ghci> zip [1,2,3,4,5] [5,5,5,5,5]  
[(1,5),(2,5),(3,5),(4,5),(5,5)]  
ghci> zip [1 .. 5] ["one", "two", "three", "four", "five"]  
[(1,"one"),(2,"two"),(3,"three"),(4,"four"),(5,"five")]  

** zip alıyor yeni bir liste oluşturuyor ama ne listesi oluşturuyor? Yeni bir pair listesi oluşturuyor.

-}
--------------------------------------------------------------
{-
Here's a problem that combines tuples and list comprehensions: which right triangle that has integers for all sides and all sides equal to or smaller than 10 has a perimeter (çevresi) of 24?
First, let's try generating all triangles with sides equal to or smaller than 10:

c hipotenüs olsun

a^2 + b^2 = c^2

a + b + c = 24

a, b, c < 10

ghci> let triangles = [ (a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10] ]   
// Bu hiç bir kısıtlama olmadan  tüm ihtimalleri bana getirir. Çoğu ihtimal dik üçgen bile oluşturmuyor. Şimdi bunları filtreleyelim.
*Main> triangles
[(1,1,1),(2,1,1),(3,1,1),(4,1,1),(5,1,1),(6,1,1),(7,1,1),(8,1,1),(9,1,1),(10,1,1),(1,2,1),(2,2,1),(3,2,1),(4,2,1),(5,2,1),(6,2,1),(7,2,1),(8,2,1),(9,2,1),(10,2,1),(1,3,1),(2,3,1),(3,3,1),(4,3,1),(5,3,1),(6,3,1),(7,3,1),(8,3,1),(9,3,1),(10,3,1),(1,4,1),(2,4,1),(3,4,1),(4,4,1),(5,4,1),(6,4,1),(7,4,1),(8,4,1),(9,4,1),(10,4,1),(1,5,1),(2,5,1),(3,5,1),(4,5,1),(5,5,1),(6,5,1),(7,5,1),(8,5,1),(9,5,1),(10,5,1),(1,6,1),(2,6,1),(3,6,1),(4,6,1),(5,6,1),(6,6,1),(7,6,1),(8,6,1),(9,6,1),(10,6,1),(1,7,1),(2,7,1),(3,7,1),(4,7,1),(5,7,1),(6,7,1),(7,7,1),(8,7,1),(9,7,1),(10,7,1),(1,8,1),(2,8,1),(3,8,1),(4,8,1),(5,8,1),(6,8,1),(7,8,1),(8,8,1),(9,8,1),(10,8,1),(1,9,1),(2,9,1),(3,9,1),(4,9,1),(5,9,1),(6,9,1),(7,9,1),(8,9,1),(9,9,1),(10,9,1),(1,10,1),(2,10,1),(3,10,1),(4,10,1),(5,10,1),(6,10,1),(7,10,1),(8,10,1),(9,10,1),(10,10,1),(1,1,2),(2,1,2),(3,1,2),(4,1,2),(5,1,2),(6,1,2),.......

Nasıl kısıtlamalar yapabilirim? a ve b kanarları c den büyük olamaz gibi... Ve dik olan kenarlarda biri diğerinden daha küçük ya da eşit olmalı o sebepten a nın üst sınırı b yaptım.

ghci> let triangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b] ]   
// olasılıklar daha da azaldı ama daha da eleme yapmalıyız, dik olma şartını koymam gerekli.

ghci> let triangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2+b^2 == c^2]   
*Main> triangles
[(3,4,5),(6,8,10)]

Çevre şartı?
ghci> let triangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2+b^2 == c^2, a+b+c==24]   
*Main> triangles
[(6,8,10)]

-}

-- Chapter 1 ve 2 bitti, 3 atlanılacak. Daha sonra dönmek üzere.
