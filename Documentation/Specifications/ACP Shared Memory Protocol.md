# SPT-120 — Shared Memory Protocol

**Document ID**: SPT-120  
**Component ID**: CMP-300 (Framework Services Layer)  
**Status**: Approved  
**Version**: 1.0  
**Author**: ACP Studio Engineering  
**Last Updated**: 2026-07-09

---

# 1. Purpose

This document defines the Shared Memory Protocol used by ACP Studio to exchange
information between Lua components and JSFX components.

The protocol provides a deterministic, asynchronous communication channel based
on REAPER Global Memory (gmem).

This specification is independent from any specific application component and
shall be considered part of the ACP Studio Framework.

---

# 2. Objectives

The protocol shall:

- provide deterministic communication;
- avoid race conditions;
- define ownership of every shared register;
- allow asynchronous processing;
- be reusable by every ACP Studio component.

---

# 3. Architecture

```
                +----------------+
                |     Lua        |
                | Analyzer       |
                | Sensor         |
                | Engine         |
                +--------+-------+
                         |
                    Shared Memory
                     (gmem)
                         |
                +--------+-------+
                |      JSFX      |
                | Analyzer       |
                | Meter          |
                | Sensor         |
                +----------------+
```

---

# 4. Register Map

| Register | Name | Direction | Description |
|----------|------|-----------|-------------|
| 0 | COMMAND | Lua → JSFX | Command register |
| 1 | STATE | JSFX → Lua | Current processing state |
| 2 | RMS | JSFX → Lua | RMS measurement |
| 3 | PEAK | JSFX → Lua | Peak measurement |
| 4 | LINEARITY | JSFX → Lua | Linearity measurement |
| 5 | SAMPLES | JSFX → Lua | Number of processed samples |
| 255 | VERSION | Bidirectional | Protocol version |

---

# 5. Ownership

Each register shall have exactly one writer.

| Register | Writer | Reader |
|----------|--------|--------|
| COMMAND | Lua | JSFX |
| STATE | JSFX | Lua |
| RMS | JSFX | Lua |
| PEAK | JSFX | Lua |
| LINEARITY | JSFX | Lua |
| SAMPLES | JSFX | Lua |
| VERSION | Lua / JSFX | Both |

No register shall have multiple concurrent writers.

### Ownership Rule

Each shared register shall have exactly one owner.

The owner is the only component allowed to modify the register.

All other components shall treat the register as read-only.

---

# 6. Commands

| Value | Name |
|------:|------|
| 0 | IDLE |
| 1 | START |
| 2 | RESET |

COMMAND represents an event.

After receiving a command the JSFX shall consume it by restoring COMMAND to IDLE.

---

# 7. States

| Value | Name |
|------:|------|
| 0 | IDLE |
| 1 | MEASURING |
| 2 | COMPLETED |
| 3 | ERROR |

STATE represents the current processing state.

Only the JSFX may modify STATE.

---

# 8. Communication Sequence

```
Lua

COMMAND = START

        │

        ▼

JSFX

STATE = MEASURING

COMMAND = IDLE

...

Processing

...

RMS
PEAK
LINEARITY
SAMPLES

STATE = COMPLETED

        │

        ▼

Lua

Read measurements
```

---

# 9. Protocol Lifecycle

The protocol follows the lifecycle shown below.

```text
                 RESET
                   │
                   ▼
            +-------------+
            |    IDLE     |
            +-------------+
                   │
             COMMAND=START
                   │
                   ▼
          +-----------------+
          |   MEASURING     |
          +-----------------+
                   │
          Processing Complete
                   │
                   ▼
          +-----------------+
          |   COMPLETED     |
          +-----------------+
                   │
             COMMAND=RESET
                   │
                   └──────────────► IDLE
```


# 10. Reset Sequence

```
Lua

COMMAND = RESET

        │

        ▼

JSFX

Reset internal state

Clear measurements

STATE = IDLE

COMMAND = IDLE
```

---

# 11. Data Validity

Measurement registers shall be considered valid only when

STATE == COMPLETED

Reading measurement registers while STATE == IDLE or STATE == MEASURING is undefined.

---

# 12. Timeout

Timeout management is outside the scope of this protocol.

Timeout detection shall be implemented by the Lua controller.

---

# 13. Versioning

Register 255 shall contain the protocol version.

Both Lua and JSFX implementations shall initialize the VERSION register during
initialization.

Future implementations may refuse communication when protocol versions do not
match.

---

# 14. Design Rules

The protocol follows the following principles:

- Single Producer / Single Consumer
- Event-based commands
- State-based feedback
- Deterministic communication
- Lock-free operation
- Asynchronous execution

---

# 15. Future Extensions

Future protocol revisions may introduce:

- Progress reporting
- Error codes
- Capability flags
- Performance counters
- Multiple communication channels

The existing register map shall remain backward compatible whenever possible.

---

# 16. Compliance

Every ACP Studio component using shared memory shall comply with this specification.

This includes, but is not limited to:

- Analyzer
- Sensor
- Meter
- Trim
- Audio Engine
- Future DSP modules

No component shall redefine the protocol independently.

## Relationship with Framework

This specification defines an Infrastructure Service.

Application components shall implement this specification but shall not modify it.

Future protocol revisions shall preserve backward compatibility whenever possible.