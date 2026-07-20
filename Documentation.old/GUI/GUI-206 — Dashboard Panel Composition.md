--------------------------------------------------------------------------------
-- ACP Studio
--
-- Document      : GUI-206 — Dashboard Panel Composition
-- Layer         : Application / GUI Integration
-- Type          : Foundation Specification
-- Status        : Approved
--
-- Purpose
--   Define the architectural foundation of the Home Dashboard composition.
--   This specification establishes the certified composition mechanism
--   responsible for delegating dashboard rendering to independent panels
--   while preserving a deterministic and modular rendering architecture.
--
-- Scope
--   This document extends the Home View component architecture introduced
--   by GUI-205. It defines the certified Dashboard composition model,
--   separating panel orchestration from panel rendering and preparing the
--   architecture for future dashboard expansion.
--------------------------------------------------------------------------------

# GUI-206 — Dashboard Panel Composition

# 1. Purpose

The purpose of GUI-206 is to introduce the first certified composition
architecture for the Home Dashboard.

This milestone establishes the architectural contract defining how the
Home Dashboard delegates graphical rendering to specialized dashboard
panels while preserving a clear separation of responsibilities between
composition and rendering.

The Dashboard evolves from a monolithic rendering component into a
pure composition component responsible only for coordinating the
rendering pipeline.

The certified composition architecture establishes the following
structure:

    HomeDashboard

          |

          +-----------------------------+

          |             |               |

          v             v               v

 AnalysisOverview   RuntimeStatus   ProjectInformation
      Panel             Panel              Panel

Each panel becomes responsible for rendering a single logical section
of the dashboard while HomeDashboard remains responsible only for
their orchestration.

GUI-206 establishes the first certified Dashboard composition model
within ACP Studio and provides the architectural foundation required
for future dashboard expansion, independent panel evolution and
component reuse without increasing the complexity of HomeDashboard.

# 2. Scope

GUI-206 includes:

- Definition of the Home Dashboard composition architecture.
- Introduction of specialized dashboard panels.
- Separation between dashboard composition and panel rendering.
- Definition of HomeDashboard composition responsibilities.
- Definition of panel responsibilities and ownership.
- Standardization of the Dashboard Panel interface.
- Integration of the composition architecture with HomeView.
- Certification through automated tests.

GUI-206 does not include:

- Runtime live data integration.
- Application Service invocation.
- Shared Memory access.
- Panel interaction.
- User interaction handling.
- Dashboard layout redesign.
- Dynamic panel creation.
- Conditional panel visibility.
- Dashboard customization.

The objective is to establish the architectural foundation of Dashboard
Panel Composition while preserving the certified Home component
architecture introduced by GUI-205.

The milestone focuses exclusively on structural decomposition of the
Dashboard into independent rendering units, preparing the graphical
architecture for future feature expansion without modifying the
existing Presentation Model lifecycle or rendering behaviour.

# 3. Architectural Context

GUI-206 extends the Home View architecture introduced by GUI-205 by
establishing the first certified composition architecture for the Home
Dashboard.

The current architecture becomes:

    HomeView

        |

        v

    HomeDashboard

        |

        +-----------------------------+

        |             |               |

        v             v               v

 AnalysisOverview   RuntimeStatus   ProjectInformation
      Panel             Panel              Panel

The Home Dashboard becomes responsible exclusively for composing the
dashboard by coordinating the rendering of independent panels.

Each panel becomes responsible for rendering a single logical section
of the Home Dashboard while remaining completely independent from the
other panels.

This architecture introduces a clear separation between composition and
graphical rendering, allowing individual dashboard sections to evolve
independently without increasing the complexity of HomeDashboard.

The Presentation Model continues to be acquired through the certified
refresh lifecycle introduced by GUI-204 and is propagated unchanged to
each dashboard panel.

The dependency flow therefore becomes:

    HomeView

        |

        v

 Presentation Model

        |

        v

   HomeDashboard

        |

        +-----------------------------+

        |             |               |

        v             v               v

 AnalysisOverview   RuntimeStatus   ProjectInformation
      Panel             Panel              Panel

GUI-206 preserves the certified one-way dependency flow established by
previous milestones while introducing a modular composition layer that
prepares the graphical architecture for future Dashboard capabilities.

# 4. Dashboard Composition Architecture

GUI-206 introduces the Dashboard Composition Architecture as the first
certified mechanism responsible for organizing the graphical structure
of the Home Dashboard.

