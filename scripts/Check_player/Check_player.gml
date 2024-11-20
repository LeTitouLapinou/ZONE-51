// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Check_player()
{
	var _distance= distance_to_object(obj_alien);//distance entre joueur et nme
	
	var _aim_alien= mp_grid_path(room_grid,pursuit,x,y,obj_alien.x,obj_alien.y,choose(0,1));//creation du path
	
	//peut aller au joueur
	if _aim_alien
	{
		path_start(pursuit,3.5,path_action_stop,false);	
	}
	

}