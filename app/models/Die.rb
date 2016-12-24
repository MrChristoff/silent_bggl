class Die

  def initialize
    $modern_dice = ["AAEEGN", "ELRTTY", "HIMNQU", "AOOTTW",
                    "ABBJOO", "EHRTVW", "DISTTY", "EIOSST",
                    "DELRVY", "ACHOPS", "EEINSU", "EEGHNW",
                    "AFFKPS", "HLNNRZ", "DEILRX", "CIMOTU"]

    shuffle_dice
  end

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
