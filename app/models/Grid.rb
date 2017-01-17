class Grid

  def shuffle_dice
    $shuffled_dice = $modern_dice.shuffle
  end

  def roll(die_number)
    die = select_die(die_number)
    die.split("").shuffle[0]
  end

  def select_die(die_number)
    $shuffled_dice[die_number]
  end

end
