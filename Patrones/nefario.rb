class Card
    attr_reader :value
    
    def initialize(value,
        kind)
        @value = value
        @kind = kind
    end

    def to_s
        return
        "#{@value}#{@kind}"
    end
end

class Player
    
    def initialize(id)
        @id = id
        @cards =[]
    end
    def add(card)
        @cards.push(card)
    end
    def printCards()
        puts "Player #{@id}: #{@cards.join(",")}"
    end
end

class CardDeck
    def initialize
        @cards = []
        ["H","T","D","S"].each do |kind|
            (1..13).each do |number|
                @cards.push(Card.new(number,kind))
            end
        end
    end
    
    def shuffle
        @cards.shuffle
    end
    
    def pickRandom
        randomCard = @cards.sample
        @cards.delete(randomCard)
        return randomCard
    end
    
    def pickLast
        return @cards.pop
    end
end

class Game
    def initialize(numberOfPlayers)
        @deck = CardDeck.new
        @players = []
        numberOfPlayers.times { |id| @players.push(Player.new(id))}
    end
    
    def printState()
        @players.each do |player|
            player.printCards
        end
    end
    
    def split(strategia)
        strategia.repartir(@players, @deck)
    end
end

class StrategySplit

    def repartir(jugadores, mazo)
        raise NotImplementedError
    end
end

class Bloque < StrategySplit
    # reparte 5 cartas a cada jugador
    def repartir(jugadores, mazo)     
        jugadores.each do |jugador|
            5.times{
                jugador.add(mazo.pickLast)
            }
        end
    end
end

class UnoPorUno < StrategySplit
    # reparte uno por uno
    def repartir(jugadores, mazo)     
        jugadores.each do |jugador|
            jugador.add(mazo.pickLast)
        end
    end
end

class SoloUno < StrategySplit
    # reparte a uno al azar
    def repartir(jugadores, mazo)     
        jugadores.sample.add(mazo.pickRandom)
    end
end

juego = Game.new(3)
r1 = Bloque.new
r2 = UnoPorUno.new
juego.split(r1)
juego.split(r2)
juego.split(SoloUno.new)
juego.printState()