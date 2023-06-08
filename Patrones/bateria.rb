class Bateria
    def initialize
        @carga = 100 # 100 % de carga
        @tiempo = 60 # 60 minutos restantes
        @observers = []
    end
    
    def register(observer)
        @observers.push(observer)
    end

    def notifyAll
        @observers.each do |obs|
            obs.update(self)
        end
    end

    def consume(voltios)
        porcentaje_consumido = voltios/256
        @carga = @carga - porcentaje_consumido
        @tiempo = @tiempo - porcentaje_consumido*60
        notifyAll()
    end

    def carga
        @carga
    end
end

class Observer
    def update(objCounter)
        raise NotImplementedError
    end
end

class LowBatery < Observer
    def update(objCounter)
        if objCounter.carga <= 20
            puts "Batería baja"
        end
    end
end

class NoBatery < Observer
    def update(objCounter)
        if objCounter.carga = 0
            puts "bye bye"
        end
    end
end