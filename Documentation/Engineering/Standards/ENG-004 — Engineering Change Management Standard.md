------------------------------------------------------------------------------
ACP Studio

Specification   : ENG-004

Title           : Engineering Change Management Standard

Category        : Engineering Standards

Status          : Certified

Version         : 1.0.0

Author          : ACP Studio

Dependencies    : ENG-001, ENG-002, ENG-003

------------------------------------------------------------------------------

# 1. Purpose

This standard defines the normative requirements governing Engineering Change
Management within the ACP Studio engineering process.

Its purpose is to establish a consistent, objective, and traceable process for
initiating, evaluating, approving, implementing, and closing Engineering
Changes affecting controlled engineering artifacts.

Engineering Change Management provides a structured framework for ensuring that
all engineering changes are properly justified, assessed, authorized,
implemented, and documented throughout the engineering lifecycle.

This standard defines how Engineering Changes shall be managed to preserve the
integrity, consistency, and traceability of the ACP Studio engineering
baseline.

It does not define engineering documentation requirements, engineering review
procedures, engineering versioning rules, software implementation techniques,
or testing methodologies, which are governed by their respective Engineering
Standards.

All Engineering Changes affecting controlled engineering artifacts within the
ACP Studio project shall conform to this standard unless explicitly superseded
by another certified Engineering Standard.

# 2. Scope

This standard applies to all Engineering Changes affecting controlled
engineering artifacts managed within the ACP Studio engineering process.

Its requirements govern the initiation, evaluation, authorization,
implementation, verification, and closure of Engineering Changes throughout
the engineering lifecycle.

This standard applies to Engineering Changes involving, but not limited to:

- Engineering Standards
- Architecture Documents
- Specifications
- Design Documents
- Templates
- Guides
- References
- Source Code
- Software Modules
- Test Suites
- Test Results
- Engineering Diagrams
- Engineering Processes

This standard defines the Engineering Change Management process.

It does not define:

- Engineering documentation structure
- Engineering Review procedures
- Engineering Versioning rules
- Software architecture
- Software design principles
- Coding standards
- Implementation techniques
- Testing methodologies
- Repository management
- Source Control Systems

These subjects shall be governed by their respective Engineering Standards.

Compliance with this standard is mandatory for all Engineering Changes affecting
controlled engineering artifacts unless explicitly superseded by another
certified Engineering Standard.

# 3. Conformance

This standard is normative.

All Engineering Changes affecting controlled engineering artifacts within the
ACP Studio project shall conform to the requirements defined by this standard
unless explicitly superseded by another certified Engineering Standard.

Conformance shall be evaluated by verifying that each Engineering Change:

- is properly initiated;
- is adequately justified;
- undergoes appropriate impact analysis;
- follows the defined approval process;
- is implemented in a controlled manner;
- is verified before closure;
- preserves engineering traceability throughout its lifecycle.

Failure to satisfy mandatory Engineering Change Management requirements shall
prevent an Engineering Change from being considered compliant with this
standard.

---

## 3.1 Normative Language

The following keywords define the normative strength of statements contained
within this standard.

| Keyword | Meaning |
|----------|---------|
| **Shall** | Indicates a mandatory requirement. |
| **Should** | Indicates a recommended practice. |
| **May** | Indicates an optional behavior or capability. |

The keywords shall be interpreted consistently throughout all ACP Studio
Engineering Standards.

---

## 3.2 Normative and Informative Content

This standard may contain both normative and informative content.

Normative content defines mandatory Engineering Change Management requirements
and shall be considered authoritative.

Informative content provides explanations, rationale, examples, notes, or
background information intended to improve understanding.

Informative content shall not modify, replace, or contradict normative
requirements.

---

## 3.3 Examples

Examples are informative.

Examples illustrate Engineering Change Management concepts and recommended
practices.

Examples shall not introduce additional Engineering Change Management
requirements.

---

## 3.4 Notes

Notes are informative.

Notes provide clarification, context, or additional observations.

Notes shall not alter the meaning of normative statements.

---

## 3.5 Conflict Resolution

