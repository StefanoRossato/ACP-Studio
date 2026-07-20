# GUI-105 — View Management Foundation

**Status**: Certified

---

## Objective

Introduce the View Management architecture for ACP Studio.

This milestone separates application content from the window layout by introducing
a View abstraction managed by a dedicated ViewManager.

The objective is to establish the architectural foundation for future application
views while maintaining a single active view.

---

# Components

## View

Abstract base class for every application view.

Responsibilities:

- store the ImGui context;
- define the common lifecycle;
- provide the rendering interface.

Public API:

- New(context)
- Initialize()
- Render()
- Shutdown()

---

## HomeView

Default application view.

Responsibilities:

- implement the View interface;
- render the initial application screen.

---

## ViewManager

Central manager responsible for the active application view.

Responsibilities:

- initialize the view system;
- manage the active view;
- execute the view lifecycle;
- render the active view.

Public API:

- Initialize(context)
- IsInitialized()
- SetView(view)
- GetView()
- HasView()
- Render()
- Shutdown()

---

# Architecture

MainWindow
│
├── Toolbar
│
├── Workspace
│     │
│     ▼
│ ViewManager
│     │
│     ▼
│ Active View
│     │
│     ▼
│ HomeView
│
└── StatusBar

---

# Design Principles

The ViewManager owns exactly one active View.

Workspace is responsible only for rendering the current View.

Views are independent from MainWindow and Workspace.

Each View implements its own lifecycle.

---

# Test Coverage

GUI-105 — View Management Foundation Test

Verified:

- ViewManager initialization
- HomeView creation
- Active view assignment
- Active view retrieval
- ViewManager shutdown

Result:

PASS

---

# Result

The View Management Foundation has been successfully implemented and certified.

This milestone establishes the architectural basis for future GUI navigation and
multiple application views.