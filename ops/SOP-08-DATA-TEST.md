# SOP-08: Data Transaction Verification (OFC22)
**Version**: 17.0 (Ground Zero)
**Target**: `cogctrl-node` VM

This SOP defines the first functional audit of the sovereign enclave. We verify that the 8 core services can correctly process a complex network topology without gRPC failures.

## 1. Prerequisites
- Confirm **SOP-07-BACKOFF-LAW.md** is complete.
- Confirm all 8 core pods are **Running (1/1)**.

## 2. Verification Steps
### Step 1: Execute the Bootstrap Mock
Run the standard ETSI bootstrap script to load the OFC22 scenario:
```bash
# Deploys Contexts, Topologies, and Devices
./src/tests/ofc22/run_test_01_bootstrap.sh
```

### Step 2: Transaction Integrity Audit
Monitor the logs for any gRPC status codes other than `OK`:
```bash
# Check the Context service for errors
microk8s kubectl logs -n cogctrl deploy/contextservice | grep -v "OK"
```
*Expected Result: Zero non-OK status codes.*

### Step 3: Database Verification
Confirm that the devices have been persisted in the SQL backend:
```bash
# Verify via CLI if direct access available, otherwise WebUI (SOP-09)
```

---
**Status**: [PENDING EXECUTION]
**Verified By**: [Agent/Human Name]
**Timestamp**: [ISO-8601]
