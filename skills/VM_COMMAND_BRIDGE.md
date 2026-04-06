# Skill: VM-Native Command Execution (The Mirror-Path Law)

## Problem Statement
When executing commands against a virtual machine via a host-side wrapper (e.g., `multipass exec`), the host's shell remains the context for piping and file resolution. This leads to:
1. **Path-Leakage**: `find` in the VM returns VM-paths (`/home/ubuntu/...`), but `xargs grep` on the host tries to find those paths on the Mac.
2. **Permission Denied**: The host shell doesn't have permissions to VM-internal roots.
3. **Execution Format Errors**: Scripts or binaries copied incorrectly between host and VM environments.

## The Never-Again Resolution
**ALL** composite commands (pipes, redirects, loops) targeted at the VM **MUST** be wrapped in a single quoted string to ensure the entire execution pipeline occurs within the VM's shell.

### Correct Pattern
Always encapsulate the full command string:
```bash
multipass exec cogctrl-node -- bash -c "ls -la /home/ubuntu/ && find . -name '*.yaml' | xargs grep 'nbiservice'"
```

### Incorrect Pattern (The Failure Pattern)
Never pipe between a VM-wrapped command and a host-side command:
```bash
multipass exec cogctrl-node -- find /home/ubuntu/ -name "*.yaml" | xargs grep "nbiservice"  # FAILURE: grep runs on host
```

## Mirror-Bridge Skill Check
Before running any analysis on the VM:
1. Identify the full pipeline needed.
2. Wrap it in `bash -c "..."` for absolute control.
3. Use absolute paths relative to the VM root.
