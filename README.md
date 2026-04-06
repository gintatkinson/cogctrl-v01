# Sovereign CogCtrl Enclave

**The Absolute Source of Truth for the Cognitive Controller Enclave**

This repository contains the **Architectural Bible**, **Operational Workflows (SOPs)**, and **Succession Skills** required to maintain a hardened, ARM64-native CogCtrl environment. 

## 🛡️ The Sovereign Bible (Rules 4, 5, 7)

Any interaction with this system is governed by the **Meta-Cognitive Locks** defined in [SOVEREIGN_BIBLE.md](./SOVEREIGN_BIBLE.md):

*   **Rule 4 (The 20% Law)**: No pod manifests or runtime states may exceed 80% CPU or result in OOMKills.
*   **Rule 5 (The Ground Truth Lock)**: Never trust the current cluster state. Always reconcile against the Whitelist and this Bible.
*   **Rule 7 (The Stable-200 Law)**: All VM environments must adhere to the 16G/200G/4-CPU resource baseline.

## 🚀 The First Command (Recovery)

If the environment is compromised or the host is lost, execute the following from a fresh MacOS/Linux host terminal:

```bash
git clone https://github.com/gintatkinson/cogctrl-v01.git && cd cogctrl-v01 && ./System_Bootstrap_Anchor.md
```

## 📂 Repository Structure

*   **/ops/**: Standard Operating Procedures (SOP-01 to SOP-10) for full system restoration.
*   **/skills/**: Portable agent instructions (CogCtrl Succession Skill).
*   **SOVEREIGN_BIBLE.md**: The mandatory architectural governance document.
*   **System_Bootstrap_Anchor.md**: The technical baseline for Ground Zero recovery.

---
**Status**: SOVEREIGN (Hardened)
**Architecture**: ARM64 Native
**Registry**: localhost:32000
