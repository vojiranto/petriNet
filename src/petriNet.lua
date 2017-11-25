function new.PetriNet (knots, converters)
    local public = {}
    
    -- ход состоит из двух фаз, взятия и отдачи
    public.step = function ()
        for _, v in pairs(converters) do
            v.take()
        end
        for _, v in pairs(converters) do
            v.recoil()
        end
    end
    
    public.print = function ()
        for k, v in pairs(knots) do
            print (k .. " = " .. v.toString())
    end end
    return copy(public)
end
