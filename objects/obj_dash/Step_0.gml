/// @description affichage du dash
// You can write your code in this editor
vectx = obj_alien.vectorX 
vecty = obj_alien.vectorY
if(vecty !=0 && vectx!=0)
{
	vectx *= 0.6
	vecty *= 0.6
}
show_debug_message(vectx)
x = obj_alien.x-7 + vectx*50
y = obj_alien.y-7 + vecty*50