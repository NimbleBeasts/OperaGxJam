
function subtract_player_lives(damage, player_num) {
	if player_num == 1 global.player1_lives -= damage; else global.player2_lives -= damage;
}

function add_player_score(score, player_num) {
	if player_num == 1 global.player1_score += score; else global.player2_score += score;

}

function set_camera_pos_correctly() {
	half_view_height = camera_get_view_height(view_camera[0]) / 2;
	avg_y = (global.player1.y + global.player2.y) / 2;
	camera_set_view_pos(view_camera[0], 0 , avg_y - half_view_height);
}

// needs commenting, will do if i feel it
function create_tiles() {
	randomize();
	var _level_index = irandom_range(1, global.num_tile_levels);
	tiles = [];
	tiles[0] = obj_tileLeftEnd;
	tiles[1] = obj_tileGround;
	tiles[2] = obj_tileRightEnd;
	tiles[3] = obj_tileWall;

	tile_map = ds_map_create();
	
	if (file_exists("levels.json")) {
		var data = "";
		var json = file_text_open_read("levels.json");
		while(!file_text_eof(json))
		{
		   data += file_text_read_string(json);
		   file_text_readln(json);
		}
		file_text_close(json);

		tile_map = json_decode(data);
		tile_map = tile_map[? string(_level_index)];
	}
	
	
	var _array_keys = ds_map_keys_to_array(tile_map);
	var _array_values = ds_map_values_to_array(tile_map);
	var _list = ds_list_create();
	
	for (var i = 0; i < array_length(_array_keys); i++) {
		_array_keys[i] = split_string(_array_keys[i], ",");
		_array_keys[i][0] = real(_array_keys[i][0]);
		_array_keys[i][1] = real(_array_keys[i][1]);
	
		var _tile_create_y_pos = _array_keys[i][1]*32 + (room_height * global.num_created_tiles);
	
		 var _tile_inst = instance_create_layer(_array_keys[i][0]*32, _tile_create_y_pos, "Tiles",  tiles[_array_values[i]]);
		 ds_list_add(_list, _tile_inst);
	}
	
	global.num_created_tiles += 1;
	ds_map_add(global.tiles_to_delete, global.num_created_tiles, _list);

	var _player_detect_y = room_height * (global.num_created_tiles + 1);
	var _player_detect = instance_create_layer(0, _player_detect_y, "PlayerDetect", obj_playerDetect);
	_player_detect.image_xscale = 10;
	_player_detect.image_yscale = 0.5;
}

function delete_tiles() {
	if not ds_map_exists(global.tiles_to_delete, global.num_created_tiles - 2) return;
	
	
	var _list = global.tiles_to_delete[? (global.num_created_tiles - 2) ];
	for (i = 0; i < ds_list_size(_list); i++) {
		instance_destroy(_list[| i]);
		ds_map_delete(global.tiles_to_delete, global.num_created_tiles - 2);
	}
}

// from https://www.reddit.com/r/gamemaker/comments/3zxota/splitting_strings/ by u/chaomoonx with minor edits
function split_string(string, delimiter) {
	var msg = string; //string to split
	var splitBy = delimiter; //string to split the first string by
	var slot = 0;
	var splits; //array to hold all splits
	var str2 = ""; //var to hold the current split we're working on building

	var i;
	for (i = 1; i < (string_length(msg)+1); i++) {
	    var currStr = string_copy(msg, i, 1);
	    if (currStr == splitBy) {
	        splits[slot] = str2; //add this split to the array of all splits
	        slot++;
	        str2 = "";
	    } else {
	        str2 = str2 + currStr;
	        splits[slot] = str2;
	    }
	}
	
	return splits;

}