/// @description Insert description here
// You can write your code in this editor


if !b_bleu //si laser rouge, degat si le joueur n'est pas invisible ou mort
{
	if (!obj_alien.invisible && !obj_alien.dead)
	{
		obj_alien.fct_Damage();
	}
}

else //si laser bleu, degat si le joueur est invisible mort
{
	if (obj_alien.invisible && !obj_alien.dead)
		{
			obj_alien.fct_Damage();
		}
}
