require_relative '../../lib/classes/effect.rb'
require 'colorize'

describe Effect do

    context '.logo' do

        it "outputs ASCII art of the One Piece Pirates Jolly Roger" do
            expect(Effect.logo).to eq(
                "\nWelcome to One Piece!\n
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@       @@@@@@@@@@@@@@
@@@@@@@@@@@@          @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@         @@@@@@@@@@@@@
@@@@@@@@@@@@          @@@@@@@@@@@@@@@@@@@@@@@,,,,,,,,,@@@@@@@@@@@@@@@@@@@@@@        @@@@@@@@@@@@@
@@@@@@@@              @@@@@@@@@@@@@@@@,,,,,,,,,,,,,,,,,,,,,@@@@@@@@@@@@@@@@              @@@@@@@@
@@@@@@              @@@@@@@@@@@@@@,,,,,,,,,,,,,,,,,,,,,,,,,,,,,@@@@@@@@@@@@@@              @@@@@@
@@@@@@               @@@@@@@@@@@,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,@@@@@@@@@@@               @@@@@@
@@@@@@@                @@@@@@@,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,@@@@@@@                @@@@@@@
@@@@@@@@@@@@@@@@@       @@@,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,@@@@      @@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@#     ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,      @@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   @@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@.........................................................................@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@                                              @@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@         @@@@@@               @@@@@@          @@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@       @@@@@@@@@@           @@@@@@@@@@       @@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@     @@@@@@@@@@@@         @@@@@@@@@@@@     @@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@    @@@@@@@@@@@@         @@@@@@@@@@@@    @@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    @@@@@@@@@@           @@@@@@@@@@    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    @@@@@@               @@@@@@    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@              @@@              @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@          @@@@@          @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@***************@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*  |  * |      |      | *  |  *@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ * |   *|      |      |*   | *  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      *|    |******|******|    |*      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@      @@ *    |      |      |    * @@      @@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@      @@@@@ *   |      |      |   * @@@@@      @@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@(                @@@@@@   *********************   @@@@@@                @@@@@@@@@@@@@
@@@@@@@@@@@@               @@@@@@@@                           @@@@@@@@               @@@@@@@@@@@@
@@@@@@@@@@@@             @@@@@@@@@@@                         @@@@@@@@@@(             @@@@@@@@@@@@
@@@@@@@@@@@@@              @@@@@@@@@@                      @@@@@@@@@@              (@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@(         @@@@@@@@@@@                  @@@@@@@@@@@@         @@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@          @@@@@@@@@@@@@@@           @@@@@@@@@@@@@@@         (@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@       @@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n".colorize(:yellow)
            )
        end
        
    end
    
end