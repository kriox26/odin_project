module Mastermind
  # Define constants
  COLORS = { 'blue' => :blue , 'red' => :red , 'cyan' => :cyan , 'yellow' => :yellow , 'green' => :green , 'magenta' => :magenta}

  SPLIT = { vertical:  "\u2551", horizontal: "\u2550", cross:     "\u256c",
		  nw_corner: "\u2554", ne_corner:  "\u2557", se_corner: "\u255d",
		  sw_corner: "\u255a", n_divide:   "\u2566", s_divide:  "\u2569",
		  e_divide:  "\u2563", w_divide:   "\u2560" }
end
