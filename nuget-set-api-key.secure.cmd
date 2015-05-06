@echo off

:: nuget-set-api-key.secure.cmd

set NUGET=.nuget\nuget

set API_KEY="users NuGet api key"

::========================================================================================
:: 	nuget setapikey <API key> [options]
::
:: 	Specify the API key to save and an optional URL to the server that provided the API key.
:: 	
:: 	SetApiKey 
::		Command Options
:: 	Source	
::		Server URL where the API key is valid.
:: 	Help	
::		help
:: 	Verbosity	
:		Display this amount of details in the output: normal, quiet, (v2.5) detailed.
:: 	NonInteractive	
::		Do not prompt for user input or confirmations.
:: 	ConfigFile	
::		(v2.5) The NuGet configuation file. 
::		If not specified, file %AppData%\NuGet\NuGet.config is used as configuration file.

echo API_KEY = %API_KEY%
%NUGET% ^
	setapikey ^
	%API_KEY%
	
::========================================================================================

@IF %ERRORLEVEL% NEQ 0 PAUSE	
