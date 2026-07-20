------------------------------------------------------------------------------
ACP Studio

Specification   : APP-001
Title           : Application Layer Architecture

Category        : Application Architecture
Status          : Approved

Version         : 2.0.0

Author          : ACP Studio

Dependencies    : DOM-001 Domain Model Architecture
                  GUI-106 View Framework Foundation
                  GUI-108 ViewManager Foundation
                  GUI-109 BaseView Foundation
                  GUI-111 View Integration Foundation

------------------------------------------------------------------------------

# 1. Purpose

------------------------------------------------------------------------------

This document defines the Application Layer Architecture used by ACP Studio.

The Application Layer coordinates the execution of application use cases by
orchestrating interactions between the Graphical User Interface, the Domain
Layer, and the Runtime Infrastructure.

The Application Layer contains no business rules and no presentation logic.

Its responsibility is limited to coordinating application workflows,
invoking domain operations, managing application navigation, and defining
the architectural boundary between the user interface and the domain model.

The Application Layer provides the foundation for all application features,
including Views, Navigation, Commands, Application Services, and ViewModels,
while preserving the independence of the underlying architectural layers.

------------------------------------------------------------------------------

# 2. Responsibilities

------------------------------------------------------------------------------

The Application Layer is responsible for:

* coordinating application use cases;
* orchestrating application workflows;
* managing application navigation;
* coordinating interactions between Views and Domain Services;
* invoking Domain Services;
* preparing ViewModels for presentation;
* isolating the Domain Layer from presentation concerns;
* isolating the Domain Layer from infrastructure concerns;
* defining the application boundary.

The Application Layer is not responsible for:

* implementing business rules;
* owning business state;
* rendering the graphical user interface;
* performing runtime operations;
* communicating directly with external systems;
* accessing shared memory;
* interacting directly with REAPER;
* implementing infrastructure services.

------------------------------------------------------------------------------

# 3. Layer Position

------------------------------------------------------------------------------

The Application Layer is positioned between the Graphical User Interface and
the Domain Layer.

It acts as the coordination layer responsible for translating user interactions
into application workflows and delegating business decisions to the Domain
Layer.

The Application Layer also coordinates interactions with the Runtime
Infrastructure whenever required by an application workflow, while preserving
the independence of both the Domain Layer and the GUI Framework.

                           User
                             │
                             ▼
                     Graphical User Interface
                             │
                             ▼
                     Application Layer
                             │
                ┌────────────┴────────────┐
                ▼                         ▼
          Domain Layer        Runtime Infrastructure

The Application Layer is the only layer responsible for coordinating
application workflows.

Business decisions shall always remain within the Domain Layer.

Presentation concerns shall always remain within the GUI Framework.

Runtime concerns shall always remain within the Runtime Infrastructure.

------------------------------------------------------------------------------

# 4. Layer Architecture

------------------------------------------------------------------------------

The Application Layer is composed of specialized components that coordinate
application behavior while preserving the separation between presentation,
business logic, and runtime infrastructure.

The layer is organized into the following architectural components:

* Views
* Navigation
* Commands
* Application Services
* ViewModels

Each component has a single responsibility and collaborates with the others
through well-defined interfaces.

The Application Layer shall remain independent from both presentation
implementation details and infrastructure implementations.

Application Layer
│
├── Views
├── Navigation
├── Commands
├── ViewModels
└── Application Services
        │
        ▼
   Domain Services

Views represent the graphical entry point of the application.

Navigation coordinates the active application View.

Commands represent user-initiated application actions.

Application Services coordinate application workflows by invoking the
appropriate Domain Services.

ViewModels expose presentation-ready data without exposing domain
implementation details.

All business rules shall remain exclusively within the Domain Layer.

------------------------------------------------------------------------------

# 5. Application Views

------------------------------------------------------------------------------

Application Views represent the graphical entry point of application use cases.

Each View is responsible exclusively for presenting information and collecting
user interactions.

Views shall remain stateless with respect to business logic and shall never
implement application workflows or business rules.

Application Views are managed by the ViewManager provided by the GUI
Framework and shall derive from the certified BaseView.

Each View shall represent a single functional area of the application.

Examples include:

* Home View
* Analysis View
* Projects View
* Profiles View
* Reports View
* Settings View

Application Views may:

* render graphical components;
* collect user interactions;
* invoke Application Services;
* display ViewModels.

Application Views shall never:

* implement business rules;
* access the Domain Layer directly;
* communicate directly with the Runtime Infrastructure;
* coordinate application workflows.

The responsibility of a View is limited to presenting the current application
state and forwarding user requests to the appropriate Application Services.

------------------------------------------------------------------------------

# 6. Application Services

------------------------------------------------------------------------------

Application Services coordinate the execution of application use cases.

