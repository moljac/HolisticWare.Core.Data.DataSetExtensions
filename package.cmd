@echo off

set NUGET=.nuget\nuget

del /q artifacts\*.*

:: this nuget wiil be unpacked and folder structure used to pack the last one
::	*Unpack.nuspec is for packaging structure to be copied to duplo-dep-nugets 

SET NUSPECS=^
	"src.HolisticWare\HolisticWare.Auth.nuspec" ^
	"src\Xamarin.Auth.Unpack.nuspec" ^
	"src\xamarin[]duplo-dep-nugets\nuspec\Xamarin.Auth.nuspec" ^

FOR %%n IN (%NUSPECS%) DO (
	echo "=========================================================================="
	echo Solution = %%n
	
	%NUGET% ^
		pack ^
		%%n ^
		-Symbols ^
		-OutputDirectory artifacts ^
		-Build ^
		-IncludeReferencedProjects ^
		-NonInteractive
)	
	
echo ========================================================================
dir artifacts\
echo ========================================================================
	
@IF %ERRORLEVEL% NEQ 0 PAUSE	

