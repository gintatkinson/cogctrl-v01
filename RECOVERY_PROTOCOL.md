# Sovereign Recovery Protocol (Zero-to-Hero)

This protocol defines the exact sequence required to reconstitute the Sovereign CogCtrl Enclave from a fresh host system.

## Phase 1: Host & VM Provisioning (ARM64)

1.  **Launch Instance**:
    ```bash
    multipass launch --name cogctrl-node \
      --cpus 8 \
      --memory 16G \
      --disk 50G
    ```
2.  **Environment Sync**: Clone this repository to the host and transfer to the VM:
    ```bash
    git clone https://github.com/gintatkinson/cogctrl-v01.git
    multipass transfer -r cogctrl-v01 cogctrl-node:/home/ubuntu/cogctrl-enclave
    ```

## Phase 2: Infrastructure Bootstrap (The Sovereign Shell)

Execute inside the VM:
1.  **Install MicroK8s**:
    ```bash
    sudo snap install microk8s --classic --channel=1.29/stable
    sudo microk8s enable dns registry hostpath-storage ingress
    ```
2.  **Establish Aliases**:
    ```bash
    sudo snap alias microk8s.kubectl kubectl
    sudo snap alias microk8s.helm3 helm3
    sudo ln -sf /snap/bin/docker /usr/bin/docker
    ```

## Phase 3: Enclave Hydration (Service Cascade)

1.  **Load Whitelist**:
    ```bash
    source tfs_runtime_env_vars.sh
    ```
2.  **Deploy Persistence**:
    ```bash
    ./deploy/crdb.sh
    ./deploy/nats.sh
    ./deploy/qdb.sh
    ```
3.  **Deploy Core Services (Rule 6: 120s Law)**:
    Deploy the following sequence with 120s backoff between each:
    `context`, `device`, `service`, `slice`, `pathcomp`, `dlt`, `interdomain`, `nbi`, `webui`.
    ```bash
    ./deploy/component.sh <component_name>
    ```

## Phase 4: Forensic Reconstitution (DLT Secrets)

Manually establish the DLT secrets required by the forensic patches:
```bash
mkdir -p src/dlt/gateway/keys
touch src/dlt/gateway/keys/priv_sk src/dlt/gateway/keys/cert.pem src/dlt/gateway/keys/ca.crt
kubectl create secret generic dlt-keystone --from-file=keystore=src/dlt/gateway/keys/priv_sk -n tfs
kubectl create secret generic dlt-signcerts --from-file=signcerts.pem=src/dlt/gateway/keys/cert.pem -n tfs
kubectl create secret generic dlt-ca-crt --from-file=ca.crt=src/dlt/gateway/keys/ca.crt -n tfs
```

## Phase 5: Audit & Anchoring

1.  **Verify**: Run `bash checkpoint.sh` to validate the restoration.
2.  **Acceptance**: Perform the 13-screen WebUI audit (3s limit).

---
**Status**: Reprovision-Ready.
**Anchored Files**: `deploy/component.sh`, `src/common/tools/service/GenericGrpcServiceAsync.py`, `src/dlt/gateway/Dockerfile`.
