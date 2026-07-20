------------------------------------------------------------------------------
ACP Studio

Specification   : TPL-001

Title           : Lua Module Template Standard

Category        : Engineering Templates

Status          : Certified

Version         : 1.0.0

Author          : ACP Studio

Dependencies    : ENG-001, ENG-002, ENG-003, ENG-004

------------------------------------------------------------------------------

# 1. Purpose

This standard defines the normative requirements governing the structure,
organization, and implementation of Lua module templates within the ACP Studio
engineering process.

Its purpose is to establish a consistent, maintainable, and architecturally
uniform template from which all Lua modules shall be derived.

The Lua Module Template provides a common engineering foundation that promotes
readability, consistency, modularity, and long-term maintainability across the
entire ACP Studio codebase.

This standard defines the mandatory structural elements, organizational
principles, and implementation rules that every Lua module template shall
follow.

It does not define software architecture, module responsibilities, coding
standards, design patterns, testing methodologies, or engineering processes,
which are governed by their respective Engineering Standards.

All Lua modules developed for the ACP Studio project shall conform to this
standard unless explicitly superseded by another certified Engineering
Standard.

# 2. Scope

This standard applies to every Lua module developed within the ACP Studio
engineering process.

Its requirements govern the structural organization, section layout, and
overall composition of Lua modules independently of their architectural role
or implementation details.

This standard applies to Lua modules including, but not limited to:

- Static Modules;
- Object-Oriented Modules;
- Domain Modules;
- Application Modules;
- Infrastructure Modules;
- GUI Modules;
- Service Modules;
- Utility Modules;
- Test Modules;
- Framework Modules.

This standard defines the official Lua Module Template used throughout ACP
Studio.

It does not define:

- software architecture;
- module responsibilities;
- business logic;
- implementation techniques;
- coding conventions;
- naming conventions;
- design patterns;
- testing methodologies;
- engineering processes.

These subjects shall be governed by their respective Engineering Standards.

Compliance with this standard is mandatory for all Lua modules unless
explicitly superseded by another certified Engineering Standard.

# 3. Conformance

This standard is normative.

All Lua modules developed within the ACP Studio project shall conform to the
requirements defined by this standard unless explicitly superseded by another
certified Engineering Standard.

Conformance shall be evaluated by verifying that each Lua module:

- follows the prescribed template structure;
- preserves the required section ordering;
- includes all mandatory template sections;
- maintains architectural consistency;
- exposes only the public API required by its responsibility;
- preserves readability and maintainability.

Failure to satisfy mandatory template requirements shall prevent a Lua module
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

Normative content defines mandatory Lua Module Template requirements and shall
be considered authoritative.

Informative content provides explanations, rationale, examples, notes, or
background information intended to improve understanding.

Informative content shall not modify, replace, or contradict normative
requirements.

---

## 3.3 Examples

Examples are informative.

Examples illustrate Lua Module Template concepts and recommended practices.

Examples shall not introduce additional template requirements.

---

## 3.4 Notes

Notes are informative.

Notes provide clarification, context, or additional observations.

Notes shall not alter the meaning of normative statements.

---

## 3.5 Conflict Resolution

In the event of conflicting template requirements, the following order of
precedence shall apply unless explicitly stated otherwise.

1. Certified Engineering Standards
2. Approved Engineering Standards
3. Lua Module Template Standard
4. Reference Implementation

Lower-precedence requirements shall not contradict higher-precedence
requirements.

---

## 3.6 Lua Module Template Conformance

Lua Module Template conformance shall be verified by confirming that:

- the required template structure is preserved;
- mandatory sections are present;
- section ordering is respected;
- module organization remains consistent;
- implementation conforms to the template requirements.

Only Lua modules satisfying these requirements shall be considered compliant
with this standard.

# 4. Definitions

This chapter defines the official Lua Module Template terminology used
throughout the ACP Studio engineering process.

The definitions contained in this chapter are normative.

Lua Module Template terminology shall be used consistently throughout ACP
Studio. Terms defined by this standard shall not be redefined elsewhere unless
explicitly superseded by another certified Engineering Standard.

---

## 4.1 Lua Module

A Lua Module is a self-contained software component that encapsulates a single
engineering responsibility and exposes a well-defined public interface.

