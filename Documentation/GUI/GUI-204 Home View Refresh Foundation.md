--------------------------------------------------------------------------------
-- ACP Studio
--
-- Document      : GUI-204 — Home View Refresh Foundation
-- Layer         : Application / GUI Integration
-- Type          : Foundation Specification
-- Status        : Approved
--
-- Purpose
--   Define the architectural foundation of the Home View refresh lifecycle.
--   This specification establishes the certified mechanism responsible for
--   acquiring, caching and refreshing the Presentation Model independently
--   from graphical rendering.
--
-- Scope
--   This document extends the Home View data binding architecture introduced
--   by GUI-203. It defines the first certified View refresh lifecycle,
--   separating Presentation Model acquisition from rendering while preparing
--   the architecture for future Application Service integration.
--------------------------------------------------------------------------------

# GUI-204 — Home View Refresh Foundation

# 1. Purpose

The purpose of GUI-204 is to introduce the first certified refresh lifecycle
for the Home View Presentation Model.

This milestone establishes the architectural contract defining how the
Presentation Model is acquired, cached and consumed by the Home View while
preserving the separation between the Application Layer and the GUI Layer.

The refresh lifecycle establishes the following architecture:

    HomeView

        |

        v

    RefreshModel()

        |

        v

 Presentation Model

        |

        v

    Cached Model

        |

        v

  GUI Rendering

The Home View becomes responsible for managing the lifecycle of the cached
Presentation Model, while the Home View Model remains the exclusive provider
of presentation data.

GUI-204 establishes the first certified View refresh lifecycle for the
ACP Studio graphical architecture and provides the architectural foundation
required for future integration with Application Services, Runtime updates
and event-driven refresh mechanisms.

# 2. Scope

GUI-204 includes:

- Definition of the Home View refresh lifecycle.
- Introduction of the Presentation Model cache.
- Separation between model acquisition and graphical rendering.
- Definition of the Home View refresh responsibilities.
- Integration of the refresh lifecycle with HomeView.
- Certification through automated tests.

GUI-204 does not include:

- Runtime live data integration.
- Shared Memory access.
- Application Service invocation.
- Domain object interaction.
- Automatic refresh scheduling.
- Event-driven refresh.
- Background synchronization.
- User interaction handling.

The objective is to establish the architectural foundation of the
Home View refresh lifecycle while preserving the certified data
binding architecture introduced by GUI-203.

# 3. Architectural Context

GUI-204 extends the Home View architecture introduced by GUI-203 by
establishing the first certified refresh lifecycle for the Presentation
Model.

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

    Cached Model

            |

            v

      GUI Rendering

HomeViewModel remains the exclusive provider of the Presentation Model.

HomeView becomes responsible for acquiring the Presentation Model,
maintaining a cached instance and rendering the cached data without
performing additional model acquisition during the rendering phase.

This architecture establishes a clear separation between Presentation
Model acquisition and graphical rendering while preserving the certified
one-way dependency flow introduced by GUI-203.

The cached Presentation Model represents the current graphical state of
the Home Dashboard and remains under the ownership of HomeView for the
duration of the View lifecycle.

# 4. Home View Refresh Architecture

The Home View architecture evolves by introducing an explicit refresh
mechanism responsible for managing the Presentation Model lifecycle.

The Home View package becomes:

    Core/

        Application/

            Views/

                Home/

                    HomeViewModel.lua

        GUI/

            Views/

                HomeView.lua

The Home View Model remains responsible for constructing and exposing
the Presentation Model.

The Home View becomes responsible for requesting the Presentation
Model, maintaining a cached instance and rendering the cached data.

The cached Presentation Model becomes part of the internal state of
HomeView and exists only for the lifetime of the View.

This architecture separates data acquisition from graphical rendering,
allowing the rendering pipeline to operate independently from future
Application Services and Runtime integrations.

The Home View Refresh Architecture establishes the certified foundation
for all future View lifecycle capabilities within ACP Studio.

# 5. Refresh Responsibilities

GUI-204 establishes the responsibilities of the Home View refresh
lifecycle between the Application Layer and the GUI Layer.

