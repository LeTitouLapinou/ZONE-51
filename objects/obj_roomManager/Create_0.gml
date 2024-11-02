/// @description Insert description here
// You can write your code in this editor

randomize() //randomisation de seed

roomWestEntrance = [rm_W_E_01, rm_W_E_02, rm_W_S_01];
roomEastEntrance = [];
roomNorthEntrance = [rm_N_S_01];
roomSouthEntrance = [];




fct_ChangeRoom = function()
{
	
	show_debug_message(roomWestEntrance)
	
	var nextRoomArray = fct_RoomSelection()
	
	var randomIndex = irandom_range(0, array_length(nextRoomArray)-1) //Generer index aleatoire
	
	show_debug_message(randomIndex)
	
	var targetRoom = nextRoomArray[randomIndex] //Aller chercher la room a l'index defini avant
	
	room_goto(targetRoom)
	
	array_delete(nextRoomArray, randomIndex, 1); //Supprimer la prochaine room du pool de rooms disponibles
		
}


fct_RoomSelection = function()
{
	switch (string_char_at(room_get_name(room), 6)) //Choisir la prochaine room en fonction de l'emplacement de la sortie de la room actuelle
	{
		case "E":
	        return roomWestEntrance;
	    break;

	    case "W":
	        return roomEastEntrance;
	    break;

	    case "S":
	        return roomNorthEntrance;
	    break;
		
	    case "N":
	        return roomSouthEntrance;
	    break;

	    //default:
	    //    draw_sprite(20, 20, spr_face_fainted);
	    //break;
	}
}
	

