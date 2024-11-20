/// @description Insert description here
// si le joueur se fait detecter(tempo)
if (obj_alien.invisible = false)
{
	instance_create_layer( _spawnnmex, _spawnnmey,"obstacles",obj_warden);
	instance_destroy(self);
}