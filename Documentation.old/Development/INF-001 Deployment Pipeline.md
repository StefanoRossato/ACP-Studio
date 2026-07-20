----------------------------------------------------------------------
ACP Studio

Document ID   : INF-001
Document      : Deployment Pipeline
Category      : Infrastructure Specification
Version       : 1.0
Status        : Approved

Review Status : Approved
Review Date   : 2026-07-10

Author        : ACP Studio Project
----------------------------------------------------------------------

# 1. Purpose

This document defines the official deployment pipeline used by ACP Studio.

The deployment pipeline is responsible for synchronizing the project repository with the REAPER runtime environment while ensuring a deterministic, reproducible and maintainable software development workflow.

The deployment infrastructure is considered a core component of ACP Studio and follows the same engineering principles adopted throughout the project.

---

# 2. Scope

This specification applies to all software components contained in the ACP Studio repository.

## Included Components

- Lua source code
- JSFX plug-ins
- Test scripts
- Infrastructure tools

## Excluded Components

- Documentation
- Development resources
- Logs
- Git metadata

---

# 3. Architecture Overview

The ACP Studio repository is the only authoritative source of the project.

The REAPER runtime is considered a generated execution environment.

```
                Repository
                     │
                     ▼
            Deployment Pipeline
                     │
                     ▼
              REAPER Runtime
                     │
                     ▼
                 Validation
```

The runtime may be destroyed and recreated at any time without affecting the repository.

No software component shall be modified directly inside the runtime.

---

# 4. Design Principles

The deployment pipeline follows four fundamental engineering principles.

## 4.1 Single Source of Truth

The Git repository is the only authoritative copy of the project.

All modifications shall be performed inside the repository.

---

## 4.2 Single Responsibility

Each deployment tool performs exactly one responsibility.

| Tool | Responsibility |
|------|----------------|
| verify.sh | Verify repository integrity |
| clean.sh | Remove ACP Studio runtime |
| deploy.sh | Deploy the repository to the REAPER runtime |

---

## 4.3 Deterministic Execution

Executing the deployment multiple times shall always produce the same runtime structure.

The deployment process shall never depend on previous executions.

---

## 4.4 Fail Fast

If any deployment phase fails, the deployment process shall terminate immediately.

Partial deployments are never permitted.

---

# 5. Design Constraints

The deployment infrastructure shall satisfy the following constraints.

## Repository is Immutable

Deployment shall never modify repository contents.

---

## Runtime is Disposable

The REAPER runtime shall always be considered disposable.

Whenever inconsistencies occur, the runtime shall be removed and recreated.

```
clean.sh

↓

deploy.sh
```

---

## Deployment is Reproducible

The deployment process shall always generate an identical runtime from the same repository revision.

---

## Infrastructure is Modular

Each infrastructure tool shall remain independently executable, testable and maintainable.

No infrastructure tool shall implement the responsibilities of another tool.

---

# 6. Repository Layout

```
ACP Studio/

├── ACP_Main.lua
├── Core/
├── Documentation/
├── JSFX/
├── Logs/
├── Resources/
├── Tests/
├── Tools/
├── README.md
├── CHANGELOG.md
└── .gitignore
```

The repository contains the complete project source code.

---

# 7. Runtime Layout

Only executable components are deployed.

```
REAPER/

├── Scripts/
│   └── ACP Studio/
│
└── Effects/
    └── ACP Studio/
```

Documentation and development assets are never deployed.

---

# 8. Runtime Deployment Workflow

The deployment pipeline consists of four sequential phases.

```
Verify Repository

↓

Clean Runtime

↓

Deploy Runtime

↓

Execute Tests
```

Each phase must complete successfully before the next phase begins.

---

# 9. Development Workflow

The official ACP Studio software lifecycle is:

```
Specification

↓

Implementation

↓

Validation

↓

Certification

↓

Commit

↓

Deployment

↓

Runtime Validation
```

Deployment shall never occur before component certification.

---

# 10. Deployment Phases

## Phase 1 — Repository Verification

Tool

```
verify.sh
```

Responsibilities

- Verify repository structure.
- Verify required files.
- Verify required directories.
- Return Exit Code 0 on success.
- Abort deployment on failure.

---

## Phase 2 — Runtime Cleanup

Tool

```
clean.sh
```

Responsibilities

Remove only:

```
REAPER/Scripts/ACP Studio

REAPER/Effects/ACP Studio
```

No unrelated REAPER files shall ever be removed.

---

## Phase 3 — Runtime Deployment

Tool

```
deploy.sh
```

Responsibilities

- Execute `verify.sh`
- Execute `clean.sh`
- Create runtime directories
- Deploy Lua source files
- Deploy JSFX plug-ins
- Report deployment status

`deploy.sh` orchestrates previously certified infrastructure tools and shall never duplicate their responsibilities.

---

## Phase 4 — Validation

Typical validation sequence:

```
Baseline_Test.lua

↓

Analyzer_Test.lua

↓

Functional Tests
```

---

# 11. Runtime Contents

The following repository components are deployed.

| Component | Runtime |
|-----------|:------:|
| ACP_Main.lua | ✓ |
| Core/ | ✓ |
| Tests/ | ✓ |
| JSFX/ | ✓ |

---

# 12. Runtime Exclusions

The following repository contents shall never be deployed.

| Component |
|-----------|
| Documentation/ |
| Logs/ |
| Resources/ |
| Tools/ |
| .git/ |
| .gitignore |
| README.md |
| CHANGELOG.md |

These files remain inside the repository only.

---

# 13. Tool Responsibilities

The deployment tools are intentionally independent.

```
verify.sh

Verifies repository integrity only.

↓

clean.sh

Removes the runtime only.

↓

deploy.sh

Coordinates deployment only.
```

No deployment tool shall implement the responsibilities of another tool.

---

# 14. Tool Dependencies

Infrastructure dependency graph:

```
verify.sh

↓

clean.sh

↓

deploy.sh

↓

Baseline_Test.lua

↓

Analyzer_Test.lua
```

Every infrastructure tool shall be independently executable and testable.

---

# 15. Error Handling

The deployment pipeline follows a Fail Fast strategy.

If any phase fails:

- Stop immediately.
- Return Exit Code 1.
- Execute no further operations.

Partial deployments are always considered invalid.

---

# 16. Exit Codes

| Exit Code | Meaning |
|-----------|---------|
| 0 | Success |
| 1 | Failure |

---

# 17. Version History

| Version | Description |
|----------|-------------|
| 1.0 | Initial infrastructure specification. |

---

# 18. Infrastructure Status

| Component | Status | Version |
|-----------|--------|---------|
| verify.sh | Certified | 1.0 |
| clean.sh | Certified | 1.0 |
| deploy.sh | Draft | — |
| Development Workflow | Draft | — |

---

# 19. Future Extensions

The deployment architecture is designed to support future enhancements.

Possible extensions include:

- Incremental deployment
- Runtime backup
- Runtime version verification
- Dry-run mode
- Verbose mode
- Checksum verification
- Automatic REAPER restart
- Continuous Integration (CI)
- Deployment reports

---

# 20. Summary

The deployment pipeline establishes a deterministic and reproducible software deployment process for ACP Studio.

The repository is the only authoritative source of the project.

The REAPER runtime is a disposable execution environment generated exclusively through the deployment pipeline.

All ACP Studio runtime environments shall be generated exclusively through the deployment pipeline.

Manual modifications inside the runtime are not supported.

This architecture guarantees consistency, maintainability and repeatability throughout the entire software development lifecycle.

A reproducible runtime is the foundation of every certified ACP Studio component.