In the event of conflicting Engineering Change Management requirements, the
following order of precedence shall apply unless explicitly stated otherwise.

1. Certified Engineering Standards
2. Approved Engineering Standards
3. Engineering Change Management Standard
4. Engineering Change being managed

Lower-precedence requirements shall not contradict higher-precedence
requirements.

---

## 3.6 Engineering Change Management Conformance

Engineering Change Management conformance shall be verified by confirming that:

- the Engineering Change is properly documented;
- the Engineering Change is justified;
- impact analysis has been completed;
- approval has been obtained where required;
- implementation follows the approved change;
- verification activities have been completed;
- Engineering Change Records remain complete and traceable.

Only Engineering Changes satisfying these requirements shall be considered
compliant with this standard.

# 4. Definitions

This chapter defines the official Engineering Change Management terminology
used throughout the ACP Studio engineering process.

The definitions contained in this chapter are normative.

Engineering Change Management shall use the terminology defined herein
consistently. Terms defined by this standard shall not be redefined elsewhere
unless explicitly superseded by another certified Engineering Standard.

---

## 4.1 Engineering Change

An Engineering Change is a controlled modification affecting one or more
engineering artifacts, engineering processes, or engineering baselines.

An Engineering Change represents the formal unit of engineering evolution
within the ACP Studio engineering process.

---

## 4.2 Change Request

A Change Request is the formal proposal describing a requested Engineering
Change.

A Change Request shall provide sufficient information to enable engineering
evaluation and decision-making.

---

## 4.3 Impact Analysis

Impact Analysis is the engineering activity performed to identify and evaluate
the potential consequences of an Engineering Change.

Impact Analysis shall consider technical, architectural, documentation,
testing, and engineering process impacts where applicable.

---

## 4.4 Change Approval

Change Approval is the formal authorization permitting an Engineering Change
to proceed to implementation.

Approval shall be granted according to the applicable engineering authority.

---

## 4.5 Change Implementation

Change Implementation is the controlled execution of an approved Engineering
Change.

Implementation shall produce the intended engineering modifications while
preserving engineering integrity and traceability.

---

## 4.6 Change Verification

Change Verification is the engineering activity confirming that an implemented
Engineering Change satisfies its approved objectives and requirements.

Verification may include Engineering Reviews, testing, inspections, or other
appropriate verification activities.

---

## 4.7 Change Closure

Change Closure is the formal completion of the Engineering Change lifecycle.

A Change shall only be closed after successful implementation, verification,
and recording of the resulting engineering information.

---

## 4.8 Change Record

A Change Record is the controlled engineering evidence documenting the complete
lifecycle of an Engineering Change.

Change Records preserve engineering history and traceability.

---

## 4.9 Change Status

Change Status identifies the current lifecycle state of an Engineering Change.

Status values shall be defined by the Engineering Change Management process.

---

## 4.10 Engineering Authority

Engineering Authority is the person, role, or organizational entity
responsible for evaluating, approving, or rejecting Engineering Changes within
its assigned scope of responsibility.

# 5. Change Management Principles

Engineering Change Management shall be governed by the principles defined in
this chapter.

These principles establish the fundamental requirements for initiating,
evaluating, approving, implementing, verifying, and closing Engineering
Changes within the ACP Studio engineering process.

---

## 5.1 Justification

Every Engineering Change shall have a clear engineering justification.

The reason for the change shall be documented before implementation begins.

Engineering Changes shall not be performed without an identified engineering
need.

---

## 5.2 Control

Engineering Changes shall be performed under controlled engineering
procedures.

Changes shall follow the Engineering Change Management process defined by this
standard.

Unauthorized Engineering Changes shall not be considered valid.

---

## 5.3 Traceability

Engineering Changes shall preserve complete engineering traceability.

Each Engineering Change shall be traceable to:

- its originating Change Request;
- affected engineering artifacts;
- Engineering Reviews, where applicable;
- resulting Engineering Versions;
- Change Records.

---

## 5.4 Impact Awareness

Engineering Changes shall be evaluated before implementation.

Impact Analysis shall identify potential effects on engineering artifacts,
architecture, documentation, testing, engineering processes, and project
baseline.

