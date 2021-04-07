
# ETS2 Radarwarner <img align="right" width="150" height="100" src="https://user-images.githubusercontent.com/37580234/113850403-b86f6d00-979a-11eb-88a7-4e0c11681a4b.png">
This is a Radarwarner for Euro Truck Simulator 2.
Using the SDK from https://github.com/nlhans/ets2-sdk-plugin.

Parts of this project are used in my work.
Hans nlhans provided the SDK and i rewrote some of his democode.
My project uses his SDK but the main program is made by me.

## Description
ETS2-Radarwarner is a app that that will warn you about speed cameras.
You'll have to mark the cameras beforehand.
Once you've tagged a camera successfully, you'll get a 2-step warn tone as you approach them.

## Requirements
- Installed ETS2 or ATS
- Installed SDK (ets2-telemetry.dll)

## Installation
1. Place the ets2-telemetry.dll inside bin/win_x64/plugins/ of your ET2/ATS installation-directory. Create the "plugins" folder if not existent.
2. When installed correct you will get a notice when starting ETS2 oder ATS that the SDK has been activated.
3. Start Radarwarner.exe and you are good to go.

## Usage
- Press F11 to save the current location of a speed camera.
- Press F9 to pause the program for 1 minute.
