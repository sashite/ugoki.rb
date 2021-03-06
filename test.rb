# frozen_string_literal: true

require "simplecov"

::SimpleCov.command_name "Brutal test suite"
::SimpleCov.start

require "./lib/ugoki"

TRUNCATED_TABLEBASE = {
  "S:N"  => {0 => [], 1 => [], 2 => [], 3 => [], 4 => [], 5 => [], 6 => [], 7 => [], 8 => [], 9 => [], 10 => [], 11 => [], 12 => [], 13 => [], 14 => [], 15 => [], 16 => [], 17 => [], 18 => [[{1 => :enemy}, [18, 1, ["S:+N"], true]], [{1 => :free}, [18, 1, ["S:+N"], false]]], 19 => [[{0 => :enemy}, [19, 0, ["S:+N"], true]], [{2 => :enemy}, [19, 2, ["S:+N"], true]], [{0 => :free}, [19, 0, ["S:+N"], false]], [{2 => :free}, [19, 2, ["S:+N"], false]]], 20 => [[{1 => :enemy}, [20, 1, ["S:+N"], true]], [{3 => :enemy}, [20, 3, ["S:+N"], true]], [{1 => :free}, [20, 1, ["S:+N"], false]], [{3 => :free}, [20, 3, ["S:+N"], false]]], 21 => [[{2 => :enemy}, [21, 2, ["S:+N"], true]], [{4 => :enemy}, [21, 4, ["S:+N"], true]], [{2 => :free}, [21, 2, ["S:+N"], false]], [{4 => :free}, [21, 4, ["S:+N"], false]]], 22 => [[{3 => :enemy}, [22, 3, ["S:+N"], true]], [{5 => :enemy}, [22, 5, ["S:+N"], true]], [{3 => :free}, [22, 3, ["S:+N"], false]], [{5 => :free}, [22, 5, ["S:+N"], false]]], 23 => [[{4 => :enemy}, [23, 4, ["S:+N"], true]], [{6 => :enemy}, [23, 6, ["S:+N"], true]], [{4 => :free}, [23, 4, ["S:+N"], false]], [{6 => :free}, [23, 6, ["S:+N"], false]]], 24 => [[{5 => :enemy}, [24, 5, ["S:+N"], true]], [{7 => :enemy}, [24, 7, ["S:+N"], true]], [{5 => :free}, [24, 5, ["S:+N"], false]], [{7 => :free}, [24, 7, ["S:+N"], false]]], 25 => [[{6 => :enemy}, [25, 6, ["S:+N"], true]], [{8 => :enemy}, [25, 8, ["S:+N"], true]], [{6 => :free}, [25, 6, ["S:+N"], false]], [{8 => :free}, [25, 8, ["S:+N"], false]]], 26 => [[{7 => :enemy}, [26, 7, ["S:+N"], true]], [{7 => :free}, [26, 7, ["S:+N"], false]]], 27 => [[{10 => :enemy}, [27, 10, ["S:+N"], true]], [{10 => :free}, [27, 10, ["S:+N"], false]]], 28 => [[{9 => :enemy}, [28, 9, ["S:+N"], true]], [{11 => :enemy}, [28, 11, ["S:+N"], true]], [{9 => :free}, [28, 9, ["S:+N"], false]], [{11 => :free}, [28, 11, ["S:+N"], false]]], 29 => [[{10 => :enemy}, [29, 10, ["S:+N"], true]], [{12 => :enemy}, [29, 12, ["S:+N"], true]], [{10 => :free}, [29, 10, ["S:+N"], false]], [{12 => :free}, [29, 12, ["S:+N"], false]]], 30 => [[{11 => :enemy}, [30, 11, ["S:+N"], true]], [{13 => :enemy}, [30, 13, ["S:+N"], true]], [{11 => :free}, [30, 11, ["S:+N"], false]], [{13 => :free}, [30, 13, ["S:+N"], false]]], 31 => [[{12 => :enemy}, [31, 12, ["S:+N"], true]], [{14 => :enemy}, [31, 14, ["S:+N"], true]], [{12 => :free}, [31, 12, ["S:+N"], false]], [{14 => :free}, [31, 14, ["S:+N"], false]]], 32 => [[{13 => :enemy}, [32, 13, ["S:+N"], true]], [{15 => :enemy}, [32, 15, ["S:+N"], true]], [{13 => :free}, [32, 13, ["S:+N"], false]], [{15 => :free}, [32, 15, ["S:+N"], false]]], 33 => [[{14 => :enemy}, [33, 14, ["S:+N"], true]], [{16 => :enemy}, [33, 16, ["S:+N"], true]], [{14 => :free}, [33, 14, ["S:+N"], false]], [{16 => :free}, [33, 16, ["S:+N"], false]]], 34 => [[{15 => :enemy}, [34, 15, ["S:+N"], true]], [{17 => :enemy}, [34, 17, ["S:+N"], true]], [{15 => :free}, [34, 15, ["S:+N"], false]], [{17 => :free}, [34, 17, ["S:+N"], false]]], 35 => [[{16 => :enemy}, [35, 16, ["S:+N"], true]], [{16 => :free}, [35, 16, ["S:+N"], false]]], 36 => [[{19 => :enemy}, [36, 19, ["S:+N", "S:N"], true]], [{19 => :free}, [36, 19, ["S:+N", "S:N"], false]]], 37 => [[{18 => :enemy}, [37, 18, ["S:+N", "S:N"], true]], [{20 => :enemy}, [37, 20, ["S:+N", "S:N"], true]], [{18 => :free}, [37, 18, ["S:+N", "S:N"], false]], [{20 => :free}, [37, 20, ["S:+N", "S:N"], false]]], 38 => [[{19 => :enemy}, [38, 19, ["S:+N", "S:N"], true]], [{21 => :enemy}, [38, 21, ["S:+N", "S:N"], true]], [{19 => :free}, [38, 19, ["S:+N", "S:N"], false]], [{21 => :free}, [38, 21, ["S:+N", "S:N"], false]]], 39 => [[{20 => :enemy}, [39, 20, ["S:+N", "S:N"], true]], [{22 => :enemy}, [39, 22, ["S:+N", "S:N"], true]], [{20 => :free}, [39, 20, ["S:+N", "S:N"], false]], [{22 => :free}, [39, 22, ["S:+N", "S:N"], false]]], 40 => [[{21 => :enemy}, [40, 21, ["S:+N", "S:N"], true]], [{23 => :enemy}, [40, 23, ["S:+N", "S:N"], true]], [{21 => :free}, [40, 21, ["S:+N", "S:N"], false]], [{23 => :free}, [40, 23, ["S:+N", "S:N"], false]]], 41 => [[{22 => :enemy}, [41, 22, ["S:+N", "S:N"], true]], [{24 => :enemy}, [41, 24, ["S:+N", "S:N"], true]], [{22 => :free}, [41, 22, ["S:+N", "S:N"], false]], [{24 => :free}, [41, 24, ["S:+N", "S:N"], false]]], 42 => [[{23 => :enemy}, [42, 23, ["S:+N", "S:N"], true]], [{25 => :enemy}, [42, 25, ["S:+N", "S:N"], true]], [{23 => :free}, [42, 23, ["S:+N", "S:N"], false]], [{25 => :free}, [42, 25, ["S:+N", "S:N"], false]]], 43 => [[{24 => :enemy}, [43, 24, ["S:+N", "S:N"], true]], [{26 => :enemy}, [43, 26, ["S:+N", "S:N"], true]], [{24 => :free}, [43, 24, ["S:+N", "S:N"], false]], [{26 => :free}, [43, 26, ["S:+N", "S:N"], false]]], 44 => [[{25 => :enemy}, [44, 25, ["S:+N", "S:N"], true]], [{25 => :free}, [44, 25, ["S:+N", "S:N"], false]]], 45 => [[{28 => :enemy}, [45, 28, ["S:N"], true]], [{28 => :free}, [45, 28, ["S:N"], false]]], 46 => [[{27 => :enemy}, [46, 27, ["S:N"], true]], [{29 => :enemy}, [46, 29, ["S:N"], true]], [{27 => :free}, [46, 27, ["S:N"], false]], [{29 => :free}, [46, 29, ["S:N"], false]]], 47 => [[{28 => :enemy}, [47, 28, ["S:N"], true]], [{30 => :enemy}, [47, 30, ["S:N"], true]], [{28 => :free}, [47, 28, ["S:N"], false]], [{30 => :free}, [47, 30, ["S:N"], false]]], 48 => [[{29 => :enemy}, [48, 29, ["S:N"], true]], [{31 => :enemy}, [48, 31, ["S:N"], true]], [{29 => :free}, [48, 29, ["S:N"], false]], [{31 => :free}, [48, 31, ["S:N"], false]]], 49 => [[{30 => :enemy}, [49, 30, ["S:N"], true]], [{32 => :enemy}, [49, 32, ["S:N"], true]], [{30 => :free}, [49, 30, ["S:N"], false]], [{32 => :free}, [49, 32, ["S:N"], false]]], 50 => [[{31 => :enemy}, [50, 31, ["S:N"], true]], [{33 => :enemy}, [50, 33, ["S:N"], true]], [{31 => :free}, [50, 31, ["S:N"], false]], [{33 => :free}, [50, 33, ["S:N"], false]]], 51 => [[{32 => :enemy}, [51, 32, ["S:N"], true]], [{34 => :enemy}, [51, 34, ["S:N"], true]], [{32 => :free}, [51, 32, ["S:N"], false]], [{34 => :free}, [51, 34, ["S:N"], false]]], 52 => [[{33 => :enemy}, [52, 33, ["S:N"], true]], [{35 => :enemy}, [52, 35, ["S:N"], true]], [{33 => :free}, [52, 33, ["S:N"], false]], [{35 => :free}, [52, 35, ["S:N"], false]]], 53 => [[{34 => :enemy}, [53, 34, ["S:N"], true]], [{34 => :free}, [53, 34, ["S:N"], false]]], 54 => [[{37 => :enemy}, [54, 37, ["S:N"], true]], [{37 => :free}, [54, 37, ["S:N"], false]]], 55 => [[{36 => :enemy}, [55, 36, ["S:N"], true]], [{38 => :enemy}, [55, 38, ["S:N"], true]], [{36 => :free}, [55, 36, ["S:N"], false]], [{38 => :free}, [55, 38, ["S:N"], false]]], 56 => [[{37 => :enemy}, [56, 37, ["S:N"], true]], [{39 => :enemy}, [56, 39, ["S:N"], true]], [{37 => :free}, [56, 37, ["S:N"], false]], [{39 => :free}, [56, 39, ["S:N"], false]]], 57 => [[{38 => :enemy}, [57, 38, ["S:N"], true]], [{40 => :enemy}, [57, 40, ["S:N"], true]], [{38 => :free}, [57, 38, ["S:N"], false]], [{40 => :free}, [57, 40, ["S:N"], false]]], 58 => [[{39 => :enemy}, [58, 39, ["S:N"], true]], [{41 => :enemy}, [58, 41, ["S:N"], true]], [{39 => :free}, [58, 39, ["S:N"], false]], [{41 => :free}, [58, 41, ["S:N"], false]]], 59 => [[{40 => :enemy}, [59, 40, ["S:N"], true]], [{42 => :enemy}, [59, 42, ["S:N"], true]], [{40 => :free}, [59, 40, ["S:N"], false]], [{42 => :free}, [59, 42, ["S:N"], false]]], 60 => [[{41 => :enemy}, [60, 41, ["S:N"], true]], [{43 => :enemy}, [60, 43, ["S:N"], true]], [{41 => :free}, [60, 41, ["S:N"], false]], [{43 => :free}, [60, 43, ["S:N"], false]]], 61 => [[{42 => :enemy}, [61, 42, ["S:N"], true]], [{44 => :enemy}, [61, 44, ["S:N"], true]], [{42 => :free}, [61, 42, ["S:N"], false]], [{44 => :free}, [61, 44, ["S:N"], false]]], 62 => [[{43 => :enemy}, [62, 43, ["S:N"], true]], [{43 => :free}, [62, 43, ["S:N"], false]]], 63 => [[{46 => :enemy}, [63, 46, ["S:N"], true]], [{46 => :free}, [63, 46, ["S:N"], false]]], 64 => [[{45 => :enemy}, [64, 45, ["S:N"], true]], [{47 => :enemy}, [64, 47, ["S:N"], true]], [{45 => :free}, [64, 45, ["S:N"], false]], [{47 => :free}, [64, 47, ["S:N"], false]]], 65 => [[{46 => :enemy}, [65, 46, ["S:N"], true]], [{48 => :enemy}, [65, 48, ["S:N"], true]], [{46 => :free}, [65, 46, ["S:N"], false]], [{48 => :free}, [65, 48, ["S:N"], false]]], 66 => [[{47 => :enemy}, [66, 47, ["S:N"], true]], [{49 => :enemy}, [66, 49, ["S:N"], true]], [{47 => :free}, [66, 47, ["S:N"], false]], [{49 => :free}, [66, 49, ["S:N"], false]]], 67 => [[{48 => :enemy}, [67, 48, ["S:N"], true]], [{50 => :enemy}, [67, 50, ["S:N"], true]], [{48 => :free}, [67, 48, ["S:N"], false]], [{50 => :free}, [67, 50, ["S:N"], false]]], 68 => [[{49 => :enemy}, [68, 49, ["S:N"], true]], [{51 => :enemy}, [68, 51, ["S:N"], true]], [{49 => :free}, [68, 49, ["S:N"], false]], [{51 => :free}, [68, 51, ["S:N"], false]]], 69 => [[{50 => :enemy}, [69, 50, ["S:N"], true]], [{52 => :enemy}, [69, 52, ["S:N"], true]], [{50 => :free}, [69, 50, ["S:N"], false]], [{52 => :free}, [69, 52, ["S:N"], false]]], 70 => [[{51 => :enemy}, [70, 51, ["S:N"], true]], [{53 => :enemy}, [70, 53, ["S:N"], true]], [{51 => :free}, [70, 51, ["S:N"], false]], [{53 => :free}, [70, 53, ["S:N"], false]]], 71 => [[{52 => :enemy}, [71, 52, ["S:N"], true]], [{52 => :free}, [71, 52, ["S:N"], false]]], 72 => [[{55 => :enemy}, [72, 55, ["S:N"], true]], [{55 => :free}, [72, 55, ["S:N"], false]]], 73 => [[{54 => :enemy}, [73, 54, ["S:N"], true]], [{56 => :enemy}, [73, 56, ["S:N"], true]], [{54 => :free}, [73, 54, ["S:N"], false]], [{56 => :free}, [73, 56, ["S:N"], false]]], 74 => [[{55 => :enemy}, [74, 55, ["S:N"], true]], [{57 => :enemy}, [74, 57, ["S:N"], true]], [{55 => :free}, [74, 55, ["S:N"], false]], [{57 => :free}, [74, 57, ["S:N"], false]]], 75 => [[{56 => :enemy}, [75, 56, ["S:N"], true]], [{58 => :enemy}, [75, 58, ["S:N"], true]], [{56 => :free}, [75, 56, ["S:N"], false]], [{58 => :free}, [75, 58, ["S:N"], false]]], 76 => [[{57 => :enemy}, [76, 57, ["S:N"], true]], [{59 => :enemy}, [76, 59, ["S:N"], true]], [{57 => :free}, [76, 57, ["S:N"], false]], [{59 => :free}, [76, 59, ["S:N"], false]]], 77 => [[{58 => :enemy}, [77, 58, ["S:N"], true]], [{60 => :enemy}, [77, 60, ["S:N"], true]], [{58 => :free}, [77, 58, ["S:N"], false]], [{60 => :free}, [77, 60, ["S:N"], false]]], 78 => [[{59 => :enemy}, [78, 59, ["S:N"], true]], [{61 => :enemy}, [78, 61, ["S:N"], true]], [{59 => :free}, [78, 59, ["S:N"], false]], [{61 => :free}, [78, 61, ["S:N"], false]]], 79 => [[{60 => :enemy}, [79, 60, ["S:N"], true]], [{62 => :enemy}, [79, 62, ["S:N"], true]], [{60 => :free}, [79, 60, ["S:N"], false]], [{62 => :free}, [79, 62, ["S:N"], false]]], 80 => [[{61 => :enemy}, [80, 61, ["S:N"], true]], [{61 => :free}, [80, 61, ["S:N"], false]]], nil => [[{18 => :free}, [nil, 18, ["S:N"], false]], [{19 => :free}, [nil, 19, ["S:N"], false]], [{20 => :free}, [nil, 20, ["S:N"], false]], [{21 => :free}, [nil, 21, ["S:N"], false]], [{22 => :free}, [nil, 22, ["S:N"], false]], [{23 => :free}, [nil, 23, ["S:N"], false]], [{24 => :free}, [nil, 24, ["S:N"], false]], [{25 => :free}, [nil, 25, ["S:N"], false]], [{26 => :free}, [nil, 26, ["S:N"], false]], [{27 => :free}, [nil, 27, ["S:N"], false]], [{28 => :free}, [nil, 28, ["S:N"], false]], [{29 => :free}, [nil, 29, ["S:N"], false]], [{30 => :free}, [nil, 30, ["S:N"], false]], [{31 => :free}, [nil, 31, ["S:N"], false]], [{32 => :free}, [nil, 32, ["S:N"], false]], [{33 => :free}, [nil, 33, ["S:N"], false]], [{34 => :free}, [nil, 34, ["S:N"], false]], [{35 => :free}, [nil, 35, ["S:N"], false]], [{36 => :free}, [nil, 36, ["S:N"], false]], [{37 => :free}, [nil, 37, ["S:N"], false]], [{38 => :free}, [nil, 38, ["S:N"], false]], [{39 => :free}, [nil, 39, ["S:N"], false]], [{40 => :free}, [nil, 40, ["S:N"], false]], [{41 => :free}, [nil, 41, ["S:N"], false]], [{42 => :free}, [nil, 42, ["S:N"], false]], [{43 => :free}, [nil, 43, ["S:N"], false]], [{44 => :free}, [nil, 44, ["S:N"], false]], [{45 => :free}, [nil, 45, ["S:N"], false]], [{46 => :free}, [nil, 46, ["S:N"], false]], [{47 => :free}, [nil, 47, ["S:N"], false]], [{48 => :free}, [nil, 48, ["S:N"], false]], [{49 => :free}, [nil, 49, ["S:N"], false]], [{50 => :free}, [nil, 50, ["S:N"], false]], [{51 => :free}, [nil, 51, ["S:N"], false]], [{52 => :free}, [nil, 52, ["S:N"], false]], [{53 => :free}, [nil, 53, ["S:N"], false]], [{54 => :free}, [nil, 54, ["S:N"], false]], [{55 => :free}, [nil, 55, ["S:N"], false]], [{56 => :free}, [nil, 56, ["S:N"], false]], [{57 => :free}, [nil, 57, ["S:N"], false]], [{58 => :free}, [nil, 58, ["S:N"], false]], [{59 => :free}, [nil, 59, ["S:N"], false]], [{60 => :free}, [nil, 60, ["S:N"], false]], [{61 => :free}, [nil, 61, ["S:N"], false]], [{62 => :free}, [nil, 62, ["S:N"], false]], [{63 => :free}, [nil, 63, ["S:N"], false]], [{64 => :free}, [nil, 64, ["S:N"], false]], [{65 => :free}, [nil, 65, ["S:N"], false]], [{66 => :free}, [nil, 66, ["S:N"], false]], [{67 => :free}, [nil, 67, ["S:N"], false]], [{68 => :free}, [nil, 68, ["S:N"], false]], [{69 => :free}, [nil, 69, ["S:N"], false]], [{70 => :free}, [nil, 70, ["S:N"], false]], [{71 => :free}, [nil, 71, ["S:N"], false]], [{72 => :free}, [nil, 72, ["S:N"], false]], [{73 => :free}, [nil, 73, ["S:N"], false]], [{74 => :free}, [nil, 74, ["S:N"], false]], [{75 => :free}, [nil, 75, ["S:N"], false]], [{76 => :free}, [nil, 76, ["S:N"], false]], [{77 => :free}, [nil, 77, ["S:N"], false]], [{78 => :free}, [nil, 78, ["S:N"], false]], [{79 => :free}, [nil, 79, ["S:N"], false]], [{80 => :free}, [nil, 80, ["S:N"], false]]]},
  "stone"=>{0=>[], 1=>[], 2=>[], 3=>[], 4=>[], 5=>[], 6=>[], 7=>[], 8=>[], 9=>[], 10=>[], 11=>[], 12=>[], 13=>[], 14=>[], 15=>[], 16=>[], 17=>[], 18=>[], 19=>[], 20=>[], 21=>[], 22=>[], 23=>[], 24=>[], 25=>[], 26=>[], 27=>[], 28=>[], 29=>[], 30=>[], 31=>[], 32=>[], 33=>[], 34=>[], 35=>[], 36=>[], 37=>[], 38=>[], 39=>[], 40=>[], 41=>[], 42=>[], 43=>[], 44=>[], 45=>[], 46=>[], 47=>[], 48=>[], 49=>[], 50=>[], 51=>[], 52=>[], 53=>[], 54=>[], 55=>[], 56=>[], 57=>[], 58=>[], 59=>[], 60=>[], 61=>[], 62=>[], 63=>[], 64=>[], 65=>[], 66=>[], 67=>[], 68=>[], 69=>[], 70=>[], 71=>[], 72=>[], 73=>[], 74=>[], 75=>[], 76=>[], 77=>[], 78=>[], 79=>[], 80=>[], nil=>[]}
}.freeze