The Home Dashboard evolves from a rendering component into a composition
component responsible for coordinating independent dashboard panels.

The Home package becomes:

    Core/

        Application/

            Views/

                Home/

                    HomeView.lua

                    HomeViewModel.lua

                    Components/

                        HomeHeader.lua

                        HomeWelcome.lua

                        HomeDashboard.lua

                        HomeWorkspace.lua

                    Panels/

                        AnalysisOverviewPanel.lua

                        RuntimeStatusPanel.lua

                        ProjectInformationPanel.lua

HomeDashboard becomes the exclusive owner of the dashboard composition.

Its responsibility is limited to determining the rendering sequence of
the dashboard panels and propagating the Presentation Model received
from HomeView.

Each panel becomes an independent rendering component with a single,
well-defined responsibility.

The Dashboard Composition Architecture establishes the following
rendering pipeline:

        Presentation Model

                |

                v

          HomeDashboard

                |

      +---------+---------+

      |         |         |

      v         v         v

 Analysis     Runtime    Project

  Panel        Panel      Panel

The composition layer remains deterministic.

The rendering order is explicitly defined by HomeDashboard and does not
depend on Runtime state, user interaction or application services.

This architecture separates dashboard orchestration from graphical
implementation, allowing individual panels to evolve independently while
preserving a stable and predictable Dashboard composition model.

The Dashboard Composition Architecture establishes the certified
foundation for every future dashboard capability introduced within
ACP Studio.

# 5. Dashboard Responsibilities

GUI-206 establishes the responsibilities of the Dashboard composition
architecture between the composition layer and the rendering layer.

## 5.1 HomeDashboard Responsibilities

HomeDashboard is responsible for:

- Composing the Dashboard panels.
- Defining the rendering order.
- Propagating the Presentation Model.
- Coordinating the Dashboard rendering pipeline.
- Preserving deterministic rendering behaviour.

HomeDashboard is not responsible for:

- Rendering dashboard contents.
- Creating presentation data.
- Formatting application information.
- Executing business logic.
- Accessing Runtime or Domain services.
- Managing panel state.

HomeDashboard acts exclusively as the composition layer of the Home
Dashboard.

Its responsibility is limited to orchestrating the rendering sequence
of independent dashboard panels.

## 5.2 Dashboard Panel Responsibilities

Each dashboard panel is responsible for:

- Rendering a single logical Dashboard section.
- Consuming the Presentation Model.
- Producing graphical output.
- Remaining independent from other panels.
- Preserving stateless behaviour.

Dashboard panels are not responsible for:

- Composing other panels.
- Modifying the Presentation Model.
- Coordinating the rendering pipeline.
- Managing application lifecycle.
- Communicating with Runtime services.
- Accessing Application Services directly.

Each panel owns only its graphical representation.

No panel has knowledge of the implementation or internal state of any
other panel.

## 5.3 Composition Ownership

The Dashboard composition is owned exclusively by HomeDashboard.

Individual dashboard panels own only their graphical rendering logic.

The Presentation Model is propagated by HomeDashboard without being
modified, duplicated or transformed.

This ownership model guarantees a clear architectural separation between
Dashboard composition and Dashboard rendering while preserving the
certified one-way dependency flow established by previous milestones.

The composition layer remains independent from graphical implementation,
allowing dashboard panels to evolve, be replaced or extended without
requiring structural modifications to HomeDashboard.

# 6. Dashboard Composition Lifecycle

GUI-206 introduces the Dashboard Composition Lifecycle as the certified
rendering workflow responsible for coordinating the execution of all
Dashboard panels.

The composition lifecycle begins when HomeDashboard receives a valid
Presentation Model from HomeView.

The Presentation Model is propagated unchanged to each panel according
to the certified rendering order established by HomeDashboard.

The certified lifecycle is:

        Presentation Model

                |

                v

          HomeDashboard

                |

                v

    AnalysisOverviewPanel

                |

                v

     RuntimeStatusPanel

                |

                v

  ProjectInformationPanel

                |

                v

         Dashboard Complete

The composition lifecycle is deterministic.

Each panel is rendered exactly once during the Dashboard rendering
pipeline.

No panel may interrupt, reorder or invoke the rendering of another
panel.

The Presentation Model remains read-only throughout the entire
composition lifecycle.

## 6.1 Composition Phase

The composition phase is responsible for coordinating the Dashboard
rendering sequence.

Responsibilities:

- Receive the Presentation Model.
- Invoke each Dashboard panel.
- Preserve the rendering order.
- Complete the Dashboard rendering pipeline.