A Lua Module shall conform to the Lua Module Template defined by this
standard.

---

## 4.2 Module Template

A Module Template is the normative structural model from which Lua modules are
derived.

The Module Template defines the mandatory organization and section layout of
every Lua module.

---

## 4.3 Module Section

A Module Section is a predefined structural region within a Lua module.

Each Module Section serves a specific engineering purpose.

Module Sections shall appear in the order defined by this standard.

---

## 4.4 Public API

The Public API is the set of functions intentionally exposed by a Lua module.

The Public API defines the services provided by the module to other
engineering components.

Only functionality belonging to the module responsibility should be exposed.

---

## 4.5 Private State

Private State is the internal data maintained by a Lua module.

Private State shall not be accessed directly from outside the module unless
explicitly required by the module design.

---

## 4.6 Private Function

A Private Function is an implementation detail that is not exposed through the
Public API.

Private Functions support the internal operation of the module while preserving
encapsulation.

---

## 4.7 Module Responsibility

Module Responsibility is the single engineering purpose assigned to a Lua
module.

Every Lua module shall implement one clearly defined responsibility.

---

## 4.8 Reference Implementation

A Reference Implementation is the official implementation demonstrating
conformance with this standard.

The ACP Studio ModuleSkeleton.lua is the Reference Implementation of the Lua
Module Template Standard.

Reference Implementations illustrate the correct application of normative
requirements but shall not replace this standard.

# 5. Template Principles

Lua Module Templates shall be governed by the engineering principles defined
in this chapter.

These principles establish the fundamental requirements for creating
consistent, maintainable, and architecturally uniform Lua modules throughout
the ACP Studio project.

---

## 5.1 Structural Consistency

Every Lua module shall follow the same structural organization.

Consistent structure improves readability, maintainability, code navigation,
and engineering review activities.

Structural organization shall not depend on the module responsibility.

---

## 5.2 Single Responsibility

Every Lua module shall implement one clearly defined engineering
responsibility.

A module shall not combine unrelated responsibilities.

The Public API shall reflect the assigned module responsibility.

---

## 5.3 Encapsulation

Implementation details shall remain internal to the module.

Only the functionality intentionally exposed through the Public API shall be
accessible by other engineering components.

Private State and Private Functions shall preserve module encapsulation.

---

## 5.4 Minimalism

Lua modules shall remain as simple as possible.

Only the structural elements required by the module responsibility shall be
implemented.

Unnecessary code, placeholders, or unused functionality should not be
introduced.

---

## 5.5 Predictability

Every Lua module shall present the same overall organization regardless of its
architectural layer.

Developers shall be able to locate module sections without ambiguity.

Predictable organization reduces engineering complexity.

---

## 5.6 Maintainability

Lua Module Templates shall promote long-term maintainability.

Module organization shall simplify future modifications, engineering reviews,
and change management activities.

---

## 5.7 Extensibility

The Lua Module Template shall support future engineering evolution without
requiring structural redesign.

Additional functionality may be introduced while preserving the template
organization defined by this standard.

---

## 5.8 Reference Implementation

The Reference Implementation shall demonstrate the correct application of the
Lua Module Template.

Reference Implementations shall remain synchronized with this standard.

Whenever this standard evolves, the corresponding Reference Implementation
shall be reviewed and updated as necessary.

---

## 5.9 Architectural Independence

The Lua Module Template defines structural organization only.

It shall not impose architectural patterns, implementation techniques, or
business responsibilities.

Architectural decisions shall be governed by the applicable Engineering
Standards.

---

## 5.10 Engineering Consistency

All Lua modules within ACP Studio shall present a consistent engineering
appearance.

Consistency shall facilitate engineering reviews, maintenance, onboarding of
new developers, and long-term evolution of the codebase.

# 6. Module Structure

Every Lua module shall follow the structural organization defined in this
chapter.

The Module Structure establishes the mandatory sequence of sections that shall
appear within every Lua module developed for ACP Studio.

Sections may remain empty when not required by the module responsibility but
shall not be removed or reordered.

---

## 6.1 Header

Every Lua module shall begin with the standard ACP Studio module header.

The header shall uniquely identify the module and provide the engineering
information required for maintenance and traceability.

The required header fields are defined by the Reference Implementation.

---