Each Application Service represents the entry point for a specific application
workflow and is responsible for coordinating interactions between the
Application Layer, the Domain Layer, and the Runtime Infrastructure when
required.

Application Services contain no business rules and own no business state.

Each Application Service shall implement a single application use case.

Application Services may:

* validate application requests;
* coordinate application workflows;
* invoke Domain Services;
* coordinate Runtime operations;
* construct ViewModels;
* return application results.

Application Services shall never:

* implement business rules;
* modify Domain objects directly;
* render graphical components;
* own application state;
* communicate directly with the user.

Application Services shall expose a minimal, explicit, and stable public API.

Examples include:

* AnalysisApplicationService
* ProjectApplicationService
* ReportApplicationService

Application Services represent the coordination boundary between the graphical
user interface and the Domain Layer.

------------------------------------------------------------------------------

# 7. Navigation

------------------------------------------------------------------------------

Navigation coordinates the activation and transition of Application Views.

It is responsible for managing the current application context while preserving
the independence of individual Views.

Navigation shall operate exclusively through the ViewManager provided by the
GUI Framework.

Application Navigation is responsible for:

* activating Application Views;
* switching between Views;
* preserving navigation state;
* coordinating View transitions;
* providing a consistent navigation experience.

Application Navigation shall never:

* implement business rules;
* render graphical components;
* coordinate application workflows;
* invoke Domain Services directly;
* perform runtime operations.

Navigation decisions shall remain independent from application use cases.

Application workflows shall be coordinated exclusively by Application
Services.

The Navigation component shall remain replaceable without affecting the
Domain Layer or the Runtime Infrastructure.

------------------------------------------------------------------------------

# 8. Commands

------------------------------------------------------------------------------

Commands represent user-initiated application actions.

A Command encapsulates the intent of a user action and provides a clear
boundary between the graphical user interface and the corresponding
application workflow.

Commands are responsible for:

* representing a single user action;
* encapsulating application requests;
* invoking the appropriate Application Service;
* providing a consistent execution model.

Commands shall never:

* implement business rules;
* render graphical components;
* coordinate application workflows;
* access the Domain Layer directly;
* perform runtime operations.

Each Command shall represent a single application intent.

Examples include:

* StartAnalysisCommand
* OpenProjectCommand
* OpenSettingsCommand
* ExportReportCommand

Commands shall remain stateless.

Application Services remain responsible for coordinating the execution of
application workflows initiated by Commands.

------------------------------------------------------------------------------

# 9. ViewModels

------------------------------------------------------------------------------

ViewModels expose presentation-ready application data.

A ViewModel adapts application and domain information into a representation
optimized for graphical presentation while preserving the independence of
the Domain Layer.

ViewModels are responsible for:

* exposing presentation-ready data;
* adapting domain objects for graphical presentation;
* formatting values for display;
* simplifying View rendering;
* isolating the GUI Framework from Domain objects.

ViewModels shall never:

* implement business rules;
* modify Domain objects;
* coordinate application workflows;
* invoke Domain Services;
* perform runtime operations.

ViewModels shall remain immutable whenever possible.

Application Views shall obtain presentation data through ViewModels rather
than interacting directly with Domain objects.

The use of ViewModels preserves the separation between presentation concerns
and business concerns while reducing coupling between the GUI Framework and
the Domain Layer.

------------------------------------------------------------------------------

# 10. Interaction with the Graphical User Interface

------------------------------------------------------------------------------

The Application Layer interacts with the Graphical User Interface exclusively
through Application Views and Application Commands.

The Graphical User Interface is responsible for rendering application state,
collecting user interactions, and forwarding application requests to the
Application Layer.

The Application Layer shall never perform graphical rendering.

Application Views may invoke Application Services directly or through
Application Commands, depending on the application workflow.

The Graphical User Interface shall never:

* implement business rules;
* access the Domain Layer directly;
* coordinate application workflows;
* perform runtime operations.

The Application Layer shall remain independent from the implementation
details of the Graphical User Interface.

Changes to the graphical interface shall not affect application workflows.

------------------------------------------------------------------------------

# 11. Interaction with the Domain Layer

------------------------------------------------------------------------------

The Application Layer interacts with the Domain Layer exclusively through
its published public interfaces.

Application Services coordinate application workflows by invoking the
appropriate Domain Services and consuming the resulting immutable Domain
objects.

The Application Layer shall never modify Domain objects directly.

All business rules, state transitions, validations, and business decisions
shall remain exclusively within the Domain Layer.

The Domain Layer shall remain independent from the Application Layer and
shall not depend on application-specific concepts.

The Application Layer is responsible solely for coordinating domain
operations and propagating the resulting application state toward the
presentation layer.

The separation between the Application Layer and the Domain Layer shall be
preserved at all times.

------------------------------------------------------------------------------

# 12. Interaction with the Runtime Infrastructure

------------------------------------------------------------------------------