Example:

```lua
HomeDashboard.Render(context, model)
```

HomeDashboard never performs graphical rendering directly.

Its only responsibility is orchestrating the rendering workflow.

## 6.2 Panel Rendering Phase

Each Dashboard panel receives the Presentation Model and renders its
own graphical section.

Responsibilities:

- Read the Presentation Model.
- Render the assigned Dashboard section.
- Preserve panel independence.
- Return control to HomeDashboard.

Panels never:

- Modify the Presentation Model.
- Invoke other panels.
- Maintain rendering state.
- Perform composition responsibilities.

This execution model guarantees that Dashboard composition remains
predictable, modular and fully independent from the implementation of
individual panels.

Future milestones may introduce additional Dashboard panels while
preserving the certified composition lifecycle established by GUI-206.

# 7. Integration with HomeView

GUI-206 extends the integration between HomeView and HomeDashboard by
introducing the first certified Dashboard composition architecture.

The integration flow becomes:

            HomeView

                |

                v

     Cached Presentation Model

                |

                v

          HomeDashboard

                |

      +---------+---------+

      |         |         |

      v         v         v

 Analysis     Runtime    Project

  Panel        Panel      Panel

HomeView remains responsible for acquiring and maintaining the cached
Presentation Model through the certified refresh lifecycle introduced by
GUI-204.

HomeDashboard receives the cached Presentation Model and becomes
responsible exclusively for coordinating the Dashboard rendering
pipeline.

Each Dashboard panel consumes the same Presentation Model instance and
renders its assigned graphical section without modifying the underlying
data.

The Dashboard composition layer does not know:

- How the Presentation Model is created.
- How the Presentation Model is refreshed.
- Where the presentation data originate.
- How future Application Services will provide data.
- How Runtime information is acquired.

The Dashboard panels do not know:

- The existence of other panels.
- The rendering order.
- The Home View lifecycle.
- The Dashboard composition mechanism.

This separation guarantees that HomeView, HomeDashboard and Dashboard
panels evolve independently while preserving the certified architectural
boundaries established by previous milestones.

## 7.1 Integration Rules

HomeView must:

- Acquire the Presentation Model.
- Maintain the cached Presentation Model.
- Invoke HomeDashboard.
- Preserve the certified refresh lifecycle.
- Avoid Dashboard rendering responsibilities.

HomeDashboard must:

- Receive the Presentation Model.
- Compose the Dashboard panels.
- Preserve the rendering order.
- Avoid panel implementation responsibilities.

Dashboard panels must:

- Consume the Presentation Model.
- Render only their assigned section.
- Remain stateless.
- Avoid composition responsibilities.

The dependency direction remains:

    HomeView

        |

        v

  HomeDashboard

        |

        +-----------------------------+

        |             |               |

        v             v               v

 AnalysisOverview   RuntimeStatus   ProjectInformation
      Panel             Panel              Panel

The dependency flow remains strictly one-way while the Dashboard
composition layer becomes the certified mechanism responsible for
coordinating Dashboard rendering.

# 8. Standard Panel Interface

GUI-206 establishes the first certified interface standard for Dashboard
panels.

Every Dashboard panel implements the same public rendering interface,
allowing HomeDashboard to compose panels without knowledge of their
internal implementation.

The certified panel interface is:

```lua
Render(context, model)
```

The rendering interface is intentionally minimal.

The rendering context provides access to the graphical environment,
while the Presentation Model provides all information required for
graphical rendering.

No additional dependencies are required.

The interface remains stable regardless of the panel implementation.

## 8.1 Interface Responsibilities

Every Dashboard panel must:

- Expose a public Render function.
- Receive the rendering context.
- Receive the Presentation Model.
- Render its graphical section.
- Return control to HomeDashboard.

Every Dashboard panel must not:

- Return graphical data.
- Modify the Presentation Model.
- Invoke other panels.
- Manage Dashboard composition.
- Maintain internal rendering state.

The Render function represents the complete public contract of a
Dashboard panel.

All implementation details remain encapsulated within the panel.

## 8.2 Interface Consistency

Every Dashboard panel follows the same execution model.

Example:

```lua
AnalysisOverviewPanel.Render(context, model)

RuntimeStatusPanel.Render(context, model)

ProjectInformationPanel.Render(context, model)
```

Because every panel exposes the same interface, HomeDashboard remains
independent from the implementation details of individual panels.

Additional Dashboard panels can therefore be introduced without
modifying the composition mechanism.

