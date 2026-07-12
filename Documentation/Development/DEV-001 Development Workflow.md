----------------------------------------------------------------------
ACP Studio

Document ID   : DEV-001
Document      : Development Workflow
Category      : Development Guide
Version       : 1.0
Status        : Approved

Review Status : Approved
Review Date   : 2026-07-10

Author        : ACP Studio Project
----------------------------------------------------------------------

# 1. Purpose

This document defines the official software development workflow adopted by the ACP Studio project.

Its purpose is to standardize the engineering process used to design, implement, validate and certify every project component.

The workflow described in this document applies to all ACP Studio software components, including Lua modules, JSFX plug-ins, infrastructure tools and technical documentation.

---

# 2. Engineering Principles

ACP Studio development follows the following engineering principles.

## Specification First

Every software component begins with an approved specification.

Implementation shall never start before the specification has been reviewed and approved.

---

## Single Responsibility

Each component shall implement one well-defined responsibility.

Large features shall be decomposed into smaller independent components whenever possible.

---

## Incremental Development

Software shall be developed incrementally.

Each implementation step introduces one functional change only.

Every increment shall be validated before continuing.

---

## Validation Before Certification

Every component shall be tested before being considered complete.

Certification is granted only after successful validation.

---

## Repository First

The Git repository is the only authoritative source of the project.

The REAPER runtime shall never be modified manually.

All runtime environments shall be generated through the deployment pipeline.

---

# 3. Development Lifecycle

Every ACP Studio component follows the same lifecycle.

```
Specification

↓

Review

↓

Approved

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

Each phase must be completed before the next phase begins.

---

# 4. Daily Development Workflow

The recommended daily workflow is:

```
Update Repository

↓

Implement One Increment

↓

Validate

↓

Run verify.sh

↓

Run deploy.sh

↓

Runtime Validation

↓

Commit
```

Only one logical change should be implemented before each validation cycle.

---

# 5. Definition of Done

A software component is considered completed only when all of the following conditions are satisfied.

- Specification completed.
- Implementation completed.
- Validation passed.
- Documentation updated.
- Deployment verified.
- Runtime validated.
- Git commit completed.

Only then may the component be considered **Certified**.

---

# 6. Component Status

Software components use the following lifecycle.

| Status | Description |
|----------|-------------|
| TODO | Work not started |
| DRAFT | Implementation in progress |
| CERTIFIED | Fully validated and completed |

Documentation uses the following lifecycle.

| Status | Description |
|----------|-------------|
| Draft | Document under development |
| In Review | Technical review in progress |
| Approved | Frozen specification |
| Certified | Implementation verified against specification |

### 6.1 Experimental Validation

When a development task depends on uncertain behavior of Lua, JSFX, REAPER APIs or any external runtime, implementation shall not begin directly in production code.

A minimal isolated experiment shall be created to validate the assumption before modifying ACP Studio production code.

Only experimentally validated behavior may be integrated into the production codebase.

---

#### Rules

- One hypothesis per experiment.
- One experiment per file.
- Experiments shall remain outside the production codebase.
- Experimental files shall never be committed.
- Production code shall contain only validated behavior.

---

# 7. Commit Guidelines

Each commit shall represent one logical development increment.

A commit should:

- Implement one responsibility.
- Be independently testable.
- Preserve a working project state.

Large multi-purpose commits should be avoided.

---

# 8. Development Rules

The following rules shall always be respected.

- One component at a time.
- One responsibility at a time.
- One validation at a time.
- One commit at a time.
- Never skip validation.
- Never deploy uncertified components.

---

# 9. Summary

The ACP Studio development workflow establishes a disciplined engineering process focused on simplicity, incremental implementation and reproducibility.

Following this workflow guarantees that every software component evolves through specification, implementation, validation and certification while preserving a stable and reproducible development environment.

The ACP Studio development philosophy can be summarized as:

```
One Component

↓

One Responsibility

↓

One Validation

↓

One Commit
```