+++
date = "2012-01-31T22:05:35+01:00"
title = "Odstranjevanje ozadja predmeta z GIMP-om"
draft = false
categories = ["GIMP"]

+++

1. Izberite primerno sliko predmeta.\\
   Pogoji za dobro sliko:

   - Predmet čez čim večji del slike za čim večjo resolucijo.\\
     Neprimerna slika:
     {{< image "/images/gimp/objects-background-removal/too-small.jpg" >}}

   - Ostra slika

   - Rob predmeta v konstrastu z ozadjem (druga barva ozadja kot je predmet)\\
     Neprimerna slika (ni ostra, barva ozadja je zelo podobna barvi predmeta):
     {{< image "/images/gimp/objects-background-removal/bad.jpg" >}}
     Primerna slika (ostra, barva ozadja je kontrastna barvi predmeta, še boljše bi bilo barvno ozadje):
     {{< image "/images/gimp/objects-background-removal/good.jpg" >}}

   - Predmet osvetljen z dveh strani, za čim manj senc na fotografiji.

2. Odprite sliko z GIMP-om

3. <a name="step-3">Ker slike JPEG ne podpirajo prosojnosti, moramo plasti dodati prosojnost. V menijih izberite *Layer → Transparency → Add Alpha Channel*.</a>
{{< image "/images/gimp/objects-background-removal/add-transparency.png" >}}

4. Med osnovnimi orodji izberite **Scissors Select Tool**.
{{< image "/images/gimp/objects-background-removal/tool-select.png" >}}

5. Izberite predmet s klikanjem na rob slike. Program bo sam poskušal slediti robu slike.
{{< image "/images/gimp/objects-background-removal/select-01.png" >}}
{{< image "/images/gimp/objects-background-removal/select-02.png" >}}

6. Če črta ne sledi robu predmeta, dodajte nove točke, tako da kliknete na črto in jo z vlečenjem miške premaknete. Za lažje določanje točk lahko sliko povečujete s tipkama + in – na numerični tipkovnici.
{{< image "/images/gimp/objects-background-removal/select-03.png" >}}

7. Dodajte toliko točk, da se bo črta natančno ujemala z robom predmeta.
{{< image "/images/gimp/objects-background-removal/select-04.png" >}}

8. Ponavljajte korake od 5 do 7, dokler črta ne obkroža celotnega predmeta.
{{< image "/images/gimp/objects-background-removal/select-05.png" >}}
{{< image "/images/gimp/objects-background-removal/select-06.png" >}}
{{< image "/images/gimp/objects-background-removal/select-07.png" >}}
{{< image "/images/gimp/objects-background-removal/select-08.png" >}}
{{< image "/images/gimp/objects-background-removal/select-09.png" >}}
{{< image "/images/gimp/objects-background-removal/select-10.png" >}}

9. Če pri premikanju črte ne kliknete dovolj na črto, bo program dodal novo točko, ki bo nadaljevanje črte. Postavite točko na naslednji del roba predmeta, ker dodajanja točke ne morete preklicati.
{{< image "/images/gimp/objects-background-removal/select-11.png" >}}

10. Zaključite črto s klikom na prvo točko. Tudi ko je črta sklenjena, lahko še vedno dodajate dodatne točke.
{{< image "/images/gimp/objects-background-removal/select-12.png" >}}

11. Ko ste zadovoljni z izborom, kliknite na sredino predmeta, da končate z izbiranjem.
{{< image "/images/gimp/objects-background-removal/select-13.png" >}}

12. <a name="step-12">Izberite *DESNI KLIK → Select → Invert*, da izberete vse razen predmeta.</a>
{{< image "/images/gimp/objects-background-removal/select-14.png" >}}

13. Pritisnite tipko DELETE, da izbrišete ozadje predmeta. Kvadratkasto ozadje označuje prosojnost. Če se izbrisano ozadje pokaže ene same barve (npr. Belo), ste pozabili dodati prosojnost ([korak 3]({{< relref "odstranjevanje-ozadja-predmeta-z-gimp-om.sl.md#step-3" >}})).
{{< image "/images/gimp/objects-background-removal/select-15.png" >}}

14. Zabrisali bomo rob predmeta, da ne bo tako oster. Ponovite [korak 12]({{< relref "odstranjevanje-ozadja-predmeta-z-gimp-om.sl.md#step-12" >}}), da zopet izberete predmet.

15. Izberite *DESNI KLIK → Select → Border ...* , da odprete okno za izbiranje roba trenutnega izbora.
{{< image "/images/gimp/objects-background-removal/select-16.png" >}}

16. Privzeta debelina roba 5px je primerna za večino fotografij. Če imate fotografijo majhne resolucije, izberite manjšo debelino roba.
{{< image "/images/gimp/objects-background-removal/select-17.png" >}}
Izbran rob slike:
{{< image "/images/gimp/objects-background-removal/select-18.png" >}}

17. V menijih izberite *Filters → Blur → Gaussian Blur …*
{{< image "/images/gimp/objects-background-removal/blur-01.png" >}}

18. Kliknite OK, da zabrišete rob slike. Privzeta nastavitev *Blur Radius* je primerna za večino fotografij. Za fotografije manjše resolucije izberite manjšo vrednost.
{{< image "/images/gimp/objects-background-removal/blur-02.png" >}}
Rezultat zabrisanja robov predmeta:
{{< image "/images/gimp/objects-background-removal/blur-03.png" >}}
{{< image "/images/gimp/objects-background-removal/blur-04.png" >}}
{{< image "/images/gimp/objects-background-removal/blur-05.png" >}}

19. Izbora ne potrebujemo več, zato ga odstranimo. Izberite *DESNI KLIK → Select → None*.
{{< image "/images/gimp/objects-background-removal/deselect.png" >}}

20. Za obrezovanje slike izberite **Crop Tool**.
{{< image "/images/gimp/objects-background-removal/crop-01.png" >}}

21. Izberite predmet tako kot želite obrezati sliko.
{{< image "/images/gimp/objects-background-removal/crop-02.png" >}}

22. Končana slika – obrezan predmet brez ozadja.
{{< image "/images/gimp/objects-background-removal/crop-03.png" >}}
