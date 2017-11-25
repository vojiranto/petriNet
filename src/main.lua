function new.Main ()
    local private = {}
    local public  = {}
    
    public.run = function ()
        private.knots      = {new.Knot(1), new.Knot(1), new.Knot(1)}
        private.converters = {new.Converter(), new.Converter()}
        
        -- ставим маркер в начало цепочки
        private.knots[1].addContent(1)
        
        
        private.converters[1].addInputKnot(private.knots[1], 1)
        private.converters[1].addOutputKnot(private.knots[2], 1)

        private.converters[2].addInputKnot(private.knots[2], 1)
        private.converters[2].addOutputKnot(private.knots[3], 1)
    
        private.petriNet = new.PetriNet(private.knots, private.converters)
        private.petriNet.print()
        print "-----"
        private.petriNet.step()
        private.petriNet.print()
        print "-----"
        private.petriNet.step()
        private.petriNet.print()
    end

    return copy(public)
end
