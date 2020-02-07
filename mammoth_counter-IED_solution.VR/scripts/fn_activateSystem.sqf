/*
 *  Author: 
 *  	D.Anderson
 *  Description:
 *  	Activation of Mammoth System
 *  Parametr(s):
 *  	0: _device - <OBJECT> - detector object
 */

private ["_device", "_array"];

_device = param [0];

_array = 
[
	"ACE_IEDLandBig_Range_ammo",
	"ACE_IEDLandSmall_Range_ammo",
	"ACE_IEDUrbanBig_Range_ammo",
	"ACE_IEDUrbanSmall_Range_ammo"
];

/* Activation Action */
[
	_device, 
	[
		"<t color='#FF0000'>Activate Mammoth System</t>", 
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			
			private _device = (_this select 3 select 0);
			private _array  = (_this select 3 select 1);
			
			hint "Mammoth System: \nACTIVATED.";
			_device removeAction _actionId;
			[_device, "Simulation_Restart"] remoteExec ["say3D"];	
			
			sleep 1;
			hint "";
			[_device] execVM "scripts\fn_deactivateSystem.sqf";
			
			/* turn ON detection */
			[
				"Mammoth_Detector", 
				"onEachFrame", 
				{
					/* code to execute */
					private ["_device", "_array", "_objects"];
					
					_device = _this select 0;
					_array  = _this select 1;
					
					_objects = nearestObjects [_device, [], 20, false];

					/* lookinf for ieds class names */
					{
						for "_i" from 0 to (count _array) do 
						{
							if(_x isKindOf (_array select _i)) exitWith { _x setDamage 1;};
						};
					}forEach _objects;
				}, 
				[_device, _array] /* arguments */
			] call BIS_fnc_addStackedEventHandler;
		},
		[_device,_array], /* arguments */
		1.5, 
		true, 
		true, 
		"",
		"true", // _target, _this, _originalTarget
		3,
		false,
		"",
		""
	]	
]remoteExec ["addAction"];
/******************************************************************/