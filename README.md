# SDN Simulator #
Achtung, das ist nur die Simulation ohne Omnetpp Binaries etc.

## Instandsetzung ##
	1)	OMNeT++ starten
	2)	Bei der Auswahl beide Haken entfernen
	3)	Rechtsklick in die leere Projekt Liste
	4)	Import...
	5)	"General" -> "Projects from Folder or Archive"
	6)	Folgendes Verzeichnis auswählen /opt/omnetpp-5.1.1/Samples/
	7)	"Deselect all" auswählen
	8)	Nur "samples/inet" und "samples/ofomnet/openflow" auswählen
	9)	"Finish" drücken
	10)	In der IDE External Interfaces aktivieren:
		Rechtsklick auf das inet Projekt -> Properties -> OMNeT++ -> Project Features -> Select "Network Emulation Support"
