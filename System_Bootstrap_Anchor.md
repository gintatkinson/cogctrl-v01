# TFS Zero-Anchor Recovery: The First Command

If the local machine, OS, and user are wiped, follow these steps to re-establish the environment using only your Google/Antigravity and GitHub credentials.

## 1. The Bootstrap Command
Run this command from any terminal on the new Mac:
```bash
git clone https://github.com/gintatkinson/tfs-controller-hardened.git && cd tfs-controller-hardened && ./bootstrap.sh
```

## 2. Requirements for Recovery
- **GitHub PAT**: Needed to download the `tfs_mirror.dmg` from the private 'Release' assets.
- **Multipass**: Must be installed (`brew install --cask multipass`).

## 3. The Source of Truth (DMG)
The `tfs_mirror.dmg` (5Gi) is the case-sensitive anchor. It is hosted as a split-release at:
- `https://github.com/gintatkinson/tfs-controller-hardened/releases/tag/source-of-truth`

## 4. Rebuilding Images
If the VM is fresh, the bootstrap will automatically trigger a **Build-from-Source** for all 22 ARM64 services to ensure architecture stability.
