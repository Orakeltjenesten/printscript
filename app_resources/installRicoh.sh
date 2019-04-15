# Printer name
NAME="NTNURicoh"

# Description, name of printer in dropdown menus                     
DESCRIPTION="NTNU - Ricoh"           

# Printer addres
ADDRESS="followprint.win.ntnu.no/ntnuprint-ricoh"   

# Printer driver file
DRIVER="/Library/Printers/PPDs/Contents/Resources/RICOH MP C6502.gz"              

sudo lpadmin -E -p "$NAME" \
                -D "$DESCRIPTION" \
                -L "$LOCATION" \
                -v smb://"$ADDRESS" \
                -P "$DRIVER" \
                -o printer-is-shared=false \
                -o printer-op-policy=authenticated \
                -o Finisher=FinVICTORIAH \
                -o MultiFold=Installed \
                -o MultiHolePunchUnit=Installed \
                -o PageSize=A4
# The following options can be enabled, but conflicts with Stapling and punch unit. 
#                   -o BKLProcessor=Plockmatic

sudo lpadmin -E -p $NAME -o auth-info-required=username,password

cupsenable "$NAME"
cupsaccept "$NAME"
