# SOP-04: Sovereign Anchor Fetch (The Snapshot)
**Version**: 17.0 (Ground Zero)
**Target**: `cogctrl-node` VM

This SOP defines the retrieval of the pure ETSI source code. To ensure "Ground Zero" purity, we use a tarball snapshot to avoid inheriting legacy git branches or contaminated history.

## 1. Prerequisites
- Confirm **SOP-03-CLUSTER-BOOTSTRAP.md** (VM Spec) is ready.
- Confirm Internet access within the VM.

## 2. Fetching Steps
### Step 1: Download the Master Snapshot
Download the official ETSI tarball directly into the `cogctrl-enclave` directory:
```bash
wget https://labs.etsi.org/rep/tfs/controller/-/archive/master/controller-master.tar.gz
```

### Step 2: Extract and Anchoring
Extract the source and remove the archive to maintain a clean workspace:
```bash
tar -xzf controller-master.tar.gz --strip-components=1
rm controller-master.tar.gz
```

### Step 3: Initialize Sovereign Git Baseline
Create a new, local Git repository. This is the **CogCtrl Sovereign Baseline**:
```bash
git init
git add .
git commit -m "Initial Sovereign Baseline (Iteration 17 - Ground Zero)"
```

### Step 4: Verify Source Integrity
Confirm the presence of core manifest and build files:
```bash
ls -F
# Expected: manifests/, src/, proto/, bootstrap.sh
```

---
**Status**: [PENDING EXECUTION]
**Verified By**: [Agent/Human Name]
**Timestamp**: [ISO-8601]
