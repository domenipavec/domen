+++
date = "2012-01-31T23:56:35+01:00"
title = "Tiskanje predmeta v naravni velikosti z GIMP-om"
draft = false
categories = ["GIMP"]

+++

1. Sledite vodiču [Odstranjevanje ozadja predmeta z GIMP-om]({{< ref "odstranjevanje-ozadja-predmeta-z-gimp-om.sl.md" >}})

2. V meniji izberite *File → New …*
{{< image "/images/gimp/object-real-size-print/image-01.png" >}}

3. Pod *Template* izberite *A4 (300ppi)* in ustvarite novo sliko.
{{< image "/images/gimp/object-real-size-print/image-02.png" >}}

4. Med orodji izberite *Rectangle Select Tool*.
{{< image "/images/gimp/object-real-size-print/image-03.png" >}}

5. Na sliki narišite izbiro poljubne velikosti.
{{< image "/images/gimp/object-real-size-print/image-04.png" >}}

6. V podrobnostih trenutnega orodja nastavite pozicijo izbire na 10mm od levega in zgornjega roba. Velikost izbire nastavite 2mm večjo od željene velikosti okvirja.
{{< image "/images/gimp/object-real-size-print/image-05.png" >}}

7. Držite tipko CTRL, in v obstoječo izbiro narišite še eno. Ker ste pritisnili tipko CTRL, bo nova izbira zmanjšala staro.
{{< image "/images/gimp/object-real-size-print/image-06.png" >}}

8. V podrobnostih orodja nastavite pozicijo na 11mm od levega in zgornjega roba. Velikost izbire pa enako željeni velikosti okvirja. Kliknite na sliko, da potrdite izbiro. Nato izberite orodje *Bucket Fill Tool*.
{{< image "/images/gimp/object-real-size-print/image-07.png" >}}

9. Kliknite v izbiro, da rob okvirja pobarvate na črno.
{{< image "/images/gimp/object-real-size-print/image-08.png" >}}

10. Izberite *DESNI KLIK → Select → None*, da odstranite izbiro.
{{< image "/images/gimp/object-real-size-print/image-09.png" >}}

11. Odprite datoteko s predmetom. Kliknite na plast s predmetom in pritisnite CTRL + C, da kopirate predmet.
{{< image "/images/gimp/object-real-size-print/image-10.png" >}}

12. Pojdite nazaj v datoteko z okvirjom in pritisnite CTRL + V, da prilepite predmet. Desno kliknite na plast *Floating Selection (Pasted Layer)* in izberite *New Layer …*, da prilepljen predmet postavite v novo plast.
{{< image "/images/gimp/object-real-size-print/image-11.png" >}}

13. Med orodji izberite **Scale Tool**.
{{< image "/images/gimp/object-real-size-print/image-12.png" >}}

14. Kliknite na predmet in ga pomanjšajte. Med pomanjševanjem držite tipko CTRL, da bo predmet ohranil razmerje stranic. Pritisnite tipko ENTER, da potrdite pomanjšanje.
{{< image "/images/gimp/object-real-size-print/image-13.png" >}}

15. Med orodji izberite Measure Tool.
{{< image "/images/gimp/object-real-size-print/image-14.png" >}}

16. Ko z orodjem potegnete črto na predmetu, se vam v statusni vrstici izpisuje dolžina črte.
{{< image "/images/gimp/object-real-size-print/image-15.png" >}}

17. Z ponavljanjem korakov od 13 do 16 zagotovite, da je slika predmeta enake velikosti kot sam predmet.

18. Med orodji izberite **Move Tool** in predmet premaknite na sredino okvirja.
{{< image "/images/gimp/object-real-size-print/image-16.png" >}}

19. V menijih izberite *File → Print …*
{{< image "/images/gimp/object-real-size-print/image-17.png" >}}

20. V dialogu Tiskanje, v zavihku Image Settings obkljukajte Ignore Page Margins.
{{< image "/images/gimp/object-real-size-print/image-18.png" >}}

21. Nastavite Resolution na 300. S temi nastavitvami zagotovite, da bo slika natisnjena v pravi velikosti.
{{< image "/images/gimp/object-real-size-print/image-19.png" >}}

22. Natisnite sliko.


