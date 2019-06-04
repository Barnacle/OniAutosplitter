state("Oni", "EN")
{
	byte3 level_data : 0x1EB6F0; // 5EB6F0
	byte8 anim : 0x1EB700; // 5EB700
	string20 save_point: 0x1ECC10; // 5ECC10 - "    Save Point 1"
	
	bool preload_state : 0x1EB84C; // 5EB84C
	bool endcheck : 0x1EC0C4; // 5EC0C4
	
	//int checpoint : 0x1ECC54;
}

state("Oni", "RU")
{
	byte3 level_data : 0x1E70B8; // 5E70B8
	byte8 anim : 0x1E70C4; // 5E70C4
	string20 save_point: 0x1E8580; // 5E8580
	
	bool preload_state : 0x1E71F8; // 5E71F8
	bool endcheck : 0x1E7A78; // 005E7A78
}

init
{
	vars.split = 0;
	vars.resetlock = false;
	
	vars.LEVEL0_data = new byte[3];
	vars.LEVEL1_data = new byte[3];
	vars.LEVEL2_data = new byte[3];
	vars.LEVEL3_data = new byte[3];
	vars.LEVEL4_data = new byte[3];
	vars.LEVEL5_data = new byte[3];
	vars.LEVEL6_data = new byte[3];
	vars.LEVEL7_data = new byte[3];
	vars.LEVEL8_data = new byte[3];
	vars.LEVEL9_data = new byte[3];
	vars.LEVEL10_data = new byte[3];
	vars.LEVEL11_data = new byte[3];
	vars.LEVEL12_data = new byte[3];
	vars.LEVEL13_data = new byte[3];
	vars.LEVEL14_data = new byte[3];
	
	// Detects current game version.
	if (modules.First().ModuleMemorySize == 3067904)
	{
		print("RU");
		version = "RU";
		
		vars.LEVEL0_data[0] = 116; vars.LEVEL0_data[1] = 42; vars.LEVEL0_data[2] = 100;
		vars.LEVEL1_data[0] = 116; vars.LEVEL1_data[1] = 42; vars.LEVEL1_data[2] = 100;
		vars.LEVEL2_data[0] = 104; vars.LEVEL2_data[1] = 175; vars.LEVEL2_data[2] = 99;
		vars.LEVEL3_data[0] = 80; vars.LEVEL3_data[1] = 175; vars.LEVEL3_data[2] = 99;
		vars.LEVEL4_data[0] = 28; vars.LEVEL4_data[1] = 176; vars.LEVEL4_data[2] = 99;
		vars.LEVEL5_data[0] = 220; vars.LEVEL5_data[1] = 176; vars.LEVEL5_data[2] = 99;
		vars.LEVEL6_data[0] = 168; vars.LEVEL6_data[1] = 26; vars.LEVEL6_data[2] = 100;
		vars.LEVEL7_data[0] = 136; vars.LEVEL7_data[1] = 251; vars.LEVEL7_data[2] = 99;
		vars.LEVEL8_data[0] = 60; vars.LEVEL8_data[1] = 177; vars.LEVEL8_data[2] = 99;
		vars.LEVEL9_data[0] = 64; vars.LEVEL9_data[1] = 176; vars.LEVEL9_data[2] = 99;
		vars.LEVEL10_data[0] = 28; vars.LEVEL10_data[1] = 176; vars.LEVEL10_data[2] = 99;
		vars.LEVEL11_data[0] = 64; vars.LEVEL11_data[1] = 185; vars.LEVEL11_data[2] = 99;
		vars.LEVEL12_data[0] = 132; vars.LEVEL12_data[1] = 186; vars.LEVEL12_data[2] = 99;
		vars.LEVEL13_data[0] = 180; vars.LEVEL13_data[1] = 177; vars.LEVEL13_data[2] = 99;
		vars.LEVEL14_data[0] = 64; vars.LEVEL14_data[1] = 179; vars.LEVEL14_data[2] = 99;
	}
	else
	{
		// print(modules.First().ModuleMemorySize.ToString()); // 3092480
		print("EN");
		version = "EN";
		
		vars.LEVEL0_data[0] = 52; vars.LEVEL0_data[1] = 113; vars.LEVEL0_data[2] = 100;
		vars.LEVEL1_data[0] = 52; vars.LEVEL1_data[1] = 113; vars.LEVEL1_data[2] = 100;
		vars.LEVEL2_data[0] = 40; vars.LEVEL2_data[1] = 246; vars.LEVEL2_data[2] = 99;
		vars.LEVEL3_data[0] = 16; vars.LEVEL3_data[1] = 246; vars.LEVEL3_data[2] = 99;
		vars.LEVEL4_data[0] = 220; vars.LEVEL4_data[1] = 246; vars.LEVEL4_data[2] = 99;
		vars.LEVEL5_data[0] = 156; vars.LEVEL5_data[1] = 247; vars.LEVEL5_data[2] = 99;
		vars.LEVEL6_data[0] = 104; vars.LEVEL6_data[1] = 97; vars.LEVEL6_data[2] = 100;
		vars.LEVEL7_data[0] = 72; vars.LEVEL7_data[1] = 66; vars.LEVEL7_data[2] = 100;
		vars.LEVEL8_data[0] = 252; vars.LEVEL8_data[1] = 247; vars.LEVEL8_data[2] = 99;
		vars.LEVEL9_data[0] = 0; vars.LEVEL9_data[1] = 247; vars.LEVEL9_data[2] = 99;
		vars.LEVEL10_data[0] = 220; vars.LEVEL10_data[1] = 246; vars.LEVEL10_data[2] = 99;
		vars.LEVEL11_data[0] = 0; vars.LEVEL11_data[1] = 0; vars.LEVEL11_data[2] = 100;
		vars.LEVEL12_data[0] = 68; vars.LEVEL12_data[1] = 1; vars.LEVEL12_data[2] = 100;
		vars.LEVEL13_data[0] = 116; vars.LEVEL13_data[1] = 248; vars.LEVEL13_data[2] = 99;
		vars.LEVEL14_data[0] = 0; vars.LEVEL14_data[1] = 250; vars.LEVEL14_data[2] = 99;
	}
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
		
		
	//print(vars.LEVEL0_data[0] + " " + vars.LEVEL0_data[1] + " " + vars.LEVEL0_data[2]);
	
	//print(current.anim[5].ToString());
	//print(current.save_point);
	//print(vars.split.ToString());
	//print(vars.split.ToString() + " " + current.level_data[0].ToString() + " " + current.level_data[1].ToString() + " " + current.level_data[2].ToString() + " " + current.save_point);
	//print(current.anim[0].ToString() + " " + current.anim[1].ToString() + " " + current.anim[2].ToString() + " " + current.anim[3].ToString() + " " + current.anim[4].ToString() + " " + current.anim[5].ToString()
	// + " " + current.anim[6].ToString() + " " + current.anim[7].ToString());
}

