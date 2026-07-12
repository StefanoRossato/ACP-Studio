################################################################################
# ACP Studio
################################################################################

Document ID     : TST-001
Title           : Test Infrastructure
Category        : Testing Standard
Status          : Approved
Version         : 1.1.0

Author          : ACP Studio
Created         : 2026-07-12
Last Updated    : 2026-07-13

################################################################################

-------------------------------------------------------------------------------
Table of Contents
-------------------------------------------------------------------------------

1. Document Purpose

2. Document Scope

3. Testing Philosophy

4. Test Infrastructure

5. Test Launcher

6. Test Bootstrap

7. Test Setup

8. Test Organization

9. Test Lifecycle

10. Conformance

11. Future Revisions

-------------------------------------------------------------------------------
1. Document Purpose
-------------------------------------------------------------------------------

The purpose of this Testing Standard is to define the common testing
infrastructure adopted by ACP Studio.

This document establishes the engineering principles, architecture and
responsibilities governing the execution of all ACP Studio test suites.

The objective of this standard is to ensure that every test executes
within a deterministic, reproducible and consistent environment,
independently of its location within the project repository.

This standard defines the common Test Bootstrap process, the shared Test
Setup environment and the organizational rules required to support
uniform testing throughout the ACP Studio project.

This document is the authoritative reference for the testing
infrastructure adopted by ACP Studio.

-------------------------------------------------------------------------------
2. Document Scope
-------------------------------------------------------------------------------

This Testing Standard applies to all test components maintained within
the ACP Studio repository.

The standard governs the architecture, organization, initialization,
execution and maintenance of the ACP Studio testing infrastructure.

The following testing categories SHALL conform to this standard:

- Unit Tests
- Integration Tests
- Runtime Tests
- Diagnostics Tests
- Certification Tests
- Future Test Suites

This standard does not define testing methodologies, validation
procedures or engineering specifications. Those subjects SHALL be
governed by their respective Engineering Standards and Specifications.

Every ACP Studio test SHALL execute through the common Test
Infrastructure defined by this standard.

-------------------------------------------------------------------------------
3. Testing Philosophy
-------------------------------------------------------------------------------

Testing is considered a first-class engineering activity within ACP
Studio.

The objective of testing is not only to detect implementation defects,
but also to validate engineering intent and demonstrate conformance to
approved specifications.

Every ACP Studio test SHALL execute within a standardized testing
environment in order to ensure deterministic, reproducible and
consistent results.

The testing infrastructure is designed to isolate individual test suites
from repository organization, filesystem layout and implementation
details.

Engineering tests SHALL depend upon the common Test Infrastructure
rather than individual project configurations.

This philosophy promotes maintainability, portability and long-term
evolution of the ACP Studio testing system.

-------------------------------------------------------------------------------
4. Test Infrastructure
-------------------------------------------------------------------------------

The ACP Studio Test Infrastructure defines the common execution
environment shared by all project test suites.

The Test Infrastructure provides a standardized initialization process
that prepares the execution environment before any individual test is
performed.

The infrastructure SHALL isolate test implementations from repository
layout, directory structure and environment configuration.

Every ACP Studio test SHALL execute through the common Test
Infrastructure prior to loading project modules or executing validation
logic.

The Test Infrastructure consists of the following engineering
components:

- Test Launcher
- Test Bootstrap
- Test Setup
- Common Test Environment

Each component has a single responsibility and SHALL remain independent
from individual test implementations.

The Test Launcher is the unique entry point of the testing
infrastructure.

The responsibilities of each component are defined by the following
sections of this standard.

-------------------------------------------------------------------------------
5. Test Launcher
-------------------------------------------------------------------------------

The Test Launcher is the unique entry point of every ACP Studio test.

The Test Launcher is responsible for performing the minimum
initialization required to transfer control to the Test Bootstrap.

The Test Launcher SHALL remain a separate component from the Test
Bootstrap and the Test Setup.

The responsibilities of the Test Launcher include:

- Locating the requested test.
- Loading the Test Bootstrap.
- Transferring control to the Test Bootstrap.
- Executing exactly one requested test.

The Test Launcher SHALL NOT configure the testing environment.

The Test Launcher SHALL NOT modify the Lua module search path.

The Test Launcher SHALL NOT load ACP Studio modules other than the Test
Bootstrap.

The Test Launcher SHALL NOT contain engineering validation logic.

