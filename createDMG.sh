#!/bin/sh

function create_icon {
    cd app_resources/graphics/$1

    mkdir $1.iconset
    
    sips -z 16 16     Icon.png --out $1.iconset/icon_16x16.png 2>/dev/null
    sips -z 32 32     Icon.png --out $1.iconset/icon_16x16@2x.png 2>/dev/null
    sips -z 32 32     Icon.png --out $1.iconset/icon_32x32.png 2>/dev/null
    sips -z 64 64     Icon.png --out $1.iconset/icon_32x32@2x.png 2>/dev/null
    sips -z 128 128   Icon.png --out $1.iconset/icon_128x128.png 2>/dev/null
    sips -z 256 256   Icon.png --out $1.iconset/icon_128x128@2x.png 2>/dev/null
    sips -z 256 256   Icon.png --out $1.iconset/icon_256x256.png 2>/dev/null
    sips -z 512 512   Icon.png --out $1.iconset/icon_256x256@2x.png 2>/dev/null
    sips -z 512 512   Icon.png --out $1.iconset/icon_512x512.png 2>/dev/null
    cp Icon.png $1.iconset/icon_512x512@2x.png 2>/dev/null
    iconutil -c icns $1.iconset 2>/dev/null

    rm -R $1.iconset
    cd ../../../
}

create_icon "ntnu_light_text"
create_icon "ntnu_dark_text"
platypus -P NTNU\ Print.platypus "./app/NTNU Print.app" -y

test -f Application-Installer.dmg && rm Application-Installer.dmg
create-dmg \
--volname "Utskrift NTNU" \
--volicon "app_resources/graphics/printicon.icns" \
--window-pos 200 120 \
--window-size 400 600 \
--background "app_resources/graphics/background.png" \
--icon-size 100 \
--icon "NTNU Print.app" 200 170 \
--hide-extension "NTNU Print.app" \
"Utskrift NTNU.dmg" \
"app/"
