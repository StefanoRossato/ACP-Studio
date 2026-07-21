------------------------------------------------------------------------------
-- ACP Studio
-- Foundation Lifecycle Definitions
--
-- Defines the canonical lifecycle states shared by the ACP Studio Foundation
-- Layer.
--
-- Every Foundation Service implementing the FND-001 architecture shall use
-- these lifecycle definitions.
------------------------------------------------------------------------------
-- Specification : FND-001
-- Category      : Foundation
------------------------------------------------------------------------------

local Lifecycle = {}

------------------------------------------------------------------------------
-- Lifecycle States
------------------------------------------------------------------------------

Lifecycle.Loaded      = "Loaded"
Lifecycle.Operational = "Operational"
Lifecycle.Terminated  = "Terminated"

------------------------------------------------------------------------------
-- Module Return
------------------------------------------------------------------------------

return Lifecycle