## 6.2 Module Declaration

The Module Declaration shall define the module table returned by the Lua file.

The declaration establishes the public identity of the module.

Object-oriented behavior may be introduced when required by the module
responsibility.

---

## 6.3 Constants

The Constants section shall contain module-private constant definitions.

Constants shall be grouped in a dedicated section to improve readability and
prevent duplication.

---

## 6.4 Private State

The Private State section shall contain the internal data maintained by the
module.

Private State shall remain encapsulated within the module.

---

## 6.5 Private Functions

The Private Functions section shall contain all non-exported functions.

Private Functions shall implement internal behavior without exposing
implementation details through the Public API.

---

## 6.6 Public API

The Public API shall expose only the functionality required by the module
responsibility.

Public functions shall remain cohesive, well-defined, and limited to the
services intentionally provided by the module.

---

## 6.7 End of Module

Every Lua module shall terminate by returning the module table.

No executable logic shall appear after the module return statement.

The End of Module section marks the completion of the module structure.

# 7. Template Lifecycle

The Lua Module Template shall evolve according to a controlled engineering
lifecycle.

The Template Lifecycle defines the sequence of states through which the
template progresses from initial creation to certified engineering use.

Each lifecycle state represents a distinct engineering condition and shall be
clearly identifiable.

---

## 7.1 Draft

A Lua Module Template enters the Draft state when its initial engineering
content has been created.

Draft Templates may undergo engineering development and revision.

Draft Templates shall not be considered normative.

---

## 7.2 Under Review

A Lua Module Template enters the Under Review state when formal Engineering
Review activities have begun.

The template shall be evaluated for:

- completeness;
- consistency;
- engineering quality;
- compliance with applicable Engineering Standards.

Review findings shall be resolved before certification.

---

## 7.3 Approved

A Lua Module Template enters the Approved state after successfully completing
Engineering Review.

Approved Templates are considered technically acceptable but are not yet the
official Reference Implementation.

Approved Templates may proceed to certification.

---

## 7.4 Certified

A Lua Module Template enters the Certified state after formal engineering
approval.

Certified Templates constitute the normative reference for Lua module
development within ACP Studio.

Only Certified Templates shall be used as the basis for new Lua modules unless
explicitly superseded by another certified Engineering Standard.

---

## 7.5 Superseded

A Lua Module Template enters the Superseded state when replaced by a newer
Certified Template.

Superseded Templates shall remain available for historical reference and
engineering traceability.

They shall not be used for new development.

---

## 7.6 Retired

A Lua Module Template enters the Retired state when it is permanently removed
from active engineering use.

Retired Templates shall remain archived according to applicable Engineering
Standards.

Retirement shall preserve engineering history and traceability.

# 8. Template Management

Lua Module Templates shall be managed using controlled engineering procedures.

Template Management ensures that the Lua Module Template remains consistent,
maintainable, and aligned with the ACP Studio Engineering Standards throughout
its lifecycle.

---

## 8.1 Template Ownership

Every Lua Module Template shall have an identified Engineering Authority
responsible for its maintenance.

The Engineering Authority shall ensure that the template remains consistent
with the applicable Engineering Standards.

Responsibility may be delegated, but accountability shall remain clearly
defined.

---

## 8.2 Template Maintenance

Certified Lua Module Templates shall be maintained under Engineering Change
Management.

Modifications shall follow the applicable Engineering Standards governing
documentation, review, versioning, and change management.

Unauthorized modifications shall not be considered valid.

---

## 8.3 Reference Implementation Synchronization

The Reference Implementation shall remain synchronized with this standard.

Whenever the normative requirements defined by this standard are modified, the
Reference Implementation shall be reviewed and updated as necessary.

The Reference Implementation shall not introduce structural elements that
contradict this standard.

---

## 8.4 Backward Compatibility

Changes to the Lua Module Template should preserve compatibility with existing
Lua modules whenever reasonably possible.

Engineering improvements shall minimize unnecessary disruption to the ACP
Studio codebase.

When compatibility cannot be preserved, the resulting Engineering Change shall
be explicitly documented.

---

## 8.5 Compliance Verification

Compliance with this standard shall be verified during Engineering Reviews.

Verification shall confirm that:

- the required template structure is preserved;
- mandatory sections are present;
- section ordering remains unchanged;
- the Reference Implementation conforms to this standard.

