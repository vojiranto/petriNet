#!/usr/bin/luajit
-------------------------------------------------------------------------------
-- Name:        SCTR - Simple Console Time Registrator                       --
-- Version:     0.2.4.5                                                      --
-- Author:      D.A. Pavlyuk                                                 --
-- License:     GPL                                                          --
-- Description: Моделирование сетей Петри                                    --
-------------------------------------------------------------------------------
function dolibs(libs)
    for _, fileName in pairs(libs) do
        dofile("../../libs/" .. fileName .. "/main.lua")
end end

function dofiles (files)
    for _, fileName in pairs(files) do
        dofile("src/".. fileName .. ".lua")
end end

new = {}
dolibs {
    "functions",
    "file",
}

dofiles {
    "main",
}

new.Main().run()
