# SOP-10: Ultimate Acceptance (Final Handoff)
**Version**: 17.0 (Ground Zero)
**Target**: `cogctrl-node` VM

This SOP defines the final certification of the Sovereign Enclave. Once these criteria are met, the system is considered hardened and ready for production handoff.

## 1. Prerequisites
- Confirm **SOP-09-UI-AUDIT.md** is complete.
- Confirm all 8 core services are stable for >1 hour.

## 2. Acceptance Audit Steps
### Step 1: The 20% Resource Law (Rule 4)
Verify that every service maintains a resource buffer. There must be zero pods with OOMKills or high CPU throttling.
```bash
# Check pod resources versus limits
microk8s kubectl top pods -n cogctrl
```
*Expected Result: >200MB free per pod, <80% CPU usage.*

### Step 2: The 50% Disk Law (SOP-02)
Verify that the build/deploy cycle did not consume the entire 200GB allocation.
```bash
df -h
```
*Expected Result: >100GB free on root volume.*

### Step 3: Sovereign Branding Audit
Perform a final recursive search for the forbidden nomenclature:
```bash
grep -r -i "TFS" . | grep -v "etsi"
```
*Expected Result: Zero matches.*

### Step 4: Final Enclave Handoff
Mark the Enclave as **Hardened (Sovereign)** and update the Ledger.

---
**Status**: [PENDING EXECUTION]
**Verified By**: [Agent/Human Name]
**Timestamp**: [ISO-8601]