# ------------------------------------------------------------------------------

actual = begin
  Ugoki.pseudo_legal_moves(TRUNCATED_TABLEBASE, "S:N,8/9/9/9/9/9/9/9/9 0 -")
end

raise if actual.to_a != []

# ------------------------------------------------------------------------------

actual = begin
  Ugoki.pseudo_legal_moves(TRUNCATED_TABLEBASE, "S:N,8/9/9/9/9/9/9/9/9 0 S:N")
end

raise if actual.to_a != [[nil, 18, "S:N", nil], [nil, 19, "S:N", nil], [nil, 20, "S:N", nil], [nil, 21, "S:N", nil], [nil, 22, "S:N", nil], [nil, 23, "S:N", nil], [nil, 24, "S:N", nil], [nil, 25, "S:N", nil], [nil, 26, "S:N", nil], [nil, 27, "S:N", nil], [nil, 28, "S:N", nil], [nil, 29, "S:N", nil], [nil, 30, "S:N", nil], [nil, 31, "S:N", nil], [nil, 32, "S:N", nil], [nil, 33, "S:N", nil], [nil, 34, "S:N", nil], [nil, 35, "S:N", nil], [nil, 36, "S:N", nil], [nil, 37, "S:N", nil], [nil, 38, "S:N", nil], [nil, 39, "S:N", nil], [nil, 40, "S:N", nil], [nil, 41, "S:N", nil], [nil, 42, "S:N", nil], [nil, 43, "S:N", nil], [nil, 44, "S:N", nil], [nil, 45, "S:N", nil], [nil, 46, "S:N", nil], [nil, 47, "S:N", nil], [nil, 48, "S:N", nil], [nil, 49, "S:N", nil], [nil, 50, "S:N", nil], [nil, 51, "S:N", nil], [nil, 52, "S:N", nil], [nil, 53, "S:N", nil], [nil, 54, "S:N", nil], [nil, 55, "S:N", nil], [nil, 56, "S:N", nil], [nil, 57, "S:N", nil], [nil, 58, "S:N", nil], [nil, 59, "S:N", nil], [nil, 60, "S:N", nil], [nil, 61, "S:N", nil], [nil, 62, "S:N", nil], [nil, 63, "S:N", nil], [nil, 64, "S:N", nil], [nil, 65, "S:N", nil], [nil, 66, "S:N", nil], [nil, 67, "S:N", nil], [nil, 68, "S:N", nil], [nil, 69, "S:N", nil], [nil, 70, "S:N", nil], [nil, 71, "S:N", nil], [nil, 72, "S:N", nil], [nil, 73, "S:N", nil], [nil, 74, "S:N", nil], [nil, 75, "S:N", nil], [nil, 76, "S:N", nil], [nil, 77, "S:N", nil], [nil, 78, "S:N", nil], [nil, 79, "S:N", nil], [nil, 80, "S:N", nil]]

