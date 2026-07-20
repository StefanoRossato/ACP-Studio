------------------------------------------------------------------------------
ACP Studio

Specification   : ENG-002

Title           : Engineering Review Standard

Category        : Engineering Standards

Status          : Certified

Version         : 1.0.0

Author          : ACP Studio

Dependencies    : ENG-001

------------------------------------------------------------------------------

# 1. Purpose

This standard defines the normative requirements governing Engineering Review
within the ACP Studio engineering process.

Its purpose is to establish a consistent, objective, and repeatable review
process that verifies the quality, correctness, completeness, consistency, and
compliance of ACP Studio engineering artifacts.

Engineering Review ensures that engineering artifacts satisfy their intended
responsibility, conform to applicable Engineering Standards, and preserve the
integrity of the ACP Studio engineering baseline.

This standard defines how Engineering Reviews shall be planned, performed,
recorded, and concluded.

It does not define software implementation, testing methodologies, document
structure, or engineering lifecycle management, which are governed by their
respective Engineering Standards.

All Engineering Reviews performed within the ACP Studio project shall conform
to this standard unless explicitly superseded by another certified Engineering
Standard.

# 2. Scope

This standard applies to all Engineering Reviews performed as part of the ACP
Studio engineering process.

Its requirements govern the planning, execution, recording, and conclusion of
Engineering Reviews throughout the entire engineering lifecycle.

This standard applies to the review of all ACP Studio engineering artifacts,
including but not limited to:

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

This standard defines the Engineering Review process.

It does not define:

- Engineering artifact structure
- Software architecture
- Software design principles
- Coding standards
- Implementation techniques
- Testing methodologies
- Version management
- Change management

These subjects shall be governed by their respective Engineering Standards.

Compliance with this standard is mandatory for all Engineering Reviews unless
explicitly superseded by another certified Engineering Standard.

# 3. Conformance

This standard is normative.

All Engineering Reviews performed within the ACP Studio project shall conform
to the requirements defined by this standard unless explicitly superseded by
another certified Engineering Standard.

Conformance shall be evaluated by verifying that the Engineering Review:

- follows the review process defined by this standard;
- applies the applicable review criteria;
- produces objective and traceable review evidence;
- records review findings and outcomes;
- preserves the integrity of the reviewed engineering artifact.

Failure to satisfy mandatory requirements shall prevent an Engineering Review
from being considered compliant with this standard.

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

Normative content defines mandatory Engineering Review requirements and shall
be considered authoritative.

Informative content provides explanations, rationale, examples, notes, or
background information intended to improve understanding.

Informative content shall not modify, replace, or contradict normative
requirements.

---

## 3.3 Examples

Examples are informative.

Examples illustrate Engineering Review concepts and recommended practices.

Examples shall not introduce additional Engineering Review requirements.

---

## 3.4 Notes

Notes are informative.

Notes provide clarification, context, or additional observations.

Notes shall not alter the meaning of normative statements.

---

## 3.5 Conflict Resolution

In the event of conflicting Engineering Review requirements, the following
order of precedence shall apply unless explicitly stated otherwise.

1. Certified Engineering Standards
2. Approved Engineering Standards
3. Engineering Review Standard
4. Engineering artifact under review

Lower-precedence requirements shall not contradict higher-precedence
requirements.

---

## 3.6 Engineering Review Conformance

Engineering Review conformance shall be verified by confirming that:

- the review scope is clearly defined;
- applicable Engineering Standards have been considered;
- review criteria have been applied consistently;
- findings are supported by objective evidence;
- review outcomes are documented;
- required corrective actions are identified, when applicable.

Only Engineering Reviews satisfying these requirements shall be considered
compliant with this standard.

# 4. Definitions

This chapter defines the official Engineering Review terminology used
throughout the ACP Studio engineering process.

The definitions contained in this chapter are normative.

Engineering Reviews shall use the terminology defined herein consistently.
Terms defined by this standard shall not be redefined elsewhere unless
explicitly superseded by another certified Engineering Standard.

---

## 4.1 Engineering Review

An Engineering Review is a structured engineering activity performed to evaluate
an engineering artifact against its applicable requirements, standards, and
acceptance criteria.

