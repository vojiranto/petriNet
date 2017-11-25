#!/usr/bin/luajit
-------------------------------------------------------------------------------
-- Name:        PetriNet                                                     --
-- Version:     0.0.2.4                                                      --
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
}

dofiles {
    "converter",
    "knot",
    "petriNet",
    "main",
}

new.Main().run()
