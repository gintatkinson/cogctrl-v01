# SOP-07: The Backoff Law (Tiered Rollout)
**Version**: 17.0 (Ground Zero)
**Target**: `cogctrl-enclave` Deployment Scripts

This SOP defines the **Tiered Deployment Sequence** required to prevent gRPC handshake storms and gRPC timeouts during the startup of the 8-service enclave.

## 1. Prerequisites
- Confirm **SOP-06-LITE-CONFIG.md** is complete.
- Confirm cluster storage and message bus foundations are running.

## 2. Deployment Steps (The Backoff Sequence)
Services MUST be deployed in the following **5 tiers**, with a **mandatory 120-second sleep** between each activation.

### Tier 0: The Anchor
1.  Deploy **`contextservice`**.
2.  **`sleep 120`**.

### Tier 1: The Infrastructure Layer
1.  Deploy **`deviceservice`**.
2.  **`sleep 120`**.

### Tier 2: The Compute Layer
1.  Deploy **`pathcompservice`**.
2.  **`sleep 120`**.

### Tier 3: The Orchestration Layer
1.  Deploy **`serviceservice`**.
2.  Deploy **`sliceservice`**.
3.  **`sleep 120`**.

### Tier 4: The Interface Layer
1.  Deploy **`load_generatorservice`**.
2.  Deploy **`monitoringservice`**.
3.  Deploy **`webuiservice`**.

---
**Status**: [PENDING EXECUTION]
**Verified By**: [Agent/Human Name]
**Timestamp**: [ISO-8601]
