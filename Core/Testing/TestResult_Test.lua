--------------------------------------------------------------------------------
-- ACP Studio
--
-- Test        : TestResult_Test
-- Module      : Core.Testing.TestResult
-- Implements  : TST-101
--
--------------------------------------------------------------------------------

local TestResult = require("Core.Testing.TestResult")

local function Assert(condition, message)

    if not condition then
        error(message, 2)
    end

end

print("--------------------------------------------------")
print("TST-101 - TestResult")
print("--------------------------------------------------")

--------------------------------------------------------------------------------
-- Success Result
--------------------------------------------------------------------------------

local success = TestResult.Success()

Assert(success:IsSuccess(),
    "Success result should report success.")

Assert(not success:IsFailure(),
    "Success result should not report failure.")

Assert(success:GetMessage() == nil,
    "Success result should not contain a diagnostic message.")

print("[PASS] Success result")

--------------------------------------------------------------------------------
-- Failure Result
--------------------------------------------------------------------------------

local failure = TestResult.Failure("Failure message")

Assert(not failure:IsSuccess(),
    "Failure result should not report success.")

Assert(failure:IsFailure(),
    "Failure result should report failure.")

Assert(failure:GetMessage() == "Failure message",
    "Failure result should preserve the diagnostic message.")

print("[PASS] Failure result")

--------------------------------------------------------------------------------
-- Immutability
--------------------------------------------------------------------------------

local immutable = false

local ok = pcall(function()

    success.NewField = 123

end)

immutable = not ok

Assert(immutable,
    "TestResult shall be immutable.")

print("[PASS] Immutability")

--------------------------------------------------------------------------------
-- Independent Instances
--------------------------------------------------------------------------------

local success2 = TestResult.Success()

Assert(success ~= success2,
    "Factory shall create independent instances.")

print("[PASS] Independent instances")

--------------------------------------------------------------------------------
-- Completed
--------------------------------------------------------------------------------

print("--------------------------------------------------")
print("TST-101 PASSED")
print("--------------------------------------------------")