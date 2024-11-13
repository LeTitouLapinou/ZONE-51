/// @description Insert description here
// si le joueur se fait detecter(tempo)
if (obj_alien.invisible = false)
{
	instance_create_layer(obj_door_entrance.x,obj_door_entrance.y,"Alien_and_Doors",obj_warden);
	instance_destroy(self);
}