The objective of an Engineering Review is to provide objective evidence that an
engineering artifact is suitable to progress within its engineering lifecycle.

---

## 4.2 Engineering Artifact

An Engineering Artifact is any controlled engineering deliverable subject to
Engineering Review.

Engineering Artifacts include, but are not limited to:

- Engineering Documents
- Source Code
- Software Modules
- Specifications
- Architecture Documents
- Design Documents
- Test Suites
- Test Results
- Engineering Diagrams

---

## 4.3 Reviewer

A Reviewer is the individual responsible for performing an Engineering Review.

The Reviewer evaluates the engineering artifact, records findings, and
determines the review outcome according to this standard.

---

## 4.4 Author

An Author is the individual responsible for creating or maintaining the
engineering artifact under review.

The Author is responsible for resolving review findings before requesting
subsequent reviews.

---

## 4.5 Review Finding

A Review Finding is an objective observation identified during an Engineering
Review.

A finding shall be supported by verifiable evidence.

---

## 4.6 Observation

An Observation is a review finding that does not constitute a
non-conformance but may improve the quality, clarity, or maintainability of an
engineering artifact.

Observations are informative unless explicitly converted into mandatory
corrective actions.

---

## 4.7 Non-Conformance

A Non-Conformance is a verified deviation from one or more mandatory
engineering requirements.

Non-Conformances shall be resolved before an engineering artifact may be
accepted when they affect mandatory requirements.

---

## 4.8 Corrective Action

A Corrective Action is an activity performed to resolve a verified
Non-Conformance or other review finding requiring modification of the reviewed
engineering artifact.

---

## 4.9 Review Outcome

A Review Outcome is the formal conclusion of an Engineering Review.

The Review Outcome determines whether the reviewed engineering artifact may
progress to the next stage of its engineering lifecycle.

---

## 4.10 Review Record

A Review Record is the controlled engineering evidence documenting the execution
and outcome of an Engineering Review.

Review Records preserve engineering traceability and shall be retained
throughout the engineering lifecycle.

# 5. Review Principles

Engineering Review is a fundamental engineering activity.

It shall be conducted according to the principles defined in this chapter.

These principles govern all Engineering Reviews performed throughout the ACP
Studio engineering process.

---

## 5.1 Objectivity

Engineering Reviews shall be based on objective evidence.

Review conclusions shall be supported by verifiable facts rather than personal
opinions, assumptions, or preferences.

---

## 5.2 Independence

Engineering Reviews should be performed with sufficient independence to ensure
an impartial evaluation.

Review decisions shall be based solely on engineering requirements and review
evidence.

---

## 5.3 Consistency

Engineering Reviews shall apply the same review criteria to comparable
engineering artifacts.

Equivalent engineering situations shall produce equivalent review outcomes.

---

## 5.4 Traceability

All review findings shall be traceable to the engineering requirement,
Engineering Standard, specification, architecture, or other engineering
artifact from which they originate.

Review decisions shall remain traceable throughout the engineering lifecycle.

---

## 5.5 Evidence-Based Evaluation

Engineering Review findings shall be supported by objective evidence.

Evidence may include engineering documentation, implementation artifacts,
Certification Tests, diagrams, or other verifiable engineering information.

Review conclusions shall not be based on assumptions.

---

## 5.6 Completeness

Engineering Reviews shall evaluate the reviewed artifact against all applicable
review criteria.

Partial reviews shall clearly identify the engineering scope that has been
evaluated.

---

## 5.7 Constructive Review

Engineering Reviews shall improve engineering quality.

Review findings should clearly identify the engineering issue and, whenever
practical, provide sufficient information to facilitate its resolution.

Engineering Reviews shall evaluate engineering artifacts rather than the
individuals responsible for creating them.

---

## 5.8 Proportionality

The depth and rigor of an Engineering Review should be proportional to the
engineering significance of the reviewed artifact.

More critical engineering artifacts should undergo more comprehensive reviews.

---

## 5.9 Engineering Integrity

Engineering Reviews shall preserve the integrity of the ACP Studio engineering
baseline.

Review decisions shall never compromise compliance with certified Engineering
Standards or previously approved engineering decisions.

