state("Oni")
{
	byte3 level_data : 0x1EB6F0;
	byte8 anim : 0x1EB700;
	string20 save_point: 0x1ECC10;
	bool preload_state : 0x1EB84C;
		
	bool endcheck : 0x1EC0C4;
	
	int checpoint : 0x1ECC54;
}

init
{
	vars.split = 0;
	vars.resetlock = false;
}

update
{
	//if(current.checpoint == 0 && current.checpoint != old.checpoint)
	//{
		//print("HELLO");
		//print(current.save_point);
	//}
	
	if(current.preload_state == false)
		vars.resetlock = false;
		
	//print(current.anim[5].ToString());
	//print(current.save_point);
	//print(vars.split.ToString());
	//print(vars.split.ToString() + " " + current.level_data[0].ToString() + " " + current.level_data[1].ToString() + " " + current.level_data[2].ToString() + " " + current.save_point);
	//print(current.anim[0].ToString() + " " + current.anim[1].ToString() + " " + current.anim[2].ToString() + " " + current.anim[3].ToString() + " " + current.anim[4].ToString() + " " + current.anim[5].ToString()
	// + " " + current.anim[6].ToString() + " " + current.anim[7].ToString());
}

start
{
	if (current.level_data[0] == 52
		&& current.level_data[1] == 113
		&& current.level_data[2] == 100
		&& current.save_point == "")
	{
		if (current.anim[0] == 130
			&& current.anim[1] == 125
			&& current.anim[2] == 140
			&& current.anim[3] == 196
			&& current.anim[4] == 165
			&& current.anim[5] == 15
			&& current.anim[6] == 169
			&& current.anim[7] == 195)
		{
			vars.split = 0;
			print("START");
			return true;
		}
	}
}

split
{
	if (vars.split == 0 && current.level_data[0] == 52
		&& current.level_data[1] == 113
		&& current.level_data[2] == 100) // Level 1
	{
		if (current.endcheck == true)
		{
			if (current.anim[0] != 130
				|| current.anim[1] != 125
				|| current.anim[2] != 140
				|| current.anim[3] != 196
				|| current.anim[4] != 165
				|| current.anim[5] != 15
				|| current.anim[6] != 169
				|| current.anim[7] != 195)
			{
				vars.split++;
				return true;
			}
		}
	}
	else if (vars.split == 1 && current.level_data[0] == 40
		&& current.level_data[1] == 246
		&& current.level_data[2] == 99) // Level 2
	{
		vars.split++;
		return true;
	}
	else if (vars.split == 2 && current.level_data[0] == 16
		&& current.level_data[1] == 246
		&& current.level_data[2] == 99) // Level 3
	{
		vars.split++;
		return true;
	}
	else if (vars.split == 3 && current.level_data[0] == 220
		&& current.level_data[1] == 246
		&& current.level_data[2] == 99) // Level 4
	{
		vars.split++;
		return true;
	}
	else if (vars.split == 4 && current.level_data[0] == 156
		&& current.level_data[1] == 247
		&& current.level_data[2] == 99) // Level 5
	{
		vars.split++;
		return true;
	}
	else if (vars.split == 5 && current.level_data[0] == 104
		&& current.level_data[1] == 97
		&& current.level_data[2] == 100) // Level 6
	{
		vars.split++;
		return true;
	}
	else if (vars.split == 6 && current.level_data[0] == 72
		&& current.level_data[1] == 66
		&& current.level_data[2] == 100) // Level 7
	{
		vars.split++;
		return true;
	}
	else if (vars.split == 7 && current.level_data[0] == 252
		&& current.level_data[1] == 247
		&& current.level_data[2] == 99) // Level 8
	{
		vars.split++;
		return true;
	}
	else if (vars.split == 8 && current.level_data[0] == 0
		&& current.level_data[1] == 247
		&& current.level_data[2] == 99) // Level 9
	{
		vars.split++;
		return true;
	}
	else if (vars.split == 9 && current.level_data[0] == 220
		&& current.level_data[1] == 246
		&& current.level_data[2] == 99) // Level 10
	{
		vars.split++;
		return true;
	}
	else if (vars.split == 10 && current.level_data[0] == 0
		&& current.level_data[1] == 0
		&& current.level_data[2] == 100) // Level 11
	{
		vars.split++;
		return true;
	}
	else if (vars.split == 11 && current.level_data[0] == 68
		&& current.level_data[1] == 1
		&& current.level_data[2] == 100) // Level 12
	{
		vars.split++;
		return true;
	}
	else if (vars.split == 12 && current.level_data[0] == 116
		&& current.level_data[1] == 248
		&& current.level_data[2] == 99) // Level 13
	{
		vars.split++;
		return true;
	}
	else if (vars.split == 13 && current.level_data[0] == 0
		&& current.level_data[1] == 250
		&& current.level_data[2] == 99) // Level 14
	{
		vars.split++;
		return true;
	}
	else if (vars.split == 14 && current.level_data[0] == 0
		&& current.level_data[1] == 250
		&& current.level_data[2] == 99
		&& current.save_point.Contains("4")) // END
	{
		if (current.endcheck == true)
		{
			print("THE END");
			vars.split++;
			return true;
		}
	}
}

reset
{
	if(vars.resetlock == false)
	{
		if (current.level_data[0] == 52
			&& current.level_data[1] == 113
			&& current.level_data[2] == 100
			&& current.preload_state == true && current.save_point == "")
		{
			if (current.anim[0] == 130
				&& current.anim[1] == 125
				&& current.anim[2] == 140
				&& current.anim[3] == 196
				&& current.anim[4] == 165
				&& current.anim[5] == 15
				&& current.anim[6] == 169
				&& current.anim[7] == 195)
			{
				vars.resetlock = true;
				vars.split = 0;
				print("RESET");
				return true;
			}
		}
	}
}