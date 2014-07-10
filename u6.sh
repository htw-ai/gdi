#!/bin/bash

<<INFO
 autor: Frederik Dudzik
 Matrikelnummer:
 Zug: 
 Gruppe: 
 Erstellungsdatum: 27.6.2014
INFO

LASTCMD='No Previous CMD'
printLASTCMD=false

main () {
	echo "$@"
	echo `basename $0`
	echo "frederik Dudzik"

	if [ "$2" == "d" ]; then
		printLASTCMD=true
	fi

	if [ "$1" == "d" ]; then
		SYSTEMINFORMATIONEN 
		funktionsauswahl
	else
		echo "Standartinformationen wurden nicht in der aufgabenstellung spzifiziert"
	fi
}


auswahlmoeglichkeiten () {
	echo "Sie haben folgende Möglichkeiten, bitte wählen Sie durch Eingabe einer Ziffer:"
	echo "1.Systeminformation anzeigen"
	echo "2.Fakultät einer Zahl berechnen"
	echo "3.Skript beenden"
}

funktionsauswahl () {

	echo "### Funktionswauswahl ###"
	auswahlmoeglichkeiten
	read INPUT
	
	case $INPUT in 
		1) 
			SYSTEMINFORMATIONEN
			LASTCMD='SYSTEMINFORMATIONEN'
		;; 
		2) 
			FAKULTAET
			LASTCMD='FAKULTAET'
		;; 
		3) 
			exit 0
		;; 
		*)
			echo "Falsche Eingabe"
			auswahlmoeglichkeiten
		;;
		esac

	funktionsauswahl

}

SYSTEMINFORMATIONEN () {
	echo "### Funktion SYSTEMINFO ###"
	echo "OS: $OSTYPE"
	echo "Kernel: uname -s"
	echo "User: $USER"

	if $printLASTCMD; then
		echo "$LASTCMD"
	fi
}

FAKULTAET () {
 	echo "### Funktion FAKULTÄT ###"
       	echo "Diese Funktion lässt die Fakultät einer Zahl berechnen. Bitte geben Sie eine" 
	echo "Zahl zwischen 1 und 20 ein."
	read NUM
	if [ $((NUM)) -gt 0 -a $((NUM)) -lt 21 ]; then
		fak=1
		for ((i=1; i<=$((NUM)); i++)); 
			do fak=$((fak * i))
		done
		echo "$fak"
		echo "fakultaet neu berechnen[Y/N](default: N)"
		read NEUBERECHNEN
		if [ "$NEUBERECHNEN" == "Y" ]; then
			FAKULTAET
		fi
	else
		echo "Falsche eingabe: $NUM"
	fi	
}

main "$@"
