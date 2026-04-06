# SOP-01: Host Decommissioning (The Nuclear Purge)
**Version**: 17.0 (Ground Zero)
**Target**: MacOS Host

This SOP establishes the **"True Ground Zero"** state by purging all legacy CogCtrl/TFS branding and metadata from the MacOS host. This ensures that the newly created VM environment is isolated and free of host-level contamination.

## 1. Prerequisites
- Confirm all critical data from `/scratch/cogctrl-enclave` is backed up (if any).
- Confirm the `multipass` environment is ready.

## 2. Decommissioning Steps
### Step 1: Unmount the Case-Sensitive Mirror
Run the following command to detach the anchor volume:
```bash
hdiutil detach /Volumes/CogCtrl_Anchor
```
*Note: If formerly named `TFS_MIRROR`, the command remains the same for the active mount point.*

### Step 2: Purge the Mac Workspace
Clear the local scratch directory to remove all metadata and un-audited snapshots:
```bash
rm -rf /Users/perkunas/.gemini/antigravity/scratch/cogctrl-enclave
```

### Step 3: Verify Host Purity
Confirm the volume and directory are gone:
```bash
ls /Volumes/
ls /Users/perkunas/.gemini/antigravity/scratch/
```
*Expected Result: Zero matches for 'CogCtrl' or 'TFS'.*

---
**Status**: [COMPLETE]
**Verified By**: Antigravity (AI Agent)
**Timestamp**: 2026-04-05T05:03:00Z
