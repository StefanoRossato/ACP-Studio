# BT-002 Runtime Commands

## Status

**Development Phase:** 2

**Milestone:** BT-002

**Status:** Approved

---

# Objective

Implement the Runtime Command Interface used by Lua to control the ACP Runtime.

This milestone introduces the command decoding layer of the runtime.

No DSP processing shall be implemented.

---

# Scope

BT-002 implements:

* Runtime command definitions.
* Runtime command decoder.
* RESET command.
* START command.
* STOP command.
* Runtime state transitions.
* Runtime command validation.

BT-002 does not implement:

* Audio analysis.
* DSP algorithms.
* Signal processing.
* Measurement logic.

---

# Runtime Commands

The runtime shall support the following commands.

| Command | Value | Description                             |
| ------- | ----: | --------------------------------------- |
| NONE    |     0 | No pending command.                     |
| RESET   |     1 | Reset the runtime to its initial state. |
| START   |     2 | Start the runtime session.              |
| STOP    |     3 | Stop the runtime session.               |

---

# Command Register

The runtime continuously monitors the shared memory command register.

Whenever a command different from NONE is detected, the runtime shall:

1. Decode the command.
2. Execute the associated action.
3. Clear the command register by writing NONE.
4. Return to the runtime loop.

Each command shall be executed only once.

---

# RESET Command

RESET restores the runtime to its baseline state.

The command shall:

* set Runtime State to IDLE;
* clear RMS;
* clear PEAK;
* clear LINEARITY;
* clear SAMPLE COUNT;
* clear any internal runtime variables.

No DSP processing shall be performed.

---

# START Command

START begins a runtime session.

The command shall:

* transition the runtime from IDLE to RUNNING;
* prepare the runtime for future DSP execution.

No measurement shall begin during BT-002.

---

# STOP Command

STOP terminates the current runtime session.

The command shall:

* transition the runtime from RUNNING to IDLE;
* preserve runtime integrity.

No additional processing shall occur.

---

# Runtime Loop

The runtime executes the following sequence continuously.

1. Read command register.
2. Decode command.
3. Execute runtime action.
4. Clear command register.
5. Continue runtime execution.

---

# Validation

The following command sequence shall execute correctly.

RESET

↓

Runtime State = IDLE

↓

START

↓

Runtime State = RUNNING

↓

STOP

↓

Runtime State = IDLE

Each command shall be executed exactly once.

---

# Acceptance Criteria

BT-002 is considered complete when:

* Runtime commands are defined.
* Command decoder is implemented.
* RESET executes correctly.
* START executes correctly.
* STOP executes correctly.
* Runtime state transitions are correct.
* Command register is cleared after execution.
* Validation succeeds.
* No DSP functionality is introduced.

---

# Deliverables

* Runtime command definitions.
* Runtime command decoder.
* RESET implementation.
* START implementation.
* STOP implementation.
* Validation tests.
* BT-002 Certification.
