---
date: 2009-10-28T21:30:00Z
tags:
  - lost drive d
  - windows vista
  - partition magic 8
  - partitie pierduta
  - windows 7
title: Partition Magic 8 pe Windows Vista / 7
url: /2009/10/28/partition-magic-8-pe-windows-vista-7/
---

De mult am vrut să scriu despre aceasta eroare care este menționată pe internet, dar nu are încă o soluție completă. Toată problema apare
de la acest program “Partition Magic 8” care se oferă să-ți corecteze niște erori din tabela de partiții (bine ar fii să nu-l lași).
După corectare vei observa că partiția D a dispărut.

Soluții:

1. folosiți programul [Testdisk](http://www.cgsecurity.org/wiki/TestDisk):
    1. alege să-ți creeze un nou fișier log (Create);
    2. alege disk-ul pe care se află partiția D după aceea Proceed;
    3. alege tipul tabelei de partiție (de obicei Intel);
    4. după aceea alegeți Analyse și apoi Quick Search;
    5. va întreba dacă să caute partiții de Vista, dați Y;
    6. ștergeți partiția D (nu o șterge de tot, ci numai din tabela de partiții);
    7. încercați sa asignați o literă la partiția ștearsă cu Disk Management;
    8. dacă nu reușiți folosiți varianta 2.
2. folosiți programul [Acronis Disk Director](http://www.acronis.com/products/diskdirector/):
    1. s-ar putea sa primiți o eroare la instalare, Acronis nu suportă hdd extern (partiții dinamice), dar nu contează;
    2. urmează pașii de recuperare (care pot însemna să copiezi datele pe altă partiție și apoi să formatezi partiția defectă sau
       să ștergi partiția și apoi să-i asignezi o litera).

Primele 2 variante le puteți găsi și [aici](http://www.technologyquestions.com/technology/windows-vista/290019-lost-drive-letter-d-my-recovery-partition.html). Daca totuși nu reușiți, încercați varianta 3 (cea pe care am folosit-o).

- am folosit din nou [Acronis Disk Director](http://www.acronis.com/products/diskdirector/) (puteți folosi și alt program care să poate face Split și Merge pe partiție):
    1. dai Split la partiția defecta în 2 bucăți: una de câțiva MB și cealaltă restul;
    2. cu bucata (de obicei cea mică) care nu are erori dai Merge cu cealaltă bucată;
    3. partiția care a rezultat nu are erori (așa ar trebui), deci poți să-i asignezi o literă și problema îi rezolvată.

Sfat: nu folosiți Partition Magic 8 (în special) sau alt program de partiționare de care nu sunteți siguri pe Windows Vista / 7.
