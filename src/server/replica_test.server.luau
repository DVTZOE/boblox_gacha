local Replica = require(game.ServerScriptService.ReplicaServer)

local replica = Replica.New({
    Token = Replica.Token("GlobalData"),
    Data = { -- Passed table reference will be used
        Score = 0,
        Nested = {
            Value = false,
        },
    },
})

replica:Replicate()

task.spawn(function()
    while true do
        replica:Set({"Score"}, replica.Data.Score + 100)
        task.wait(1)
    end
end)

replica:Set({"Nested", "Value"}, true)