# ------------------------------------------------------------------------------

actual = begin
  Ugoki.pseudo_legal_moves(TRUNCATED_TABLEBASE, "9/9/9/5,S:N,3/9/9/9/9/9 0 -")
end

raise if actual.to_a != [[32, 13, "S:+N", nil], [32, 15, "S:+N", nil]]

# ------------------------------------------------------------------------------

actual = begin
  Ugoki.pseudo_legal_moves(TRUNCATED_TABLEBASE, "9/9/9/5,S:N,3/9/9/9/9/9 0 S:N")
end

raise if actual.to_a != [[32, 13, "S:+N", nil], [32, 15, "S:+N", nil], [nil, 18, "S:N", nil], [nil, 19, "S:N", nil], [nil, 20, "S:N", nil], [nil, 21, "S:N", nil], [nil, 22, "S:N", nil], [nil, 23, "S:N", nil], [nil, 24, "S:N", nil], [nil, 25, "S:N", nil], [nil, 26, "S:N", nil], [nil, 27, "S:N", nil], [nil, 28, "S:N", nil], [nil, 29, "S:N", nil], [nil, 30, "S:N", nil], [nil, 31, "S:N", nil], [nil, 33, "S:N", nil], [nil, 34, "S:N", nil], [nil, 35, "S:N", nil], [nil, 36, "S:N", nil], [nil, 37, "S:N", nil], [nil, 38, "S:N", nil], [nil, 39, "S:N", nil], [nil, 40, "S:N", nil], [nil, 41, "S:N", nil], [nil, 42, "S:N", nil], [nil, 43, "S:N", nil], [nil, 44, "S:N", nil], [nil, 45, "S:N", nil], [nil, 46, "S:N", nil], [nil, 47, "S:N", nil], [nil, 48, "S:N", nil], [nil, 49, "S:N", nil], [nil, 50, "S:N", nil], [nil, 51, "S:N", nil], [nil, 52, "S:N", nil], [nil, 53, "S:N", nil], [nil, 54, "S:N", nil], [nil, 55, "S:N", nil], [nil, 56, "S:N", nil], [nil, 57, "S:N", nil], [nil, 58, "S:N", nil], [nil, 59, "S:N", nil], [nil, 60, "S:N", nil], [nil, 61, "S:N", nil], [nil, 62, "S:N", nil], [nil, 63, "S:N", nil], [nil, 64, "S:N", nil], [nil, 65, "S:N", nil], [nil, 66, "S:N", nil], [nil, 67, "S:N", nil], [nil, 68, "S:N", nil], [nil, 69, "S:N", nil], [nil, 70, "S:N", nil], [nil, 71, "S:N", nil], [nil, 72, "S:N", nil], [nil, 73, "S:N", nil], [nil, 74, "S:N", nil], [nil, 75, "S:N", nil], [nil, 76, "S:N", nil], [nil, 77, "S:N", nil], [nil, 78, "S:N", nil], [nil, 79, "S:N", nil], [nil, 80, "S:N", nil]]

