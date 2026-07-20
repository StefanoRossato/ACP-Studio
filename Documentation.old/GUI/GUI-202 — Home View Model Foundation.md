--------------------------------------------------------------------------------
-- ACP Studio
--
-- Document      : GUI-202 — Home View Model Foundation
-- Layer         : Application / GUI Integration
-- Type          : Foundation Specification
-- Status        : Approved
--
-- Purpose
--   Define the architectural foundation of the Home View Model used by the
--   ACP Studio Home View Package. This specification establishes the separation
--   between application state, view representation, and graphical rendering,
--   defining responsibilities, data contracts, lifecycle rules, and dependency
--   boundaries.
--
-- Scope
--   This document applies to the Home View Model introduced by GUI-202 and
--   serves as the architectural reference for future Home Dashboard data
--   integration and Application View evolution.
--------------------------------------------------------------------------------

# GUI-202 — Home View Model Foundation

## 1. Purpose

The purpose of GUI-202 is to introduce the first View Model
for the ACP Studio Application View architecture.

This milestone establishes the separation between:

    Application State

            |

            v

    View Representation

            |

            v

    GUI Rendering

The View Model becomes the controlled data boundary between
Application Services and graphical components.

---

# 2. Scope

GUI-202 includes:

- Creation of HomeViewModel.
- Definition of the Home View data contract.
- Integration point between HomeView and Application state.
- Validation of the View Model structure.
- Certification through automated tests.

GUI-202 does not include:

- Runtime live data integration.
- Shared Memory access.
- Domain Service invocation.
- Analysis execution state updates.
- Persistence.

The objective is architectural foundation only.

---

# 3. Architectural Context

Current architecture:


    Application Layer


        HomeViewModel


              |

              v


        HomeView


              |

              v


        Components / Panels


              |

              v


             GUI


The View Model is owned by the Application View package
and consumed by the graphical layer.

---

# 4. Home View Package

The Home View package becomes:

    Core/

        Application/

            Views/

                Home/


                    HomeView.lua

                    HomeViewModel.lua


                    Components/


                    Panels/



The package owns all Home Dashboard related elements.

---

# 5. HomeViewModel Responsibilities

HomeViewModel is responsible for:

- Providing structured Home View data.
- Maintaining default application view state.
- Acting as a data boundary for graphical components.
- Providing stable data contracts.

HomeViewModel is not responsible for:

- Rendering GUI elements.
- Creating ImGui contexts.
- Managing windows.
- Executing application workflows.
- Accessing Domain objects directly.

---

# 6. Data Contract

Initial View Model structure:

```lua
HomeViewModel =
{
    Runtime =
    {
        Status = "UNKNOWN"
    },


    Project =
    {
        Name = "No Project"
    },


    Analysis =
    {
        Status = "IDLE"
    }
}
```

---

# 7. Lifecycle

The HomeViewModel lifecycle defines how the View Model
is created, initialized and exposed to the Home View.

The initial lifecycle is:

    Create()

        |

        v


    Initialize()

        |

        v


    Expose Data()

        |

        v


    Update()

The Update phase is part of the future lifecycle model
and is not implemented in GUI-202.

## 7.1 Create

The Create phase is responsible for creating
a new HomeViewModel instance.


Responsibilities:

- Allocate the View Model structure.
- Initialize default values.
- Return a valid model instance.


Example:


```lua
local Model =
    HomeViewModel.Create()

```

# 8. Integration with HomeView

The HomeView integration introduces the first
connection between Application state and GUI rendering.


The integration flow becomes:


    HomeView


        |

        v


    HomeViewModel


        |

        v


    Components / Panels


        |

        v


    ImGui Rendering

HomeView owns the relationship with the View Model.

The View Model does not know:

- HomeView implementation.
- GUI components.
- ImGui rendering.

The dependency direction is:

    Application View

            |

            v

    View Model


The GUI layer consumes the model,
but the model remains independent from GUI technology.

## 8.1 Integration Rules

HomeView must:

- Receive a valid HomeViewModel instance.
- Pass required data to Components and Panels.
- Preserve separation between data and rendering.


Components and Panels must:

- Receive data explicitly.
- Render only graphical representation.
- Avoid direct Application Service access.

# 9. Testing Strategy


GUI-202 introduces the first View Model
certification workflow.


The objective is to verify the HomeViewModel
contract independently from the GUI layer.

## 9.1 HomeViewModel Test

The certification test must verify:


- Module loading.
- Factory availability.
- Model creation.
- Default data contract.
- Internal structure validity.

Expected certification output:


    PASS - HomeViewModel module loaded

    PASS - Factory available

    PASS - Model created

    PASS - Runtime data available

    PASS - Project data available

    PASS - Analysis data available

    PASS - GUI-202 certified

## 9.2 Test Restrictions

The test must verify:

- Application layer behaviour.
- Data contract.


The test must not require:

- ImGui context.
- Window creation.
- GUI rendering.


HomeViewModel is an application object,
not a graphical component.

---

# 10. Certification Criteria

GUI-202 is considered certified when all
following conditions are satisfied.

## Implementation

- HomeViewModel module exists.
- Factory method is implemented.
- Default model structure is valid.

## Architecture

- View Model has no GUI dependency.
- View Model does not create ImGui objects.
- Application and GUI responsibilities remain separated.

## Testing

- HomeViewModel test passes.
- Data contract validation succeeds.
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

Future milestones may extend HomeViewModel
with real application data.

Possible extensions:

## Runtime Integration

Connection with:

- Runtime Observer.
- Runtime Metrics.
- Runtime Monitoring.

## Project Integration

Connection with:

- Current project information.
- Track information.
- Session context.

## Analysis Integration

Connection with:

- AnalysisApplicationService.
- AnalysisSession.
- Measurement results.

## Reactive Updates

Future versions may introduce:

- Automatic refresh.
- Event driven updates.
- View Model notifications.

GUI-202 establishes the foundation required
for progressive Home Dashboard data integration.

--------------------------------------------------------------------------------
-- End of Specification
--------------------------------------------------------------------------------