## 5.1 HomeViewModel Responsibilities

HomeViewModel is responsible for:

- Creating the Presentation Model.
- Providing a stable Presentation Model contract.
- Supplying a valid Presentation Model upon request.
- Remaining independent from the View lifecycle.

HomeViewModel is not responsible for:

- Caching the Presentation Model.
- Managing refresh operations.
- Rendering graphical components.
- Managing GUI state.
- Scheduling model updates.

## 5.2 HomeView Responsibilities

HomeView is responsible for:

- Requesting the Presentation Model.
- Maintaining the cached Presentation Model.
- Managing the refresh lifecycle.
- Rendering the cached Presentation Model.
- Preserving graphical consistency.

HomeView is not responsible for:

- Creating presentation data.
- Executing business logic.
- Modifying the Presentation Model.
- Maintaining application state.

## 5.3 Refresh Ownership

The cached Presentation Model is owned exclusively by
HomeView.

HomeViewModel creates the Presentation Model and transfers
its ownership to HomeView for the duration of the View
lifecycle.

The cached Presentation Model represents the current
graphical state of the Home Dashboard and is refreshed
only through the certified refresh mechanism established
by GUI-204.

This ownership model guarantees a clear separation between
Presentation Model construction and Presentation Model
lifecycle management while preserving the architectural
boundaries between the Application Layer and the GUI Layer.

# 6. Presentation Model Cache

GUI-204 introduces the Presentation Model Cache as the first certified
View state owned by HomeView.

The cached Presentation Model represents the current graphical state
required by the Home Dashboard during the rendering lifecycle.

The cache is acquired through the HomeViewModel and remains valid until
an explicit refresh operation is performed.

The Presentation Model Cache is intentionally simple and independent from
Runtime, Domain or Application Services.

The initial cache lifecycle is:

    HomeViewModel

          |

          v

     GetModel()

          |

          v

 Presentation Model

          |

          v

  HomeView Cache

          |

          v

   GUI Rendering

The cached Presentation Model becomes the single source of presentation
data consumed by HomeView during rendering.

The rendering process must never request or recreate the Presentation
Model while rendering is in progress.

Future milestones may introduce cache invalidation, incremental updates
and automatic refresh mechanisms while preserving the certified cache
architecture established by GUI-204.

# 7. Refresh Lifecycle

The Refresh Lifecycle defines how the Presentation Model is acquired,
cached and consumed by the Home View.

The certified lifecycle is:

    OnEnter()

         |

         v

    RefreshModel()

         |

         v

 Presentation Model

         |

         v

 HomeView Cache

         |

         v

 GUI Rendering

The lifecycle is deterministic and separates Presentation Model
acquisition from graphical rendering.

The Presentation Model is acquired through HomeViewModel and stored
inside the Home View cache before any rendering operation is performed.

## 7.1 Model Refresh

The model refresh phase is responsible for acquiring a valid
Presentation Model.

Responsibilities:

- Request the Presentation Model.
- Replace the cached Presentation Model.
- Preserve cache consistency.

Example:

```lua
self:RefreshModel()
```

The refresh operation becomes the exclusive mechanism through which
HomeView updates its Presentation Model.

## 7.2 Rendering Phase

The rendering phase consumes the cached Presentation Model without
requesting additional application data.

The rendering process must:

- Read the cached Presentation Model.
- Render the Home Dashboard.
- Preserve cache integrity.

The cached Presentation Model is considered read-only during the
rendering phase.

Future milestones may introduce explicit refresh requests,
cache invalidation and automatic refresh scheduling without
modifying the certified lifecycle established by GUI-204.

# 8. Integration with HomeView

GUI-204 extends the integration between HomeViewModel and HomeView by
introducing the first certified refresh lifecycle.

The integration flow becomes:

        HomeView

            |

            v

       OnEnter()

            |

            v

     RefreshModel()

            |

            v

      HomeViewModel

            |

            v

   Presentation Model

            |

            v

     HomeView Cache

            |

            v

      GUI Rendering