# ------------------------------------------------------------------------------

actual = begin
  Ugoki.pseudo_legal_moves(TRUNCATED_TABLEBASE, "9/9/9/9/6,S:N,2/9/9/9/9 0 -")
end

raise if actual.to_a != [[42, 23, "S:+N", nil], [42, 23, "S:N", nil], [42, 25, "S:+N", nil], [42, 25, "S:N", nil]]

# ------------------------------------------------------------------------------

actual = begin
  Ugoki.pseudo_legal_moves(TRUNCATED_TABLEBASE, "9/9/9/9/6,S:N,2/9/9/9/9 0 S:N")
end

raise if actual.to_a != [[42, 23, "S:+N", nil], [42, 23, "S:N", nil], [42, 25, "S:+N", nil], [42, 25, "S:N", nil], [nil, 18, "S:N", nil], [nil, 19, "S:N", nil], [nil, 20, "S:N", nil], [nil, 21, "S:N", nil], [nil, 22, "S:N", nil], [nil, 23, "S:N", nil], [nil, 24, "S:N", nil], [nil, 25, "S:N", nil], [nil, 26, "S:N", nil], [nil, 27, "S:N", nil], [nil, 28, "S:N", nil], [nil, 29, "S:N", nil], [nil, 30, "S:N", nil], [nil, 31, "S:N", nil], [nil, 32, "S:N", nil], [nil, 33, "S:N", nil], [nil, 34, "S:N", nil], [nil, 35, "S:N", nil], [nil, 36, "S:N", nil], [nil, 37, "S:N", nil], [nil, 38, "S:N", nil], [nil, 39, "S:N", nil], [nil, 40, "S:N", nil], [nil, 41, "S:N", nil], [nil, 43, "S:N", nil], [nil, 44, "S:N", nil], [nil, 45, "S:N", nil], [nil, 46, "S:N", nil], [nil, 47, "S:N", nil], [nil, 48, "S:N", nil], [nil, 49, "S:N", nil], [nil, 50, "S:N", nil], [nil, 51, "S:N", nil], [nil, 52, "S:N", nil], [nil, 53, "S:N", nil], [nil, 54, "S:N", nil], [nil, 55, "S:N", nil], [nil, 56, "S:N", nil], [nil, 57, "S:N", nil], [nil, 58, "S:N", nil], [nil, 59, "S:N", nil], [nil, 60, "S:N", nil], [nil, 61, "S:N", nil], [nil, 62, "S:N", nil], [nil, 63, "S:N", nil], [nil, 64, "S:N", nil], [nil, 65, "S:N", nil], [nil, 66, "S:N", nil], [nil, 67, "S:N", nil], [nil, 68, "S:N", nil], [nil, 69, "S:N", nil], [nil, 70, "S:N", nil], [nil, 71, "S:N", nil], [nil, 72, "S:N", nil], [nil, 73, "S:N", nil], [nil, 74, "S:N", nil], [nil, 75, "S:N", nil], [nil, 76, "S:N", nil], [nil, 77, "S:N", nil], [nil, 78, "S:N", nil], [nil, 79, "S:N", nil], [nil, 80, "S:N", nil]]

