ACP Studio
TST-001 Test Template Standard
------------------------------

Document ID
TST-001

Status
Certified

Version
1.0

---

Purpose

Define the standard structure, lifecycle, certification process, and
usage rules for ACP Studio certified test templates.

---

1. Scope

This document defines the engineering standard for ACP Studio
certified test templates.

This standard applies to every `*_Test.lua` module developed within
ACP Studio.

This document defines the standard structure, generation rules,
certification process, and lifecycle of certified test templates.

This document does not define test implementation, testing
strategies, or production module behavior.

---

2. Test Template Philosophy

Certified test templates are engineering artifacts.

Certified test templates define the standard structure of ACP Studio
test modules.

Certified test templates shall be reusable, maintainable, and
experimentally validated.

Certified test templates shall not be considered examples or sample
code.

Certified test templates shall be suitable for direct production use.

Certified test templates shall evolve through controlled revisions.

Engineering improvements identified during test module development
shall be applied to the certified template before being adopted by
production test modules.

---

3. Certified Template Lifecycle

Every certified test template shall follow the lifecycle defined
below.

Need
  │
  ▼
Design
  │
  ▼
Experimental Validation
  │
  ▼
Certification
  │
  ▼
Production Use
  │
  ▼
Revision

---

4. Test Module Structure

Every ACP Studio test module shall be generated from the certified
Test Skeleton.

Every ACP Studio test module shall follow the standard structure
defined by the certified Test Skeleton.

The standard structure shall provide a consistent organization for
all ACP Studio `*_Test.lua` modules.

Only the certified Test Skeleton may define the standard structure of
ACP Studio test modules.

Structural modifications identified during test module development
shall be applied to the certified Test Skeleton before being adopted
by production test modules.

Production test modules shall not introduce structural variations
that are inconsistent with the certified Test Skeleton.

---

5. Test Setup

Every ACP Studio test module shall initialize the test environment
through the certified Test Setup procedure.

The Test Setup shall provide a consistent execution environment for
every ACP Studio test module.

The Test Setup shall be the single entry point for test
initialization.

Production test modules shall not duplicate initialization logic
already provided by the Test Setup.

Changes to the Test Setup shall be validated through the certified
Test Skeleton before being adopted by production test modules.

---

6. Dependencies

Production modules shall be imported using the ACP Studio module
loading convention.

Test module dependencies shall be declared explicitly within the
Dependencies section.

The Test Skeleton shall define the standard organization of module
dependencies.

Dependencies shall be organized to clearly distinguish production
modules from test infrastructure.

Production test modules shall not introduce undocumented dependency
loading mechanisms.

Changes to dependency organization shall be validated through the
certified Test Skeleton before being adopted by production test
modules.

---

7. Test Skeleton

The Test Skeleton defines the standard structure of every ACP Studio
`*_Test.lua` module.

The Test Skeleton shall contain only the structural elements common
to all ACP Studio test modules.

The Test Skeleton shall not define test-specific behavior or
validation logic.

The Test Skeleton shall be maintained as a certified engineering
artifact.

Every production test module shall be generated from the certified
Test Skeleton.

The Test Skeleton shall evolve through controlled revisions and
experimental validation.

Structural improvements identified during production test module
development shall be applied to the Test Skeleton before being
adopted by production test modules.

The certified Test Skeleton is the reference implementation of the
ACP Studio Test Template Standard.

The Test Skeleton shall be the single authoritative source for the
standard structure of ACP Studio test modules.

---

8. Template Certification

Certified test templates shall be validated through experimental use
within ACP Studio.

A template shall be considered certified only after being
successfully used to generate and execute at least one production
test module.

Template certification shall verify structural correctness,
maintainability, and compatibility with the ACP Studio test
infrastructure.

Production test modules generated from the certified template shall
not require structural modifications.

Template revisions shall require a new certification whenever the
standard structure is modified.

Certified templates shall remain synchronized with the corresponding
engineering standards.

---

9. Engineering Rules

Every ACP Studio `*_Test.lua` module shall be generated from the
certified Test Skeleton.

Production test modules shall not redefine the standard structure
defined by the certified Test Skeleton.

Engineering improvements identified during test module development
shall be applied to the certified Test Skeleton before being adopted
by production test modules.

Certified test templates shall be maintained together with the
corresponding engineering documentation.

Template revisions shall be documented, versioned, and traceable.

Certified templates shall remain consistent with the ACP Studio
engineering standards and development workflow.

Obsolete templates shall be revised or deprecated rather than
duplicated.

Certified templates shall be periodically reviewed to ensure
continued compatibility with the ACP Studio test infrastructure.

---

End of Document