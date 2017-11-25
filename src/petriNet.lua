local function maximum (t)
    local res = 0
    -- раскалупываем три вложенных массива
    for _, v in pairs(t) do
        for _, v1 in pairs(v) do
            for _, v2 in pairs(v1) do
                local tmp = 0
                if type(v2) == "table" then
                    tmp = v2[1]
                else
                    tmp = v2
                end
                if tmp > res then
                    res = tmp
    end end end end
    return res
end

function new.PetriNet (knots, converters)
    -- стандартный способ построения сети
    if converters then
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

        public.addContent = function (i, c)
            if type(i) == "table" then
                for _, v in pairs(i) do
                    knots[v[1]].addContent(v[2])
            end else
                knots[i].addContent(c)
        end end
        
        public.print = function ()
            for k, v in pairs(knots) do
                print (k .. " = " .. v.toString())
        end end
        return copy(public)
    
    else -- альтернативный способ построения сети

        local newKnots      = {}
        local newConverters = {}
        for i = 1, maximum(knots) do
            newKnots[i] = new.Knot(10^10)
        end
        
        for k, v in pairs(knots) do
            newConverters[k] = new.Converter()
            for _, v1 in pairs(v[1]) do
                if type(v1) == "table" then
                    -- ставим кратность
                    newConverters[k].addInputKnot(newKnots[v1[1]], v1[2])
                else
                    -- кратность по умолчанию
                    newConverters[k].addInputKnot(newKnots[v1], 1)                                
            end end

            for _, v1 in pairs(v[2]) do
                if type(v1) == "table" then
                    -- ставим кратность
                    newConverters[k].addOutputKnot(newKnots[v1[1]], v1[2])
                else
                    -- кратность по умолчанию
                    newConverters[k].addOutputKnot(newKnots[v1], 1)                                
            end end
        end
        return new.PetriNet(newKnots, newConverters)
end end

