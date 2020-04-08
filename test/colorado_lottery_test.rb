require 'minitest/autorun'
require 'minitest/pride'
require './lib/colorado_lottery'
require './lib/game'
require './lib/contestant'

require 'pry';


class GameTest < Minitest::Test
  def test_it_exists
    lottery = ColoradoLottery.new
    assert_instance_of ColoradoLottery, lottery
  end

  def test_it_has_readable_attributes
    lottery = ColoradoLottery.new

    assert_equal ({}), lottery.registered_contestants
    assert_equal [], lottery.winners
    assert_equal ({}), lottery.current_contestants
  end

  def test_it_can_verify_age_and_game_of_interest
    pick_4 = Game.new('Pick 4', 2)
    mega_millions = Game.new('Mega Millions', 5, true)
    cash_5 = Game.new('Cash 5', 1)
    alexander = Contestant.new({
                          first_name: 'Alexander',
                          last_name: 'Aigades',
                          age: 28,
                          state_of_residence: 'CO',
                          spending_money: 10})
    lottery = ColoradoLottery.new
    benjamin = Contestant.new({
                           first_name: 'Benjamin',
                           last_name: 'Franklin',
                           age: 17,
                           state_of_residence: 'PA',
                            spending_money: 100})
    alexander.add_game_interest('Pick 4')
    alexander.add_game_interest('Mega Millions')
    benjamin.add_game_interest('Mega Millions')

    assert_equal true, lottery.interested_and_18?(alexander, pick_4)
  end

  def test_it_can_regester
    pick_4 = Game.new('Pick 4', 2)
    mega_millions = Game.new('Mega Millions', 5, true)
    cash_5 = Game.new('Cash 5', 1)
    alexander = Contestant.new({
                          first_name: 'Alexander',
                          last_name: 'Aigades',
                          age: 28,
                          state_of_residence: 'CO',
                          spending_money: 10})
    lottery = ColoradoLottery.new
    benjamin = Contestant.new({
                           first_name: 'Benjamin',
                           last_name: 'Franklin',
                           age: 17,
                           state_of_residence: 'PA',
                            spending_money: 100})
    alexander.add_game_interest('Pick 4')
    alexander.add_game_interest('Mega Millions')
    benjamin.add_game_interest('Mega Millions')


    assert_equal true, alexander.can_register?
    assert_equal false, benjamin.can_register?
  end


end
