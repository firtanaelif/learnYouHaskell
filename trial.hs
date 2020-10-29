-- 13 ekim 2020

-- Open your terminal and type in ghci. You will be greeted with something like this.

-- GHCi, version 6.8.2: http://www.haskell.org/ghc/  :? for help... Loading package base ... linking ... done.  
-- Prelude>  // Congratulations, you're in GHCI! 


-- haskell uzantılı vscode dan proje oluştur terminalden dizine git ghci komutu ile çalıştır 
-- :l <dosyaAdı> diyerek load et, devamında çalışacaktır.
-- Yani demek istediğim burda yorum satırında olmayan functionlara ben terminalimden ulaşabilirim.
-- Yanii yeniden söylemek gerekirse //Prelude> kısmına ver yetkiyi. Sonra da function isimlerini kullanarak çalış.

-- Unutma bunu!! Her değişiklik için yeniden load etmek isteyebilirsin :S



doubleMe x = x + x  
doubleUs x y = doubleMe x + doubleMe y   

doubleSmallNumber x = if x > 100  
                        then x  
                        else x*2   




-- An intro to lists

-- örnek: [1,2,3,4,16] ++ [9,10,11,12] --> [1,2,3,4,16,9,10,11,12] listeleri birleştirdi. 
-- Tek tipleri birlikte kullanabiliriz. integer ve string ya da char aynı anda kullanılamaz.
-- let c = [1,2,3,4] dedikten sonra "c" dersem listeye erişirim




-- Bizim için en önemli operatör cons? operatörü ":",

-- listenin önüne eklnmesini sağlıyor [1,2,3]:[4,5,6] diyemeyiz, sadece sağ taraf liste olabilir. iki listeyi birleştirmeyi sağlamaz, sadece bir listeyi bir elemanı birleştirmei sağlar, liste her zaman sağda eleman her zaman solda olmalıdır.
-- ghci> 'A':" SMALL CAT"  
-- "A SMALL CAT"  
-- ghci> 5:[1,2,3,4,5]  
-- [5,1,2,3,4,5]  

-- Notice how : takes a number and a list of numbers or a character and a list of characters, whereas ++ takes two lists. Even if you're adding an element to the end of a list with ++, you have to surround it with square brackets so it becomes a list.

-- [1,2,3] is actually just syntactic sugar for 1:2:3:[]. [] is an empty list. If we prepend 3 to it, it becomes [3]. If we prepend 2 to that, it becomes [2,3], and so on.




-- index operatörü

-- If you want to get an element out of a list by index, use !!. The indices start at 0.
-- ghci> "Steve Buscemi" !! 6  
-- 'B'  
-- ghci> [9.4,33.2,96.2,11.2,23.25] !! 1  
-- 33.2 



-- ghci> let b = [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]  
-- ghci> b  
-- [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]  
-- ghci> b !! 2  
-- [1,2,2,3,4]
-- ghci> b !! 2  !! 2
-- 2
-- ghci> b ++ [[1,1,1,1]]  
-- [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3],[1,1,1,1]]  
-- ghci> [6,6,6]:b  
-- [[6,6,6],[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]  






-- Aşırı saçma bir şey daha
-- ghci> "ali" < "veli" dersen true, ali" > "veli dersende false döner. Sebebi neydi ki? Sebebi index sayısı değil!! İlk index e bakıyoruz a > v midir? nope. Al işte veli büyük yani.
-- ghci> [1,2,3,4] > [2,3] de false döncektir çünkü 1 < 2
-- "Alim" < "Ali" True




-- Lists can be compared if the stuff they contain can be compared. When using <, <=, > and >= to compare lists, they are compared in lexicographical order. First the heads are compared. If they are equal then the second elements are compared, etc.

-- ghci> [3,2,1] > [2,1,0]  
-- True  
-- ghci> [3,2,1] > [2,10,100]  
-- True  
-- ghci> [3,4,2] > [3,4]  
-- True  
-- ghci> [3,4,2] > [2,4]  
-- True  
-- ghci> [3,4,2] == [3,4,2]  
-- True  
-- What else can you do with lists? Here are some basic functions that operate on lists.

-- head takes a list and returns its head. The head of a list is basically its first element.

-- ghci> head [5,4,3,2,1]  
-- 5   
-- tail takes a list and returns its tail. In other words, it chops off a list's head.

-- ghci> tail [5,4,3,2,1]  
-- [4,3,2,1]   
-- last takes a list and returns its last element.

-- ghci> last [5,4,3,2,1]  
-- 1   
-- init takes a list and returns everything except its last element.

-- ghci> init [5,4,3,2,1]  
-- [5,4,3,2]   


-- Bunu görselleyelimde unutmayalım, resim dosyasını (list mosnter) ziyaret et :*

-- "take" takes number and a list. It extracts that many elements from the beginning of the list. Watch. // diyor ki baştan o kadar al bana ver.

-- ghci> take 3 [5,4,3,2,1]  
-- [5,4,3]  
-- ghci> take 1 [3,9,3]  
-- [3]  
-- ghci> take 5 [1,2]  
-- [1,2]  
-- ghci> take 0 [6,6,6]  
-- []  

-- drop da o kadar indexi düşürü kalanını verir.

-- `elem` içinde var mı diye sorar?




------------- bir sonraki konumuz --> Texas ranges