RegisterCommand("record", function(source , args)
    StartRecording(1)
    TriggerEvent('Notification',"Started Recording!", "success")
end)

RegisterCommand("clip", function(source , args)
    StartRecording(0)
end)

RegisterCommand("saveclip", function(source , args)
    StopRecordingAndSaveClip()
    TriggerEvent('Notification',"Saved Recording!", "success")
end)

RegisterCommand("delclip", function(source , args)
    StopRecordingAndDiscardClip()
    TriggerEvent('Notification',"Deleted Recording!", "error")
end)

RegisterCommand("editor", function(source , args)
    NetworkSessionLeaveSinglePlayer()
    ActivateRockstarEditor()
    TriggerEvent('Notification',"Later aligator!", "error")
end)