---

## 5.10 Continuous Improvement

Engineering Reviews should contribute to the continuous improvement of ACP
Studio engineering practices.

Recurring review findings should be analyzed to identify opportunities for
improving standards, templates, engineering processes, and implementation
practices.

# 6. Review Process

Every Engineering Review shall follow a defined and repeatable review process.

The review process establishes the sequence of activities required to evaluate
an engineering artifact in a consistent, objective, and traceable manner.

The Engineering Review process consists of the following phases.

```text
Review Request
      │
      ▼
Review Preparation
      │
      ▼
Review Execution
      │
      ▼
Review Findings
      │
      ▼
Review Decision
      │
      ▼
Review Record
```

Engineering Review activities shall be performed sequentially.

Review phases shall not be omitted unless explicitly permitted by another
certified Engineering Standard.

---

## 6.1 Review Request

Every Engineering Review shall begin with a formal review request.

The review request shall identify:

- the engineering artifact to be reviewed;
- the review scope;
- the applicable Engineering Standards;
- any supporting engineering documentation.

The review request establishes the engineering context of the review.

---

## 6.2 Review Preparation

Before the review begins, the Reviewer shall verify that sufficient
engineering information is available.

Preparation may include:

- reviewing applicable Engineering Standards;
- reviewing dependent engineering artifacts;
- identifying applicable review criteria;
- defining the review scope.

Incomplete preparation may compromise the effectiveness of the review.

---

## 6.3 Review Execution

The Reviewer shall evaluate the engineering artifact against the applicable
review criteria.

The review shall verify compliance with:

- Engineering Standards;
- approved specifications;
- architectural constraints;
- applicable engineering requirements.

Review conclusions shall be supported by objective evidence.

---

## 6.4 Review Findings

All findings identified during the review shall be recorded.

Each finding shall:

- clearly describe the issue;
- identify the affected engineering artifact;
- reference the applicable requirement or standard;
- include supporting evidence.

Findings shall be classified according to this standard.

---

## 6.5 Review Decision

Upon completion of the evaluation, the Reviewer shall determine the formal
Review Outcome.

The decision shall reflect the overall compliance of the reviewed engineering
artifact.

The Review Outcome shall be documented before the review is considered
complete.

---

## 6.6 Review Record

Every Engineering Review shall produce a Review Record.

The Review Record shall preserve:

- review scope;
- participants;
- review findings;
- review outcome;
- supporting evidence;
- review date.

Review Records establish the engineering evidence of the review and shall
remain traceable throughout the engineering lifecycle.

# 7. Review Roles

Engineering Reviews shall assign clear responsibilities to all participants.

Each role defined by this standard has a distinct engineering responsibility.

Responsibilities shall remain clearly separated to preserve review objectivity,
traceability, and accountability.

---

## 7.1 Author

The Author is responsible for creating and maintaining the engineering artifact
submitted for review.

The Author shall:

- prepare the engineering artifact for review;
- provide supporting engineering information when required;
- respond to review findings;
- implement approved corrective actions.

The Author shall not determine the Review Outcome.

---

## 7.2 Reviewer

The Reviewer is responsible for performing the Engineering Review.

The Reviewer shall:

- evaluate the engineering artifact;
- apply the review criteria defined by this standard;
- identify review findings;
- determine the Review Outcome;
- produce the Review Record.

The Reviewer shall perform the review objectively and consistently.

---

## 7.3 Review Participants

Additional participants may contribute to an Engineering Review when their
engineering expertise is required.

Review Participants may:

- provide technical clarification;
- supply supporting engineering evidence;
- answer engineering questions;
- contribute specialist knowledge.

Review Participants shall not modify the Review Outcome unless explicitly
authorized by the applicable Engineering Standard.

---

## 7.4 Review Responsibility

Each Engineering Review shall identify the individuals responsible for the
review activities.

Responsibility for review findings shall remain traceable throughout the
engineering lifecycle.

Responsibilities shall not be ambiguous or shared without explicit definition.

---

## 7.5 Role Independence

Engineering Review roles should remain sufficiently independent to preserve the
objectivity of the review.

