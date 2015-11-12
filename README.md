dotfiles-maniac zackn9ne's dotfiles
===============
<pre>
            Ü                                           Ü           Ü
              Ü    þ   Ü                                  Ü   Ü    Û
               ÛÛÜÜ ÜÜÛ                                    ÛÛÛÜÜ ÜÛÝþ
            Ü ßÜÛÛÛÛÛÛÜÜ Üß ÜßßßÜ                       þÜÜÜÛÛÛÛÛÛÛÛÜ
           ÜÜÜÜÜÜÜÜÜßßÛ   ÜÛ ÜÛÜ Û                         ßÛÛÛÛÛÛÛÛßß ß
       ÜÜÛÛÛÛÛÛÛÛÛÛÛÛÛÜÜÜÛÛÝ ßÛÛÛß                         ß  ÛÛÛßÜ
     ÜÛÛÛÛÛÛÛß  ÜÜ  ßßÛÛÛÛÛÛ                                 ÞÝ ßÜ ß
    ÜÛÛÛÛÛÛÛ   ÞÛÛß     ßÛÛÛ ßÜ                  Ü           þ
    ÛÛÛÛÛÛÛÛÜ  Üß     Üß  ßÛÛ                     ÛÛÜÜ
    ÛÛÛÛÛÛÛÛÛÛÜ       ßÜ  ÜÛÛÜ                   ÞÛÛÛÛÛ


    zackn9nes dotfiles for vim & tmux nuff sed

    how this is organised
    - there are regular directories named after program
    - inside those are the dotfiles and dotfolders related to program
    - cd into dotfiles-maniac and stow #{program name}
    - #{program name}'s dotfiles and or folders get(s) stowed into their proper places: $HOME

    brew install stow
    - make subdirectories
    - clear dotfiles from ~/
    - cd into dotfiles-maniac && stow vim

    learn about stow, its awesome (i could never get my dotfiles ot symlink)
    - http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html 
    - https://www.gnu.org/software/stow/


    ÛÛÛÛÛÛÛÛÛÛÛÛÛÜÜ     ßßßß          ÜÜÜÜÜÜÜ    Ûß ßÛÛÝ     ÜÜÜÜÜÜÜ
     ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÜÜÜ         ÜÛÛÛÛßßßÛÛÛÛÛÜ   ÜÛÛ   ÜÜÛÛÛßßßßÛÛÛÛÜÜ
      ßÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÜ ßÜÜ ÜÛÛÛÛÛ     ÛÛÛÛÛÛÜÛÛß ÜÛÛÛÛÛ      ÛÛÛÛÛÛÜ
     Üß ßßÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÜ ßÛÛÛÛÛÛÜ     ÛÛÛÛÛÛÛß  ÛÛÛÛÛÛ   ÜÛÛÛÜÛÛÛÛÛÛ
    Üß Ü    ßßßÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÜ ßÛÛÛß   ÜÜÜÛÛÛÛÛÛÛÛ  ÛÛÛÛÛÛÛ  ÛÛßÛÛÛÛÛÛÛÛß
 Ü  ÛÜ Ü         ßßÛÛÛÛÛÛÛÛÛÛÛÛ Ü   ÜÜÛÛÛßß ÛÛÛÛÛÛÛ  ÛÛÛÛÛÛÛ  Û   ßßßßßß     Üþ
  Û ÛÛÜßÛ   Ü    ÜÜ  ÛÛÛÛÛÛÛÛÛÛ ßÜÛÛÛÛÛß  Ü ÛÛÛÛÛÛÛ  ÛÛÛÛÛÛÛ Ü ß     ÜÛÛÜ Ü Û Ü
  Û ÛÛÛÜßÛÜÛÜ Ü ÛÛÛßÜ ÛÛÛÛÛÛÛÛß ÛÛÛÛÛÛ  þÛß ÞÛÛÛÛÛÛ ÜÛÛÛÛÛÛÛÛ ÛÜßþÜÝÛßÜ ÞÛ ÛÛÛ
