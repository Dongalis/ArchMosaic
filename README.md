# ArchMosaic

**Flexible Arch Linux setup toolkit. Fast, versatile, and highly modular.**

ArchMosaic is a collection of **Bash scripts with example templates** that demonstrate how to structure and automate Arch Linux setups. It provides a foundation for creating custom and easily reproducable setups.

## Features

ArchMosaic includes:

- **Bash Scripts** – Scripts for automating installation and configuration tasks.  
- **Example Templates** – Template profiles that demonstrate script usage and structure.  

## Installation

Clone the repository:

```bash
git clone https://github.com/yourusername/ArchMosaic.git
cd ArchMosaici
```

Ensure the main script is executable:
 ```bash
chmod +x install.sh
```

ArchMosaic will **install Chaotic AUR and an AUR helper automatically** if they are not present.

> ⚠️ Profiles must be created in the `profiles/` folder before running `install.sh`.

## Folder Structure

```text
ArchMosaic/
├── install.sh          # Main install script
├── installer.conf      # Configuration file with variables and options
├── lib/                # Additional scripts used by installer
├── profiles/           # Folder containing profile folders
│   ├── <profile>/       # Example profile folder
│   │   ├── profile.conf
│   │   ├── pre-install.sh
│   │   ├── packages.txt
│   │   ├── flatpaks.txt
│   │   ├── root.manifest
│   │   ├── home.manifest
│   │   └── post-install.sh
```

## Usage

1. Create one or more **profile folders** inside the `profiles/` directory.  
2. Each profile folder can contain the following files:

   - `profile.conf` – Profile configuration (can set dependencies on other profiles).  
   - `pre-install.sh` – Script that runs before any packages are installed.  
   - `packages.txt` – List of packages to install with pacman or the AUR helper.  
   - `flatpaks.txt` – List of Flatpak packages to install.  
   - `root.manifest` – List of files located in `profiles/<profile>/root` to copy relative to `/`.  
   - `home.manifest` – List of files located in `profiles/<profile>/home` to copy relative to `~`.  
   - `post-install.sh` – Script that runs last after everything is installed.

3. Once profiles are ready, run the main installer:

```bash
sudo ./install.sh <profile>
```
