# Optimus Linux (PRoot / Termux)
Autor: Radoslav Čornanič

Optimus je vlastná distribúcia pre Android (cez Termux) bežiaca v PRoot. Je samoliečiaca, modulárna a bezpečná. Obsahuje automatické spúšťanie tvojich skriptov (Koranos Pack 1/2/3), watchdog každých 10 minút, profily (web/ml/devops/db/cli), snapshot/restore/reset a vlastné príkazy.

Obsah:
- Debian Trixie v PRoot s brandingom „Optimus“
- Autorun Koranos Pack 1/2/3
- Príkazy: optimus, koranos, optimus-health, optimus-repair, optimus-watchdog, optimus-snapshot, optimus-restore, optimus-reset, optimus-enable, optimus-disable
- Profily: web, ml, devops, db, cli
- Watchdog: pravidelná kontrola a oprava
- Bez rootu, jeden klik

Ako nainštalovať:
1) Nainštaluj Termux (F-Droid).
2) Prenes sem súbory z balíka (optimus-install.sh, optimus-rootfs.tar.gz, príkazy).
3) Spusti:
   bash optimus-install.sh

Použitie po inštalácii:
- optimus        # vstup do Optimus (tmux session)
- koranos        # spustí tvoje Koranos packy
- optimus-enable web|ml|devops|db|cli
- optimus-watchdog start|stop|status

Licencia:
Autorské dielo Radoslava Čornaniča. Komerčné šírenie len so súhlasom autora.
