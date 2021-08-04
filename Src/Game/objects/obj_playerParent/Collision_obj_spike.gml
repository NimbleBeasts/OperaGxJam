subtract_player_lives(1, player_num);
knockback(point_direction(x, y, x + hsp + 2, y + vsp), 4);
audio_play_sound(snd_trap_spike, 11, false);
