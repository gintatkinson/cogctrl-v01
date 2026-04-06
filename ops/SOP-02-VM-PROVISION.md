# SOP-02: VM Provisioning (Stable-200 / Network Bridge)
**Version**: 17.0 (Ground Zero)
**Target**: Multipass ARM64

This SOP defines the assembly of the **'Sovereign Node'** (formerly `tfs-vm-stable`). This configuration is anchored in the **Stable-200 Resource Law** to eliminate build-time DiskPressure and gRPC timeouts.

## 1. Prerequisites
- Confirm **SOP-GLOBAL-CONFIG.md** parameters are available.
- Confirm host `en0` (Wi-Fi) or other bridge is active.

## 2. Provisioning Steps
### Step 1: Launch the Sovereign Node
Execute the following precise command to provision the 16GB/200GB environment:
```bash
multipass launch \
  --name cogctrl-node \
  --cpus 4 \
  --memory 16G \
  --disk 200G \
  --network name=en0,mode=manual \
  24.04
```
*Note: Mode 'manual' is used to allow the human/agent to configure the bridge IP if needed, or simply for the stable bridge attachment.*

### Step 2: Establish the Enclave Directory
Log into the VM and create the persistent workspace:
```bash
multipass exec cogctrl-node -- mkdir -p ~/cogctrl-enclave
```

### Step 3: Verify Resource Allocation
Confirm the VM has the correct specs before proceeding:
```bash
multipass info cogctrl-node
```
*Expected Result: 16G RAM, 200G Disk, en0 attached.*

---
**Status**: [PENDING EXECUTION]
**Verified By**: [Agent/Human Name]
**Timestamp**: [ISO-8601]
