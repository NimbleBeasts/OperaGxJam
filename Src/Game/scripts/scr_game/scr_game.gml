


function subtract_player_lives(damage) {
	global.player_lives -= damage;
	show_debug_message("Life = " + string(global.player_lives));
}

function create_tiles() {
	var _map_id = layer_tilemap_get_id("TileGround");

	
	tile_map = ds_map_create();
	
	if (file_exists("test.json")) {
		var data = "";
		var json = file_text_open_read("test.json");
		while(!file_text_eof(json))
		{
		   data += file_text_read_string(json);
		   file_text_readln(json);
		}
		file_text_close(json);

		tile_map = json_decode(data);
	}
	
	
	var _array_keys = ds_map_keys_to_array(tile_map);
	var _array_values = ds_map_values_to_array(tile_map);
	
	for (var i = 0; i < array_length(_array_keys); i++) {
		_array_keys[i] = split_string(_array_keys[i], ",");
		_array_keys[i][0] = real(_array_keys[i][0]);
		_array_keys[i][1] = real(_array_keys[i][1]);

		tilemap_set(_map_id, _array_values[i] , _array_keys[i][0], _array_keys[i][1]); 
		instance_create_layer(_array_keys[i][0]*32, _array_keys[i][1]*32, "GroundObjects", obj_groundObject);
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