# BG2 Enhanced Edition Trilogy (EET) Mod Installation Scripts

Automated installation scripts for setting up a modded Baldur's Gate 2: Enhanced Edition with EET (Enhanced Edition Trilogy) on macOS.

## Overview

This repository contains scripts and documentation for installing a comprehensive mod setup for Baldur's Gate 2 EE with EET, which combines BG1:EE, SoD, and BG2:EE into a single continuous campaign.

## Requirements

- macOS (tested on Apple Silicon)
- Baldur's Gate: Enhanced Edition (Steam version)
- Baldur's Gate 2: Enhanced Edition (Steam version)
- Siege of Dragonspear DLC
- [WIT (Weidu Install Tool)](https://github.com/Argent77/WeiduInstallTool)

## Directory Structure

```
bg2-mod-scripts/
├── scripts/
│   ├── install_eet.sh              # EET core installation
│   ├── install_remaining_mods.sh   # All remaining mods in WeiDU order
│   └── package_mod.sh              # Utility for packaging mods
├── memory/
│   ├── MEMORY.md                   # Project memory index
│   └── eet_arm_mac_fix.md         # ARM Mac specific fix for EET
├── docs/
│   ├── WEIDU_ORDER.txt            # Complete mod installation order
│   └── SETUP_GUIDE.md             # Step-by-step setup instructions
└── README.md
```

## Quick Start

1. **Clone this repository**
   ```bash
   cd ~
   git clone https://github.com/theodesp/bg2-mod-scripts.git
   ```

2. **Copy scripts to your BG2:EE directory**
   ```bash
   cd ~/bg2-mod-scripts
   cp scripts/*.sh "$HOME/Library/Application Support/Steam/steamapps/common/Baldur's Gate II Enhanced Edition/"
   ```

3. **Follow the setup guide**
   See [docs/SETUP_GUIDE.md](docs/SETUP_GUIDE.md) for detailed instructions.

## Installation Order

The installation follows this sequence:

1. **BGEE mods** - Install fixpack, UI, and content mods in BG1:EE
2. **EET core** - Install EET to import BG1:EE into BG2:EE (`install_eet.sh`)
3. **Remaining mods** - Install all other mods in proper WeiDU order (`install_remaining_mods.sh`)

See [docs/WEIDU_ORDER.txt](docs/WEIDU_ORDER.txt) for the complete mod list and order.

## Apple Silicon (ARM Mac) Support

If you're running on Apple Silicon (M1/M2/M3), you MUST apply the EET ARM Mac fix before installing EET. See [memory/eet_arm_mac_fix.md](memory/eet_arm_mac_fix.md) for details.

**Quick fix:**
```bash
cd "$HOME/Library/Application Support/Steam/steamapps/common/Baldur's Gate II Enhanced Edition"
cp weidu eet/bin/osx/
chmod +x eet/bin/osx/weidu
```

## Included Mods

The setup includes 200+ mod components including:

- **Core**: EET, EE Fixpack, LeUI, EE UI Tweaks
- **Content**: Endless BG1, Northern Tales, Dark Horizons, Quest Pack
- **NPCs**: Sirene, Isra, Recorder, BG1 NPC Project
- **Quests**: Assassinations, Sellswords, Back to Brynnlaw, Hidden Adventures
- **Romance/Friendship**: Romantic Encounters, Imoen Friendship, Yoshimo, Korgan
- **Restoration**: Unfinished Business, Ascension Restoration Project
- **Audio/Visual**: Infinity Sounds, HQ Soundclips, PPE (Portraits)
- **Tweaks**: EET Tweaks, higher framerates, improved worldmap

## Scripts

### install_eet.sh
Installs the EET core component. This must be run after:
- Installing required mods in BG1:EE (eefixpack, bg1re, questpack, ascension)
- Applying the ARM Mac fix (if on Apple Silicon)

### install_remaining_mods.sh
Installs all remaining mods in the correct WeiDU order. This includes:
- 200+ mod components
- Proper language settings for each mod
- Error handling and progress reporting
- Sequential installation to respect mod dependencies

### package_mod.sh
Utility script for packaging individual mods for distribution.

## Memory System

The `memory/` directory contains Claude Code project memory:
- Installation notes and fixes
- Platform-specific issues
- Mod compatibility information

This is used by Claude Code to provide context-aware assistance.

## Troubleshooting

### EET Installation Fails
- **Apple Silicon**: Apply the ARM Mac fix from `memory/eet_arm_mac_fix.md`
- **Intel Mac**: Ensure weidu binary is in the correct location
- Check WeiDU.log for errors

### Mod Installation Fails
- Check the last installed component in WeiDU.log
- Ensure you installed BGEE mods before EET
- Verify all mod folders are in the BG2:EE directory

### Performance Issues
- The full mod setup is large; installation may take several hours
- Some mods (especially audio/portraits) increase game size significantly

## Contributing

Contributions welcome! Please submit issues or pull requests for:
- Bug fixes
- Additional mod configurations
- Platform-specific fixes
- Documentation improvements

## License

MIT License - See LICENSE file for details

## Credits

- EET by K4thos
- All mod authors (see individual mod documentation)
- Baldur's Gate modding community
- WIT by Argent77

## Links

- [EET Documentation](https://github.com/Gibberlings3/EET)
- [Beamdog Forums](https://forums.beamdog.com/)
- [Gibberlings3 Forum](https://www.gibberlings3.net/)
- [Pocket Plane Group](http://www.pocketplane.net/)