# ------------------------------------------------------------------------------

actual = begin
  Ugoki.pseudo_legal_moves(TRUNCATED_TABLEBASE, "9/9/5,stone,3/9/6,S:N,2/9/9/9/9 0 -")
end

raise if actual.to_a != [[42, 23, "S:+N", "STONE"], [42, 23, "S:N", "STONE"], [42, 25, "S:+N", nil], [42, 25, "S:N", nil]]

# ------------------------------------------------------------------------------

actual = begin
  Ugoki.pseudo_legal_moves(TRUNCATED_TABLEBASE, "9/9/5,stone,3/9/6,S:N,2/9/9/9/9 0 S:N")
end

raise if actual.to_a != [[42, 23, "S:+N", "STONE"], [42, 23, "S:N", "STONE"], [42, 25, "S:+N", nil], [42, 25, "S:N", nil], [nil, 18, "S:N", nil], [nil, 19, "S:N", nil], [nil, 20, "S:N", nil], [nil, 21, "S:N", nil], [nil, 22, "S:N", nil], [nil, 24, "S:N", nil], [nil, 25, "S:N", nil], [nil, 26, "S:N", nil], [nil, 27, "S:N", nil], [nil, 28, "S:N", nil], [nil, 29, "S:N", nil], [nil, 30, "S:N", nil], [nil, 31, "S:N", nil], [nil, 32, "S:N", nil], [nil, 33, "S:N", nil], [nil, 34, "S:N", nil], [nil, 35, "S:N", nil], [nil, 36, "S:N", nil], [nil, 37, "S:N", nil], [nil, 38, "S:N", nil], [nil, 39, "S:N", nil], [nil, 40, "S:N", nil], [nil, 41, "S:N", nil], [nil, 43, "S:N", nil], [nil, 44, "S:N", nil], [nil, 45, "S:N", nil], [nil, 46, "S:N", nil], [nil, 47, "S:N", nil], [nil, 48, "S:N", nil], [nil, 49, "S:N", nil], [nil, 50, "S:N", nil], [nil, 51, "S:N", nil], [nil, 52, "S:N", nil], [nil, 53, "S:N", nil], [nil, 54, "S:N", nil], [nil, 55, "S:N", nil], [nil, 56, "S:N", nil], [nil, 57, "S:N", nil], [nil, 58, "S:N", nil], [nil, 59, "S:N", nil], [nil, 60, "S:N", nil], [nil, 61, "S:N", nil], [nil, 62, "S:N", nil], [nil, 63, "S:N", nil], [nil, 64, "S:N", nil], [nil, 65, "S:N", nil], [nil, 66, "S:N", nil], [nil, 67, "S:N", nil], [nil, 68, "S:N", nil], [nil, 69, "S:N", nil], [nil, 70, "S:N", nil], [nil, 71, "S:N", nil], [nil, 72, "S:N", nil], [nil, 73, "S:N", nil], [nil, 74, "S:N", nil], [nil, 75, "S:N", nil], [nil, 76, "S:N", nil], [nil, 77, "S:N", nil], [nil, 78, "S:N", nil], [nil, 79, "S:N", nil], [nil, 80, "S:N", nil]]

