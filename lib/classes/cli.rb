require 'pry'
require_relative './characters.rb'
require_relative './devilfruit.rb'
require_relative './menu.rb'
require_relative './effects.rb'
require_relative './arcs.rb'

class OnePiece::CLI

    def call
        Effects.new.logo
        Menu.new.menu
    end

end
    