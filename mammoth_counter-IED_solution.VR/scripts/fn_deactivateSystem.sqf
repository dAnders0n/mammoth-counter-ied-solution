/*
 *  Author: 
 *  	D.Anderson
 *  Description:
 *  	Deactivation of Mammoth System
 *  Parametr(s):
 *  	0: _device - <OBJECT> - detector object
 */

private ["_device"];

_device = param [0];

/* Activation Action */
[
	_device, 
	[
		"<t color='#FF0000'>Deactivate Mammoth System</t>", 
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			
			private _device = (_this select 3 select 0);
			
			hint "Mammoth System: \nDEACTIVATED.";
			_device removeAction _actionId;
			[_device] execVM "scripts\fn_activateSystem.sqf";
			
			/* turn OFF detection */
			["Mammoth_Detector", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
			[_device, "Simulation_Fatal"] remoteExec ["say3D"];
			
			sleep 1;
			hint "";
		},
		[_device], /* arguments */
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