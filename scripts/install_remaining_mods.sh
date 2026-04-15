#!/bin/bash

# Install remaining mods after EET core
# Run this AFTER install_eet.sh completes

set -e

MODS=(
    # LeUI
    "LeUI/LeUI.tp2|0|lefreut's Enhanced UI - Core component"
    "LeUI/LeUI.tp2|1|lefreut's Enhanced UI - BG2 vanilla bams for spells"
    "LeUI/LeUI.tp2|2|lefreut's Enhanced UI - BG2 vanilla fonts for descriptions"

    # EE UI Tweaks
    "EEUITweaks/EEUITWEAKS.tp2|1100|Display max proficiency limits"
    "EEUITweaks/EEUITWEAKS.tp2|2000|Transparent Sidebars"
    "EEUITweaks/EEUITWEAKS.tp2|2030|Adul's Better Quick Loot"
    "EEUITweaks/EEUITWEAKS.tp2|2070|Dee's Permanent Thieving Button"
    "EEUITweaks/EEUITWEAKS.tp2|2130|Clickable dialog box"
    "EEUITweaks/EEUITWEAKS.tp2|3020|Mr2150's Journal Fixes"
    "EEUITweaks/EEUITWEAKS.tp2|3028|lefreut's Customize Screens Tweaks"
    "EEUITweaks/EEUITWEAKS.tp2|3051|Without Item Comparison"

    # BGEE Classic Movies
    "BGEEClassicMovies/BGEECLASSICMOVIES.tp2|0|Replace all movies"
    "BGEEClassicMovies/BGEECLASSICMOVIES.tp2|2|Show all movies in options"
    "BGEEClassicMovies/BGEECLASSICMOVIES.tp2|3|Restore BG1 Chapter and Dream Screens"
    "BGEEClassicMovies/BGEECLASSICMOVIES.tp2|4|Startup: Disable logo and intro movies"

    # MiH P&P Fixpack
    "mih_fr/setup-mih_fr.tp2|0|MiH P&P-based Fixpack"
    "mih_fr/setup-mih_fr.tp2|2|Sound Volume Fixes"
    "mih_fr/setup-mih_fr.tp2|3|Lore-Friendly Spell Names"
    "mih_fr/setup-mih_fr.tp2|6|Item Restorations"
    "mih_fr/setup-mih_fr.tp2|7|Spell Restorations"
    "mih_fr/setup-mih_fr.tp2|8|Store Restorations (BG1)"
    "mih_fr/setup-mih_fr.tp2|9|Quest Restorations (BG1)"
    "mih_fr/setup-mih_fr.tp2|10|Minor Restorations (BG1)"
    "mih_fr/setup-mih_fr.tp2|11|Minor Restorations (BG2)"
    "mih_fr/setup-mih_fr.tp2|12|Volo's Travels"
    "mih_fr/setup-mih_fr.tp2|16|Better Prepared Allies"
    "mih_fr/setup-mih_fr.tp2|17|Obtain Obscure Items"
    "mih_fr/setup-mih_fr.tp2|18|Revised Spell Damage Caps"

    # Endless BG1
    "c#endlessbg1/C#ENDLESSBG1.tp2|0|Endless BG1: Main Component"
    "c#endlessbg1/C#ENDLESSBG1.tp2|1|More Flavor to Hero of Baldur's Gate"
    "c#endlessbg1/C#ENDLESSBG1.tp2|2|Short Public Hero Tribute"
    "c#endlessbg1/C#ENDLESSBG1.tp2|3|Sarevok's Unique Items"
    "c#endlessbg1/C#ENDLESSBG1.tp2|4|Sarevok's Sword"
    "c#endlessbg1/C#ENDLESSBG1.tp2|5|Imoen and Duke Jannath"
    "c#endlessbg1/C#ENDLESSBG1.tp2|6|Duke Eltan Is in the Palace"
    "c#endlessbg1/C#ENDLESSBG1.tp2|7|Flaming Fist After Final Fight"
    "c#endlessbg1/C#ENDLESSBG1.tp2|8|jastey's Version"
    "c#endlessbg1/C#ENDLESSBG1.tp2|10|First Refugees Come to Baldur's Gate"
    "c#endlessbg1/C#ENDLESSBG1.tp2|11|Ophyllis the Treasurer"
    "c#endlessbg1/C#ENDLESSBG1.tp2|12|Denkod in Thieves' Guild"
    "c#endlessbg1/C#ENDLESSBG1.tp2|13|Skip Thieves' Maze Once"
    "c#endlessbg1/C#ENDLESSBG1.tp2|14|Korlasz' Dungeon is in BG1"
    "c#endlessbg1/C#ENDLESSBG1.tp2|15|Fenster the Palace Healer"
    "c#endlessbg1/C#ENDLESSBG1.tp2|16|Captain Corwin Is in the Palace"

    # SoD Tweaks
    "c#sodtweaks/setup-c#sodtweaks.tp2|3|NPC Dialogues: Activate All Always"
    "c#sodtweaks/setup-c#sodtweaks.tp2|5|More Dialogue Choices"
    "c#sodtweaks/setup-c#sodtweaks.tp2|7|Restore scripted Abduction Scene"
    "c#sodtweaks/setup-c#sodtweaks.tp2|9|SoD Starting XP: 90,000"
    "c#sodtweaks/setup-c#sodtweaks.tp2|20|Make Portal Close from Dragonspear"
    "c#sodtweaks/setup-c#sodtweaks.tp2|21|Hephernaan takes Vault Key"

    # SoD Boareskyr Bridge
    "c#sodboabri/C#SODBOABRI.tp2|0|Scene at Boareskyr Bridge - NPC Reactions"
    "c#sodboabri/C#SODBOABRI.tp2|1|Add Description Text to Bridge"
    "c#sodboabri/C#SODBOABRI.tp2|2|Bridge Scene Different Choices"
    "c#sodboabri/C#SODBOABRI.tp2|3|Add Stat Changes to Bridge Choices"

    # Imoen Forever
    "imoen_forever/IMOEN_FOREVER.tp2|10|Imoen Remains in Korlasz' Dungeon"
    "imoen_forever/IMOEN_FOREVER.tp2|11|Imoen Returns in First Coalition Camp"
    "imoen_forever/IMOEN_FOREVER.tp2|12|Imoen Better Reason to Stay"
    "imoen_forever/IMOEN_FOREVER.tp2|13|Play Cutscene With Imoen"
    "imoen_forever/IMOEN_FOREVER.tp2|14|Imoen Dialogue Chapters 8-12"
    "imoen_forever/IMOEN_FOREVER.tp2|15|Imoen at End Should be Party One"
    "imoen_forever/IMOEN_FOREVER.tp2|20|Imoen's chest moves with campaign"
    "imoen_forever/IMOEN_FOREVER.tp2|25|Imoen PID during chapters 8-12"

    # BG1 NPC Project
    "bg1npc/bg1npc.tp2|0|BG1NPC Required Modifications"
    "bg1npc/bg1npc.tp2|10|Banters, Quests, and Interjections"
    "bg1npc/bg1npc.tp2|20|Ajantis Romance: 1 hour"
    "bg1npc/bg1npc.tp2|30|Branwen Romance: 1 hour"
    "bg1npc/bg1npc.tp2|42|Coran Romance: 30 minutes"
    "bg1npc/bg1npc.tp2|50|Dynaheir Romance: 1 hour"

    # Ajantis BG1
    "ajantisbg1/Setup-AjantisBG1.tp2|0|Ajantis BG1 Expansion"
    "ajantisbg1/Setup-AjantisBG1.tp2|1|Ajantis Family Shield BAM"

    # Coran BG Friend
    "coranbgfriend/CORANBGFRIEND.tp2|0|Coran's Extended BG Friendship"

    # Xan BG1 Friend
    "XanBG1Friend/SETUP-XANBG1FRIEND.tp2|0|Xan's friendship path for BG1"

    # Northern Tales
    "ntotsc/NTOTSC.tp2|0|Northern Tales (main)"
    "ntotsc/NTOTSC.tp2|1|Spawn less Monsters"
    "ntotsc/NTOTSC.tp2|2|Keelor the Dwarf"
    "ntotsc/NTOTSC.tp2|3|Llindellyn's Lucky Arrow"
    "ntotsc/NTOTSC.tp2|4|Nim Furlwing's Hunting Hounds"
    "ntotsc/NTOTSC.tp2|5|Pilar and Gheldehar"

    # Dark Horizons
    "DarkHorizons/DarkHorizons.tp2|0|Dark Horizons Mod"

    # Unfinished Business
    "ub/SETUP-UB.tp2|0|UB - Kidnapping of Boo"
    "ub/SETUP-UB.tp2|1|UB - Suna Seni/Valygar"
    "ub/SETUP-UB.tp2|2|UB - Kalah"
    "ub/SETUP-UB.tp2|4|UB - Gorje Hilldark"
    "ub/SETUP-UB.tp2|7|UB - Restored Encounters"
    "ub/SETUP-UB.tp2|10|UB - Restored Hell Minions"
    "ub/SETUP-UB.tp2|12|UB - Item Restorations"
    "ub/SETUP-UB.tp2|17|UB - Character Names"
    "ub/SETUP-UB.tp2|18|UB - Minor Dialogs"
    "ub/SETUP-UB.tp2|20|UB - Extended ToB Descriptions"
    "ub/SETUP-UB.tp2|21|UB - ToB Minor Restorations"

    # Ascension Restoration
    "arestorationp/ARESTORATIONP.tp2|0|Restored Locations|1"
    "arestorationp/ARESTORATIONP.tp2|1|Restored Characters and Dialogs|1"
    "arestorationp/ARESTORATIONP.tp2|2|Restored Sounds|1"
    "arestorationp/ARESTORATIONP.tp2|3|Restored Items|1"
    "arestorationp/ARESTORATIONP.tp2|4|Restored Wish Options|1"
    "arestorationp/ARESTORATIONP.tp2|5|Restored XP for Minor Things|1"
    "arestorationp/ARESTORATIONP.tp2|6|Lich Deril|1"
    "arestorationp/ARESTORATIONP.tp2|7|Restored Random Encounters|1"
    "arestorationp/ARESTORATIONP.tp2|8|Minor Restorations|1"
    "arestorationp/ARESTORATIONP.tp2|9|Restored Bard Stronghold|1"
    "arestorationp/ARESTORATIONP.tp2|10|Better Item Import|1"
    "arestorationp/ARESTORATIONP.tp2|11|Restored Final Slayer Dream|1"

    # Hidden Adventures
    "hiddenadventure/hiddenadventure.tp2|0|Lady Elgea's plot|1"
    "hiddenadventure/hiddenadventure.tp2|2|Jerlia's Ore Shop|1"
    "hiddenadventure/hiddenadventure.tp2|3|Elven holy water|1"
    "hiddenadventure/hiddenadventure.tp2|4|Wave Blade in Treasury|1"
    "hiddenadventure/hiddenadventure.tp2|5|Silver Dagger|1"
    "hiddenadventure/hiddenadventure.tp2|6|Bards at stronghold|1"
    "hiddenadventure/hiddenadventure.tp2|7|Bard for stronghold|1"
    "hiddenadventure/hiddenadventure.tp2|8|Silver Sword|1"
    "hiddenadventure/hiddenadventure.tp2|9|Tunnel for Saradush|1"
    "hiddenadventure/hiddenadventure.tp2|10|Temple of Mask|1"

    # Assassinations
    "Assassinations/ASSASSINATIONS.tp2|0|Assassinations mod"

    # Sellswords
    "Sellswords/SELLSWORDS.tp2|0|Sellswords mod"

    # Back to Brynnlaw
    "BackBrynnlaw/BACKBRYNNLAW.tp2|0|Back to Brynnlaw"

    # Romantic Encounters
    "RE/SETUP-RE.tp2|0|RE - Main NPCs React"
    "RE/SETUP-RE.tp2|1|Storms and Lightning"
    "RE/SETUP-RE.tp2|2|Aimi's Magic"
    "RE/SETUP-RE.tp2|3|Anishai's Deft Hands"
    "RE/SETUP-RE.tp2|4|Evening with Aran"
    "RE/SETUP-RE.tp2|5|Bjornin's Desire"
    "RE/SETUP-RE.tp2|7|Trademeet with Busya"
    "RE/SETUP-RE.tp2|8|Gambling Cambion"
    "RE/SETUP-RE.tp2|9|Chanelle's Gifts"
    "RE/SETUP-RE.tp2|10|Night with Coran"
    "RE/SETUP-RE.tp2|11|Cyric's Test"
    "RE/SETUP-RE.tp2|12|Tryst with Pirate Lord"
    "RE/SETUP-RE.tp2|13|Lonely Dryad"
    "RE/SETUP-RE.tp2|14|Edwin's Softer Side"
    "RE/SETUP-RE.tp2|15|Eldoth' Exploits"
    "RE/SETUP-RE.tp2|16|Elhan's Expansion"
    "RE/SETUP-RE.tp2|17|Firkraag's Unsheathed Sword"
    "RE/SETUP-RE.tp2|18|Gaelan's Contract"
    "RE/SETUP-RE.tp2|19|Walk with Garren"
    "RE/SETUP-RE.tp2|20|Enter Haer'Dalis"
    "RE/SETUP-RE.tp2|21|Hendak's Heart"
    "RE/SETUP-RE.tp2|22|Ilona"
    "RE/SETUP-RE.tp2|23|Jarlaxle's Fascinations"
    "RE/SETUP-RE.tp2|24|Night with Lais"
    "RE/SETUP-RE.tp2|25|Laran's Promise"
    "RE/SETUP-RE.tp2|26|Love Song of Logan"
    "RE/SETUP-RE.tp2|27|Mekrath and Nymphology"
    "RE/SETUP-RE.tp2|28|Mira's Special Stock"
    "RE/SETUP-RE.tp2|29|Noober Returns"
    "RE/SETUP-RE.tp2|31|Renal Bloodscalp"
    "RE/SETUP-RE.tp2|32|Old Ribald's Speciality"
    "RE/SETUP-RE.tp2|33|Sir Ryan Trawl"
    "RE/SETUP-RE.tp2|34|Saemon, a Pirate"
    "RE/SETUP-RE.tp2|35|Dreaming of Sendai"
    "RE/SETUP-RE.tp2|36|Sheri the Bardess"
    "RE/SETUP-RE.tp2|38|Phaere's Reward"
    "RE/SETUP-RE.tp2|39|Spell Research with Teos"
    "RE/SETUP-RE.tp2|40|Fling with Yoshimo"
    "RE/SETUP-RE.tp2|41|Isabelle's Fears"
    "RE/SETUP-RE.tp2|42|Anne's Rescue"
    "RE/SETUP-RE.tp2|43|The Queen"
    "RE/SETUP-RE.tp2|44|Valygar Romance"
    "RE/SETUP-RE.tp2|45|Rehearsal with Chandra"
    "RE/SETUP-RE.tp2|46|Goldander Blackenrock"
    "RE/SETUP-RE.tp2|47|Chat with Viekang"
    "RE/SETUP-RE.tp2|48|Bravery or Folly"
    "RE/SETUP-RE.tp2|49|Blame the Moon"
    "RE/SETUP-RE.tp2|50|Cernick's Confession"
    "RE/SETUP-RE.tp2|51|Valygar Romance ToB"
    "RE/SETUP-RE.tp2|52|Minsc Takes A Bath"
    "RE/SETUP-RE.tp2|53|Nizidramanii'yt's Vanity"

    # Sirene BG1
    "Sirene/Setup-Sirene.tp2|0|Sirene NPC for BG:EE"
    "Sirene/Setup-Sirene.tp2|1|BG2 Default (Isandir)"

    # Isra BG1
    "isra/ISRA.tp2|0|Isra NPC Mod"

    # Recorder
    "Recorder/Setup-Recorder.tp2|0|Recorder NPC"
    "Recorder/Setup-Recorder.tp2|1|Recorder's Music"

    # Isra BG2
    "isra_bg2/isra_bg2.tp2|0|Isra for BGII"

    # Sirene BG2
    "Sirene_BG2/Sirene_BG2.tp2|0|Sirene NPC for BG2:EE"

    # Imoen Friendship
    "imoenfriendship/IMOENFRIENDSHIP.tp2|0|Imoen Friendship"

    # Korgan's Redemption
    "korgan/KORGAN.tp2|0|Korgan's Redemption|1"

    # Yoshimo Friendship
    "yoshimo/yoshimo.tp2|0|Yoshimo Friendship"

    # NPC Flirt Pack
    "npcflirt/SETUP-NPCFLIRT.tp2|0|Aerie Flirt SOA"
    "npcflirt/SETUP-NPCFLIRT.tp2|2|Aerie Flirt TOB"
    "npcflirt/SETUP-NPCFLIRT.tp2|4|Jaheira Flirt SOA"
    "npcflirt/SETUP-NPCFLIRT.tp2|6|Jaheira Flirt TOB"
    "npcflirt/SETUP-NPCFLIRT.tp2|8|Viconia Flirt SOA"
    "npcflirt/SETUP-NPCFLIRT.tp2|10|Viconia Flirt TOB"
    "npcflirt/SETUP-NPCFLIRT.tp2|12|Anomen Flirt SOA"
    "npcflirt/SETUP-NPCFLIRT.tp2|14|Anomen Flirt TOB"

    # Crossmod Content
    "ajantisbg1/Setup-AjantisBG1.tp2|30|Ajantis SoD Crossmod"
    "isra_bg2/isra_bg2.tp2|1|Isra Crossmod Content"

    # Banter Pack
    "banterpack/Setup-banterpack.tp2|0|Pocket Plane Banter Pack"
    "banterpack/Setup-banterpack.tp2|1|SOA Banter Accelerator"

    # Crossmod BG2
    "crossmodbg2/setup-crossmodbg2.tp2|1|Crossmod Banter Pack"
    "crossmodbg2/setup-crossmodbg2.tp2|2|Crossmod Romance Conflicts"

    # EET Tweaks
    "EET_Tweaks/EET_TWEAKS.tp2|1050|Cameo NPCs appearance"
    "EET_Tweaks/EET_TWEAKS.tp2|2042|XP for Traps/Spells/Lockpicking"
    "EET_Tweaks/EET_TWEAKS.tp2|3000|Disable hostile after charm"
    "EET_Tweaks/EET_TWEAKS.tp2|3010|PnP spell scroll levels"
    "EET_Tweaks/EET_TWEAKS.tp2|4020|Higher framerates support"
    "EET_Tweaks/EET_TWEAKS.tp2|4040|Import party items to SoA"
    "EET_Tweaks/EET_TWEAKS.tp2|4060|Wand Case"
    "EET_Tweaks/EET_TWEAKS.tp2|4070|Key Ring"

    # HQ Sound Clips
    "HQ_SoundClips_BG2EE/HQ_SOUNDCLIPS_BG2EE.tp2|0|HQ soundclips BG2EE"

    # Infinity Sounds
    "infinitysounds/INFINITYSOUNDS.tp2|100|Restore BG1 Spellcasting Voices"
    "infinitysounds/INFINITYSOUNDS.tp2|110|Restore BG1 Spellcasting Sounds"
    "infinitysounds/INFINITYSOUNDS.tp2|120|Restore BG1 Weapon Sounds"
    "infinitysounds/INFINITYSOUNDS.tp2|130|Restore BG1 Armor Sounds"
    "infinitysounds/INFINITYSOUNDS.tp2|140|Restore BG1 GUI Sounds"
    "infinitysounds/INFINITYSOUNDS.tp2|170|Restore Chunked Death Sound"
    "infinitysounds/INFINITYSOUNDS.tp2|180|Tweak Sound Channel Volumes"
    "infinitysounds/INFINITYSOUNDS.tp2|189|Enable Footsteps in Combat"
    "infinitysounds/INFINITYSOUNDS.tp2|210|Restore BG1 Ambient Sounds"
    "infinitysounds/INFINITYSOUNDS.tp2|230|Restore & Tweak Soundsets"
    "infinitysounds/INFINITYSOUNDS.tp2|240|More Existence Sounds"
    "infinitysounds/INFINITYSOUNDS.tp2|250|Tweak Existence Sound Delay"
    "infinitysounds/INFINITYSOUNDS.tp2|265|Restore NPC Voiceovers"
    "infinitysounds/INFINITYSOUNDS.tp2|270|Additional NPC Voiceovers"

    # Portraits Portraits Everywhere
    "PPE/SETUP-PPE.tp2|0|PPE - core component"
    "PPE/SETUP-PPE.tp2|100|Category Portraits: Sequenced"
    "PPE/SETUP-PPE.tp2|10|Isandir's CHARNAME Portraits"
    "PPE/SETUP-PPE.tp2|20|Replace Low Quality Portraits"
    "PPE/SETUP-PPE.tp2|25|Edwin/Edwina"
    "PPE/SETUP-PPE.tp2|30|Ust Natha Drow NPCs"

    # BP-BGT Worldmap
    "bp-bgt-worldmap/setup-bp-bgt-worldmap.tp2|0|Worldmap (colored icons)"
    "bp-bgt-worldmap/setup-bp-bgt-worldmap.tp2|4|Window Style: BG2"

    # EET End
    "eet/EET_end/EET_end.tp2|0|EET End - Standard installation"
)

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

GAME_DIR="/Users/theo.despoudis/Library/Application Support/Steam/steamapps/common/Baldur's Gate II Enhanced Edition"
cd "$GAME_DIR"

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}Installing Remaining Mods${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

install_component() {
    local tp2_file="$1"
    local component="$2"
    local description="$3"
    local language="${4:-0}"

    echo -e "${YELLOW}Installing: ${description}${NC}"
    echo -e "  TP2: ${tp2_file}, Component: ${component}, Language: ${language}"

    if ./weidu --language "${language}" --force-install "${component}" "${tp2_file}" --no-exit-pause; then
        echo -e "${GREEN}✓ Installed successfully${NC}"
    else
        echo -e "${RED}✗ Installation failed${NC}"
        echo -e "${RED}Check the log above for errors${NC}"
        exit 1
    fi
    echo ""
}

for mod in "${MODS[@]}"; do
    IFS='|' read -r tp2_file component description language <<< "$mod"
    install_component "$tp2_file" "$component" "$description" "$language"
done

echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}All remaining mods installed!${NC}"
echo -e "${GREEN}========================================${NC}"
