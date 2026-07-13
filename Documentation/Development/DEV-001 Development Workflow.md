ACP Studio
DEV-001 Engineering Workflow
----------------------------

Document ID
DEV-001

Status
Certified

Version
4.0

---

Purpose

Define the official engineering workflow governing the development,
validation, certification, and maintenance of ACP Studio software.

---

1. Engineering Requirements

Every ACP Studio component shall satisfy the following engineering
requirements.

• Every component shall originate from an approved specification.

• Every component shall implement a single well-defined responsibility.

• Every implementation shall be experimentally validated.

• Every implementation shall comply with the ACP Studio engineering
  architecture and coding standards.

• Every repository state submitted for certification shall contain
  only production-ready components.

• Every repository commit shall represent a certified engineering
  baseline.

----------------------------------------------------------------------

2. Engineering Workflow

Every ACP Studio component shall follow the engineering workflow
defined below.

    Specification
          │
          ▼
    Implementation
          │
          ▼
    Experimental Validation
          │
          ▼
    Architecture Review
          │
          ▼
    Repository Cleanup
          │
          ▼
    Certification
          │
          ▼
    Commit
          │
          ▼
    Tag (Milestone Only)

Engineering phases shall be completed in the defined order.

----------------------------------------------------------------------

3. Engineering Phases

3.1 Specification

Objective

Define the functional and architectural requirements of the component.

Activities

Produce an approved engineering specification defining behaviour,
interfaces, responsibilities, and acceptance criteria.

Output

Approved specification.

----------------------------------------------------------------------

3.2 Implementation

Objective

Implement the approved specification.

Activities

Develop the component according to the approved specification and
ACP Studio engineering standards.

Output

Working implementation.

----------------------------------------------------------------------

3.3 Experimental Validation

Objective

Verify that the implementation satisfies the approved specification.

Activities

Execute experimental validation, analyse the observed behaviour,
and resolve implementation defects before certification.

Output

Experimentally validated implementation.

----------------------------------------------------------------------

3.4 Architecture Review

Objective

Verify compliance with ACP Studio engineering standards.

Activities

Review the implementation to verify architectural consistency,
component responsibilities, dependencies, documentation, naming,
and coding standards.

Output

Architecture approved.

----------------------------------------------------------------------

3.5 Repository Cleanup

Objective

Prepare the repository for certification.

Activities

Remove temporary and obsolete artifacts and verify repository
consistency prior to certification.

Output

Clean repository.

----------------------------------------------------------------------

3.6 Certification

Objective

Confirm that the component satisfies all engineering requirements.

Activities

Verify completion of the engineering workflow and approve the
component for inclusion in the certified baseline.

Output

Certified component.

----------------------------------------------------------------------

3.7 Commit

Objective

Record a certified engineering baseline.

Activities

Commit the certified repository state.

Output

Repository history updated.

----------------------------------------------------------------------

3.8 Tag

Objective

Identify an official project milestone.

Activities

Create the official milestone tag for the certified baseline.

Output

Certified project milestone.

----------------------------------------------------------------------

4. Repository Requirements

Before certification, the repository shall satisfy the following
requirements.

• No temporary files.
• No obsolete source code.
• No experimental artifacts.
• No duplicated responsibilities.
• No unresolved TODO entries.
• No unresolved FIXME entries.
• Documentation updated.
• CHANGELOG updated.

----------------------------------------------------------------------

5. Development Rules

The following rules are mandatory.

• Engineering phases shall not be skipped.

• Certification shall not begin before successful Experimental
  Validation.

• Repository Cleanup shall be completed before Certification.

• Experimental code shall not be committed.

• Certified baselines shall not be modified without an approved
  specification.

• Milestone tags shall identify certified repository baselines.

----------------------------------------------------------------------

End of Document