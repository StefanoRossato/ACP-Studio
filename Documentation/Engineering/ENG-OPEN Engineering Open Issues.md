################################################################################
# ACP Studio
################################################################################

Document ID     : ENG-OPEN
Title           : Engineering Open Issues
Category        : Engineering
Status          : Approved
Version         : 1.0.0

Author          : ACP Studio
Created         : 2026-07-13
Last Updated    : 2026-07-13

################################################################################

-------------------------------------------------------------------------------
1. Document Purpose
-------------------------------------------------------------------------------

The purpose of this document is to record engineering questions,
deferred architectural decisions and pending engineering reviews that
emerge during the development of ACP Studio.

This document provides a controlled engineering register used to
preserve technical knowledge, maintain decision traceability and support
future engineering activities.

Engineering Open Issues are intended to document engineering decisions
that have been intentionally postponed because they fall outside the
scope of the current implementation milestone.

This document is an engineering management artifact and SHALL NOT be
used to record software defects, implementation tasks or temporary
development notes.

-------------------------------------------------------------------------------
2. Document Scope
-------------------------------------------------------------------------------

This document applies to all engineering activities performed within
the ACP Studio project.

The scope of this document includes engineering questions, deferred
architectural decisions, pending engineering reviews and other
engineering matters requiring future evaluation.

Engineering Open Issues may originate from engineering reviews,
implementation activities, debugging sessions, testing, validation or
certification processes.

Each Open Issue SHALL remain associated with its originating context to
preserve engineering traceability.

This document does not replace Engineering Standards,
Specifications, Development Documents, Review Documents or project
documentation governed by ENG-001.

-------------------------------------------------------------------------------
3. Engineering Philosophy
-------------------------------------------------------------------------------

Engineering decisions represent valuable engineering knowledge and
shall be preserved throughout the lifecycle of the ACP Studio project.

Not every engineering question can or should be resolved within the
current implementation milestone. Engineering progress shall not be
delayed solely because future architectural decisions remain open.

Deferred engineering decisions shall be explicitly documented to
preserve context, rationale and traceability.

The Engineering Open Issues Register enables controlled engineering
evolution by separating ongoing implementation from future engineering
work while ensuring that important engineering discussions are never
lost.

Engineering Open Issues are considered engineering artifacts and shall
remain subject to engineering review until formally resolved or closed.

-------------------------------------------------------------------------------
4. Engineering Principles
-------------------------------------------------------------------------------

The Engineering Open Issues Register is governed by a set of engineering
principles defining how open engineering matters shall be identified,
recorded, maintained and resolved.

These principles ensure that engineering knowledge remains traceable,
reviewable and available throughout the lifecycle of the ACP Studio
project.

Engineering principles are intended to remain stable throughout the
lifecycle of the project and shall only be revised under exceptional
circumstances.

The following sections define the engineering principles governing the
Engineering Open Issues Register.

-------------------------------------------------------------------------------
4.1 Documentation Before Resolution
-------------------------------------------------------------------------------

Engineering matters requiring future evaluation shall be documented
before implementation continues.

Engineering progress shall not depend upon the immediate resolution of
every engineering question.

Engineering Open Issues preserve engineering intent while allowing
implementation to proceed within the scope of the current development
milestone.

Engineering decisions shall be documented before they are deferred.

This principle ensures that engineering knowledge remains available for
future engineering review and shall not depend upon individual memory or
informal communication.

-------------------------------------------------------------------------------
4.2 Engineering Traceability
-------------------------------------------------------------------------------

Every Engineering Open Issue shall remain traceable throughout its
complete lifecycle.

Each Open Issue shall preserve sufficient engineering context to
identify its origin, purpose, engineering rationale and the engineering
activity from which it originated.

Engineering traceability shall be maintained regardless of changes to
project structure, implementation or documentation.

Closing an Engineering Open Issue SHALL NOT remove its engineering
history.

Engineering knowledge shall remain permanently available for future
engineering review.

