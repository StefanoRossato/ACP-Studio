------------------------------------------------------------------------------
ACP Studio

Specification   : TPL-002
Title           : Lua Test Template Standard

Category        : Engineering Templates
Status          : Certified

Version         : 1.0.0

Author          : ACP Studio

Dependencies    : ENG-001
                : TPL-001
                : TPL-006

------------------------------------------------------------------------------

# 1. Purpose

This standard defines the certified engineering template for implementing
automated Lua test modules within ACP Studio.

Its purpose is to establish a uniform structure for all test modules,
ensuring consistency, readability, maintainability, deterministic execution,
and repeatable certification throughout the ACP Studio engineering lifecycle.

This standard defines the required organization and execution framework for
Lua test modules.

It does not define testing methodologies, verification criteria, or component-
specific test cases, which are governed by their respective engineering
standards and specifications.

All automated Lua tests developed for ACP Studio shall conform to this
standard unless explicitly superseded by another certified engineering
standard.

# 2. Scope

This standard applies to all automated Lua test modules developed as part of
the ACP Studio project.

Its requirements govern the structure, organization, initialization,
execution, and certification of test modules across the entire software
architecture.

This standard applies to tests regardless of:

- Architectural layer
- Software component
- Development phase
- Implementation technology
- Testing purpose

The following test categories shall conform to this standard:

- Engineering Tests
- Application Tests
- Domain Tests
- Runtime Tests
- Analysis Tests
- GUI Tests
- Integration Tests
- Observability Tests
- Diagnostics Tests
- Tool Tests

This standard defines the structural framework for Lua test modules.

It does not define:

- Test methodologies
- Verification strategies
- Component-specific test cases
- Acceptance criteria
- Engineering certification procedures

These subjects shall be governed by their respective engineering standards,
specifications, and architectural documents.

Compliance with this standard is mandatory unless explicitly superseded by a
certified engineering standard defining more specific test requirements.

# 3. Conformance

This standard is normative.

All ACP Studio Lua test modules shall conform to the requirements defined by
this standard unless explicitly superseded by another certified engineering
standard.

Conformance shall be verified during engineering review and certification.

Failure to satisfy mandatory requirements shall prevent a test module from
being considered compliant with this standard.

---

## 3.1 Normative Language

The following keywords define the normative strength of statements contained
within this standard.

| Keyword | Meaning |
|----------|---------|
| **Shall** | Indicates a mandatory requirement. |
| **Should** | Indicates a recommended practice. |
| **May** | Indicates an optional behavior or capability. |

The keywords shall be interpreted consistently throughout all ACP Studio test
modules.

---

## 3.2 Normative and Informative Content

This standard may contain both normative and informative content.

Normative content defines mandatory engineering requirements governing the
structure and implementation of Lua test modules.

Informative content provides explanations, rationale, examples, notes, or
background information intended to improve understanding.

Informative content shall not modify, replace, or contradict normative
requirements.

---

## 3.3 Examples

Examples are informative.

Examples illustrate recommended organization, implementation techniques, and
usage of the certified test template.

Examples shall not introduce additional engineering requirements.

---

## 3.4 Notes

Notes are informative.

Notes provide clarification, context, or additional observations.

Notes shall not alter the meaning of normative statements.

---

## 3.5 Engineering Review

Conformance shall be verified through engineering review.

Engineering review shall confirm that:

- mandatory requirements are satisfied;
- the standardized test structure is preserved;
- the test environment is initialized correctly;
- module loading follows the prescribed sequence;
- assertions are implemented consistently;
- the execution flow conforms to this standard.

Only test modules satisfying these requirements may be considered compliant
with this standard.

# 4. Test Template Principles

This chapter defines the engineering principles governing the ACP Studio Lua
Test Template.

These principles establish the objectives that every generated test module
shall satisfy.

---

## 4.1 Standardization

Every Lua test module shall adopt the standardized structure defined by this
standard.

A consistent organization improves readability, engineering review,
maintainability, and long-term evolution of the ACP Studio codebase.

---

## 4.2 Independence

Each test module shall execute independently of every other test module.

A test shall not rely upon the execution, results, or side effects of another
test.

---

## 4.3 Determinism

A test executed under identical conditions shall always produce identical
results.

Test execution shall not depend upon undefined behavior, execution order, or
external state unless explicitly required by the specification being verified.

---

## 4.4 Isolation

Each test module shall initialize its execution environment before loading the
component under test.

Initialization shall ensure that every test executes within a controlled and
predictable environment.

---

## 4.5 Simplicity

The test template shall provide only the infrastructure required to execute a
test.

Business logic, production functionality, and component-specific behavior
shall not be incorporated into the template.

---

## 4.6 Reusability

The template shall support the creation of test modules for every ACP Studio
architectural layer without modification of its fundamental structure.

Reusable engineering infrastructure shall be preferred over component-specific
solutions.

---

## 4.7 Traceability

Every test module shall maintain explicit traceability to the engineering
artifact being verified.

Traceability shall be established through the standardized document header and
the associated engineering specification.

# 5. Standard Test Structure

Every Lua test module shall follow the standardized organization defined by
this chapter.

A consistent structure improves readability, engineering review,
maintainability, and long-term evolution of the ACP Studio test suite.

The logical organization of a Lua test module shall be as follows.

```text
Header

Test Environment
    Load Bootstrap
    Initialize Test Environment

Module Under Test

Test Dependencies

Constants

Private Functions

Test Cases

Public API

Run Test
```

