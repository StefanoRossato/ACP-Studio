--------------------------------------------------------------------------------
-- ACP Studio
--
-- Document      : GUI-203 — Home View Data Binding Foundation
-- Layer         : Application / GUI Integration
-- Type          : Foundation Specification
-- Status        : Approved
--
-- Purpose
--   Define the architectural foundation of the first data binding mechanism
--   between HomeView and HomeViewModel. This specification establishes the
--   certified contract between the Application View Model and the graphical
--   View, defining responsibilities, data flow, dependency boundaries and
--   rendering ownership.
--
-- Scope
--   This document applies to the Home View package introduced by GUI-201 and
--   the Home View Model introduced by GUI-202. It defines the first certified
--   data binding architecture that will serve as the foundation for future
--   Application Service integration.
--------------------------------------------------------------------------------

# GUI-203 — Home View Data Binding Foundation

# 1. Purpose

The purpose of GUI-203 is to introduce the first certified data binding
mechanism between the Home View and the Home View Model.

This milestone establishes the architectural contract between the
Application Layer and the GUI Layer, defining how presentation data
is exposed by the View Model and consumed by the graphical View.

The data binding architecture establishes the separation between:

    HomeViewModel

           |

           v

    Presentation Model

           |

           v

        HomeView

           |

           v

     GUI Rendering

The Home View becomes responsible only for rendering the presentation
model, while the Home View Model becomes the exclusive provider of
presentation data.

GUI-203 establishes the first certified one-way data flow for the
ACP Studio graphical architecture and provides the foundation for
future integration with Application Services.

# 2. Scope

GUI-203 includes:

- Definition of the HomeView ↔ HomeViewModel data binding architecture.
- Definition of the Presentation Model consumed by HomeView.
- Introduction of the first certified one-way data flow.
- Integration of HomeView with HomeViewModel.
- Validation of the data binding contract.
- Certification through automated tests.

GUI-203 does not include:

- Runtime live data integration.
- Shared Memory access.
- Application Service invocation.
- Domain object interaction.
- Automatic model refresh.
- Event-driven updates.
- User interaction handling.

The objective is to establish the architectural foundation of the
data binding mechanism between the Application Layer and the GUI Layer
without introducing dynamic application behaviour.

# 3. Architectural Context

GUI-203 extends the Home View architecture introduced by GUI-202 by
establishing the first certified data binding between the Application
Layer and the GUI Layer.

The current architecture becomes:

    Application Layer

            |

            v

      HomeViewModel

            |

            v

    Presentation Model

            |

            v

         HomeView

            |

            v

     Components / Panels

            |

            v

            GUI

The HomeViewModel owns the Presentation Model and acts as the single
provider of presentation data.

HomeView consumes the Presentation Model and is responsible only for
its graphical representation.

This architecture establishes a strict one-way dependency flow from
the Application Layer to the GUI Layer while preserving complete
separation between presentation logic and graphical rendering.

# 4. Home View Package

The Home View package evolves into the first complete
Application / GUI integration unit.

    Core/

        Application/

            Views/

                Home/

                    HomeViewModel.lua


        GUI/

            Views/

                HomeView.lua

The Home View Model owns the Presentation Model and exposes
the data required by the graphical layer.

The Home View consumes the Presentation Model and renders the
Home Dashboard without owning application data.

This package establishes the first certified separation between
presentation logic and graphical rendering and becomes the
reference architecture for future ACP Studio views.

# 5. Data Binding Responsibilities

GUI-203 establishes the responsibilities of the data binding
mechanism between the Application Layer and the GUI Layer.

## 5.1 HomeViewModel Responsibilities

HomeViewModel is responsible for:

- Creating the Presentation Model.
- Providing a stable data contract.
- Supplying all data required by HomeView.
- Acting as the single source of presentation data.

HomeViewModel is not responsible for:

- Rendering graphical components.
- Creating ImGui contexts.
- Managing windows.
- Executing application workflows.
- Accessing Runtime components.

## 5.2 HomeView Responsibilities

HomeView is responsible for:

- Requesting the Presentation Model.
- Rendering the Presentation Model.
- Forwarding presentation data to graphical components.
- Preserving graphical consistency.

HomeView is not responsible for:

- Creating presentation data.
- Maintaining application state.
- Executing business logic.
- Modifying the Presentation Model.

## 5.3 Data Ownership

The Presentation Model is owned exclusively by
HomeViewModel.

HomeView receives the model as read-only input and
must never modify its contents.

This ownership model guarantees a single source of truth
for the Home Dashboard presentation state and preserves
the separation between the Application Layer and the
GUI Layer.

# 6. Presentation Model

The Presentation Model defines the certified data contract
between HomeViewModel and HomeView.

The model represents the graphical state required by the
Home Dashboard independently from Runtime, Domain, or
Application Services.

The initial Presentation Model structure is:

```lua
{
    title = "ACP Studio",

    cards =
    {
        {
            title = "Runtime",
            description = "Runtime monitoring"
        },

        {
            title = "Application",
            description = "Application services"
        },

        {
            title = "Domain",
            description = "Domain model"
        }
    }
}
```

The Presentation Model is intentionally minimal and serves
only as the first certified contract between the
Application Layer and the GUI Layer.

The structure may evolve in future milestones, provided
that compatibility with the certified data binding
architecture is preserved.

