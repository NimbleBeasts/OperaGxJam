/// @description Camera follow


half_view_height = camera_get_view_height(view_camera[0]) / 2;

camera_set_view_pos(view_camera[0], 0 , y - half_view_height);