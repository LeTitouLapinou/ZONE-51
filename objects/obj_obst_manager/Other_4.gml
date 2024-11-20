/// @description Insert description here




var _lay_id= layer_get_id("Tiles_Walls");// get le nom du layer
var _room_id = layer_tilemap_get_id(_lay_id);

var taillecellule = 16; // determiner la taille des cell
var wh = room_width/taillecellule;
var ht = room_height/taillecellule;


room_grid = mp_grid_create(0,0,wh,ht,taillecellule,taillecellule)//creation de la grid

for(var i=0; i<wh; i++)//déterminer endroits des walls
{
	for(var j = 0; j<ht; j++)
	{
		if(tilemap_get_at_pixel(_room_id,i*taillecellule,j*taillecellule)>0)// si qqch est trouver on ajoute au grid interdit
		{
			mp_grid_add_cell(room_grid,i,j)
			
		}
	}
}