HomeView accesses the Presentation Model exclusively
through the public interface exposed by HomeViewModel.

# 7. Data Binding Lifecycle

The Data Binding Lifecycle defines how the Presentation
Model is created, exposed and consumed by the Home View.

The initial lifecycle is:

    GetModel()

         |

         v

Presentation Model

         |

         v

HomeView

         |

         v

GUI Rendering

The lifecycle is intentionally simple and deterministic.

The Presentation Model is created by HomeViewModel and
immediately exposed to HomeView for rendering.

No intermediate processing or transformation is performed
during GUI-203.

## 7.1 Model Creation

The model creation phase is responsible for producing
a valid Presentation Model.

Responsibilities:

- Create the Presentation Model.
- Initialize default values.
- Return a valid model instance.

Example:

```lua
local Model =
    HomeViewModel.GetModel()
```

The returned model represents the complete graphical
state required by HomeView.

## 7.2 Model Consumption

HomeView retrieves the Presentation Model and renders
its contents without modifying the data.

The rendering process must:

- Read the Presentation Model.
- Render the Home Dashboard.
- Preserve the Presentation Model integrity.

The Presentation Model is considered read-only during
the rendering phase.

Future milestones may introduce model refresh and
incremental updates without changing the certified
lifecycle established by GUI-203.

# 8. Integration with HomeView

GUI-203 introduces the first certified data binding
between HomeViewModel and HomeView.

The integration flow becomes:

    HomeView

        |

        | GetModel()

        v

    HomeViewModel

        |

        v

Presentation Model

        |

        v

GUI Rendering

HomeView obtains the Presentation Model exclusively
through the public interface exposed by HomeViewModel.

The View does not know:

- How the Presentation Model is created.
- Where the presentation data originate.
- How future Application Services will provide data.

The View is responsible only for rendering the
Presentation Model.

The HomeViewModel remains completely independent from:

- ImGui.
- GUI components.
- Window management.
- Graphical rendering.

This separation guarantees that presentation logic
can evolve independently from the graphical layer.

## 8.1 Integration Rules

HomeView must:

- Request the Presentation Model through HomeViewModel.
- Render only the received Presentation Model.
- Preserve one-way data flow.
- Avoid creating presentation data.

HomeViewModel must:

- Expose a stable public API.
- Return a valid Presentation Model.
- Remain independent from GUI technology.
- Avoid graphical responsibilities.

The dependency direction is:

    Application Layer

            |

            v

      HomeViewModel

            |

            v

         HomeView

            |

            v

            GUI

The dependency flow is strictly one-way and must be
preserved by all future Home Dashboard implementations.

# 9. Testing Strategy

GUI-203 introduces the first certification workflow
for the Home View data binding architecture.

The objective is to verify the certified contract
between HomeViewModel and HomeView independently from
future Runtime and Application Service integrations.

## 9.1 Home View Data Binding Test

The certification test must verify:

- HomeViewModel module loading.
- Presentation Model availability.
- Presentation Model validity.
- HomeView data binding.
- Home Dashboard rendering.
- Window lifecycle completion.

Expected certification output:

    PASS - HomeViewModel module loaded

    PASS - Presentation Model available

    PASS - Data binding established

    PASS - Home Dashboard rendered

    PASS - Window closed

    PASS - GUI-203 certified

## 9.2 Test Restrictions

The test must verify:

- Data binding behaviour.
- Presentation Model contract.
- HomeView integration.

The test must not require:

- Runtime execution.
- Shared Memory.
- Application Services.
- Domain Services.
- Live application data.

The objective is to certify the architectural
integration between HomeViewModel and HomeView
without introducing external dependencies.

# 10. Certification Criteria

GUI-203 is considered certified when all
following conditions are satisfied.

## Implementation

- HomeViewModel exposes the certified GetModel() interface.
- A valid Presentation Model is returned.
- HomeView consumes the Presentation Model.
- No presentation data remain hardcoded inside HomeView.

## Architecture

- HomeViewModel has no GUI dependency.
- HomeView owns no presentation data.
- One-way data flow is preserved.
- Application and GUI responsibilities remain separated.

## Testing

- Home View Data Binding Test passes.
- Presentation Model validation succeeds.
- HomeView renders the Presentation Model correctly.
- No unexpected dependencies are introduced.

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

Future milestones may extend the Home data binding
architecture with dynamic application data and
reactive presentation updates.

Possible extensions:

## Application Service Integration

Connection with:

- AnalysisApplicationService.
- RuntimeApplicationService.
- ProjectApplicationService.

## Runtime Integration

Connection with:

- Runtime state.
- Runtime metrics.
- Runtime monitoring.

## Project Integration

Connection with:

- Current project information.
- Session context.
- User workspace.

## Reactive Presentation

Future versions may introduce:

- Automatic Presentation Model refresh.
- Event-driven updates.
- Incremental View updates.
- ViewModel synchronization.

## Dashboard Expansion

Future versions may extend the Presentation Model
with additional dashboard sections while preserving
the certified data binding contract established by
GUI-203.

GUI-203 establishes the architectural foundation
required for progressive integration between the
Application Layer and the graphical Home View.

--------------------------------------------------------------------------------
-- End of Specification
--------------------------------------------------------------------------------