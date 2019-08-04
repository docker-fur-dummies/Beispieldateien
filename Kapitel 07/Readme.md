# Beispieldateien für Kapitel 7

Die Datei `ReadTags.ps1` enthält das Skript um in Powershell die Tags für ein Image aus dem Dockerhub abzurufen. Aufruf entweder mit `.\ReadTags.ps1` oder mit einem Image Namen: `.\ReadTags.ps1 -PackageName nginx`. 

Wenn der Aufruf fehlschlägt, weil die Powershell im Restricted Mode gestartet wurde, dann muss einmal in einer Powershell mit Admin-Rechten der Befehl `Set-ExecutionPolicy Unrestricted` ausgeführt werden. **Achtung, das kann zu Sicherheitslücken führen, um sicher zu gehen, sollten Sie die ps1-Datei in der Powershell ISE öffnen und Zeile für Zeile ausführen!** Mehr Informationen dazu [bei Open Tech Guides](https://www.opentechguides.com/how-to/article/powershell/105/powershel-security-error.html)

