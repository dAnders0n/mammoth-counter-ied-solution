/*
 *  Author: 
 *  	D.Anderson
 *  Description:
 *  	Mammoth System Initialization
 *  Parametr(s):
 *  	0: _vehicle - <OBJECT> - Vehicle to install Mammoth System
 */

if (isServer) then
{
	private ["_vehicle", "_pole", "_device", "_vehPos"];

	_vehicle = param[0];
	_vehPos = getPos _vehicle;

	/* create & attachTo device 01 - pole */
	_pole = "Land_TorqueWrench_01_F" createVehicle _vehPos;
	_pole attachTo [_vehicle, [0, 2.1, -1.25]];
	_pole setDir 270;
	/******************************************************************/

	/* create & attachTo device 01 - detector */
	_device = "Land_BatteryPack_01_closed_black_F" createVehicle _vehPos;
	_device attachTo [_vehicle, [0, 2.8, -1.35]];
	/******************************************************************/
	
	[_device] execVM "scripts\fn_activateSystem.sqf";
	
};
/******************************************************************/