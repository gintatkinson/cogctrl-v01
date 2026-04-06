# SOP-06: Lite-Configuration (The Shortlist)
**Version**: 17.0 (Ground Zero)
**Target**: `cogctrl-enclave` Deployments

This SOP defines the **8-service Lite Configuration** required to pass the 13-Screen Audit within constrained ARM64 environments. It addresses the user's rejection of "bloated" infrastructure by decommissioning non-essential services.

## 1. Prerequisites
- Confirm **SOP-05-BIBLE-FIXES.md** is complete.
- Confirm `multipass` memory is set to >8G (Stable-200 is 16G).

## 2. Configuration Steps
### Step 1: Decommission the NBI
The `nbiservice` is explicitly removed to preserve CPU cycles on ARM64:
```bash
# Remove from all deployment manifests
sed -i '/nbiservice/d' manifests/tfs-install.yaml
```

### Step 2: Enforce the Core Shortlist
Ensure ONLY the following 8 services are deployed:
1.  **Context**: `contextservice`
2.  **Device**: `deviceservice`
3.  **Pathcomp**: `pathcompservice`
4.  **Service**: `serviceservice`
5.  **Slice**: `sliceservice`
6.  **Load-Gen**: `load_generatorservice`
7.  **Monitoring**: `monitoringservice`
8.  **WebUI**: `webuiservice`

### Step 3: Verify Shortlist Alignment
Confirm the manifest build script only includes the 8 core services:
```bash
# Verify with build audit
grep "service" manifests/tfs-install.yaml | wc -l
# Expected Result: 8
```

---
**Status**: [PENDING EXECUTION]
**Verified By**: [Agent/Human Name]
**Timestamp**: [ISO-8601]