-------------------------------------------------------------------------------
4.3 Controlled Deferral
-------------------------------------------------------------------------------

Engineering Open Issues shall only be created when an engineering matter
cannot be resolved within the scope of the current engineering activity.

Deferring an engineering decision shall be a deliberate engineering
action supported by sufficient technical justification.

Engineering Open Issues shall not be used to postpone implementation
tasks that can be completed within the current milestone.

Deferred engineering decisions shall remain subject to future
engineering review and shall not be considered permanently accepted.

This principle ensures that Engineering Open Issues remain focused on
engineering evolution rather than project backlog management.

-------------------------------------------------------------------------------
4.4 Context Preservation
-------------------------------------------------------------------------------

Every Engineering Open Issue shall preserve the engineering context in
which the issue originated.

Engineering context includes the technical motivation, the engineering
activity, the associated milestone and any engineering artifacts
required to understand the issue during future review.

Engineering context shall remain complete and understandable
independently of subsequent implementation changes.

Engineering Open Issues shall preserve sufficient information to allow
future engineering evaluation without requiring reconstruction from
informal discussions or personal recollection.

This principle ensures that engineering decisions remain understandable
throughout the complete lifecycle of the ACP Studio project.

-------------------------------------------------------------------------------
4.5 Controlled Closure
-------------------------------------------------------------------------------

Engineering Open Issues shall only be closed following an explicit
engineering decision.

Closing an Engineering Open Issue shall require that the original
engineering matter has been reviewed, evaluated and resolved.

The closure of an Engineering Open Issue shall preserve the engineering
decision together with its supporting rationale.

Engineering Open Issues shall not be closed solely because the related
implementation has been completed.

This principle ensures that Engineering Open Issues document engineering
knowledge rather than implementation progress.

-------------------------------------------------------------------------------
5. Engineering Open Issues Register
-------------------------------------------------------------------------------

The Engineering Open Issues Register is the authoritative repository for
all Engineering Open Issues maintained within the ACP Studio project.

The register provides a controlled and traceable mechanism for managing
engineering matters requiring future evaluation.

Each Engineering Open Issue shall be uniquely identified and maintained
throughout its complete lifecycle.

The Engineering Open Issues Register shall preserve engineering
knowledge independently of implementation progress, repository
organization or project structure.

The following sections define the organization, lifecycle and structure
of Engineering Open Issues maintained within the register.

-------------------------------------------------------------------------------
6. Issue Identification
-------------------------------------------------------------------------------

Every Engineering Open Issue shall be assigned a unique Engineering
Open Issue Identifier (EOI ID).

Engineering Open Issue Identifiers provide the basis for engineering
traceability throughout the complete lifecycle of the issue.

Engineering Open Issue Identifiers shall remain stable throughout the
lifetime of the register.

Engineering Open Issue Identifiers shall not be reused, even after an
issue has been closed.

The Engineering Open Issue Identifier format adopted by ACP Studio is:

Example:

EOI-001
EOI-002
EOI-003

Engineering Open Issue Identifiers shall be assigned sequentially in the
order in which issues are recorded within the register.

-------------------------------------------------------------------------------
7. Issue Lifecycle
-------------------------------------------------------------------------------

Every Engineering Open Issue shall progress through a controlled
lifecycle from identification to closure.

The issue lifecycle ensures that Engineering Open Issues are reviewed,
maintained and resolved according to a consistent engineering process.

Engineering Open Issues shall remain within the Engineering Open Issues
Register until they have been formally closed in accordance with the
engineering principles defined by this document.

Changes to Engineering Open Issues shall be recorded in a controlled and
traceable manner.

The following lifecycle states are defined for Engineering Open Issues.

-------------------------------------------------------------------------------
7.1 Engineering Open Issue States
-------------------------------------------------------------------------------

Engineering Open Issues progress through the following lifecycle states.

Open

The Engineering Open Issue has been identified and formally recorded
within the Engineering Open Issues Register.

Deferred

The Engineering Open Issue has been intentionally postponed to a future
engineering activity. The reason for the deferral and the expected
engineering milestone shall be documented.

