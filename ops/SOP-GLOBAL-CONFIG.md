# SOP-GLOBAL-CONFIG: Sovereign Enclave Parameters
**Version**: 17.0 (Ground Zero)
**Status**: Mandatory

This document defines the **Fixed Parameters** for both Humans and AI Agents. These values MUST be used in all scripts and Multipass commands to ensure the **Stable-200** baseline.

## 1. Virtual Machine Resources (Stable-200)
- **VM_NAME**: `cogctrl-node`
- **VM_CPUS**: `4`
- **VM_MEMORY**: `16G`
- **VM_DISK**: `200G`
- **VM_IMAGE**: `24.04` (Ubuntu Noble)

## 2. Network Configuration
- **VM_BRIDGE**: `en0` (Wi-Fi on MacOS Host)
- **WEBUI_PORT**: `8080` (Standard Mapping)

## 3. Sovereign Labels
- **PROJECT_NAME**: `CogCtrl`
- **NAMESPACE**: `cogctrl`
- **REGISTRY**: `localhost:32000`

---
**Verification**: Any plan deviating from these parameters is a **Rule 7 violation** (Case-Sensitive/Resource Integrity).
