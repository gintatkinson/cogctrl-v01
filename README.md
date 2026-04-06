# Sovereign CogCtrl Enclave

The Absolute Source of Truth for the Cognitive Controller Enclave

This repository contains the Architectural Bible, Operational Workflows (SOPs), and Succession Skills required to maintain a hardened, ARM64-native CogCtrl environment. 

## Sovereign Bible (Governor Rules)

Any interaction with this system is governed by the Meta-Cognitive Locks defined in [SOVEREIGN_BIBLE.md](./SOVEREIGN_BIBLE.md):

| Rule | Title | Directive |
| :--- | :--- | :--- |
| Rule 4 | The 20% Law | Maintain >20% resource headroom per pod; zero OOMKills permitted. |
| Rule 5 | Ground Truth Lock | Never trust runtime state; reconcile only against the Whitelist. |
| Rule 7 | Stable-200 Law | Mandate the 16G RAM / 200G Disk / 4-CPU VM baseline. |
| Rule 8 | The Browser Lock | Interaction with GitHub MUST be terminal-only; no browser agents. |
| Rule 9 | Execution Guard | No system modifications without unambiguous approval ("GO", "DO IT"). |
| Rule 10 | Sovereign Save | Pushing a checkpoint to GitHub is MANDATORY after each SOP milestone. |

## Restoration Roadmap (SOP Sequence)

| Phase | SOP Link | Objective | Action |
| :--- | :--- | :--- | :--- |
| I: Forge | [SOP-01](./ops/SOP-01-HOST-PURGE.md) | Host Purge | Total VM erasure and workspace cleanup. |
| | [SOP-02](./ops/SOP-02-VM-PROVISION.md) | Provisioning | Spawn Stable-200 VM with en0 bridge. |
| | [SOP-03](./ops/SOP-03-CLUSTER-BOOTSTRAP.md) | Bootstrap | Install MicroK8s v1.29 and core persistence. |
| II: Assembly | [SOP-04](./ops/SOP-04-SOURCE-FETCH.md) | Mirror Fetch | Re-establish local source from the GitHub Anchor. |
| | [SOP-05](./ops/SOP-05-BIBLE-FIXES.md) | Bible Patches | Inject hardening fixes into the fresh source code. |
| | [SOP-06](./ops/SOP-06-LITE-CONFIG.md) | Lite-Config | Enforce the 8-service mandated whitelist. |
| III: Rollout | [SOP-07](./ops/SOP-07-BACKOFF-LAW.md) | Backoff Law | Deploy services with a mandatory 120s cooldown. |
| | [SOP-08](./ops/SOP-08-DATA-TEST.md) | Data Load | Execute the OFC22 data bootstrap. |
| IV: Audit | [SOP-09](./ops/SOP-09-UI-AUDIT.md) | UI Audit | Confirm all 13 WebUI modules load in <3 seconds. |
| | [SOP-10](./ops/SOP-10-ACCEPTANCE.md) | Acceptance | Final resource and functionally sign-off. |

## Mandated 8-Service Whitelist

The enclave is functionally limited to these 8 atomic services. Any other detected service must be purged under [SOP-01](./ops/SOP-01-HOST-PURGE.md):

1. contextservice
2. deviceservice
3. serviceservice
4. sliceservice
5. pathcompservice (frontend & backend)
6. dltservice
7. interdomainservice
8. webuiservice

## Repository Structure

*   [ops/](./ops/): Standard Operating Procedures (SOP-01 to SOP-10).
*   [skills/](./skills/): Portable agent instructions ([Succession Skill](./skills/cogctrl_skill.md)).
*   [SOVEREIGN_BIBLE.md](./SOVEREIGN_BIBLE.md): The mandatory architectural governance document.
*   [System_Bootstrap_Anchor.md](./System_Bootstrap_Anchor.md): The technical baseline for recovery.

## First Command (Recovery)

Execute this from any fresh terminal to re-establish the environment:
```bash
git clone https://github.com/gintatkinson/cogctrl-v01.git && cd cogctrl-v01 && ./System_Bootstrap_Anchor.md
```

---
**Mission Status**: SOP-04 (SYNCHRONIZING SOURCE)
**Target Host**: 192.168.2.21
**Checkpoints**: Synchronized on GitHub
