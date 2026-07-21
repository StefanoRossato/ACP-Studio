local Bootstrap = {}

local RuntimeEnvironment =
    require("Core.Runtime.RuntimeEnvironment")

local State = {
    Initialized = false
}

function Bootstrap.Initialize()

    if State.Initialized then
        return true
    end

    RuntimeEnvironment.Initialize()

    if not RuntimeEnvironment.Prepare() then
        return false
    end

    if not RuntimeEnvironment.Validate() then
        return false
    end

    State.Initialized = true

    return true

end

return Bootstrap