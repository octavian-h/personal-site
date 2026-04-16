---
date: 2009-11-25T00:03:00Z
tags:
  - eroare explorer
  - windows 7
  - bitdefender 2010
title: Click dreapta pe desktop in Windows 7
url: /2009/11/25/click-dreapta-pe-desktop-in-windows-7/
---

De câteva zile windows explore se tot blochează când apăs click dreapta. Apare o eroare de genul “Windows Explorer has stopped working.” cu
opțiunile: trimite eroarea ”Windows is searching for a solution” și restartează explorer-ul. In Event viewer apar următoarele detalii:

> The program Explorer.EXE version 6.1.7600.16404 stopped interacting with Windows and was closed. To see if more information
> about the problem is available, check the problem history in the Action Center control panel.
>
> Application Path:
> C:\Windows\Explorer.exe

Soluții:

1. Dacă ai BitDefender 2010, s-ar putea să-ți vină de aici eroarea. In Event viewer apar următoarele detalii:
   > Code Integrity determined that the page hashes of an image file are not valid. The file could be improperly signed
   > without page hashes or corrupt due to unauthorized modification. The invalid hashes could indicate a potential disk device
   > error.
   >
   > File Name: BitDefender\BitDefender 2010\Active Virus Control\midas32-v2\_56\midas32.dll

   Pentru a nu restarta calculatorul se poate face în felul următor:
    - oprește pentru 5 minute protecția în timp real a antivirusului;
    - după aceea restartează explorer-ul și reactivează protecția.Ar trebui acum să se poată da click dreapta fără să se mai blocheze
      windows explorer.
2. Dacă nu ai BitDefender 2010 vezi următoarele site-uri:
    - [Right Click on desktop causing Explorer.exe crash](http://www.sevenforums.com/crashes-debugging/34826-right-click-desktop-causing-explorer-exe-crash.html)
    - [How to fix “Windows Explorer has stopped working” in Windows 7](http://www.webtlk.com/2009/02/18/how-to-fix-windows-explorer-has-stopped-working-in-windows-7)
    - [Un forum pe technet (foarte mare)](http://social.technet.microsoft.com/forums/en-US/itprovistasetup/thread/3b9bf8c9-7a04-4b8a-9952-0e8ff9662998/)
    - [Un post pe BlogDNA](http://www.blogsdna.com/2137/fix-windows-installer-explorer-update-has-stopped-working-in-windows-7.htm)
