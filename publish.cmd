@echo off

set NUGET=.nuget\nuget

::=============================================================================
:: 	NOTE: do not push this to public repos!
:: 	sample snippet for the .gitignore
	**/*.secure*
	**/*.secret*	
::----------------------------------------------------------------------------
::	following script sets only few environment variables
::	API_KEY
::
set FILE=nuget-set-api-key.secure.cmd
SET NUGETS=^
	"artifacts\" ^
	
	
If exist %FILE% (
	call %FILE%
)

echo API_KEY = %API_KEY%


FOR %%n IN (%NUGETS%) DO (

	echo "=========================================================================="
	echo Solution = %%n
	%NUGET% ^
		push ^
		%%n
)

@IF %ERRORLEVEL% NEQ 0 PAUSE	