Implemented

The engineering decision associated with the Engineering Open Issue has
been fully implemented. Implementation may include software,
documentation, engineering standards, engineering processes or any other
engineering artifact required to resolve the issue.

Closed

The Engineering Open Issue has been formally closed. Closure confirms
that the engineering decision has been implemented, reviewed and
recorded within the Engineering Open Issues Register.

-------------------------------------------------------------------------------
8. Issue Structure
-------------------------------------------------------------------------------

Every Engineering Open Issue shall follow a standardized structure to
ensure consistency, engineering traceability and long-term
maintainability.

The standardized structure ensures that Engineering Open Issues remain
complete, understandable and suitable for future engineering review.

Each Engineering Open Issue shall contain sufficient information to
describe the engineering matter independently of external documents or
informal discussions.

The following sections define the mandatory structure of every
Engineering Open Issue.

-------------------------------------------------------------------------------
8.1 Mandatory Information
-------------------------------------------------------------------------------

Every Engineering Open Issue shall contain a minimum set of mandatory
information to ensure engineering consistency, traceability and
long-term maintainability.

Mandatory information shall be sufficient to understand the engineering
matter independently of informal discussions or personal recollection.

Mandatory information shall remain complete throughout the complete
lifecycle of the Engineering Open Issue.

The following sections define the mandatory information required for
every Engineering Open Issue.

-------------------------------------------------------------------------------
8.2 Engineering Open Issue Identifier
-------------------------------------------------------------------------------

Every Engineering Open Issue shall be identified by a unique
Engineering Open Issue Identifier (EOI ID).

The Engineering Open Issue Identifier provides the primary reference
used to identify, trace and maintain Engineering Open Issues throughout
their complete lifecycle.

The Engineering Open Issue Identifier shall remain permanently
associated with the Engineering Open Issue and shall never be modified
or reassigned.

Engineering Open Issue Identifiers shall conform to the identification
rules defined in Section 6 of this document.

-------------------------------------------------------------------------------
8.3 Title
-------------------------------------------------------------------------------

Every Engineering Open Issue shall define a unique and descriptive
title.

The title shall clearly identify the engineering matter requiring future
evaluation.

Titles shall remain stable throughout the lifecycle of the Engineering
Open Issue unless an engineering review determines that a modification
is required to improve clarity or accuracy.

The title shall be concise, unambiguous and suitable for engineering
reference.

-------------------------------------------------------------------------------
8.4 Engineering Origin
-------------------------------------------------------------------------------

Every Engineering Open Issue shall identify its Engineering Origin.

The Engineering Origin identifies the engineering activity, engineering
review, implementation milestone or engineering process from which the
Engineering Open Issue originated.

The Engineering Origin shall remain permanently associated with the
Engineering Open Issue to preserve engineering traceability throughout
its complete lifecycle.

Engineering Origin shall identify where the Engineering Open Issue was
generated rather than where it is expected to be resolved.

-------------------------------------------------------------------------------
8.5 Description
-------------------------------------------------------------------------------

Every Engineering Open Issue shall include a clear and complete
description of the engineering matter requiring future evaluation.

The description shall explain the engineering problem, its technical
background and the reason why the Engineering Open Issue has been
created.

The description shall remain factual and objective and shall avoid
describing potential engineering solutions unless required to clarify
the engineering matter.

The description shall be sufficiently complete to allow future
engineering review without requiring additional contextual
information.

-------------------------------------------------------------------------------
8.6 Engineering Impact
-------------------------------------------------------------------------------

Every Engineering Open Issue shall describe its Engineering Impact.

Engineering Impact identifies the expected consequences of leaving the
Engineering Open Issue unresolved.

Engineering Impact shall describe the effect of the Engineering Open
Issue on the engineering architecture, engineering process,
documentation, implementation or long-term maintainability of ACP
Studio.

Engineering Impact shall describe engineering consequences rather than
implementation effort or project priority.

