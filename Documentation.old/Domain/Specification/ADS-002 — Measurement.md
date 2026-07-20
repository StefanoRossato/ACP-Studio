---

ACP Studio

Capability      : ADS-002
Title           : Measurement

Category        : Domain Capability
Status          : Approved

Version         : 1.0.0

Author          : ACP Studio

Dependencies    : DOM-001 Domain Model Architecture

---

# 1. Purpose

---

This document defines the Measurement value object used by the ACP Studio Analysis domain.

A Measurement represents a single immutable measurement value together with its measurement type and unit.

---

# 2. Responsibilities

---

The Measurement is responsible for:

* representing a single measurement;
* preserving measurement validity;
* providing immutable access to its state;
* comparing measurements for equality.

The Measurement is not responsible for:

* performing audio analysis;
* calculating measurements;
* communicating with the runtime;
* accessing shared memory;
* interacting with REAPER.

---

# 3. Domain Model

---

Measurement shall represent a single immutable domain value.

```text
Measurement
    │
    ├── Value
    ├── Type
    └── Unit
```

Each Measurement shall preserve the relationship between its value, type and unit.

---

# 4. Public API

---

### Constructor

```lua
Measurement.New(
    value,
    type,
    unit)
```

Creates a new immutable Measurement.

---

### GetValue

```lua
Measurement:GetValue()
```

Returns the measurement value.

---

### GetType

```lua
Measurement:GetType()
```

Returns the measurement type.

---

### GetUnit

```lua
Measurement:GetUnit()
```

Returns the measurement unit.

---

### Equals

```lua
Measurement:Equals(other)
```

Returns `true` when both Measurements represent the same domain value.

---

# 5. Invariants

---

A Measurement shall always satisfy the following rules.

* Value shall be a valid number.
* Type shall be a non-empty string.
* Unit shall be a non-empty string.
* The object shall be immutable after construction.

---

# 6. Design Principles

---

The Measurement shall:

* remain immutable;
* expose a minimal public API;
* remain independent from infrastructure;
* preserve domain consistency;
* represent a single domain value.

---

# 7. Certification Criteria

---

The Measurement is certified when:

* valid instances can be created;
* invalid construction is rejected;
* all getters return the expected values;
* equality comparison behaves correctly;
* immutability is preserved.

---

------------------------------------------------------------------------------
End of Document
------------------------------------------------------------------------------