start
{
	if (current.level_data[0] == vars.LEVEL0_data[0]
		&& current.level_data[1] == vars.LEVEL0_data[1]
		&& current.level_data[2] == vars.LEVEL0_data[2]
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
	if (vars.split == 0 && current.level_data[0] == vars.LEVEL1_data[0]
		&& current.level_data[1] == vars.LEVEL1_data[1]
		&& current.level_data[2] == vars.LEVEL1_data[2]) // Level 1
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
	else if (vars.split == 1 && current.level_data[0] == vars.LEVEL2_data[0]
		&& current.level_data[1] == vars.LEVEL2_data[1]
		&& current.level_data[2] == vars.LEVEL2_data[2]) // Level 2
	{
		vars.split++;
		return true;
	}
	else if (vars.split == 2 && current.level_data[0] == vars.LEVEL3_data[0]
		&& current.level_data[1] == vars.LEVEL3_data[1]
		&& current.level_data[2] == vars.LEVEL3_data[2]) // Level 3
	{
		vars.split++;
		return true;
	}
	else if (vars.split == 3 && current.level_data[0] == vars.LEVEL4_data[0]
		&& current.level_data[1] == vars.LEVEL4_data[1]
		&& current.level_data[2] == vars.LEVEL4_data[2]) // Level 4
	{
		vars.split++;
		return true;
	}
	else if (vars.split == 4 && current.level_data[0] == vars.LEVEL5_data[0]
		&& current.level_data[1] == vars.LEVEL5_data[1]
		&& current.level_data[2] == vars.LEVEL5_data[2]) // Level 5
	{
		vars.split++;
		return true;
	}
	else if (vars.split == 5 && current.level_data[0] == vars.LEVEL6_data[0]
		&& current.level_data[1] == vars.LEVEL6_data[1]
		&& current.level_data[2] == vars.LEVEL6_data[2]) // Level 6
	{
		vars.split++;
		return true;
	}
	else if (vars.split == 6 && current.level_data[0] == vars.LEVEL7_data[0]
		&& current.level_data[1] == vars.LEVEL7_data[1]
		&& current.level_data[2] == vars.LEVEL7_data[2]) // Level 7
	{
		vars.split++;
		return true;
	}
	else if (vars.split == 7 && current.level_data[0] == vars.LEVEL8_data[0]
		&& current.level_data[1] == vars.LEVEL8_data[1]
		&& current.level_data[2] == vars.LEVEL8_data[2]) // Level 8
	{
		vars.split++;
		return true;
	}
	else if (vars.split == 8 && current.level_data[0] == vars.LEVEL9_data[0]
		&& current.level_data[1] == vars.LEVEL9_data[1]
		&& current.level_data[2] == vars.LEVEL9_data[2]) // Level 9
	{
		vars.split++;
		return true;
	}
	else if (vars.split == 9 && current.level_data[0] == vars.LEVEL10_data[0]
		&& current.level_data[1] == vars.LEVEL10_data[1]
		&& current.level_data[2] == vars.LEVEL10_data[2]) // Level 10
	{
		vars.split++;
		return true;
	}
	else if (vars.split == 10 && current.level_data[0] == vars.LEVEL11_data[0]
		&& current.level_data[1] == vars.LEVEL11_data[1]
		&& current.level_data[2] == vars.LEVEL11_data[2]) // Level 11
	{
		vars.split++;
		return true;
	}
	else if (vars.split == 11 && current.level_data[0] == vars.LEVEL12_data[0]
		&& current.level_data[1] == vars.LEVEL12_data[1]
		&& current.level_data[2] == vars.LEVEL12_data[2]) // Level 12
	{
		vars.split++;
		return true;
	}
	else if (vars.split == 12 && current.level_data[0] == vars.LEVEL13_data[0]
		&& current.level_data[1] == vars.LEVEL13_data[1]
		&& current.level_data[2] == vars.LEVEL13_data[2]) // Level 13
	{
		vars.split++;
		return true;
	}
	else if (vars.split == 13 && current.level_data[0] == vars.LEVEL14_data[0]
		&& current.level_data[1] == vars.LEVEL14_data[1]
		&& current.level_data[2] == vars.LEVEL14_data[2]) // Level 14
	{
		vars.split++;
		return true;
	}
	else if (vars.split == 14 && current.level_data[0] == vars.LEVEL14_data[0]
		&& current.level_data[1] == vars.LEVEL14_data[1]
		&& current.level_data[2] == vars.LEVEL14_data[2]
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
		if (current.level_data[0] == vars.LEVEL0_data[0]
			&& current.level_data[1] == vars.LEVEL0_data[1]
			&& current.level_data[2] == vars.LEVEL0_data[2]
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