# ------------------------------------------------------------------------------

actual = begin
  Ugoki.pseudo_legal_moves(TRUNCATED_TABLEBASE, "9/9/9/9/9/9/9/9/1,S:N,7 0 -")
end

raise if actual.to_a != [[73, 54, "S:N", nil], [73, 56, "S:N", nil]]

# ------------------------------------------------------------------------------

actual = begin
  Ugoki.pseudo_legal_moves(TRUNCATED_TABLEBASE, "9/9/9/9/9/9/9/9/1,S:N,7 0 S:N")
end

raise if actual.to_a != [[73, 54, "S:N", nil], [73, 56, "S:N", nil], [nil, 18, "S:N", nil], [nil, 19, "S:N", nil], [nil, 20, "S:N", nil], [nil, 21, "S:N", nil], [nil, 22, "S:N", nil], [nil, 23, "S:N", nil], [nil, 24, "S:N", nil], [nil, 25, "S:N", nil], [nil, 26, "S:N", nil], [nil, 27, "S:N", nil], [nil, 28, "S:N", nil], [nil, 29, "S:N", nil], [nil, 30, "S:N", nil], [nil, 31, "S:N", nil], [nil, 32, "S:N", nil], [nil, 33, "S:N", nil], [nil, 34, "S:N", nil], [nil, 35, "S:N", nil], [nil, 36, "S:N", nil], [nil, 37, "S:N", nil], [nil, 38, "S:N", nil], [nil, 39, "S:N", nil], [nil, 40, "S:N", nil], [nil, 41, "S:N", nil], [nil, 42, "S:N", nil], [nil, 43, "S:N", nil], [nil, 44, "S:N", nil], [nil, 45, "S:N", nil], [nil, 46, "S:N", nil], [nil, 47, "S:N", nil], [nil, 48, "S:N", nil], [nil, 49, "S:N", nil], [nil, 50, "S:N", nil], [nil, 51, "S:N", nil], [nil, 52, "S:N", nil], [nil, 53, "S:N", nil], [nil, 54, "S:N", nil], [nil, 55, "S:N", nil], [nil, 56, "S:N", nil], [nil, 57, "S:N", nil], [nil, 58, "S:N", nil], [nil, 59, "S:N", nil], [nil, 60, "S:N", nil], [nil, 61, "S:N", nil], [nil, 62, "S:N", nil], [nil, 63, "S:N", nil], [nil, 64, "S:N", nil], [nil, 65, "S:N", nil], [nil, 66, "S:N", nil], [nil, 67, "S:N", nil], [nil, 68, "S:N", nil], [nil, 69, "S:N", nil], [nil, 70, "S:N", nil], [nil, 71, "S:N", nil], [nil, 72, "S:N", nil], [nil, 74, "S:N", nil], [nil, 75, "S:N", nil], [nil, 76, "S:N", nil], [nil, 77, "S:N", nil], [nil, 78, "S:N", nil], [nil, 79, "S:N", nil], [nil, 80, "S:N", nil]]

