/// @description Insert description here
// You can write your code in this editor



//Le Room Manager est persistant 

randomize() //randomisation de seed

nb_rooms_seen = 0;

//On stocke les rooms dans des tableaux, selon de quel cote est l'entree
roomWestEntrance = [rm_W_E_01, rm_W_S_01, rm_W_N_01, rm_W_W_01];
roomEastEntrance = [rm_E_E_01, rm_E_E_02, rm_E_S_01, rm_E_S_02, rm_E_N_01, rm_E_N_02, rm_E_W_01];
roomNorthEntrance = [rm_N_E_01, rm_N_S_01, rm_N_S_02, rm_N_N_01];
roomSouthEntrance = [rm_S_E_01, rm_S_S_01, rm_S_N_01, rm_S_W_01];


//Les rooms finales, avec des entrées différentes. Elles sont appelées quand le jouer a exploré assez de rooms (variable max_rooms)
endWestEntrance = [rm_W_Exit];
endEastEntrance = [rm_E_Exit];
endNorthEntrance = [rm_N_Exit];
endSouthEntrance = [rm_S_Exit];



fct_ChangeRoom = function()
{
	
	var nextRoomArray = fct_RoomSelection() 
	
	var randomIndex = irandom_range(0, array_length(nextRoomArray)-1) //Generer index aleatoire
		
	var targetRoom = nextRoomArray[randomIndex] //Aller chercher la room a l'index defini avant
	
	room_goto(targetRoom)
	
	nb_rooms_seen += 1; //Combien de rooms le joueur a traversé
	
	array_delete(nextRoomArray, randomIndex, 1); //Supprimer la prochaine room du pool de rooms disponibles
		
	room_instance_add(targetRoom, 0, 0, obj_backgroundFilter); //On ajoute le filtre pour le background dans la prochaine room
}


fct_RoomSelection = function()
{
	switch (string_char_at(room_get_name(room), 6)) //Choisir la prochaine room en fonction de l'emplacement de la sortie de la room actuelle
	{
		case "E":
	        if (array_length(roomWestEntrance)=0) || (nb_rooms_seen == max_rooms)
				return endWestEntrance;
			else return roomWestEntrance;
	    break;

	    case "W":
	        if (array_length(roomEastEntrance)=0) || (nb_rooms_seen == max_rooms)
				return endEastEntrance;
			else return roomEastEntrance;
	    break;

	    case "S":
	        if (array_length(roomNorthEntrance)=0) || (nb_rooms_seen == max_rooms)
				return endNorthEntrance;
			else return roomNorthEntrance;
	    break;
		
	    case "N":
	        if (array_length(roomSouthEntrance)=0) || (nb_rooms_seen == max_rooms)
				return endSouthEntrance;
			else return roomSouthEntrance;
	    break;

	   
	}
}
	

audio_play_sound(snd_ambient_music,10,3,5) //musique de fond
