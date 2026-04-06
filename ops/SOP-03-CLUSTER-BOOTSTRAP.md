# SOP-03: Cluster & OS Bootstrap (The Sovereign Shell)
**Version**: 17.0 (Ground Zero)
**Target**: Ubuntu 24.04 (Multipass)

This SOP establishes the persistent storage and message bus foundations required for the CogCtrl services. All commands are executed within the `cogctrl-node` VM.

## 1. Prerequisites
- Confirm **SOP-02-VM-PROVISION.md** is complete.
- Confirm Internet access within the VM.

## 2. Bootstrap Steps
### Step 1: Install MicroK8s (v1.29+)
Provision the Kubernetes runtime with the stable v1.29 channel:
```bash
sudo snap install microk8s --classic --channel=1.29/stable
sudo usermod a G microk8s $USER
sudo chown f R $USER ~/.kube
newgrp microk8s
```

### Step 2: Enable Core Add-ons
Activate the mandatory cluster services:
```bash
microk8s enable dns registry storage helm
```
*Note: Registry will be available at localhost:32000.*

### Step 3: Deploy Persistent Persistence
Deploy the database and message bus foundations:
```bash
# Deploys CockroachDB, NATS, QuestDB, and Kafka (The CogCtrl Core)
./deploy/persist.sh
```

### Step 4: Verify Cluster Readiness
Confirm the node is Ready and persistence pods are running:
```bash
microk8s kubectl get nodes
microk8s kubectl get pods -A
```
*Expected Result: Node Status=Ready, Storage pods=Running.*

---
**Status**: [PENDING EXECUTION]
**Verified By**: [Agent/Human Name]
**Timestamp**: [ISO-8601]