Engineering decisions shall consider both direct and indirect impacts.

---

## 5.5 Authorization

Engineering Changes requiring approval shall not proceed to implementation
before authorization has been granted.

Approval shall be performed by the appropriate Engineering Authority.

---

## 5.6 Integrity

Engineering Changes shall preserve the integrity of controlled engineering
artifacts.

No Engineering Change shall compromise engineering consistency, correctness,
or traceability.

---

## 5.7 Verification

Every implemented Engineering Change shall be verified.

Verification shall confirm that the approved engineering objectives have been
achieved without introducing unacceptable engineering inconsistencies.

---

## 5.8 Accountability

Engineering Change Management shall ensure accountability throughout the
change lifecycle.

Responsibilities for proposing, evaluating, approving, implementing,
verifying, and closing Engineering Changes shall be clearly identifiable.

---

## 5.9 Transparency

Engineering Change information shall remain complete, accurate, and available
to support Engineering Reviews, certification activities, maintenance, and
future engineering development.

Engineering decisions should be understandable and supported by recorded
engineering evidence.

---

## 5.10 Continuous Improvement

Engineering Change Management shall support the continuous improvement of the
ACP Studio engineering process.

Engineering experience gained through completed Engineering Changes should be
used to improve engineering practices, standards, and methodologies.

# 6. Change Management Process

Engineering Changes shall be managed according to the controlled process
defined in this chapter.

The Engineering Change Management Process ensures that every Engineering
Change is initiated, evaluated, approved, implemented, verified, and closed in
a consistent, traceable, and repeatable manner.

Every Engineering Change shall follow the lifecycle defined by this standard.

---

## 6.1 Change Identification

The Engineering Change Management Process begins with the identification of an
engineering need.

The identified need shall be sufficiently understood before initiating an
Engineering Change.

Engineering needs may originate from:

- engineering improvements;
- defect correction;
- architectural evolution;
- documentation updates;
- process improvements;
- engineering review findings;
- testing activities;
- other justified engineering requirements.

---

## 6.2 Change Request

An identified engineering need shall be documented as a Change Request.

The Change Request shall clearly describe:

- the engineering problem or opportunity;
- the proposed Engineering Change;
- affected engineering artifacts;
- expected engineering benefits.

The Change Request becomes the formal input to the Engineering Change
Management Process.

---

## 6.3 Impact Analysis

Each Change Request shall undergo Engineering Impact Analysis before
implementation.

Impact Analysis shall evaluate, where applicable:

- technical impact;
- architectural impact;
- documentation impact;
- testing impact;
- engineering process impact;
- engineering baseline impact;
- engineering risk.

The results of the analysis shall support the Engineering Change decision.

---

## 6.4 Change Decision

Following Impact Analysis, the Engineering Change shall receive one of the
following decisions:

- Approved;
- Rejected;
- Deferred;
- Returned for additional information.

The decision shall be recorded as part of the Engineering Change Record.

---

## 6.5 Change Implementation

Approved Engineering Changes shall be implemented in a controlled manner.

Implementation shall conform to all applicable Engineering Standards.

Implementation activities shall preserve engineering integrity,
consistency, and traceability.

---

## 6.6 Change Verification

Completed Engineering Changes shall be verified before closure.

Verification shall confirm that:

- the approved objectives have been achieved;
- affected engineering artifacts remain consistent;
- applicable Engineering Reviews have been completed;
- resulting Engineering Versions have been assigned where required.

Engineering Changes failing verification shall not proceed to closure.

---

## 6.7 Change Closure

Engineering Changes shall be formally closed after successful verification.

Closure shall confirm that:

- implementation is complete;
- verification activities are complete;
- Engineering Records have been updated;
- Version Records have been updated where applicable;
- Engineering traceability has been preserved.

A closed Engineering Change represents the completion of one controlled
engineering evolution.

# 7. Change Lifecycle

Engineering Changes shall progress through a controlled lifecycle.

The Change Lifecycle defines the sequence of states through which every
Engineering Change shall evolve from initiation to closure.