-------------------------------------------------------------------------------
8.7 Related Engineering Artifacts
-------------------------------------------------------------------------------

Purpose
-------

The Related Engineering Artifacts field identifies every engineering
artifact that is directly associated with the Engineering Open Issue.

Its purpose is to establish explicit engineering traceability between
the unresolved issue and the documentation, software components,
specifications or other engineering artifacts that are affected by,
reference, or are expected to evolve because of the issue.

This field enables future engineering activities to rapidly identify all
relevant project artifacts without requiring additional investigation.

Requirements
------------

The Related Engineering Artifacts field shall identify every engineering
artifact having a direct relationship with the Engineering Open Issue.

Referenced artifacts may include, but are not limited to:

- Engineering Standards
- Engineering Specifications
- Design Documents
- Source Code Modules
- Runtime Components
- Interfaces
- Communication Protocols
- Test Specifications
- Validation Documents
- Certification Documents

Each referenced artifact shall be identified using its official
repository name or approved engineering identifier.

Only artifacts having a direct engineering relationship with the issue
shall be referenced.

Implementation ideas, future work, assumptions and indirect
dependencies shall not be recorded in this field.

The absence of related artifacts is permitted only when no engineering
artifact has yet been identified.

Rationale
---------

Maintaining explicit relationships between Engineering Open Issues and
engineering artifacts preserves project-wide traceability throughout the
entire engineering lifecycle.

This separation allows issue identification, technical context and
implementation planning to remain independent while ensuring that all
affected engineering assets can be located efficiently during future
development and maintenance activities.

-------------------------------------------------------------------------------
9. Engineering Issue Management
-------------------------------------------------------------------------------

Engineering Open Issues shall be managed according to a controlled and
traceable engineering process throughout their entire lifecycle.

Issue management begins when an Engineering Open Issue is formally
identified and continues until the issue is verified as resolved and
officially closed.

The purpose of Engineering Issue Management is to ensure that unresolved
engineering problems remain visible, traceable, documented and
consistently evaluated during the evolution of the ACP Studio project.

Issue management shall preserve engineering knowledge, support informed
technical decisions and ensure that no unresolved engineering issue is
lost, duplicated or informally resolved.

The following sections define the engineering principles governing the
management, evaluation, resolution, verification and closure of
Engineering Open Issues.

-------------------------------------------------------------------------------
9.1 Engineering Issue Management Principles
-------------------------------------------------------------------------------

Engineering Open Issues shall be managed according to a consistent,
controlled and fully traceable engineering process.

Issue management shall ensure that unresolved engineering problems are
systematically documented, periodically reviewed and evaluated until
their final resolution or justified closure.

Engineering decisions shall be based on documented technical evidence
rather than informal discussions or individual assumptions.

Every significant management activity performed on an Engineering Open
Issue shall preserve engineering traceability and historical context.

Issue management shall remain independent from implementation planning,
project scheduling and resource allocation.

The management process shall promote engineering transparency,
long-term maintainability and continuous improvement of the ACP Studio
engineering knowledge base.

-------------------------------------------------------------------------------
9.2 Engineering Issue Review
-------------------------------------------------------------------------------

Engineering Open Issues shall be periodically reviewed throughout their
entire lifecycle.

The purpose of the review process is to evaluate the current technical
status of each issue, confirm the continued validity of its recorded
information and determine whether additional engineering actions are
required.

Issue reviews shall verify that the issue description, engineering
impact and related engineering artifacts remain accurate and consistent
with the current state of the project.

Reviews may result in updates to the issue documentation, modifications
to the planned resolution strategy or formal closure when the issue has
been satisfactorily resolved.

Every review shall preserve engineering traceability and shall not
remove or overwrite historical engineering information.

Engineering reviews shall be performed whenever significant technical
changes may affect the validity or relevance of an Engineering Open
Issue.

-------------------------------------------------------------------------------
9.3 Resolution Strategy
-------------------------------------------------------------------------------

A Resolution Strategy defines the intended engineering approach for
addressing an Engineering Open Issue.

