SMODS.Joker({
	key = "honest",
	atlas = "jokers",
	pos = {x=9,y=12},
	rarity = 1,
	cost = 4,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	config = {extra = {mult = 12, hand_type = 'Pair'}},
	loc_vars = function(self, info_queue, card)
        if card and Ortalab.config.artist_credits then info_queue[#info_queue+1] = {generate_ui = ortalab_artist_tooltip, key = 'crimson'} end
		return {vars = {card.ability.extra.mult, localize(card.ability.extra.hand_type, 'poker_hands')}}
	end,
	calculate = function(self, card, context)
        if context.joker_main and not next(context.poker_hands[card.ability.extra.hand_type]) then
            return {
                mult = card.ability.extra.mult, 
            }
        end
    end
})