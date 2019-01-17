#!/bin/bash

current=$(dconf read /org/gnome/desktop/interface/gtk-theme)

if [ "$current" == "'Adwaita-dark'" ]; then
	dconf write /org/gnome/desktop/interface/gtk-theme "'HighContrast'"
else
	dconf write /org/gnome/desktop/interface/gtk-theme "'Adwaita-dark'"
fi
	