The Application Layer interacts with the Runtime Infrastructure exclusively
for coordinating the execution of technical operations required by
application workflows.

Runtime operations are initiated by Application Services whenever technical
execution is required to support a valid application use case.

The Runtime Infrastructure is responsible for executing technical operations
without influencing application workflows or business decisions.

The Application Layer shall never expose Runtime implementation details to
the Graphical User Interface.

The Runtime Infrastructure shall remain independent from both the
Application Layer and the Domain Layer.

Changes to Runtime implementations shall not affect application workflows,
provided that the published Runtime interfaces remain unchanged.

Business decisions shall never be delegated to the Runtime Infrastructure.

The separation between application coordination and technical execution
shall be preserved at all times.

------------------------------------------------------------------------------

# 13. Dependency Rules

------------------------------------------------------------------------------

The architectural layers of ACP Studio shall follow a strict unidirectional
dependency model.

Dependencies shall flow only toward lower architectural layers.

The permitted dependency flow is:

                     Graphical User Interface
                                │
                                ▼
                       Application Layer
                                │
                                ▼
                          Domain Layer
                                │
                                ▼
                     Runtime Infrastructure

The following dependencies are permitted:

* Graphical User Interface → Application Layer
* Application Layer → Domain Layer
* Application Layer → Runtime Infrastructure
* Runtime Infrastructure → Infrastructure Components

The following dependencies are prohibited:

* Domain Layer → Application Layer
* Domain Layer → Graphical User Interface
* Runtime Infrastructure → Application Layer
* Runtime Infrastructure → Domain Layer
* Graphical User Interface → Domain Layer
* Graphical User Interface → Runtime Infrastructure

Circular dependencies between architectural layers are prohibited.

Each layer shall expose its functionality exclusively through its published
public interfaces.

No layer shall depend upon the internal implementation details of another
layer.

------------------------------------------------------------------------------

# 14. Design Principles

------------------------------------------------------------------------------

The Application Layer shall comply with the following design principles.

* Single Responsibility
  Each component shall have a single, well-defined responsibility.

* Separation of Concerns
  Presentation, application coordination, business logic, and technical
  execution shall remain isolated within their respective architectural
  layers.

* Stateless Coordination
  Application Services shall remain stateless and shall not own application
  or business state.

* Explicit Dependencies
  Dependencies between architectural layers shall remain explicit and
  unidirectional.

* Composition over Inheritance
  Application components shall favor composition whenever practical.

* Minimal Public Interfaces
  Public APIs shall remain small, explicit, and stable.

* Immutable Data Flow
  Domain objects shall remain immutable outside the Domain Layer.

* Replaceable Components
  Components of the Application Layer shall be replaceable without affecting
  the Domain Layer, the GUI Framework, or the Runtime Infrastructure.

* Deterministic Workflows
  Application workflows shall produce deterministic behavior for equivalent
  inputs.

* No Speculative Functionality
  Functionality shall be introduced only when required by approved
  application use cases.

------------------------------------------------------------------------------

# 15. Certification Criteria

------------------------------------------------------------------------------

The Application Layer is certified when the following conditions are
satisfied.

* Application workflows are coordinated exclusively through Application
  Services.

* Business rules remain exclusively within the Domain Layer.

* Presentation logic remains exclusively within the Graphical User
  Interface.

* Runtime operations are coordinated without exposing technical
  implementation details to the user interface.

* Architectural dependencies comply with the approved dependency model.

* Application components remain stateless unless explicitly specified
  otherwise.

* Public interfaces remain minimal, explicit, and stable.

* Application workflows produce deterministic results for equivalent
  application requests.

* Components comply with the Single Responsibility Principle.

* The separation between the Graphical User Interface, Application Layer,
  Domain Layer, and Runtime Infrastructure is preserved.

The Application Layer shall remain extensible without requiring changes to
the architectural responsibilities defined by this specification.

------------------------------------------------------------------------------

# 16. Future Evolution

------------------------------------------------------------------------------

The Application Layer is designed to support the progressive evolution of
ACP Studio while preserving the architectural boundaries defined by this
specification.

Future application capabilities shall be introduced by extending the
Application Layer through new Views, Application Services, Commands,
Navigation components, and ViewModels.

Examples of future application features include:

* Analysis
* Projects
* Profiles
* Reports
* Settings

New application components shall integrate with the existing architecture
without modifying the responsibilities of the Graphical User Interface,
Domain Layer, or Runtime Infrastructure.

The introduction of new application features shall not require changes to
the certified architectural responsibilities defined by this specification.

Future evolution shall preserve:

* the separation of concerns;
* the approved dependency model;
* the independence of architectural layers;
* the stability of public interfaces;
* the coordination role of the Application Layer.

The Application Layer shall remain the architectural foundation for all
future application functionality implemented by ACP Studio.

------------------------------------------------------------------------------