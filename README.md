# Readme

## Update icons
You need Sketch to edit the icons (NTNU logo and printer logo) and the background as well. 
In Sketch, Edit->Export... and only export the "Icon.png". 

## Edit app
You need [Platypus](https://sveinbjorn.org/platypus) to open the  `.platypus`-app file. Notice the *Script path* and *Bundled files*. `main.scpt` is Applescript and is used for the logic. This scipt calls on several shell commands as well as `installRicoh.sh`. The last file is mostly settings for the printer. Export the app to `./app/NTNU Print.app`. 

`com.apple.print.custompresets.forprinter.NTNURicoh.plist` is a *Preset file* that contains presets for the printer. You can edit settings and copy the file from `~/Library/Preferences`.

`testprint.pdf` is the printed PDF. 

`RicohPrinterDrivers.pkg` is installed silently with administrator permissions. 

## Requirements
`brew install create-dmg`

Install Platypus command line tool: go to Platypus>Preferences...>Install`.


# Update DMG
Run , then `./createDMG.sh`.