HomeView requests the Presentation Model exclusively through the
public interface exposed by HomeViewModel.

The acquired Presentation Model is stored inside the Home View cache
and becomes the only source of presentation data consumed during
rendering.

The View does not know:

- How the Presentation Model is created.
- Where the presentation data originate.
- How future Application Services will provide data.
- When future refresh requests will be triggered.

The View is responsible only for managing the refresh lifecycle and
rendering the cached Presentation Model.

The HomeViewModel remains completely independent from:

- ImGui.
- GUI components.
- Window management.
- View lifecycle.
- Refresh scheduling.

This separation guarantees that Presentation Model construction,
Presentation Model lifecycle and graphical rendering evolve
independently.

## 8.1 Integration Rules

HomeView must:

- Request the Presentation Model through HomeViewModel.
- Cache the acquired Presentation Model.
- Render only the cached Presentation Model.
- Preserve the refresh lifecycle.
- Avoid creating presentation data.

HomeViewModel must:

- Expose a stable public API.
- Return a valid Presentation Model.
- Remain independent from GUI technology.
- Avoid lifecycle responsibilities.

The dependency direction remains:

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

The dependency flow remains strictly one-way while the refresh
lifecycle becomes the certified mechanism responsible for
Presentation Model acquisition.

# 9. Testing Strategy

GUI-204 introduces the first certification workflow for the Home View
refresh lifecycle.

The objective is to verify the certified refresh mechanism between
HomeViewModel and HomeView independently from future Runtime and
Application Service integrations.

## 9.1 Home View Refresh Test

The certification test must verify:

- HomeViewModel module loading.
- Presentation Model availability.
- HomeView initialization.
- Presentation Model cache creation.
- Refresh lifecycle execution.
- Home Dashboard rendering.
- Window lifecycle completion.

Expected certification output:

    PASS - HomeViewModel module loaded

    PASS - Presentation Model available

    PASS - Presentation Model cached

    PASS - Refresh lifecycle executed

    PASS - Home Dashboard rendered

    PASS - Window closed

    PASS - GUI-204 certified

## 9.2 Test Restrictions

The test must verify:

- Refresh lifecycle behaviour.
- Presentation Model cache.
- HomeView integration.

The test must not require:

- Runtime execution.
- Shared Memory.
- Application Services.
- Domain Services.
- Live application data.

The objective is to certify the architectural integration between
HomeViewModel and HomeView while validating the certified refresh
lifecycle introduced by GUI-204.

# 10. Certification Criteria

GUI-204 is considered certified when all
following conditions are satisfied.

## Implementation

- HomeView maintains a cached Presentation Model.
- The Presentation Model is acquired through the certified refresh mechanism.
- Rendering consumes only the cached Presentation Model.
- HomeViewModel remains responsible for Presentation Model construction.
- Presentation Model acquisition is separated from graphical rendering.

## Architecture

- HomeViewModel has no GUI dependency.
- HomeView owns the Presentation Model cache.
- Presentation Model ownership remains clearly defined.
- One-way dependency flow is preserved.
- Application and GUI responsibilities remain separated.

## Testing

- Home View Refresh Test passes.
- Presentation Model cache validation succeeds.
- Refresh lifecycle executes correctly.
- HomeView renders the cached Presentation Model.
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

Future milestones may extend the Home View refresh architecture
with advanced View lifecycle capabilities and dynamic Presentation
Model management.

Possible extensions:

## Refresh Scheduling

Introduction of:

- Manual refresh operations.
- Automatic refresh scheduling.
- Periodic Presentation Model updates.

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

## Reactive Refresh

Future versions may introduce:

- Event-driven refresh.
- Presentation Model invalidation.
- Incremental cache updates.
- View synchronization.

## Dashboard Expansion

Future versions may extend the Presentation Model
with additional dashboard sections while preserving
the certified refresh architecture established by
GUI-204.

GUI-204 establishes the architectural foundation
required for deterministic View lifecycle management
within the ACP Studio graphical architecture.

--------------------------------------------------------------------------------
-- End of Specification
--------------------------------------------------------------------------------