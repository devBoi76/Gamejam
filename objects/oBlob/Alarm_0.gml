/// @description

var stay_still = random_range(0, 1) > ((oNoteSpawner.player_confidence)/30)

if (fight_over) {
	if not won_fight {
		image_index = defeat_frame
		image_yscale = lerp(image_yscale, 0.5, 0.5)
		alarm[0] = 10
	}
} else if (won_fight or stay_still) {
	image_index = still_frames[still_step]
	still_step = (still_step + 1) % array_length(still_frames)
	alarm[0] = 20
} else {
	image_index = interesting_frames[round(random_range(0, array_length(interesting_frames)-1))]
	alarm[0] = random_range(60 * 0.5, 60 * 1)
}