The Test Launcher SHALL remain minimal and deterministic.

After transferring control to the Test Bootstrap, the Test Launcher
SHALL perform no additional processing.

-------------------------------------------------------------------------------
6. Test Bootstrap
-------------------------------------------------------------------------------

The Test Bootstrap is responsible for preparing the execution
environment required by every ACP Studio test.

The Test Bootstrap SHALL execute before any project module is loaded or
any test logic is performed.

The responsibilities of the Test Bootstrap include:

- Locating the ACP Studio repository root.
- Configuring the Lua module search path.
- Loading the common Test Setup environment.
- Preparing the common execution environment.
- Transferring control to the requesting test.

The Test Bootstrap SHALL remain independent of individual test suites.

No ACP Studio test SHALL configure repository paths, module search paths
or environment initialization directly.

All common initialization logic SHALL be centralized within the Test
Bootstrap.

-------------------------------------------------------------------------------
7. Test Setup
-------------------------------------------------------------------------------

The Test Setup is responsible for preparing the common execution
environment shared by all ACP Studio test suites.

The Test Setup SHALL execute after the Test Bootstrap has completed the
environment initialization.

The responsibilities of the Test Setup include:

- Initializing the common testing environment.
- Loading shared engineering utilities.
- Loading common logging facilities.
- Initializing shared test services.
- Providing common helper functions.
- Providing common testing constants.

The Test Setup SHALL remain independent of individual test
implementations.

No ACP Studio test SHALL duplicate initialization logic already provided
by the Test Setup.

The Test Setup provides the common engineering foundation upon which all
ACP Studio tests are executed.

-------------------------------------------------------------------------------
8. Test Organization
-------------------------------------------------------------------------------

The ACP Studio testing system SHALL be organized according to
engineering responsibility.

Each test suite SHALL belong to a well-defined testing category and
SHALL remain independent from other test suites whenever practical.

The testing repository SHALL organize test suites into dedicated
directories based on their engineering purpose.

The following testing categories are defined:

- Runtime Tests
- Analysis Tests
- Integration Tests
- Diagnostics Tests
- Framework Tests

Additional testing categories MAY be introduced as the ACP Studio
project evolves, provided they conform to this Testing Standard.

Individual tests SHALL depend only upon the common Test Infrastructure
and SHALL remain independent of repository organization and directory
structure.

The organization of the testing repository SHALL promote consistency,
discoverability and long-term maintainability.

-------------------------------------------------------------------------------
9. Test Lifecycle
-------------------------------------------------------------------------------

Every ACP Studio test SHALL progress through a defined engineering
lifecycle from initial implementation to long-term maintenance.

The testing lifecycle ensures that every test is designed, implemented,
validated and maintained according to a consistent engineering process.

The following lifecycle phases are defined:

1. Architecture
2. Review
3. Specification Freeze
4. Implementation
5. Validation
6. Certification
7. Maintenance

Each phase SHALL be completed before progressing to the next phase.

Approved test infrastructure components SHALL only be modified through
the defined engineering review process.

The testing lifecycle promotes consistency, traceability and long-term
maintainability throughout the ACP Studio project.

-------------------------------------------------------------------------------
10. Conformance
-------------------------------------------------------------------------------

A test component conforms to this Testing Standard when all mandatory
requirements defined by TST-001 have been satisfied.

Conformance SHALL be verified as part of the engineering review process
prior to test certification.

Tests that do not conform to this Testing Standard SHALL NOT be
considered certified.

Future Testing Standards MAY define additional conformance requirements
provided they do not conflict with this Testing Standard.

Conformance to this standard ensures that every ACP Studio test executes
within the common Test Infrastructure and follows a consistent
engineering process.

-------------------------------------------------------------------------------
11. Future Revisions
-------------------------------------------------------------------------------

This Testing Standard is intended to provide a stable engineering
foundation for the ACP Studio testing infrastructure.

Future revisions SHALL preserve the engineering principles established
by this standard while allowing controlled evolution of the testing
system.

Revisions SHALL be introduced only when required to support new
engineering capabilities, additional testing categories or significant
architectural improvements.

All revisions SHALL be reviewed, approved and documented according to
the engineering lifecycle adopted by ACP Studio.

Future revisions SHALL preserve backward compatibility whenever
practical and SHALL maintain consistency throughout the ACP Studio
testing framework.