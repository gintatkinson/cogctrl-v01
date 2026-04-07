# The Hardened Sovereign Sequence (Iteration 18)

This mission-critical SOP suite replaces the legacy SOPs (01-10). It is derived directly from the **TeraFlowSDN (TFS) Hardened Distribution** and strictly follows **Rule 12 (SBOM Integrity Law)**.

## SOP-03: Hardened Runtime Establishment (The Sovereign Shell)
1.  **Bootstrap Kubernetes**: `sudo snap install microk8s --classic --channel=1.29/stable`.
2.  **Official Aliases**: `sudo snap alias microk8s.kubectl kubectl` and `sudo snap alias microk8s.helm3 helm3`.
3.  **Internal Snap Symlink**: `sudo ln -sf /snap/bin/docker /usr/bin/docker`.
4.  **Enable Add-ons**: `microk8s enable dns registry hostpath-storage ingress`.

## SOP-05: ARM64 Platform Alignment (The Forensic Patch)
1.  **Patch src/pathcomp/backend/Dockerfile**: Add `uuid-dev` to the native build layer.
2.  **Patch src/pathcomp/backend/Makefile**: Map the ARM64-specific `glib-2.0` include paths.
3.  **Patch manifests/cockroachdb/single-node.yaml**: Ensure `storageClassName: microk8s-hostpath` is explicitly declared.

## SOP-06: Script-First Execution (The Sovereign Deployment)
1.  **Synchronization**: Ensure `/home/ubuntu/tfs-main` matches the cloned repository.
2.  **Bootstrap Entry Point**: `source my_deploy.sh`.
3.  **Persistence Cascade**: Execute `./deploy/crdb.sh`, `./deploy/nats.sh`, and `./deploy/qdb.sh`.
4.  **Service Cascade (120s Law)**: Deploy the 8 core services with the mandatory backoff.

## SOP-09: Acceptance Audit (The Ground Zero Standard)
1.  **gRPC Health Check**: Verify `grpc_health_probe` on all 8 services.
2.  **13-Screen WebUI Audit**: Complete the visual verification with a **3-second maximum latancy** limit.
3.  **Succession Save**: Push the final `SUCCESSION_LEDGER.md` and `RECOVERY_SIGNAL.sh` to GitHub.
