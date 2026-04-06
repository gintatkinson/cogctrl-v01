# Sovereign CogCtrl Enclave

**The Absolute Source of Truth for the Cognitive Controller Enclave**

This repository contains the **Architectural Bible**, **Operational Workflows (SOPs)**, and **Succession Skills** required to maintain a hardened, ARM64-native CogCtrl environment. 

## 🛡️ The Sovereign Bible (Governor Rules)

Any interaction with this system is governed by the **Meta-Cognitive Locks** defined in [SOVEREIGN_BIBLE.md](./SOVEREIGN_BIBLE.md):

| Rule | Title | Directive |
| :--- | :--- | :--- |
| **Rule 4** | **The 20% Law** | Maintain >20% resource headroom per pod; zero OOMKills permitted. |
| **Rule 5** | **Ground Truth Lock** | Never trust runtime state; reconcile only against the Whitelist. |
| **Rule 7** | **Stable-200 Law** | Mandate the 16G RAM / 200G Disk / 4-CPU VM baseline. |
| **Rule 8** | **The Browser Lock** | Interaction with GitHub MUST be terminal-only; no browser agents. |
| **Rule 9** | **Execution Guard** | No system modifications without unambiguous approval ("GO", "DO IT"). |
| **Rule 10** | **Sovereign Save** | Pushing a checkpoint to GitHub is MANDATORY after each SOP milestone. |

## 🚀 Restoration Roadmap (SOP Sequence)

| Phase | SOP ID | Objective | Action |
| :--- | :--- | :--- | :--- |
| **I: Forge** | SOP-01 | Host Purge | Total VM erasure and workspace cleanup. |
| | SOP-02 | Provisioning | Spawn **Stable-200** VM with `en0` bridge. |
| | SOP-03 | Bootstrap | Install MicroK8s v1.29 and core persistence. |
| **II: Assembly** | SOP-04 | Mirror Fetch | Re-establish local source from the GitHub Anchor. |
| | SOP-05 | Bible Patches | Inject hardening fixes into the fresh source code. |
| | SOP-06 | Lite-Config | Enforce the **8-service mandated whitelist**. |
| **III: Rollout** | SOP-07 | Backoff Law | Deploy services with a mandatory 120s cooldown. |
| | SOP-08 | Data Load | Execute the OFC22 data bootstrap. |
| **IV: Audit** | SOP-09 | UI Audit | Confirm all 13 WebUI modules load in <3 seconds. |
| | SOP-10 | Acceptance | Final resource and functionally sign-off. |

## 🛠️ The Mandated 8-Service Whitelist

The enclave is functionally limited to these 8 atomic services. Any other detected service must be purged under **SOP-01**:

1. `contextservice`
2. `deviceservice`
3. `serviceservice`
4. `sliceservice`
5. `pathcompservice` (frontend & backend)
6. `dltservice`
7. `interdomainservice`
8. `webuiservice`

## 🏁 The First Command (Recovery)

Execute this from any fresh terminal to re-establish the environment:
```bash
git clone https://github.com/gintatkinson/cogctrl-v01.git && cd cogctrl-v01 && ./System_Bootstrap_Anchor.md
```

---
**Mission Status**: RESTORATION IN PROGRESS (SOP-02 COMPLETE)
**Target Host**: 192.168.2.21
**Checkpoints**: Synchronized on GitHub
