# ArchMosaic

**Flexible Arch Linux setup toolkit. Fast, versatile, and highly modular.**

ArchMosaic is a collection of **Bash scripts with example templates** that demonstrate how to structure and automate Arch Linux setups. It provides a foundation for creating custom and easily reproducable setups.

## Features

ArchMosaic includes:

- **Chaotic AUR Deployment** – Adds and configures the Chaotic AUR repository.
- **AUR Helper Installation** – Installs an AUR helper automatically if not present.
- **Package Installation** – Installs packages from the official Arch repositories.
- **Flatpak Installation** – Installs Flatpak applications.
- **File Deployment** – Deploys files to system and user locations.
- **Pre-Install and Post-Install Execution** – Runs profile-specific scripts before and after installation.

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

### Profile Selection

Profiles to be installed can be specified in the `installer.conf` file.
```bash
PROFILES=("main-example")
```
This allows defining profiles that are always executed when running:

```bash
./install.sh
```

By adjusting the configuration, different profile combinations can be selected without modifying the main script.

## Example Setup

The repository includes a **pre-defined example setup** to demonstrate ArchMosaic’s functionality.  

- **Main Profile:** `main-example`  
  - Does not install packages directly.  
  - Depends on `secondary-example` using:  

'''bash
DEPENDS=("secondary-example")
'''

- **Secondary Profile:** `secondary-example`  
  - Installs example packages (`htop` via pacman, `cower-bin` via AUR helper, `org.gnome.Nibbles` via Flatpak).  
  - Creates example files in `/tmp/archmosaic-demo/` and `~/.archmosaic-demo/`.  
  - Cleans up temporary files after installation.  

This setup demonstrates **package installation, file deployment, and profile dependencies** in action.

## Contributing

Contributions are welcome. You can:

- Improve existing scripts  
- Suggest new scripts or features  

Please open a pull request or issue for contributions.

## License

This project is licensed under the **GNU General Public License v2 (GPLv2)** – see the `LICENSE` file for details.
