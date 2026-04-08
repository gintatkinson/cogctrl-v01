# Recovery Plan: Sovereign CogCtrl Enclave Restoration

The system has experienced a "pollution event" where unauthorized deployments were initiated in the `default` namespace, likely due to a namespace context failure. While the core 8 services are running in the `tfs` namespace, the `dltservice` is missing from the mandated whitelist, and `nbiservice` shows signs of historical instability (22 restarts) due to Kafka connectivity warnings.

## User Review Required

> [!IMPORTANT]
> **Unauthorized Deployments Found**: Deployments for `context`, `device`, `service`, etc., were found failing in the `default` namespace. These will be purged to satisfy **Rule 25 (Architectural Silence)**.
> 
> **Whitelist Discrepancy**: `dltservice` is missing from the `tfs` namespace and the `tfs_runtime_env_vars.sh` whitelist, violating **Rule 41 (Sovereign Whitelist)**. I propose adding `dlt` to the restoration sequence.

## Proposed Changes

### [Component] Kubernetes Cluster Cleanup
#### [DELETE] Unauthorized Deployments in `default` namespace
- Purge all `tfs` related deployments/pods in the `default` namespace.

### [Component] Enclave Configuration
#### [MODIFY] [tfs_runtime_env_vars.sh](file:///Users/perkunas/.gemini/antigravity/scratch/tfs_runtime_env_vars.sh)
- Add `dlt` to `TFS_COMPONENTS`.

### [Component] Deployment Tooling & Forensic Fixes
#### [MODIFY] [component.sh](file:///Users/perkunas/.gemini/antigravity/scratch/deploy/component.sh)
- Add specialized build logic for `dlt` component.
#### [MODIFY] [GenericGrpcServiceAsync.py](file:///Users/perkunas/.gemini/antigravity/scratch/src/common/tools/service/GenericGrpcServiceAsync.py)
- **FORENSIC FIX**: Convert `start()` method to `async def` to resolve `SyntaxError: 'await' outside async function`.
#### [MODIFY] [Dockerfile (DLT Gateway)](file:///Users/perkunas/.gemini/antigravity/scratch/src/dlt/gateway/Dockerfile)
- **FORENSIC FIX**: Add missing `COPY proto/ipowdm.proto ./proto/ipowdm.proto`.

### [Component] Enclave Restoration (SOP-06-RESTORE-FINAL)
#### [EXECUTE] DLT Secret Creation
- Manually create `dlt-keystone`, `dlt-signcerts`, and `dlt-ca-crt` secrets in the `tfs` namespace using placeholders to satisfy the manifest requirements.
#### [EXECUTE] `deploy/component.sh dlt`
- Deploy the missing `dltservice` following **Rule 6 (120s Backoff Law)**.
#### [VERIFY] `nbiservice` Stability
- Monitor Kafka connectivity logs periodically.

## Open Questions

- Should I proceed with the **Rule 2 (Ground Zero Law)** total purge if the NBI service continues to show Kafka metadata warnings, or is a "live fix" of the configuration authorized?
- Confirm if `dltservice` was omitted from the environment script for a specific hardware limitation on this ARM64 node.

## Verification Plan

### Automated Tests
- `multipass exec cogctrl-node -- microk8s kubectl get pods -n default` (Should be empty of TFS pods).
- `multipass exec cogctrl-node -- microk8s kubectl get pods -n tfs` (Should show 9/9 Ready).
- `bash checkpoint.sh` (Should pass for `SOP-06-RESTORE-FINAL`).

### Manual Verification
- **13-Screen WebUI Audit**: User to verify module loading performance.
