function Knot (limit)
    local privat = {
        content = 0,
        limit   = limit,
    }
    local public = {}
    
    -- удалить излишек 
    privat.removeExcess = function ()
        if privat.content > limit then
            local rest = privat.content - limit
            privat.content = limit
            return rest    
    end end

    -- установить ограничение
    public.setLimit = function (limit)
        privat.limit = limit
        return privat.removeExcess()
    end
    
    -- добавить содержимого
    public.addContent = function (content)
        privat.content = privat.content + content
        return privat.removeExcess()
    end
    
    -- содержимое существует в нужном количестве
    public.enoughContent = function (content)
        return privat.content >= content
    end
    
    -- извлекаем содержимое, если его достаточно.
    public.getContent = function (content)
        if privat.content >= content then
            privat.content = privat.content - content
            return content
    end end
    
    return copy(public)
end
