------------------------------------------------------------------------------
ACP Studio

Document        : DOM-001
Title           : Domain Model Architecture

Category        : Architecture
Status          : Approved

Version         : 2.1.0

Author          : ACP Studio

Dependencies    : ARC-001 Architecture Skeleton Standard
                  RTM-001 Runtime Architecture

------------------------------------------------------------------------------

# 1. Purpose

The purpose of the Domain Model is to provide a technology-independent
representation of the ACP Studio business domain.

The Domain layer defines the language, concepts, relationships and rules
governing the business model of ACP Studio.

By isolating business concepts from runtime infrastructure and external
technologies, the Domain Model provides a stable architectural foundation
for the entire framework.

------------------------------------------------------------------------------

# 2. Scope

This document defines the architecture of the ACP Studio Domain layer.

Specifically, it defines:

- the purpose of the Domain layer;
- the architecture of the Domain Model;
- the domain component types;
- the relationships between domain components;
- the interaction between Domain and Infrastructure;
- the design principles governing all domain components;
- the lifecycle of domain capabilities.

The implementation of every domain component is defined by its dedicated
Capability Specification.

------------------------------------------------------------------------------

# 3. Domain Architecture

The Domain layer represents the business knowledge of ACP Studio.

It contains only technology-independent business concepts.

The Domain layer defines:

- what ACP Studio knows;
- how business concepts relate to each other;
- the consistency rules governing the business domain.

The Domain Model is completely isolated from:

- Runtime;
- Infrastructure;
- REAPER APIs;
- Shared Memory;
- JSFX;
- persistence;
- external systems.

Infrastructure defines how information is acquired.

Domain Services define how domain operations are coordinated.

------------------------------------------------------------------------------

# 4. Domain Component Types

The Domain Model is composed of four architectural component types.

## Aggregate Root

The Aggregate Root owns the consistency of a domain aggregate.

All interactions with an aggregate shall occur through its Aggregate Root.

An Aggregate Root may own Entities and Value Objects.

------------------------------------------------------------------------------

## Entity

An Entity represents a business concept with its own identity.

Entities may aggregate one or more Value Objects.

Entities preserve business consistency but do not own the aggregate lifecycle.

------------------------------------------------------------------------------

## Value Object

A Value Object represents a single immutable business value.

Value Objects have no identity.

Equality is determined exclusively by their domain state.

------------------------------------------------------------------------------

## Domain Service

A Domain Service coordinates business operations.

A Domain Service owns no business state.

Its responsibility is limited to domain coordination.

------------------------------------------------------------------------------

# 5. Analysis Domain Model

The current Analysis domain is organized according to the following
Domain-Driven Design model.

```text
Analysis Domain
│
├── Aggregate Root
│
│   AnalysisSession
│
├── Entity
│
│   MeasurementResult
│
├── Value Objects
│
│   AnalysisState
│   Measurement
│
└── Domain Service

    AnalysisService
```

The relationships between the domain components are illustrated below.

```text
AnalysisSession
        │
        ├── State
        │       │
        │       ▼
        │   AnalysisState
        │
        └── Result
                │
                ▼
        MeasurementResult
                │
                ├── RMS
                │
                └── Peak
                        │
                        ▼
                    Measurement

AnalysisService
        │
        └── Coordinates AnalysisSession lifecycle
```

The Analysis Session is the Aggregate Root of the Analysis domain.

All access to the Analysis domain shall occur through the Analysis Session
aggregate.

------------------------------------------------------------------------------

# 6. Architectural Principles

Every Domain Component shall comply with the following principles.

## Single Responsibility

Each component shall represent exactly one business concept.

------------------------------------------------------------------------------

## Technology Independence

No component shall depend on Runtime, Infrastructure or implementation
details.

------------------------------------------------------------------------------

## Immutability

Value Objects shall be immutable.

Aggregates shall preserve business consistency through immutable state.

------------------------------------------------------------------------------

## Domain-Oriented Interface

Public APIs shall expose only business concepts.

Technology-specific concepts shall never appear in the Domain layer.

------------------------------------------------------------------------------

## Minimal Public API

Only operations required by the business domain shall be exposed.

------------------------------------------------------------------------------

## Independent Testability

Every domain component shall be independently testable.

------------------------------------------------------------------------------

# 7. Relationship with Infrastructure

The Domain layer is isolated from Infrastructure.

Infrastructure is responsible for:

- acquiring external information;
- translating external data into domain components;
- coordinating runtime interaction.

The Domain layer is responsible only for representing business concepts.

```text
External Systems
        │
        ▼
Infrastructure
        │
        ▼
Domain
```

Infrastructure depends on Domain.

Domain shall never depend on Infrastructure.

------------------------------------------------------------------------------

# 8. Domain Capability Lifecycle

Every Domain Component shall follow the ACP Studio engineering workflow.

```text
Architecture
        │
        ▼
Capability Specification
        │
        ▼
Approved
        │
        ▼
Implementation
        │
        ▼
Capability Test
        │
        ▼
Certified
```

Implementation shall never precede its Capability Specification.

Certification shall always verify compliance with the approved specification.

------------------------------------------------------------------------------

# 9. Design Rules

Compliance with the following rules is mandatory.

Every Domain Component shall:

- represent exactly one business concept;
- remain independent from Infrastructure;
- expose only business-oriented APIs;
- provide a minimal public interface;
- remain immutable whenever applicable;
- avoid speculative functionality;
- be specified before implementation;
- be documented through a dedicated Capability Specification;
- be validated through dedicated unit tests.

------------------------------------------------------------------------------

# 10. Certification Requirements

The Domain Model Architecture is considered certified when:

- the architectural principles defined by DOM-001 have been approved;
- every Domain Component complies with DOM-001;
- every Domain Component is documented through its Capability Specification;
- every Domain Component is validated through dedicated unit tests;
- the interaction between Infrastructure and Domain has been verified through
  integration testing.

Compliance with DOM-001 is mandatory for all future Domain Components.

------------------------------------------------------------------------------

# 11. Future Evolution

The Domain Model shall evolve incrementally.

New Domain Components shall be introduced only in response to concrete
business requirements.

The architectural principles defined by DOM-001 shall remain stable
throughout the evolution of ACP Studio.

------------------------------------------------------------------------------
End of Document
------------------------------------------------------------------------------