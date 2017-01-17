class Grid

  def initialize(bag_of_dice)
    $dice = bag_of_dice.dice
    $rolled_dice = []

    shuffle_dice
    grid_builder
  end

  def shuffle_dice
    $shuffled_dice = $dice.shuffle
  end

  def grid_builder
    $shuffled_dice.each do |die|
      $rolled_dice << roll_dice(die)
    end
  end

  def roll_dice(die)
    die.split("").shuffle[0]
  end

  def select_die(die_number)
    $rolled_dice[die_number]
  end
end
