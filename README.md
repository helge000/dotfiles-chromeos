# Helge's Chromeos Dotfiles

## Abstract
These dotfiles are a version to work with chromeos in dev mode and 
[crew](https://github.com/skycocker/chromebrew) / [couton](https://github.com/dnschneid/crouton)

### Motivation
As of now, my Asus Chromebook Flip C302 (cave) does not support Crostini \([#918312](https://bugs.chromium.org/p/chromium/issues/detail?id=918312)\) and I have to resort to dev mode.
So, the next time I accidentally wipe my Chromebook by pressing space at boot this document helps to restore it to working condition.

## Setup

### Enable DEV mode
1. Power down
2. Hold `Esc` + `Refresh`
3. While holding, press power on
4. Press `Ctrl` + `d`

### Initial setup
1. After the ChromeOS setup wizard, download the ZIP file of this repo and extract it in your **Downloads** folder
2. Open a chrome shell, `Ctrl` + `Alt` + `t`, type `shell`
3. Change to your home dir `cd ~`
4. Move the contents of the zip archive to your home dir
5. Run initial setup: `setup/setup-new-chromebook.sh`. This step will bootstrap Chromebrew with my package selection.
6. After all packages are installed, `source .bashrc` or logout / login to chrosh again.

## Manual setup
This part aggregates steps to make my chromebook more usable, they have to be done manually after every install

### Make Amazon Prime stream in HD
Currently this works just by spoofing the user agent:

1. Install [User Agent Switcher extension](https://chrome.google.com/webstore/detail/user-agent-switcher-for-c/djflhoibgkdhkhhcedjiklpkjnoahfmg)
2. Copy `setup/user_agent_export.json` to **Downloads**
3. In the extension settings, import this file

**Note:** Netflix is not that nice. As of early 2019, there is no way any more to enable streaming in 1080p. My device is locked to 480p

### Make fonts from Android Apps more readable [#842004](https://bugs.chromium.org/p/chromium/issues/detail?id=842004)
1. Install [QuickShortcutMaker](https://play.google.com/store/apps/details?id=com.sika524.android.quickshortcut)
2. Create a shortcut to `com.android.settings/com.android.settings.accessibility.AccessibilitySettingsForSetupWizardActivity`
can be fund in Settings.
3. Click on it
4. Star it, so the next time it will be in Favorites tab
5. Click on **Open Activity** and change font size to **big**

**Note:** Since this is a hack, it must be redone after every reboot.