# ------------------------------------------------------------------------------

actual = begin
  Ugoki.pseudo_legal_moves(TRUNCATED_TABLEBASE, "9/9/9/9/9/9/9/9/9 0 -")
end

raise if actual.to_a != []

# ------------------------------------------------------------------------------

actual = begin
  Ugoki.pseudo_legal_moves(TRUNCATED_TABLEBASE, "9/9/9/9/9/9/9/9/9 0 S:N")
end

raise if actual.to_a != [[nil, 18, "S:N", nil], [nil, 19, "S:N", nil], [nil, 20, "S:N", nil], [nil, 21, "S:N", nil], [nil, 22, "S:N", nil], [nil, 23, "S:N", nil], [nil, 24, "S:N", nil], [nil, 25, "S:N", nil], [nil, 26, "S:N", nil], [nil, 27, "S:N", nil], [nil, 28, "S:N", nil], [nil, 29, "S:N", nil], [nil, 30, "S:N", nil], [nil, 31, "S:N", nil], [nil, 32, "S:N", nil], [nil, 33, "S:N", nil], [nil, 34, "S:N", nil], [nil, 35, "S:N", nil], [nil, 36, "S:N", nil], [nil, 37, "S:N", nil], [nil, 38, "S:N", nil], [nil, 39, "S:N", nil], [nil, 40, "S:N", nil], [nil, 41, "S:N", nil], [nil, 42, "S:N", nil], [nil, 43, "S:N", nil], [nil, 44, "S:N", nil], [nil, 45, "S:N", nil], [nil, 46, "S:N", nil], [nil, 47, "S:N", nil], [nil, 48, "S:N", nil], [nil, 49, "S:N", nil], [nil, 50, "S:N", nil], [nil, 51, "S:N", nil], [nil, 52, "S:N", nil], [nil, 53, "S:N", nil], [nil, 54, "S:N", nil], [nil, 55, "S:N", nil], [nil, 56, "S:N", nil], [nil, 57, "S:N", nil], [nil, 58, "S:N", nil], [nil, 59, "S:N", nil], [nil, 60, "S:N", nil], [nil, 61, "S:N", nil], [nil, 62, "S:N", nil], [nil, 63, "S:N", nil], [nil, 64, "S:N", nil], [nil, 65, "S:N", nil], [nil, 66, "S:N", nil], [nil, 67, "S:N", nil], [nil, 68, "S:N", nil], [nil, 69, "S:N", nil], [nil, 70, "S:N", nil], [nil, 71, "S:N", nil], [nil, 72, "S:N", nil], [nil, 73, "S:N", nil], [nil, 74, "S:N", nil], [nil, 75, "S:N", nil], [nil, 76, "S:N", nil], [nil, 77, "S:N", nil], [nil, 78, "S:N", nil], [nil, 79, "S:N", nil], [nil, 80, "S:N", nil]]

