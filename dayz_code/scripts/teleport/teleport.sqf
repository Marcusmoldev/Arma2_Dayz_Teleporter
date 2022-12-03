////////////////////////////////////////////////////////////
// Written by Macintosh @ Joint Forces Gaming - 2022.12.03//
////////////////////////////////////////////////////////////
private ["_ownerPUID","_soundArr","_obj","_pos","_dir"];

scopeName "main";
local _allPortals = nearestObjects [player, ["Vendmachine1_DZ"], 20000];  


local _portalUsed = nearestObjects [player, ["Vendmachine1_DZ"], 6];  
local _isPlayersPortal = _portalUsed select 0 getVariable ["ownerPUID","0"];

local _playerPUID = getPlayerUID player;
local _countAllPortals = (count _allPortals) -1;
local _portalsVicinity = (count _portalUsed);
local _counter = 0;

	
 _soundArr = [
	["tel1"],
	["tel2"]
];
	

if(_isPlayersPortal != _playerPUID) then
{
	"Error : This is not your portal!" call dayz_rollingMessages;
	breakTo "main";
} else { 
	if(_portalsVicinity > 1) then
	{
		"Error : You can't have more than two portals!" call dayz_rollingMessages;
		breakTo "main";
	} else {
			for "_n" from _countAllPortals to 0 step -1 do 
			{
				_ownerPUID = _allPortals select _n getVariable ["ownerPUID","0"];
				if(_ownerPUID == _playerPUID) then
				{
					_counter = _counter + 1;
					
					if (_counter > 2) then {
					"Error : You can not have more than two portals!" call dayz_rollingMessages;
					breakTo "main";
					};
				};
			};
			
			_allPortals set [0, "IGNORE"]; //we dont want to teleport to the portal being used
			
			for "_i" from _countAllPortals to 0 step -1 do 
			{
				_ownerPUID = _allPortals select _i getVariable ["ownerPUID","0"];
				if(_ownerPUID == _playerPUID) then
				{

					_obj = _allPortals select _i;
					_pos = getPosATL _obj;
					_dir = getDir _obj;
					
					
					if (count _pos < 1) then {"Unable to teleport here." call dayz_rollingMessages;}
					else {
					
					[nil, (vehicle player), rSAY, [(_soundArr call BIS_fnc_selectRandom) select 0, 100]] call RE;
					
					"You are being teleported .." call dayz_rollingMessages;
					disableUserInput true; disableUserInput true;
					
					player switchMove "AcinPercMrunSnonWnonDf_agony"; // knockout animation
					
					local _effect = ppEffectCreate ["colorCorrections", 1000];
					local _ppGrain = ppEffectCreate ["filmGrain", 2005];
					
					_ppGrain ppEffectEnable true;
					_ppGrain ppEffectCommit 1;
					
					_effect ppEffectEnable true;
					_effect ppEffectAdjust [1, 0.4, 0, [9, 9, 9, 9], [9, 9, 9, 0], [5, 6, 5, 9]];
					_effect ppEffectCommit 2;
					sleep 5;
					titleText["","BLACK OUT",3];
					systemChat "You are being teleported, please wait 30 seconds ..";
					sleep 8;
					(vehicle player) setPosATL [_pos select 0, _pos select 1, _pos select 2];
					sleep 21;
					ppEffectDestroy _effect;
					titleText["","BLACK IN",8];
					
					player SWITCHMOVE "AmovPpneMstpSnonWnonDnon_healed"; //getting back up anim
					disableUserInput false; disableUserInput false;
							
					breakTo "main";
				};
			};
		};
	};
};
