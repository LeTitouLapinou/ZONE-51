/// @description Insert description here
#macro TS	16
// calcul taille grid
var _ht = ceil(room_height/TS);
var _wh = ceil(room_width/TS);

//motion planning
room_grid = mp_grid_create(0,0,_wh,_ht,TS,TS);

//ajout des collision
mp_grid_add_instances(room_grid, obj_fence ,true);