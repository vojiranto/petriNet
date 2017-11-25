function new.Main ()
    local private = {}
    local public  = {}
    
    public.run = function ()        
        -- узлы и преобразователи
        private.petriNet = new.PetriNet{
            {{1}, {2}},
            {{1}, {3}}
        }
        
        -- маркеры
        private.petriNet.addContent{{1,1}}
        
        for i = 1, 2 do
            private.petriNet.print()
            print "-----"
            private.petriNet.step()
        end
    end

    return copy(public)
end