When complete independence is not practical, review decisions shall continue to
be supported exclusively by objective engineering evidence.

Role independence shall contribute to the credibility and integrity of the
Engineering Review process.

# 8. Review Criteria

Engineering Reviews shall evaluate engineering artifacts using defined and
consistent review criteria.

The applicable review criteria shall be determined according to the type,
purpose, and engineering responsibility of the reviewed artifact.

Every Engineering Review shall apply the review criteria objectively and
consistently.

---

## 8.1 Completeness

The Engineering Review shall verify that the engineering artifact is complete
with respect to its intended engineering responsibility.

Required engineering information shall not be omitted.

Incomplete engineering artifacts shall not be considered fully compliant.

---

## 8.2 Correctness

The Engineering Review shall verify that the engineering artifact is
technically correct.

Engineering statements, requirements, interfaces, and engineering decisions
shall accurately represent the intended engineering solution.

---

## 8.3 Consistency

The Engineering Review shall verify internal and external consistency.

The reviewed engineering artifact shall:

- use consistent terminology;
- avoid contradictory statements;
- remain consistent with dependent engineering artifacts;
- preserve engineering coherence.

---

## 8.4 Compliance

The Engineering Review shall verify compliance with all applicable Engineering
Standards.

Compliance shall include, when applicable:

- documentation standards;
- architectural standards;
- coding standards;
- testing standards;
- project-specific engineering requirements.

---

## 8.5 Traceability

The Engineering Review shall verify that engineering decisions, requirements,
and review findings remain traceable.

Required engineering relationships shall be explicit whenever practical.

---

## 8.6 Maintainability

The Engineering Review shall evaluate the long-term maintainability of the
engineering artifact.

Engineering complexity shall remain appropriate to the engineering
responsibility of the artifact.

---

## 8.7 Reviewability

The Engineering Review shall verify that the engineering artifact can be
efficiently reviewed.

Engineering organization, clarity, and structure shall facilitate future
Engineering Reviews.

---

## 8.8 Evidence

Review conclusions shall be supported by objective engineering evidence.

Engineering evidence shall be sufficient to justify every review finding and
Review Outcome.

Unsupported conclusions shall not be considered valid.

---

## 8.9 Scope Verification

The Engineering Review shall verify that the reviewed engineering artifact
remains within its declared engineering scope.

Responsibilities assigned to other engineering artifacts shall not be
duplicated without justification.

---

## 8.10 Overall Assessment

The Engineering Review shall conclude with an overall engineering assessment
based on the applicable review criteria.

The overall assessment shall support the Review Outcome defined by this
standard.

# 9. Review Outcomes

Every Engineering Review shall conclude with a formal Review Outcome.

The Review Outcome communicates the engineering status of the reviewed artifact
and determines whether additional engineering actions are required.

Review Outcomes shall be based exclusively on the review findings and the
applicable review criteria.

---

## 9.1 Accepted

An Engineering Artifact may be classified as **Accepted** when the Engineering
Review determines that it satisfies all mandatory review requirements.

Minor observations may exist provided they do not affect compliance with
mandatory Engineering Standards or engineering requirements.

Accepted artifacts may progress to the next stage of the applicable
engineering process.

---

## 9.2 Accepted with Observations

An Engineering Artifact may be classified as **Accepted with Observations**
when review findings identify opportunities for improvement that do not
constitute Non-Conformances.

Observations should be addressed when practical but shall not prevent the
artifact from progressing.

---

## 9.3 Rework Required

An Engineering Artifact shall be classified as **Rework Required** when one or
more Non-Conformances prevent acceptance.

The Engineering Review shall identify the required corrective actions before a
subsequent review is requested.

Rework Required artifacts shall undergo a new Engineering Review after the
identified issues have been resolved.

---

## 9.4 Review Deferred

An Engineering Review may be classified as **Review Deferred** when the review
cannot be completed because essential engineering information is unavailable or
the review scope cannot be adequately evaluated.

The reasons for deferring the review shall be documented in the Review Record.

---

## 9.5 Outcome Justification

Every Review Outcome shall include sufficient engineering justification.

The justification shall reference the review findings and the objective
evidence supporting the decision.

