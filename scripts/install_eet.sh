#!/bin/bash

cd "/Users/theo.despoudis/Library/Application Support/Steam/steamapps/common/Baldur's Gate II Enhanced Edition"

echo "Installing EET Core - you will need to provide the BGEE installation path"
echo "BGEE path should be: /Users/theo.despoudis/Library/Application Support/Steam/steamapps/common/Baldur's Gate Enhanced Edition"
echo ""

./weidu --language 0 --force-install 0 eet/EET.tp2

echo ""
echo "EET installation complete!"
