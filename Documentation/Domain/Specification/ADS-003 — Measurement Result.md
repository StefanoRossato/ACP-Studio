---

ACP Studio

Capability      : ADS-003
Title           : Measurement Result

Category        : Domain Capability
Status          : Approved

Version         : 1.0.0

Author          : ACP Studio

Dependencies    : DOM-001 Domain Model Architecture
                  ADS-002 Measurement

---

# 1. Purpose

---

This document defines the Measurement Result entity used by the ACP Studio Analysis domain.

A Measurement Result aggregates the measurements produced by an analysis and provides a single immutable representation of the analysis outcome.

The Measurement Result also provides an immutable empty instance representing an analysis that has not yet produced measurements.

---

# 2. Responsibilities

---

The Measurement Result is responsible for:

* aggregating analysis measurements;
* preserving measurement consistency;
* providing immutable access to analysis results;
* comparing analysis results for equality;
* preserving the relationship between aggregated measurements.

The Measurement Result is not responsible for:

* performing audio analysis;
* calculating measurements;
* communicating with the runtime;
* accessing shared memory;
* interacting with REAPER.

---

# 3. Domain Model

---

Measurement shall represent a single immutable domain value.

Each Measurement shall preserve the relationship between its value, type and unit.

[diagram]

```text
MeasurementResult
        │
        ├── RMS
        │       │
        │       ▼
        │   Measurement
        │
        └── Peak
                │
                ▼
            Measurement
```

Each Measurement shall be valid according to ADS-002.

The empty Measurement Result shall aggregate valid Measurement instances and represent the absence of completed analysis.   

---

# 4. Public API

---

### Constructor

```lua
MeasurementResult.New(
    rms,
    peak,
    timestamp)
```

Creates a new immutable Measurement Result.

---

### GetRMS

```lua
MeasurementResult:GetRMS()
```

Returns the RMS measurement.

---

### GetPeak

```lua
MeasurementResult:GetPeak()
```

Returns the Peak measurement.

---

### GetTimestamp

```lua
MeasurementResult:GetTimestamp()
```

Returns the measurement timestamp.

---

### Equals

```lua
MeasurementResult:Equals(other)
```

Returns `true` when both Measurement Results represent the same domain state.

------------------------------------------------------------------------------

### Empty

```lua
MeasurementResult.Empty()
```

Creates an immutable empty Measurement Result.

The empty Measurement Result represents a valid domain object before an analysis has completed.

---

# 5. Invariants

---

A Measurement Result shall always satisfy the following rules.

* RMS shall be a valid Measurement.
* Peak shall be a valid Measurement.
* Timestamp shall be a non-negative integer.
* The object shall be immutable after construction.
* The empty Measurement Result shall be a valid immutable Measurement Result.

---

# 6. Design Principles

---

The Measurement Result shall:

* remain immutable;
* expose a minimal public API;
* remain independent from infrastructure;
* preserve domain consistency;
* aggregate only immutable domain value objects.

The Measurement Result shall avoid null domain objects by providing an immutable empty instance.

---

# 7. Certification Criteria

---

The Measurement Result is certified when:

* valid instances can be created;
* invalid construction is rejected;
* all getters return the expected values;
* equality comparison behaves correctly;
* immutability is preserved;
* equality shall be value-based;
* the empty Measurement Result behaves correctly.

---

------------------------------------------------------------------------------
End of Document
------------------------------------------------------------------------------