The purpose of the Resolution Strategy is to establish the planned
technical direction while preserving sufficient flexibility to
accommodate future engineering knowledge and design evolution.

A Resolution Strategy shall be developed only after the issue has been
adequately analyzed and its engineering context has been sufficiently
understood.

The Resolution Strategy shall describe the intended engineering approach
without prescribing implementation details, development schedules,
resource allocation or project planning activities.

A Resolution Strategy may evolve as additional engineering information
becomes available.

Changes to the Resolution Strategy shall preserve engineering
traceability and shall not modify the original definition of the
Engineering Open Issue.

The existence of a Resolution Strategy does not imply that engineering
implementation has begun or that the issue is scheduled for immediate
resolution.

-------------------------------------------------------------------------------
9.4 Resolution Verification
-------------------------------------------------------------------------------

The resolution of an Engineering Open Issue shall be verified before the
issue may be considered eligible for closure.

The purpose of Resolution Verification is to confirm that the
implemented engineering solution effectively addresses the original
issue without introducing unacceptable side effects or inconsistencies.

Verification activities shall evaluate the implemented solution against
the original issue description, engineering impact and related
engineering artifacts.

Verification may include engineering reviews, technical analysis,
validation activities, testing or certification procedures, as
appropriate for the nature of the issue.

Successful verification shall provide objective engineering evidence
supporting issue closure.

If verification demonstrates that the issue has not been satisfactorily
resolved, the Engineering Open Issue shall remain open and continue to
be managed according to the Engineering Issue Management process.

-------------------------------------------------------------------------------
9.5 Issue Closure
-------------------------------------------------------------------------------

An Engineering Open Issue shall only be closed after its resolution has
been successfully verified in accordance with the Engineering Issue
Management process.

The purpose of Issue Closure is to formally record that the engineering
problem has been satisfactorily addressed and no further management
activities are required.

Issue Closure shall be supported by objective engineering evidence
demonstrating that the original issue has been resolved.

Closure shall preserve the complete engineering history of the issue,
including its original description, engineering impact, related
engineering artifacts, review activities and verification results.

Closing an Engineering Open Issue shall not remove, replace or modify
the historical engineering information recorded throughout its
lifecycle.

A closed Engineering Open Issue shall remain available as part of the
permanent engineering knowledge base of the ACP Studio project.

-------------------------------------------------------------------------------
9.6 Issue Reopening
-------------------------------------------------------------------------------

A closed Engineering Open Issue may be reopened when objective
engineering evidence demonstrates that the original problem has not been
fully resolved or that new information significantly changes the
engineering assessment of the issue.

The purpose of Issue Reopening is to ensure that engineering decisions
remain technically accurate throughout the evolution of the ACP Studio
project.

Issue Reopening shall be based on documented engineering evidence and
shall not result from informal assumptions or undocumented observations.

When an Engineering Open Issue is reopened, the original issue
identifier shall be retained in order to preserve engineering
traceability and historical continuity.

The reopening process shall preserve all previous engineering
documentation, review activities, verification results and closure
records.

Issue Reopening shall initiate a new Engineering Issue Management cycle
while maintaining the complete historical record of previous management
activities.

-------------------------------------------------------------------------------
9.7 Historical Traceability
-------------------------------------------------------------------------------

Engineering Issue Management shall preserve the complete historical
record of every Engineering Open Issue throughout its entire lifecycle.

The purpose of Historical Traceability is to ensure that engineering
knowledge, technical decisions and management activities remain
available for future engineering analysis, maintenance and project
evolution.

Historical Traceability shall preserve, at a minimum:

- Issue identification
- Engineering origin
- Issue description
- Engineering impact
- Related engineering artifacts
- Review activities
- Resolution strategies
- Verification activities
- Closure records
- Reopening records

Historical engineering information shall not be removed, replaced or
modified in a manner that compromises engineering traceability.

Corrections or updates shall preserve the integrity of the historical
record while clearly identifying subsequent engineering decisions.

Historical Traceability shall support engineering reviews, certification
activities, audits and long-term project maintainability.