Non-conforming templates shall not be certified.

---

## 8.6 Controlled Evolution

The Lua Module Template shall evolve only through controlled Engineering
Changes.

Evolution shall preserve architectural consistency, engineering quality, and
long-term maintainability.

Changes shall remain fully traceable throughout the template lifecycle.

---

## 8.7 Template Availability

The current Certified Lua Module Template shall remain available to all
engineering personnel.

Only the latest Certified Reference Implementation should be used for new Lua
module development unless otherwise specified by another certified Engineering
Standard.

# 9. Template Records

Template Records shall document the engineering evolution of the Lua Module
Template and its corresponding Reference Implementation.

Template Records provide the authoritative engineering evidence supporting
traceability, Engineering Reviews, certification activities, version
management, and future engineering maintenance.

---

## 9.1 Purpose

The purpose of Template Records is to preserve a complete, accurate, and
traceable history of the Lua Module Template.

Template Records shall enable engineering personnel to understand how the
template evolved, why modifications were introduced, and how conformity with
this standard has been maintained.

---

## 9.2 Required Information

Each Template Record shall include, at a minimum:

- Template Identifier;
- Template title;
- Template version;
- Lifecycle status;
- Engineering Change reference, where applicable;
- Engineering Review reference;
- Certification status;
- Reference Implementation version;
- Revision summary.

Additional information may be recorded when required by other Engineering
Standards.

---

## 9.3 Accuracy

Template Records shall accurately represent the corresponding Lua Module
Template.

Recorded information shall be complete, consistent, and free from ambiguity.

Errors identified within Template Records shall be corrected in a controlled
and traceable manner.

---

## 9.4 Chronological Order

Template Records shall preserve the chronological evolution of the Lua Module
Template.

Significant engineering events shall be recorded in the order in which they
occur.

Chronological history shall remain complete throughout the template lifecycle.

---

## 9.5 Traceability

Template Records shall preserve complete engineering traceability.

Each Template Record should identify, where applicable:

- applicable Engineering Changes;
- related Engineering Reviews;
- corresponding Reference Implementation;
- resulting template version;
- associated Engineering Standards.

Traceability shall support Engineering Reviews, certification activities,
maintenance, and engineering audits.

---

## 9.6 Retention

Template Records shall be retained for the lifetime of the corresponding Lua
Module Template unless superseded by another certified Engineering Standard.

Historical Template Records shall remain accessible for engineering reference.

---

## 9.7 Authority

Template Records constitute the official engineering history of the Lua Module
Template.

When discrepancies exist between informal engineering information and Template
Records, the Template Records shall be considered authoritative.

# Appendix A — Standard Module Layout

This appendix is informative.

The following diagram illustrates the standard structural organization of an
ACP Studio Lua module.

```text
--------------------------------------------------------------------------------
Header
--------------------------------------------------------------------------------

Module Declaration

--------------------------------------------------------------------------------
Constants
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
Private State
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
Private Functions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
Public API
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
End of Module
--------------------------------------------------------------------------------
```

Every Lua module developed within ACP Studio should preserve this structural
organization.

The diagram illustrates the logical organization of a Lua module and does not
define implementation details.

# Appendix B — Module Header Example

This appendix is informative.

The following example illustrates the standard ACP Studio module header.

```lua
--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : ModuleName
-- Layer         : LayerName
-- Purpose       : Brief description of the module responsibility.
-- Specification : XXX-000
--------------------------------------------------------------------------------
```

The actual values depend on the specific module being implemented.

The Reference Implementation provides the authoritative header format.

# Appendix C — Minimal Reference Implementation

This appendix is informative.

The following example illustrates the minimal organization of a Lua module
conforming to this standard.

```lua
--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : ModuleName
-- Layer         : LayerName
-- Purpose       : Module responsibility.
-- Specification : XXX-000
--------------------------------------------------------------------------------

local ModuleName = {}

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Private State
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return ModuleName
```

This example illustrates only the structural organization required by this
standard.

The complete Reference Implementation is provided by `ModuleSkeleton.lua`.

# Revision History

| Version  | Date       | Description                |
|----------|------------|----------------------------|
| 1.0.0    | 2026-07-20 | Initial certified release  |