The order of these sections shall remain consistent throughout the ACP Studio
project.

Additional sections may be introduced only when required by the engineering
responsibility of the test module.

The standardized structure shall not be modified for stylistic preferences.

# 6. Test Environment

Every Lua test module shall initialize the ACP Studio test environment before
loading any project module.

The Test Environment is responsible for preparing a deterministic execution
context shared by all ACP Studio tests.

The initialization process shall include:

- locating the project Bootstrap module;
- determining the repository root;
- configuring the Lua module search path;
- preparing the test execution environment.

The test environment shall be initialized exactly once during test execution.

No ACP Studio module shall be loaded before successful initialization of the
Test Environment.

Failure to initialize the Test Environment shall immediately terminate test
execution.

The Test Environment shall remain independent of the component under test and
shall not contain business logic or component-specific behavior.

# 7. Module Under Test

The component under test shall be loaded only after successful initialization
of the Test Environment.

Module loading shall use the ACP Studio standardized module loading mechanism.

The module under test shall represent the primary engineering artifact being
verified by the test module.

Only modules required for the execution of the test shall be loaded.

The module under test shall remain clearly identifiable within the test
structure.

Dependencies unrelated to the component under test shall be declared
separately within the Test Dependencies section.

The loading of the component under test shall not produce side effects beyond
those required by its documented initialization behavior.

# 8. Test Dependencies

The Test Dependencies section declares all modules required to support the
execution of the test other than the component under test.

Test dependencies may include:

- helper modules;
- test utilities;
- mock implementations;
- supporting infrastructure;
- engineering utilities.

Dependencies shall remain limited to those strictly required by the test.

Unnecessary dependencies shall not be introduced.

Dependencies shall not modify the behavior of the component under test unless
explicitly required by the engineering specification being verified.

The Test Dependencies section shall remain clearly separated from the Module
Under Test section in order to preserve engineering traceability and improve
reviewability.

# 9. Test Utilities

The Lua Test Template provides a standardized set of utility functions intended
to support consistent test execution.

These utilities constitute part of the certified testing infrastructure and
shall be used whenever applicable.

The template provides standardized facilities for:

- console management;
- diagnostic logging;
- assertion handling.

Tests shall use the provided utilities in preference to custom
implementations.

Additional utility functions may be introduced when required by the
engineering responsibility of the template.

Utility functions shall remain generic and reusable.

They shall not contain business logic, component-specific behavior, or
application-specific assumptions.

The purpose of the Test Utilities section is to provide common infrastructure
that improves consistency, readability, maintainability, and engineering
review across all ACP Studio test modules.

# 10. Test Cases

Test cases define the engineering behaviors verified by the test module.

Each test case shall validate one specific capability, responsibility, or
engineering requirement of the component under test.

Test cases shall remain independent of one another.

The successful execution or failure of one test case shall not influence the
behavior of any other test case.

Each test case shall have a single clearly defined responsibility.

Multiple engineering behaviors shall not be combined within a single test
case unless explicitly required by the engineering specification.

Test cases shall produce deterministic and repeatable results.

The execution sequence of individual test cases shall remain explicit and
controlled by the test module.

Test cases shall communicate failures through the standardized assertion
mechanism provided by the test infrastructure.

The organization of test cases shall facilitate engineering review,
maintenance, and future extension of the test module.

# 11. Public API

Every Lua test module shall expose a minimal and well-defined public
interface.

The public interface shall provide the entry point required to execute the
test.

Public functions shall remain limited to those necessary for external
invocation of the test.

Implementation details shall remain encapsulated within the private sections
of the module.

The Public API shall not expose internal helper functions, implementation
artifacts, or temporary execution state.

The public interface shall remain stable, simple, and consistent across all
ACP Studio test modules.

A standardized public interface improves automation, integration, and
engineering review throughout the ACP Studio test framework.

# 12. Test Execution

The execution of a Lua test module shall follow a deterministic and
well-defined sequence.

Test execution shall begin from the standardized public entry point defined by
the test module.

The execution sequence shall include:

- initialization of the test environment;
- execution of all defined test cases;
- reporting of the overall execution result.

Test execution shall terminate with a clearly identifiable outcome indicating
successful completion or failure.

Unexpected errors shall immediately terminate execution and be reported
through the standardized test reporting mechanism.

The execution flow shall remain deterministic, repeatable, and independent of
external runtime conditions whenever technically feasible.

The standardized execution model ensures consistent behavior across all ACP
Studio test modules and facilitates automated execution and certification.

# 13. Compliance

A Lua test module conforms to this standard when it satisfies all mandatory
requirements defined in this specification.

Conformance requires, at minimum:

- compliance with the standardized test structure;
- correct initialization of the Test Environment;
- clear identification of the Module Under Test;
- proper separation of Test Dependencies;
- use of the standardized testing infrastructure;
- deterministic execution of test cases;
- a minimal and standardized Public API;
- execution through the standardized Test Execution model.

Engineering review shall verify conformance before a test module may be
considered certified.

Failure to satisfy any mandatory requirement defined by this specification
constitutes non-conformance.

# 14. References

## Normative References

ENG-001 — Engineering Documentation Standard

TPL-001 — Lua Module Template Standard

## Informative References

ACP Studio Engineering Architecture

ACP Studio Testing Framework

# 15. Revision History

| Version  | Date       | Description                                               |
|----------|------------|-----------------------------------------------------------|
| 1.0.0    | 2026-07-20 | First approved version of the Lua Test Template Standard. |