-------------------------------------------------------------------------------
10. Conformance
-------------------------------------------------------------------------------

An Engineering Open Issues Register conforms to this Engineering
Standard when all mandatory requirements defined by this document have
been satisfied.

Conformance shall be verified as part of the engineering review process
prior to document approval.

Engineering Open Issues shall contain all mandatory information defined
by Section 8 and shall be managed in accordance with the Engineering
Issue Management process defined by Section 9.

Engineering Open Issues that do not satisfy the mandatory requirements
of this standard shall not be considered compliant with the ACP Studio
Engineering Documentation System.

Compliance with this Engineering Standard shall be evaluated in addition
to the documentation requirements established by ENG-001 Documentation
Standard.

-------------------------------------------------------------------------------
11. Engineering Data Model Review
-------------------------------------------------------------------------------

The Engineering Open Issue Data Model shall be periodically reviewed to
ensure that it remains consistent, complete, maintainable and suitable
for the long-term evolution of the ACP Studio engineering documentation
system.

The purpose of the Engineering Data Model Review is to verify the
quality, integrity and engineering consistency of the data model rather
than the individual Engineering Open Issues recorded within the register.

The Engineering Data Model Review shall evaluate, at a minimum, the
following engineering criteria:

- One Field, One Responsibility
- No Field Overlap
- No Redundant Information
- No Derived Information
- Engineering Traceability
- Long-Term Maintainability
- Separation between Data Model and Process Model
- Compliance with ENG-001 Documentation Standard

The review shall verify that each field defined by the Engineering Open
Issue Structure represents a single engineering concept and that no
engineering information is unnecessarily duplicated across multiple
fields.

The review shall also verify that management activities remain
independent from the Engineering Open Issue Data Model and are defined
exclusively within the Engineering Issue Management process.

Any modification to the Engineering Open Issue Data Model shall preserve
backward compatibility whenever practical and shall maintain the
engineering principles established by this standard.

-------------------------------------------------------------------------------
12. Future Revisions
-------------------------------------------------------------------------------

This Engineering Standard is intended to provide a stable foundation for
the management of Engineering Open Issues within the ACP Studio project.

Future revisions shall preserve the engineering principles, data model
integrity and management process established by this standard while
allowing controlled evolution of engineering practices and documentation
requirements.

Any revision affecting the Engineering Open Issue Data Model shall be
evaluated through an Engineering Data Model Review prior to approval.

Revisions shall preserve engineering traceability and backward
compatibility whenever practical.

Changes introducing new data fields, modifying existing field semantics
or altering the Engineering Issue Management process shall be
technically justified, fully documented and reviewed in accordance with
the ACP Studio Engineering Documentation System.

Future revisions shall remain compliant with ENG-001 Documentation
Standard.

-------------------------------------------------------------------------------
13. Engineering Open Issues
-------------------------------------------------------------------------------

The following Engineering Open Issues are currently recorded within the
ACP Studio Engineering Open Issues Register.

-------------------------------------------------------------------------------
EOI-001
-------------------------------------------------------------------------------

Title

Unified Test Logging Infrastructure

Engineering Origin

BT-003 – WP-5 Runtime Analysis Model

Description

Current engineering tests report execution results directly to the
REAPER console using ShowConsoleMsg().

Production components use the ACP Studio Logger, which writes
diagnostic information to ACP.log.

The engineering project currently lacks a unified logging
infrastructure dedicated to the test framework.

Future engineering evaluation shall determine whether test execution
should adopt a dedicated Test Logger capable of providing consistent
diagnostic output while maintaining compatibility with the existing
engineering logging infrastructure.

Engineering Impact

The absence of a unified test logging infrastructure does not affect
functional correctness but reduces consistency across engineering
artifacts and limits future extensibility of the testing framework.

Related Engineering Artifacts

- ENG-001 Documentation Standard
- DEV-001 Engineering Workflow
- TST-001 Test Monitor
- RuntimeModel_Test.lua
- Logger.lua