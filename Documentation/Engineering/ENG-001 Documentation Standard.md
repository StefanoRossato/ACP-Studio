ACP Studio
ENG-001 Documentation Standard
------------------------------

Document ID
ENG-001

Status
Certified

Version
4.0

---

Purpose

Define the official documentation standard governing the creation,
maintenance, revision, certification, and lifecycle of ACP Studio
engineering documentation.

---

1. Documentation Requirements

Every ACP Studio engineering document shall satisfy the following
requirements.

• Every document shall have a unique document identifier.

• Every document shall define its purpose.

• Every document shall declare its status.

• Every document shall declare its version.

• Every document shall comply with this documentation standard.

---

2. Documentation Workflow

Every engineering document shall follow the documentation workflow
defined below.

```
Specification
      │
      ▼
Draft
      │
      ▼
Experimental
      │
      ▼
Documentation Review
      │
      ▼
Documentation Cleanup
      │
      ▼
Certification
      │
      ▼
Revision
      │
      ▼
Publication
```
Documentation phases shall be completed in the defined order.

---

3. Document Structure

Every engineering document shall use the following structure.


```
Document Header

      ▼

    Purpose

      ▼

Numbered Sections

      ▼

End of Document
```

Additional sections may be introduced when required, provided the
overall structure remains consistent.

---

## 4. Engineering Structure Standards

This section defines the mandatory structural standards adopted throughout the ACP Studio engineering project.

### 4.1 Lua Module Skeleton

Additional top-level sections shall require a revision of this standard.

Every Lua source file shall follow the certified ACP Studio Module Skeleton.

The section order is mandatory and shall not be modified.

Every module shall contain the following sections:

```text
----------------------------------------------------------------------
-- Header
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Module
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Dependencies
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Constants
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Construction
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Private Methods
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Public Interface
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Module Export
----------------------------------------------------------------------
```

All sections shall always be present, even if temporarily empty.

Development shall consist of progressively populating the predefined sections while preserving the original structure.

The Module Skeleton provides the following engineering benefits:

* Consistent source file organization.
* Predictable code navigation.
* Reduced review effort.
* Uniform engineering standards across the entire project.

---

### 4.2 Document Header

Every engineering document shall use the following header.

---

ACP Studio

XXX-000 Document Title

---

**Document ID**

XXX-000

**Status**

Draft | Experimental | Certified | Deprecated

**Version**

1.0

---

**Purpose**

Describe the purpose of the document.

---

The document header shall be identical for every ACP Studio engineering document.


5. Document Sections

Each section shall describe a single subject.

Sections shall be numbered sequentially.

Section titles shall be concise and descriptive.

Information shall not be duplicated across multiple sections.

Documents shall maintain a consistent level of abstraction within
each section.

---

6. Writing Style

Engineering documentation shall be clear, concise, consistent, and
verifiable.

Normative statements shall use "shall".

Informative statements should use precise and unambiguous language.

Terminology shall remain consistent throughout the document.

Implementation details shall be documented only when required by the
document purpose.

Examples shall support the specification but shall not define it.

---

7. Document Lifecycle

Every engineering document shall follow the lifecycle defined below.

```
Draft
      │
      ▼
Experimental
      │
      ▼
Certified
      │
      ▼
Deprecated
```

Document status shall accurately represent the current maturity of
the document.

Certified documents shall evolve through documented revisions.

---

8. Document Identification

Every engineering document shall have a unique document identifier.

Document identifiers shall use the following format.

XXX-000

The alphabetical prefix identifies the document family.

The numerical suffix uniquely identifies the document within its
document family.

The document identifier is the authoritative identifier of the
document.

Document headers shall not duplicate information already defined by
the document identifier.

---

9. Documentation Rules

The following rules are mandatory.

• Every document shall comply with this standard.

• Every document version shall use the Major.Minor format.

• Every document revision shall be versioned.

• Every document revision shall be traceable.

• Certified documents shall not be modified without a new revision.

• Obsolete documents shall be deprecated rather than deleted.

• Documentation shall be maintained together with the corresponding
engineering artifacts.

• Documentation reviews shall correct only critical blocking issues.

• Non-blocking improvements shall require a new specification and a
new document revision.

---

End of Document