Each lifecycle state represents a distinct engineering condition and shall be
clearly identifiable.

---

## 7.1 Proposed

An Engineering Change enters the Proposed state when a valid Change Request has
been created.

The Proposed state represents an Engineering Change awaiting evaluation.

No implementation activities shall begin while the Engineering Change remains
in the Proposed state.

---

## 7.2 Under Analysis

An Engineering Change enters the Under Analysis state when Engineering Impact
Analysis has begun.

During this state, engineering personnel shall evaluate the feasibility,
impact, risks, and expected benefits of the proposed change.

The analysis shall provide sufficient information to support an engineering
decision.

---

## 7.3 Approved

An Engineering Change enters the Approved state after receiving formal
authorization from the appropriate Engineering Authority.

Only Approved Engineering Changes may proceed to implementation.

Approval shall be recorded within the corresponding Change Record.

---

## 7.4 Rejected

An Engineering Change enters the Rejected state when it is determined that the
proposed modification should not be implemented.

The reason for rejection shall be documented.

Rejected Engineering Changes shall remain part of the Engineering Change
history.

---

## 7.5 Implementing

An Engineering Change enters the Implementing state when approved engineering
activities are actively modifying the affected engineering artifacts.

Implementation shall conform to all applicable Engineering Standards.

Engineering traceability shall be preserved throughout implementation.

---

## 7.6 Verification

An Engineering Change enters the Verification state after implementation has
been completed.

Verification shall confirm that:

- approved objectives have been achieved;
- engineering artifacts remain consistent;
- applicable Engineering Reviews have been completed;
- required Engineering Versions have been assigned.

Engineering Changes failing verification shall return to the Implementing
state or be otherwise dispositioned according to engineering authority.

---

## 7.7 Closed

An Engineering Change enters the Closed state after successful completion of
verification and all required engineering records have been updated.

Closed Engineering Changes represent completed engineering evolution and shall
remain permanently traceable.

No further modifications shall be performed under a Closed Engineering Change.

# 8. Change Management

Engineering Changes shall be managed using controlled and repeatable
engineering procedures.

Change Management ensures that Engineering Changes remain authorized,
traceable, consistent, and properly documented throughout their lifecycle.

---

## 8.1 Change Registration

Every Engineering Change shall be formally registered before engineering
implementation begins.

Registration shall assign a unique Engineering Change identity and establish
its initial lifecycle state.

The Change Record shall be created at the time of registration.

---

## 8.2 Change Ownership

Every Engineering Change shall have an identified Engineering Authority
responsible for its management.

The Engineering Authority shall ensure that the Engineering Change progresses
according to this standard.

Responsibility may be delegated but accountability shall remain clearly
defined.

---

## 8.3 Change Planning

Approved Engineering Changes should be planned before implementation.

Planning may include:

- implementation activities;
- affected engineering artifacts;
- verification activities;
- engineering resources;
- expected completion criteria.

Planning should reduce engineering risk and improve implementation
predictability.

---

## 8.4 Change Coordination

Engineering Changes affecting multiple engineering artifacts shall be
coordinated to preserve engineering consistency.

Dependencies between Engineering Changes should be identified whenever
applicable.

Coordinated implementation shall minimize engineering conflicts.

---

## 8.5 Change Monitoring

Engineering Changes shall be monitored throughout their lifecycle.

Monitoring should confirm that:

- lifecycle progression remains valid;
- implementation activities remain controlled;
- engineering risks remain acceptable;
- engineering objectives continue to be achievable.

Significant deviations should be evaluated by the Engineering Authority.

---

## 8.6 Change Documentation

Engineering documentation affected by an Engineering Change shall be updated
before the Engineering Change is closed.

Documentation updates shall remain consistent with the implemented engineering
state.

Documentation shall preserve engineering traceability.

---

## 8.7 Change Completion

An Engineering Change shall be considered complete only when:

- implementation has been completed;
- verification has been successfully completed;
- required Engineering Reviews have been completed;
- applicable Engineering Versions have been assigned;
- Engineering Change Records have been updated;
- engineering traceability has been preserved.

Only completed Engineering Changes may proceed to the Closed lifecycle state.

