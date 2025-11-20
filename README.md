# Device Tree for iBall Snap 4G2 (codenamed _"Snap_4G2"_)

## Device Specifications

| Device                  | iBall Snap 4G2                                               |
| -----------------------:| :----------------------------------------------------------- |
| **SoC** | MediaTek MT6735M (64-bit)                                    |
| **CPU** | Quad-core 1.0 GHz ARM Cortex-A53                             |
| **GPU** | ARM Mali-T720 MP2                                            |
| **Memory** | 2GB RAM (LPDDR3)                                             |
| **Shipped Android** | 7.0 (Nougat) / SDK 25                                        |
| **Storage** | 16GB eMMC 5.1                                                |
| **Battery** | Non-removable Li-Po (Capacity varies by model batch)         |
| **Display** | 1024 x 600 px (WSVGA), Landscape Native                      |
| **Rear Camera** | Samsung S5K5E2YA (5MP) or ST55A                              |
| **Front Camera** | SP2508 (2MP)                                                 |
| **Kernel** | 3.18.35+                                                     |

## Features

**Works**
- Booting
- **ADB** (Fixed via FunctionFS & ConfigFS)
- **Touchscreen** (Corrected with Landscape Matrix Swap/Flip)
- **Decryption** (Data partition)
- External SD Card
- USB OTG
- Backup/Restore (System, Data, Boot, NVRAM, Metadata)

**Disabled / Not Working**
- **MTP**: Disabled (Kernel driver issues). Use `adb push` / `adb pull` for file transfer.
- **Stock Encryption**: Requires formatting data / disabling dm-verity to boot.

## Critical Installation Notes

**Partition Resizing Required**
This device ships with a tiny 16MB recovery partition. This tree requires a **64MB Recovery Partition**.
1. You **MUST** flash the modified [`scatter.txt`](https://gist.github.com/Pranav-Talmale/be16771c4fc60816834468918d41e2be) using SP Flash Tool (Format All + Download).
2. Restore your IMEI/Serial using SN Writer tool immediately after formatting.

**Boot Loop Fix**
The stock kernel uses DM-Verity and Force Encrypt. To boot System after installing TWRP:
1. Flash TWRP.
2. Flash `Magisk` (v23.0+) OR `no-verity-opt-encrypt.zip`.
3. **Format Data** (Wipe -> Format Data -> "yes") is mandatory on the first install.

## Compile

**Build Dependencies**
Ensure your build environment is set up for Android 7.1 (OmniROM).
- **Java:** OpenJDK 8 (Required)
- **Python:** Python 2.7 (Required)
- **Locale:** `LC_ALL=C` (Required for flex)

**Sync The TWRP Omni 7.1 Minimal Manifest**
```bash
# 1. Make the dir
mkdir twrp && cd twrp
```
```bash
# 2. Initialize the repo
repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-7.1
```
```bash
# 3. Repo Sync
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all)
```
```bash
# 4. Clone Device Repo
git clone https://github.com/Pranav-Talmale/device_iball_snap_4g2.git device/iball/Snap_4G2
```

**Build Command**
```bash
# 1. Initialize environment
. build/envsetup.sh
```
```bash
# 2. Select device (This will load vendorsetup.sh fixes)
lunch omni_Snap_4G2-eng
```
```bash
# 3. Build
mka recoveryimage
````

## Device Picture
![iBall Slide Snap 4G2](https://images.fonearena.com/photos/albums/userpics/10004/4~174.jpg)