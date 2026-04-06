# SOP-09: The 13-Screen Audit (Visual Acceptance)
**Version**: 17.0 (Ground Zero)
**Target**: CogCtrl WebUI

This SOP defines the manual audit of the 13-Screen UI suite. Every module MUST load securely and present consistent data to pass the Sovereign Acceptance.

## 1. Prerequisites
- Confirm **SOP-08-DATA-TEST.md** is complete.
- Confirm port-forwarding or bridge access to `http://<VM_IP>:8080/`.

## 2. Audit Steps
### Step 1: The 3-Second Rule
Every one of the following screens MUST load in **less than 3 seconds**:
1.  **Context**: The primary data anchor.
2.  **Topology**: Visual network graph.
3.  **Devices**: List of all 8 core services and resources.
4.  **Services**: Connectivity services.
5.  **Slices**: Network slicing modules.
6.  **Automation**: Workflows and policies.
7.  **L3VPN**: Virtual private network configs.
8.  **Optical**: Physical layer details.
9.  **Inventory**: Hardware details.
10. **Monitoring**: Resource usage and metrics.
11. **Statistics**: Real-time traffic data (Prometheus sync).
12. **Settings**: User and system config.
13. **About**: Version and audit trails.

### Step 2: Resource Sync Verification
Verify that the **Devices** and **Topologies** loaded via CLI (SOP-08) are visually present in the UI.

---
**Status**: [PENDING EXECUTION]
**Verified By**: [Agent/Human Name]
**Timestamp**: [ISO-8601]
