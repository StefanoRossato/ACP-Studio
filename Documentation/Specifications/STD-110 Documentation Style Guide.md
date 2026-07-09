# STD-110 — Documentation Style Guide

| **Field**        | **Value**              |
| ---------------- | ---------------------- |
| **Document ID**  | STD-110                |
| **Category**     | Engineering Standard   |
| **Status**       | Approved               |
| **Version**      | 1.0                    |
| **Author**       | ACP Studio Engineering |
| **Last Updated** | 2026-07-09             |

---

# 1. Introduction

## 1.1 Purpose

This standard defines the documentation style adopted by the ACP Studio project.

Its purpose is to ensure that every engineering document follows a consistent structure, terminology, visual presentation, and writing style.

This standard applies to all documentation produced within the ACP Studio repository.

---

## 1.2 Scope

This document defines:

* document structure;
* typography;
* section hierarchy;
* normative language;
* tables;
* diagrams;
* code blocks;
* notes and examples;
* cross references;
* versioning;
* review process.

This document does not define engineering requirements or implementation details.

---

## 1.3 Objectives

The documentation system shall:

* provide consistency across all documents;
* improve readability;
* simplify maintenance;
* reduce ambiguity;
* support long-term evolution of the project.

---

# 2. Document Classification

ACP Studio documentation is organized into document categories.

| Prefix | Document Type          | Purpose                                       |
| ------ | ---------------------- | --------------------------------------------- |
| ENG    | Engineering Principles | Engineering philosophy and project principles |
| STD    | Standard               | Project-wide rules and conventions            |
| TPL    | Template               | Reusable document templates                   |
| ARC    | Architecture           | High-level system architecture                |
| BLP    | Blueprint              | Architectural concepts                        |
| SPT    | Specification          | Normative technical requirements              |
| DES    | Design                 | Implementation design                         |
| API    | API Reference          | Public interfaces                             |
| DOC    | Guide                  | Informative documentation                     |

Each document shall belong to exactly one category.

---

# 3. Document Structure

Every engineering document shall follow the same high-level organization.

```text
Document Information

1. Introduction

2. Main Content

...

References

Relationship with ACP Studio Framework
```

The exact chapters may vary according to the document type.

---

# 4. Document Information

Every document shall begin with a document information table.

Example:

| Field       | Value    |
| ----------- | -------- |
| Document ID | XXX-000  |
| Status      | Approved |
| Version     | 1.0      |

The document information table shall appear before the first chapter.

---

# 5. Section Numbering

Section numbering shall use decimal notation.

Example:

```text
1.
1.1
1.2
2.
2.1
2.2
```

Heading levels shall not be skipped.

Correct:

```text
#
##
###
```

Incorrect:

```text
#
###
```

---

# 6. Typography

The following typography conventions shall be used consistently.

| Element        | Style             |
| -------------- | ----------------- |
| Document Title | Heading 1         |
| Chapter        | Heading 1         |
| Section        | Heading 2         |
| Subsection     | Heading 3         |
| Keywords       | Bold              |
| File Names     | Code              |
| Identifiers    | Code              |
| Code           | Fenced Code Block |

---

# 7. Normative Language

Normative keywords shall be written in uppercase.

The following keywords are defined.

| Keyword        | Meaning                |
| -------------- | ---------------------- |
| **SHALL**      | Mandatory requirement  |
| **SHALL NOT**  | Mandatory prohibition  |
| **SHOULD**     | Strong recommendation  |
| **SHOULD NOT** | Recommendation against |
| **MAY**        | Optional behavior      |

Normative statements shall use these keywords consistently.

Example:

> The Controller Endpoint **SHALL** initialize the VERSION register.

---

# 8. Definitions

Definitions shall use the following format.

> **Definition**
>
> A Register is a logical storage location identified by an integer index.

Definitions shall avoid implementation details.

---

# 9. Requirements

Normative requirements shall be concise and unambiguous.

Each requirement shall describe one behavior only.

Good example:

> The Processing Endpoint **SHALL** update the STATE register.

Poor example:

> The Processing Endpoint shall update the state and eventually perform additional operations if necessary.

---

# 10. Notes

Informative notes shall use the following format.

> **Note**
>
> Notes provide clarification but do not define mandatory behavior.

Notes shall never introduce new requirements.

---

# 11. Examples

Examples shall use the following format.

> **Example**
>
> COMMAND = START

Examples are informative only.

---

# 12. Tables

Tables shall:

* use consistent column alignment;
* include a header row;
* include descriptive column names.

Numeric values should be right aligned.

Text should be left aligned.

---

# 13. Diagrams

Diagrams shall:

* be written using monospace formatting;
* remain readable in plain text;
* illustrate concepts rather than define requirements.

Requirements shall always be defined by text.

---

# 14. Code Blocks

Source code shall use fenced code blocks with language identifiers.

Example:

````markdown
```lua
local value = 0
```
````

Every code block shall specify its language whenever possible.

---

# 15. Cross References

Documents shall reference other ACP Studio documents by their Document ID.

Example:

* ENG-000
* STD-110
* SPT-120

Cross references shall remain stable across document revisions.

---

# 16. Versioning

Document Version identifies the revision of the document.

Implementation versions are independent from document versions.

Example:

* Document Version = 1.2
* Protocol Version = 1

These values represent different concepts and shall not be confused.

---

# 17. Review Process

Every engineering document shall undergo the following review stages.

1. Structural Review
2. Technical Review
3. Editorial Review
4. Approval

Only approved documents may be used as implementation references.

---

# 18. Compliance

A compliant ACP Studio document SHALL:

* follow the standard document structure;
* use the prescribed typography;
* use normative language consistently;
* distinguish requirements from notes and examples;
* provide stable cross references;
* include document metadata;
* be reviewed before approval.

Documents that do not satisfy these requirements shall not be considered official engineering documentation.

---

# 19. Future Evolution

This standard may evolve to include:

* additional document categories;
* diagram conventions;
* naming conventions;
* glossary management;
* automated documentation validation.

Future revisions should preserve backward compatibility whenever possible.

---

# Relationship with ACP Studio Framework

STD-110 defines the official documentation style for ACP Studio.

All engineering documents, including Standards, Specifications, Blueprints, Designs, Templates, and Architecture documents, shall comply with this standard.

This document establishes the editorial foundation of the ACP Studio Engineering Documentation System.
