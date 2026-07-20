# DES-CF-001
## Analyzer Interface

| Field | Value |
|--------|-------|
| Document ID | DES-CF-001 |
| Version | 1.0 |
| Status | Approved |
| Phase | Core Features |
| Component | Analyzer Interface |
| Author | ACP Studio |

---

# Analyzer Interface

# 1. Purpose

The Analyzer module provides the communication layer between ACP Studio and ACP_Analyzer.jsfx.

The module abstracts all REAPER and JSFX communication from the rest of the application.

---

# 2. Responsibilities

- Initialize analyzer communication.
- Reset the analyzer.
- Read measurement values.
- Detect analyzer availability.
- Provide a simple API to Session.

---

# 3. Public Interface

Analyzer.New()

Creates a new Analyzer instance.

---

Analyzer:Initialize()

Initializes communication with ACP_Analyzer.jsfx.

---

Analyzer:Reset()

Resets the analyzer before a new analysis session.

---

Analyzer:Update()

Reads the current analyzer state.

---

Analyzer:IsReady()

Returns true when the analyzer is ready.

---

Analyzer:Read()

Returns the current analyzer measurements.

---

# 4. Dependencies

- REAPER API
- ACP_Analyzer.jsfx
- Result.lua

---

# 5. Notes

Session.lua shall never communicate directly with ACP_Analyzer.jsfx.

All communication shall pass through Analyzer.lua.