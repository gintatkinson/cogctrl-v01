# SOVEREIGN COGCTRL ARCHITECTURAL BIBLE

## Governance Rules (Meta-Cognitive Locks)

### Rule 1: The Succession Law (Documentation-First)
- **Directive**: Every bug encountered or dependency added MUST first be documented in the Succession Skill or this Bible BEFORE applying the fix.
- **Action**: Prevent "Wisdom Loss" by maintaining a persistent ledger of all architectural corrections.

### Rule 2: The Ground Zero Law (Zero-Anchor Reset)
- **Directive**: If the system's "Source of Truth" is compromised or deviates from this Bible, do not attempt to "patch" the failure.
- **Action**: Execute a total "Ground Zero" purge (VM deletion and workspace reset) and rebuild from the official ETSI Master.

### Rule 3: The Audit-First Law (13-Screen UI Success)
- **Directive**: System "Health" is NOT defined by backend logs or pod status alone.
- **Action**: A deployment is only verified as successful when all 13 primary WebUI modules load correctly within the 3-second limit.

### Rule 5: Meta-Cognitive Ground Truth Lock
- **Directive**: Never trust the runtime state (kubectl get pods) as a benchmark for architectural correctness. 
- **Action**: Reconcile active services only against the mandated 8-service whitelist.

### Rule 6: The 120s Backoff Law (Deployment Throttle)
- **Directive**: To prevent "Handshake Storms" and gRPC timeouts on ARM64, services must be deployed with a mandatory cooldown.
- **Action**: Enforce a 120-second sleep between each core service activation.

### Architectural Silence Directive
- **Directive**: Any service discovered in the cluster that is NOT in the mandated Lite-Configuration (e.g., Monitoring, Load-Generator, Kafka) is considered unauthorized.
- **Action**: Purge unauthorized services immediately. Do not attempt to fix or 'resuscitate' components outside the 8-service enclave.

### Ground Zero Protocol
- **Directive**: 'Ground Zero' is defined as a total VM purge and new spawn.
- **Action**: Execute 'multipass delete --purge' followed by a clean launch whenever the architecture is compromised.

### ARM64 Native Compliance
- **Directive**: All service health probes must be ARM64-compatible.
- **Action**: Inject only the 'v0.4.34-linux-arm64' grpc_health_probe binary during stabilization.

### Rule 11: The Minimalism Lock (Configuration Over Modification)
- **Directive**: No code or manifest modifications are permitted if a configuration variable, environment variable, or official script can achieve the same result.
- **Action**: Always prioritize standard configuration patterns (e.g., `TFS_COMPONENTS` in `tfs.sh`) over manual "hacking" of YAMLs or source code. Any non-trivial modification must be cross-referenced against the original ETSI baseline and explicitly approved.

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

### Rule 8: Web-Access Sovereignty (The Browser Lock)
- **Directive**: The AI Agent MUST NEVER use the browser subagent or any web-access tool to interact with GitHub. 
- **Action**: Use ONLY the terminal/git-cli for all repository operations. Direct WebUI interaction via an agent is an architectural breach.

### Rule 9: Explicit Authorization Lock (The Execution Guard)
- **Directive**: The AI Agent MUST NEVER initiate system-modifying operations (builds, deployments, or resets) based on informational queries or ambiguous responses. 
- **Action**: Proceed ONLY upon receiving a clear, total approval or a direct order (e.g., "GO", "COMMENCE", "EXECUTE"). Any ambiguity MUST result in a halt and a request for confirmation.

### Rule 10: The Persistence Checkpoint (Sovereign Save)
- **Directive**: After the successful completion of each SOP transition (e.g., SOP-02 finish), the AI Agent MUST push a "Checkpoint Commit" to GitHub.
- **Action**: Use `git commit -m "CHECKPOINT: SOP-XX COMPLETE"` followed by a push to ensure the mission remains recoverable mid-restoration.
