# SOP-05: The Bible Ledger (Hardening Fixes)
**Version**: 17.0 (Ground Zero)
**Target**: `cogctrl-enclave` Source Code

This SOP defines the mandatory technical fixes derived from the Sovereign Bible. These patches MUST be applied before the first build to ensure ARM64 compatibility and WebUI accessibility.

## 1. Prerequisites
- Confirm **SOP-04-SOURCE-FETCH.md** is complete.
- Confirm source code is extracted into the workspace.

## 2. Hardening Steps
### Step 1: WebUI Path Prefix Fix
Ensure the WebUI is accessible under the `/webui` prefix for standard ingress routing:
```python
# Patch src/webui/service/WebUIService.py
# (Inject PathPrefix middleware)
```

### Step 2: ARM64 Decorator Stubs
Patch the gRPC decorator to support `arm64` specifics:
```python
# Patch src/common/method_wrappers/Decorator.py
# (Add ARM64 stubs and MetricsPool logic)
```

### Step 3: Lowercase ACL Template Fix
Correct the template name from `ACL.html` to `acl.html` (Case-Sensitive):
```bash
mv src/device/service/drivers/ietf_l2vpn/templates/ACL.html src/device/service/drivers/ietf_l2vpn/templates/acl.html
```

### Step 4: Duplicate Metrics Registration Fix
Prevent the `Prometheus.MetricsPool` from failing on duplicate registrations:
```python
# Patch src/common/metrics/MetricsPool.py
# (Add registration check)
```

---
**Status**: [PENDING EXECUTION]
**Verified By**: [Agent/Human Name]
**Timestamp**: [ISO-8601]
