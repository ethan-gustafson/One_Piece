require 'pry'
require_relative './characters.rb'
require_relative './devilfruit.rb'
require_relative './menu.rb'
require_relative './effects.rb'

class CLI

    def call
        Effects.new.logo
        Menu.new.menu
    end

end
    