## 8.3 Interface Evolution

The Dashboard Panel Interface is designed to remain stable as the
Dashboard grows.

Future milestones may introduce additional Dashboard panels implementing
the same certified interface without requiring changes to HomeDashboard
or existing panels.

This interface standard establishes a uniform rendering contract across
the Dashboard architecture and becomes the certified foundation for all
future Dashboard components within ACP Studio.

# 9. Testing Strategy

GUI-206 introduces the certification workflow for the Dashboard
Composition Architecture.

The objective is to verify the structural composition of the Home
Dashboard independently from future Runtime, Domain and Application
Service integrations.

The certification validates that HomeDashboard acts exclusively as a
composition component while each Dashboard panel remains responsible
only for its own graphical rendering.

## 9.1 Dashboard Composition Test

The certification test must verify:

- HomeDashboard module loading.
- Dashboard panel module loading.
- Dashboard composition initialization.
- Presentation Model propagation.
- AnalysisOverviewPanel rendering.
- RuntimeStatusPanel rendering.
- ProjectInformationPanel rendering.
- Dashboard rendering completion.
- Window lifecycle completion.

Expected certification output:

    PASS - HomeDashboard module loaded

    PASS - Dashboard panels loaded

    PASS - Presentation Model available

    PASS - Dashboard composition initialized

    PASS - AnalysisOverviewPanel rendered

    PASS - RuntimeStatusPanel rendered

    PASS - ProjectInformationPanel rendered

    PASS - Dashboard composition completed

    PASS - Window closed

    PASS - GUI-206 certified

## 9.2 Test Restrictions

The test must verify:

- Dashboard composition behaviour.
- Panel composition order.
- Presentation Model propagation.
- Panel independence.
- HomeDashboard integration.

The test must not require:

- Runtime execution.
- Shared Memory.
- Application Services.
- Domain Services.
- Live application data.
- User interaction.

The objective is to certify the architectural composition between
HomeDashboard and Dashboard panels while validating the certified
Dashboard Composition Architecture introduced by GUI-206.

# 10. Certification Criteria

GUI-206 is considered certified when all following conditions are
satisfied.

## Implementation

- HomeDashboard performs only Dashboard composition.
- Dashboard rendering is fully delegated to independent panels.
- All Dashboard panels implement the certified rendering interface.
- The Presentation Model is propagated unchanged to every panel.
- Dashboard composition remains deterministic.
- No Dashboard panel contains composition responsibilities.

## Architecture

- HomeDashboard remains independent from panel implementations.
- Dashboard panels remain stateless.
- Dashboard panels remain independent from one another.
- The one-way dependency flow is preserved.
- Presentation Model ownership remains unchanged.
- Composition and rendering responsibilities remain clearly separated.

## Testing

- Dashboard Composition Test passes.
- Dashboard panel loading succeeds.
- Presentation Model propagation is validated.
- Dashboard rendering completes successfully.
- Panel execution order is preserved.
- No unexpected architectural dependencies are introduced.

Certification status:

    Specification

          |

          v

    Implementation

          |

          v

         Test

          |

          v

    Certification

          |

          v

         Freeze

# 11. Future Extensions

Future milestones may extend the Dashboard Composition Architecture
with additional Dashboard capabilities while preserving the certified
composition model introduced by GUI-206.

Possible extensions:

## Additional Dashboard Panels

Introduction of new specialized panels such as:

- Recent Analysis Panel.
- Notifications Panel.
- System Health Panel.
- Active Session Panel.
- Performance Metrics Panel.

## Dynamic Dashboard Composition

Future versions may introduce:

- Optional Dashboard panels.
- Conditional panel visibility.
- User configurable Dashboard layouts.
- Dynamic panel registration.

## Interactive Panels

Future Dashboard panels may support:

- User interaction.
- Commands.
- Navigation.
- Contextual actions.
- Drill-down views.

## Application Service Integration

Future panels may consume Presentation Models generated by:

- AnalysisApplicationService.
- RuntimeApplicationService.
- ProjectApplicationService.

without modifying the certified Dashboard composition architecture.

## Dashboard Scalability

The standardized panel interface allows the Dashboard to grow by adding
new panels without increasing the structural complexity of
HomeDashboard.

The composition mechanism remains unchanged while individual panels
continue to evolve independently.

GUI-206 establishes the architectural foundation required for modular
Dashboard composition within the ACP Studio graphical architecture.

--------------------------------------------------------------------------------
-- End of Specification
--------------------------------------------------------------------------------