# 9. Change Records

Engineering Change Records shall document the complete lifecycle of every
Engineering Change affecting controlled engineering artifacts.

Change Records provide the authoritative engineering evidence supporting
traceability, Engineering Reviews, certification activities, version
management, and future engineering maintenance.

---

## 9.1 Purpose

The purpose of Change Records is to preserve a complete, accurate, and
traceable history of Engineering Changes.

Change Records shall enable engineering personnel to understand why an
Engineering Change was initiated, how it was evaluated, how it was
implemented, and how it was verified.

---

## 9.2 Required Information

Each Change Record shall include, at a minimum:

- Engineering Change Identifier;
- Change title;
- Change description;
- Engineering justification;
- Change origin;
- Engineering Authority;
- Lifecycle status;
- Decision outcome;
- Implementation summary;
- Verification summary;
- Closure date, where applicable.

Additional information may be recorded when required by other Engineering
Standards.

---

## 9.3 Accuracy

Change Records shall accurately represent the corresponding Engineering
Change.

Recorded information shall be complete, consistent, and free from ambiguity.

Errors identified within Change Records shall be corrected in a controlled and
traceable manner.

---

## 9.4 Chronological Order

Change Records shall preserve the chronological evolution of every
Engineering Change.

Significant engineering events shall be recorded in the order in which they
occur.

Chronological history shall remain complete throughout the Engineering Change
lifecycle.

---

## 9.5 Traceability

Change Records shall preserve complete engineering traceability.

Each Change Record should identify, where applicable:

- originating Change Request;
- affected engineering artifacts;
- related Engineering Reviews;
- resulting Engineering Versions;
- associated Engineering Records.

Traceability shall support Engineering Reviews, certification activities,
maintenance, and engineering audits.

---

## 9.6 Retention

Change Records shall be retained for the lifetime of the corresponding
Engineering Change unless superseded by another certified Engineering
Standard.

Historical Change Records shall remain accessible for engineering reference.

---

## 9.7 Authority

Change Records constitute the official engineering history of an Engineering
Change.

When discrepancies exist between informal engineering information and Change
Records, the Change Records shall be considered authoritative.

# Appendix A — Change Management Workflow Example

This appendix is informative.

The following example illustrates a typical Engineering Change Management
workflow.

```text
Engineering Need
        │
        ▼
Change Request
        │
        ▼
Impact Analysis
        │
        ▼
Decision
 ┌───────────────┐
 │               │
Approved    Rejected
 │
 ▼
Implementation
 │
 ▼
Verification
 │
 ▼
Version Update
 │
 ▼
Change Closure
```

The workflow illustrates the logical sequence of Engineering Change
Management activities.

Actual implementation details may vary provided that all normative
requirements defined by this standard are satisfied.

# Appendix B — Change Classification Guide

This appendix is informative.

Engineering Changes may be classified according to their engineering impact.

| Change Type | Typical Characteristics |
|-------------|-------------------------|
| Corrective | Resolves engineering defects or inconsistencies. |
| Preventive | Reduces the likelihood of future engineering problems. |
| Adaptive | Adjusts engineering artifacts to new requirements or environments. |
| Perfective | Improves quality, maintainability, readability, or performance. |
| Architectural | Introduces significant engineering or architectural evolution. |
| Process | Modifies engineering processes, standards, or methodologies. |

Engineering classification supports planning and impact analysis but does
not modify the Engineering Change Management Process defined by this
standard.

# Appendix C — Change Record Template

This appendix is informative.

The following template illustrates a recommended Engineering Change Record.

------------------------------------------------------------------------------
Engineering Change Identifier :

Title :

Description :

Engineering Justification :

Origin :

Affected Engineering Artifacts :

Engineering Authority :

Current Lifecycle State :

Decision :

Implementation Summary :

Verification Summary :

Related Engineering Reviews :

Related Engineering Versions :

Closure Date :

Notes :

------------------------------------------------------------------------------

# Revision History

| Version  | Date       | Description                |
|----------|------------|----------------------------|
| 1.0.0    | 2026-07-20 | Initial certified release |