Review Outcomes shall be reproducible by independent reviewers evaluating the
same engineering evidence.

---

## 9.6 Corrective Actions

When corrective actions are required, the Review Record shall identify:

- the affected engineering artifact;
- the applicable review finding;
- the required corrective action;
- any engineering constraints relevant to the correction.

Completion of corrective actions shall be verified by a subsequent Engineering
Review unless otherwise specified by another certified Engineering Standard.

# 10. Review Records

Every Engineering Review shall produce a Review Record.

The Review Record constitutes the official engineering evidence that the review
has been performed in accordance with this standard.

Review Records shall be complete, accurate, and traceable.

---

## 10.1 Purpose

The purpose of a Review Record is to document:

- the engineering artifact under review;
- the review scope;
- the review participants;
- the review findings;
- the Review Outcome;
- the supporting engineering evidence.

The Review Record preserves the engineering history of the review.

---

## 10.2 Required Information

Every Review Record shall include, at minimum:

- review identifier;
- review date;
- reviewed engineering artifact;
- applicable Engineering Standards;
- Reviewer;
- Author;
- review scope;
- review findings;
- Review Outcome.

Additional information may be recorded when appropriate.

---

## 10.3 Review Findings

Each recorded finding shall include:

- a unique identifier;
- a concise description;
- supporting evidence;
- classification;
- reference to the applicable requirement or Engineering Standard.

Findings shall be sufficiently detailed to support future Engineering Reviews.

---

## 10.4 Review Outcome

The Review Outcome recorded within the Review Record shall include:

- the formal outcome;
- engineering justification;
- any required corrective actions.

The recorded outcome shall accurately represent the conclusions of the review.

---

## 10.5 Traceability

Review Records shall remain traceable throughout the engineering lifecycle.

Traceability shall include relationships between:

- Engineering Standards;
- engineering artifacts;
- review findings;
- corrective actions;
- subsequent Engineering Reviews.

---

## 10.6 Retention

Review Records shall be retained for the lifetime of the corresponding
engineering artifact unless otherwise specified by another certified
Engineering Standard.

Historical Review Records shall not be modified after completion.

If corrections are necessary, they shall be recorded through a subsequent
Engineering Review or an officially documented amendment.

---

## 10.7 Integrity

Review Records shall preserve the integrity of the Engineering Review process.

Review Records shall accurately reflect the performed review and shall not omit
or alter review findings after the Review Outcome has been established.

Engineering evidence supporting the Review Record shall remain available whenever
practical.

# Appendix A — Review Workflow Example

## A.1 Purpose

This appendix provides an informative example illustrating the Engineering
Review process defined by this standard.

The example is provided solely to improve understanding of the review workflow.

It does not introduce additional requirements.

---

## A.2 Example Workflow

```text
Engineering Artifact
        │
        ▼
Review Request
        │
        ▼
Review Preparation
        │
        ▼
Engineering Review
        │
        ▼
Review Findings
        │
        ▼
Review Outcome
        │
        ▼
Review Record
        │
        ▼
Engineering Process
```

The Engineering Review concludes with the Review Record.

Subsequent engineering activities are governed by their respective Engineering
Standards.

# Appendix B — Engineering Review Checklist

The following checklist is informative.

It may be used to support Engineering Reviews performed according to this
standard.

Typical review questions include:

□ Is the review scope clearly defined?

□ Are all applicable Engineering Standards identified?

□ Is the engineering artifact complete?

□ Is the engineering artifact technically correct?

□ Is terminology used consistently?

□ Are engineering decisions traceable?

□ Are review findings supported by objective evidence?

□ Are all findings properly documented?

□ Has a Review Outcome been determined?

□ Has a Review Record been completed?

# Appendix C — Review Record Template

The following template illustrates a typical Review Record.

Review Identifier:

Review Date:

Engineering Artifact:

Author:

Reviewer:

Applicable Engineering Standards:

Review Scope:

Review Findings:

Review Outcome:

Corrective Actions:

Supporting Evidence:

Comments:

# Revision History

| Version  | Date       | Description                 |
|----------|------------|-----------------------------|
| 1.0.0    | 2026-07-20 | Initial certified release.  |