# ------------------------------------------------------------------------------

actual = begin
  Ugoki.pseudo_legal_moves(TRUNCATED_TABLEBASE, "S:N,8/9/9/9/9/9/9/9/9 1 -")
end

raise if actual.to_a != []

# ------------------------------------------------------------------------------

actual = begin
  Ugoki.pseudo_legal_moves(TRUNCATED_TABLEBASE, "S:N,8/9/9/9/9/9/9/9/9 1 S:N")
end

raise if actual.to_a != []

# ------------------------------------------------------------------------------

actual = begin
  Ugoki.pseudo_legal_moves(TRUNCATED_TABLEBASE, "9/9/9/5,S:N,3/9/9/9/9/9 1 -")
end

raise if actual.to_a != []

# ------------------------------------------------------------------------------

actual = begin
  Ugoki.pseudo_legal_moves(TRUNCATED_TABLEBASE, "9/9/9/5,S:N,3/9/9/9/9/9 1 S:N")
end

raise if actual.to_a != []

# ------------------------------------------------------------------------------

actual = begin
  Ugoki.pseudo_legal_moves(TRUNCATED_TABLEBASE, "9/9/9/9/6,S:N,2/9/9/9/9 1 -")
end

raise if actual.to_a != []

# ------------------------------------------------------------------------------

actual = begin
  Ugoki.pseudo_legal_moves(TRUNCATED_TABLEBASE, "9/9/9/9/6,S:N,2/9/9/9/9 1 S:N")
end

raise if actual.to_a != []

# ------------------------------------------------------------------------------

actual = begin
  Ugoki.pseudo_legal_moves(TRUNCATED_TABLEBASE, "9/9/5,stone,3/9/6,S:N,2/9/9/9/9 1 -")
end

raise if actual.to_a != []

# ------------------------------------------------------------------------------

actual = begin
  Ugoki.pseudo_legal_moves(TRUNCATED_TABLEBASE, "9/9/5,stone,3/9/6,S:N,2/9/9/9/9 1 S:N")
end

raise if actual.to_a != []

# ------------------------------------------------------------------------------

actual = begin
  Ugoki.pseudo_legal_moves(TRUNCATED_TABLEBASE, "9/9/9/9/9/9/9/9/1,S:N,7 1 -")
end

raise if actual.to_a != []

# ------------------------------------------------------------------------------

actual = begin
  Ugoki.pseudo_legal_moves(TRUNCATED_TABLEBASE, "9/9/9/9/9/9/9/9/1,S:N,7 1 S:N")
end

raise if actual.to_a != []

# ------------------------------------------------------------------------------

actual = begin
  Ugoki.pseudo_legal_moves(TRUNCATED_TABLEBASE, "9/9/9/9/9/9/9/9/9 1 -")
end

raise if actual.to_a != []

# ------------------------------------------------------------------------------

actual = begin
  Ugoki.pseudo_legal_moves(TRUNCATED_TABLEBASE, "9/9/9/9/9/9/9/9/9 1 S:N")
end

raise if actual.to_a != []
