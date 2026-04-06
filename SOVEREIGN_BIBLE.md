# SOVEREIGN COGCTRL ARCHITECTURAL BIBLE

## Governance Rules (Meta-Cognitive Locks)

### Rule 5: Meta-Cognitive Ground Truth Lock
- **Directive**: Never trust the runtime state of the cluster (kubectl get pods) as a benchmark for architectural correctness. 
- **Action**: Always cross-reference the active pods with the MANDATED service whitelist in 'deploy/tfs.sh' or this Bible.

### Architectural Silence Directive
- **Directive**: Any service discovered in the cluster that is NOT in the mandated Lite-Configuration (e.g., Monitoring, Load-Generator, Kafka) is considered unauthorized.
- **Action**: Purge unauthorized services immediately. Do not attempt to fix or 'resuscitate' components outside the 8-service enclave.

### Ground Zero Protocol
- **Directive**: 'Ground Zero' is defined as a total VM purge and new spawn.
- **Action**: Execute 'multipass delete --purge' followed by a clean launch whenever the architecture is compromised.

### ARM64 Native Compliance
- **Directive**: All service health probes must be ARM64-compatible.
- **Action**: Inject only the 'v0.4.34-linux-arm64' grpc_health_probe binary during stabilization.

## Sovereign Lite-Configuration Whitelist (Mandated 8 Services)
1. contextservice
2. deviceservice
3. serviceservice
4. sliceservice
5. pathcompservice (frontend & backend)
6. dltservice
7. interdomainservice
8. webuiservice

## Sovereign Performance & Resource Laws

### Rule 4: The 20% Resource Law
- **Directive**: Every service maintains a functional resource buffer. 
- **Action**: Zero pods with OOMKills are permitted. Ensure >200MB free per pod and <80% CPU usage (`microk8s kubectl top pods`).

### Rule 7: The Stable-200 Resource Law
- **Directive**: Any plan deviating from the Stable-200 resource baseline is authorized ONLY by human override.
- **Action**: Mandate 16GB RAM, 200GB Disk, and 4 CPUs for the `cogctrl-node`. 

### The 3-Second Rule (Visual Acceptance)
- **Directive**: Every primary UI screen MUST load in less than 3 seconds.
- **Action**: Conduct recursive load audits for all 13 modules during final acceptance.