ÜÞÛÝÞÛÛÛÜßÛÛÛÛ ÛÛ Ü  ÜÛÛÛÛÛÛÛß ÛÛÛÛÛÛÛ ÛßÜÛÝÞÛÛÛÛÛÛÝ ÛÛÛÛÛÛÛÛÜßßÛÛÛÜß ÜÛß Ü ÛÛÝ
 ÛÛÝÞÛÛÛÛÛÜÜßßÜÜßß ßÜÛÛÛÛÛÛÛßÜ ÛÛÛÛÛÛÛÜ ß ÛÛ ÛÛÛÛÛÛÛ Ü ÛÛÛÛÛÛÛÛÛÜÜÜÜÜÛÛÛßÜÛßÜÛ
 ÞÛÛ ÛÛÛßßÛÛÛÛÜÜÜÜÛÛÛÛÛÛÛßßÜÛÛÜßÛÛÛÛÛÛÛÛÛÛÛß ßÛÛÛÛÛÛÛßÜÜßßÛÛÛÛÛÛÛÛÛÛÛßß ÛßÜÛÛÝ
 ÜÛßÜßßÜÛÛÜÜßßßßßßßßßßÜÜÜÛÛÛÛÛÛÛÜÜßßßßßßßÜÜÛÛÛÜßßßßÜÜÛÛÛÛÛÜÜßßßßßßßÜÜÛÜßÜÛÛÛÛÛ
  ÞÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛßßÛÛÛÛÛÛÛÛÛÛÛÛßÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
  ÛÛßßßßÜ ßÛÛÛßßßÛÛÛÜ Ü ßÜ   ßßßÜþ   ÛÛÛßß    ÛßßÜ ßßßÛÛÛßß  ßßÛÛß  ßßÛÛß ÜßßÛÝ
 ßþ ßßÜ     ÛÝ  ß    ß              ß        ßþ        ßßÛ       ß     ß      ß
            þß    ß                                       ß        .Hetero/Sac.
                           - SUPERIOR ART CREATIONS -
                                 - SINCE 1994 -
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
 °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
 ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
 Ü                                                                            Ü
 ± SAC                                     Ü                                  ±
 °                                      ÞÛÛ                                   °
 °                                    ßÜÛÛÝ                                   °
 ±                          ßÜÜ        ÞÛÛ          Ü                     SAC ±
 ß               ÜÛÛÛÜÜ    ÞÛÛÝßßÜÜÜ   ÛÛÝß  ÜÜÜßßÛÛÝÛÛÜÜ                     ß
 ßßßßßßßßßßßßßßß  ÛÛÛ  ßßÜÜ ÛÛÛ    ÛÛÛÞÛÛ   ÛÛÝ   ÞÛÛÝÛÝ ßß ßßßßßßßßßßßßßßßßßßß
 °°°°°°°°°°°°°°°° ÞÛÛÝ ° ßÛÛÛÛÛÝ° ÞÛÛÝÛÛÝ ÜÞÛÛ ßßÜÜÛÛßßßßßßÛÛÛÝ°°°°°°°°°°°°°°°°
 ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ ÛÛÛ Ü ÞÛÛÝÛÛÛ  ÛÛÛÛÛÛÛßßÛÛÝ  ÜÜ  ÞÛÛÝ  ÞÛÛÛ ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
 Ü                  ßßß  ßßß  ßßßßßß ßß     ßßßß     ßßßßßßßß                 Ü
 Û                              ú RELEASE NOTES ú                             Û
 Û                                                                            Û
 Û             * This Release is dedicated to Princess Diana who *            Û
 Û            * died tragically on a Traffic-Accident last Month. *           Û
 Û                                                                            Û
 Û                                                                            Û
 Û  Hi everybody,                                                             Û
 Û  welcome to Zackn9nes DOTFILES!                                            Û
 Û                                                                            Û
 Û  As you see we have a new NFO-Design in this Package, we hope you like     Û
 Û  like it :) The .NFO itself is now subdivided in the following Parts:      Û
 Û                                                                            Û
 Û  What's else to say? ... TMUX VIM and a Terminal.app Theme, Ubuntu font    Û
 Û  reccomended, but nevertheless (hehe) enjoy.                               Û
 Û                                                                            Û
 Û                                                                            Û
 Û                                                     ... the zackn9ne Team  Û
 Û                                                     ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ  Û
 Û                                                                            Û
 ß                                                                            ß
 ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
 °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
</pre>


*fin*
