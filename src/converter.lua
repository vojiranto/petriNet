function new.Converter ()
    local private = {
        inputKnots  = {},
        outputKnots = {},
        isActive    = false,
    }
    private.addKnot = function (knotTable, knot, multiplicity)
        knotTable[knot] = multiplicity
    end

    local public = {}
    
    public.addInputKnot = function (knot, multiplicity)
        private.addKnot(private.inputKnots, knot, multiplicity)
    end
    
    public.addOutputKnot = function (knot, multiplicity)
        private.addKnot(private.outputKnots, knot, multiplicity)
    end


    public.take = function ()
        -- проверить, что взятие возможно
        for k, v in pairs(private.inputKnots) do
            if not k.enoughContent(v) then
                private.isActive = false
                return
        end end
        
        -- взять всё что нужно
        for k, v in pairs(private.inputKnots) do
            k.getContent(v)
        end
        private.isActive = true
    end
    
    -- разложить всё, что нужно
    public.recoil = function ()
        if private.isActive then
            for k, v in pairs(private.outputKnots) do
            k.addContent(v)
    end end end

    return copy(public)
end
