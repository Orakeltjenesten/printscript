# Printer name
NAME="NTNUXerox"      

# Description, name of printer in dropdown menus                     
DESCRIPTION="NTNU - Xerox"

# Printer addres
ADDRESS="followprint.win.ntnu.no/ntnuprint-xerox"

# Printer driver file
DRIVER="drv:///sample.drv/generic.ppd"

sudo lpadmin -E -p "$NAME" \
                -D "$DESCRIPTION" \
                -L "$LOCATION" \
                -v smb://"$ADDRESS" \
                -m "$DRIVER" \
                -o printer-is-shared=false \
                -o printer-op-policy=authenticated \
                -o Duplex=DuplexNoTumble \
                -o Option1=True \
                -o PageSize=A4


sudo lpadmin -E -p $NAME -o auth-info-required=username,password

cupsenable "$NAME"
cupsaccept "$NAME"
