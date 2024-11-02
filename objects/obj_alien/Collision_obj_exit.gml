/// @description Insert description here
// You can write your code in this editor


if (string_char_at(room_get_name(room), 6) == "E")
{
	show_debug_message("yipee")

	while(targetRoom == room)
	{
		targetRoom = obj_roomManager.roomWestEntrance[irandom_range(0, array_length(obj_roomManager.roomWestEntrance)-1)]
	}
	
	room_goto(targetRoom)
}