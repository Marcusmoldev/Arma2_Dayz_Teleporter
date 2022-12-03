///////////////////////////////////////////////////////////////////////////
// Written by MarcusMolDev (Macintosh) @ Joint Forces Gaming - 2022.12.03//
///////////////////////////////////////////////////////////////////////////

Installation of teleporter script. This script is only client side.
------------------------------------------------------------------------------------------------------------------------------------------------------------------
Step 1.
Unpack your Mission PBO and place the script and the audio files in the same folder structure which I have specified.
------------------------------------------------------------------------------------------------------------------------------------------------------------------
Step 2.

Go to your fn_selfActions.sqf which should be located at \dayz_code\compile\fn_selfActions.sqf

Search for this piece of code:

player removeAction s_player_manageDoor;
		s_player_manageDoor = -1;
	};

Paste this within quotes below:


		if (_typeOfCursorTarget == "Vendmachine1_DZ") then {	
	 if (s_player_Teleport < 0) then {                 	 
		 s_player_Teleport = player addaction [("<t color=""#B40404"">" + ("Teleport") +"</t>"), "dayz_code\scripts\teleport\teleport.sqf",_cursorTarget, 0, false, true, "", ""];
		  };				   
		  } else {
		   player removeAction s_player_Teleport;
		   s_player_Teleport = -1;
		   };	
	if (_typeOfCursorTarget != "Vendmachine1_DZ") then {
	 player removeAction s_player_Teleport;
	 s_player_Teleport = -1;
	};


(IF YOU DONT HAVE A FN_SELFACTIONS)
If you dont have a fn_selfActions.sqf , you can simply use the one I provided in the files. 
In the case that you dont have a fn_selfActions, you probably dont have a compiles either, so copy that one over as well.

------------------------------------------------------------------------------------------------------------------------------------------------------------------
Step 3. (this step can be ignored if you copied over the fn_selfActions I provide)

In fn_selfActions , search for : 
player removeAction s_player_plot_boundary;

Above it, paste this:
	player removeAction s_player_Teleport;
s_player_Teleport = -1;


Now you can close and save fn_selfActions.
------------------------------------------------------------------------------------------------------------------------------------------------------------------
Step 4.
If you have your own compiles, open your compiles.sqf and paste this line of code the same way its done in the file I provided.

fnc_usec_selfActions = compile preprocessFileLineNumbers "dayz_code\compile\fn_selfActions.sqf";


If you dont have a custom compiles you will have to add a line of code to your init.sqf

Search for this line :
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";

paste this line below :
call compile preprocessFileLineNumbers "dayz_code\init\compiles.sqf";
------------------------------------------------------------------------------------------------------------------------------------------------------------------
Step 5.

In the Variables.sqf
paste this line the same way it is done in the file i provided: s_player_Teleport = -1;

If you dont have a custom variables, use the one I provided.

If you dont have a custom variables you will have to add a line of code to your init.sqf

Search for this line :
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";

paste this line below :
call compile preprocessFileLineNumbers "dayz_code\init\variables.sqf";
------------------------------------------------------------------------------------------------------------------------------------------------------------------

Step 6.
Add the "vendmachine1_kit" class to your traders as a buyable item, or lootspawn.

Here is the trader category on my server :

class Category_924 {
	class vendmachine1_kit {
		type = "trade_items";
		buy[] = {50000,"ItemGoldBar"};
		sell[] = {50000,"ItemGoldBar"};
	};
};

As this is a script tutorial I will not focus on Trader Editing. Refer to this video by JasonTM instead.
https://youtu.be/Dy0TP8Pi3nk





BATTLEEYE FILTERS 
- I have not provided any battleeye filters for this script. I suggest you check following links for filters:
- Tutorial for filter adding by JasonTM : https://youtu.be/0STj1jMs0aA
- Eraser1's filter tool : https://github.com/eraser1/BE_AEG 
- Guide to BE filters : https://opendayz.net/threads/a-guide-to-battleye-filters.21066/
