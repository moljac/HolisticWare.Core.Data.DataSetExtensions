@echo off

set VSVARS="C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\Tools\vsvars32.bat"
::set VSDEVCMD="C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\Tools\VsDevCmd.bat"
set MSBUILD=C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe

:: %comspec% /k ""C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\Tools\VsDevCmd.bat""

call %VSVARS% 
::call %VSDEVCMD% 

set SOLUTIONS=^
	"HolisticWare.System.Data.DataSetExtensions.sln" ^
	
.nuget\nuget.exe ^
		restore HolisticWare.System.Data.DataSetExtensions.sln

	.nuget\nuget.exe restore ..\%%s

	
pause		
FOR %%s IN (%SOLUTIONS%) DO (
	echo "=========================================================================="
	echo Solution = %%s
	
	.nuget\nuget.exe restore ..\%%s
		
	.nuget\nuget.exe ^
		update ^
		..\%%s
	
	pause
	::@IF %ERRORLEVEL% NEQ 0 PAUSE	
	echo "--------------------------------------------------------------------"
		
	msbuild ^
		/m:8 ^
		/p:Configuration=Debug ^
		%%s

	msbuild ^
		/m:8 ^
		/p:Configuration=Release ^
		%%s
	
	%MSBUILD% ^
		/m:8 ^
		/p:Configuration=Debug ^
		%%s
		
	%MSBUILD% ^
		/m:8 ^
		/p:Configuration=Release ^
		%%s
)

@IF %ERRORLEVEL% NEQ 0 PAUSE	
