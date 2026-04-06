# CogCtrl Sovereign Succession Ledger

This ledger is the persistent memory of all failure points, architectural compromises, and baseline shifts within the Sovereign CogCtrl enclave. This document MANDATES that past errors are never repeated.

---

## [Iteration 17.1] Architectural Breach (SOP-03 failure)
**Date**: 2026-04-06T17:47:00Z
**Failure Point**: **The Pollution Event**
- **Deviation**: Introduced standalone `kubectl` snap and manual `/usr/local/bin/helm3` wrapper scripts into the Step Zero VM.
- **Breach**: Deviation from the official TFS/MicroK8s SBOM.
- **Recovery Violation**: Attempted to "undo by editing" (deleting the pollution) instead of performing a forensic rollback.
- **Succession Warning**: Native Snap Aliases (`microk8s.kubectl -> kubectl`) MUST be the only method of tool exposure.

---

## [Iteration 17.2] Ground Zero Rollback (Recovery Start)
**Date**: 2026-04-06T17:47:30Z
**Recovery Point**: **Absolute Step Zero**
- **Action**: `multipass delete --purge cogctrl-node`.
- **Learnings**: **Rule 12 (SBOM Integrity Law)** established in the Bible to lock the distribution against external "garbage."
- **Audit Mandate**: Forensic `git status/diff` required at every SOP transition.

---
