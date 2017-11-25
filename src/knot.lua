function new.Knot (limit)
    local private = {
        content = 0,
        limit   = limit,
    }
    local public = {}
    
    -- удалить излишек 
    private.removeExcess = function ()
        if private.content > limit then
            local rest = private.content - limit
            private.content = limit
            return rest    
    end end

    -- установить ограничение
    public.setLimit = function (limit)
        private.limit = limit
        return private.removeExcess()
    end
    
    -- добавить содержимого
    public.addContent = function (content)
        private.content = private.content + content
        return private.removeExcess()
    end
    
    -- содержимое существует в нужном количестве
    public.enoughContent = function (content)
        return private.content >= content
    end
    
    -- извлекаем содержимое, если его достаточно.
    public.getContent = function (content)
        if private.content >= content then
            private.content = private.content - content
            return content
    end end
    
    public.toString = function ()
        return private.content
    end

    return copy(public)
end
