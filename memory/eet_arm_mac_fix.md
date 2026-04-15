---
name: EET ARM Mac Fix
description: Fix for EET mod installation on Apple Silicon Macs - weidu binary placement issue
type: project
---

EET (Enhanced Edition Trilogy) mod fails to install on Apple Silicon Macs with "weidu not found" error because EET's GET_SYSTEM_ARCH function doesn't recognize ARM architecture.

**Problem:**
- EET checks for system architecture using GET_SYSTEM_ARCH
- On ARM Macs, it returns `arm64` or `aarch64`
- EET only recognizes `amd64`, so arch_var stays empty
- EET then looks for binaries in `eet/bin/osx/` instead of `eet/bin/osx/aarch64/`

**Solution:**
Copy weidu binary directly to `eet/bin/osx/`:
```bash
cp weidu eet/bin/osx/
chmod +x eet/bin/osx/weidu
```

Optionally also create aarch64 folder for completeness:
```bash
mkdir -p eet/bin/osx/aarch64
cp weidu eet/bin/osx/aarch64/
```

**Why:**
When arch_var is empty, EET falls back to looking for `%MOD_FOLDER%/bin/%WEIDU_OS%/%file%%exe%` which resolves to `eet/bin/osx/weidu`.

**How to apply:**
Always apply this fix before installing EET mod on Apple Silicon Macs. The weidu binary location is:
`~/Library/Application Support/wit/weidu/macos/aarch64/weidu`
