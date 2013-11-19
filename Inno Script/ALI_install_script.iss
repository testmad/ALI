; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define InstallerTitle "ALI - Another LiteStep Installer"
#define InstallerWindowTitle "ALI"
#define InstallerVersion "0.0.1"
#define InstallerPublisher "testmad"
#define BaseAppName "LiteStep"
#define BaseAppVersion "0.25.0a-13.08.07"
#define BaseAppPublisher "The LSDev Team"
#define BaseAppURL "http://www.LSDev.org/"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{21F723DC-FFB6-4C7F-BF27-892C1A67CF04}
AppName={#BaseAppName}
AppVersion={#BaseAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#BaseAppPublisher}
AppPublisherURL={#BaseAppURL}
;AppSupportURL={#MyAppURL}
;AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#BaseAppName}
DefaultGroupName={#BaseAppName}
AllowNoIcons=yes
LicenseFile=C:\Users\testmad\Desktop\ALI\Installer\LS\license.txt
OutputDir=C:\Users\testmad\Desktop\ALI\bin
OutputBaseFilename=LiteStep_{#BaseAppVersion}_Setup
SetupIconFile=C:\Users\testmad\Desktop\ALI\Installer\ALI_ls.ico
Compression=lzma
SolidCompression=yes
WizardImageFile=C:\Users\testmad\Desktop\ALI\Installer\Untitled-1.bmp
WizardSmallImageFile=C:\Users\testmad\Desktop\ALI\Installer\237_11744584849_1533_n.bmp
UninstallDisplayIcon={app}\ALI\ALI_ls.ico
ChangesAssociations=True

#include <idp.iss>
MinVersion=0,6.0

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Icons]
Name: "{group}\{cm:UninstallProgram,{#BaseAppName}}"; Filename: "{uninstallexe}"; IconFilename: "{app}\ALI\ALI_ls.ico"; IconIndex: 0
Name: "{userdesktop}\Set Explorer as Shell"; Filename: "{app}\utilities\wxlua.exe"; IconFilename: "{app}\ALI\SetShellExplorer.ico"; IconIndex: 0; Parameters: "LOSS.lua explorer"
Name: "{userdesktop}\Set LiteStep as Shell"; Filename: "{app}\utilities\wxlua.exe"; IconFilename: "{app}\ALI\SetShellLS.ico"; IconIndex: 0; Parameters: "LOSS.lua litestep"

[Messages]
SetupAppTitle={#InstallerTitle}
SetupWindowTitle={#InstallerWindowTitle} {#InstallerVersion}

[Dirs]
Name: "{app}\ALI"
Name: "{app}\Modules"
Name: "{app}\NLM"
Name: "{app}\Profiles"
Name: "{app}\utilities"
Name: "{app}\Profiles\{username}"
Name: "{app}\Profiles\{username}\personal"
Name: "{app}\Profiles\{username}\personal\jkey"
Name: "{app}\Profiles\{username}\personal\lsxcommand"
Name: "{app}\Profiles\{username}\personal\rainlendar"
Name: "{app}\Profiles\{username}\personal\rainlendar\languages"
Name: "{app}\Profiles\{username}\themes"
Name: "{app}\Profiles\{username}\themes\InstDef"

[Files]
Source: "C:\Users\testmad\Desktop\ALI\Installer\LS\changes.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\LS\hook.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\LS\libpng13.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\LS\license.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\LS\litestep.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\LS\lsapi.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\LS\manual.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\LS\step.rc"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\LS\xPaintClass-1.0.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\LS\zlib1.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\NLM\doc2.css"; DestDir: "{app}\NLM"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\NLM\install.txt"; DestDir: "{app}\NLM"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\NLM\msvcr71.dll"; DestDir: "{app}\NLM"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\NLM\NetLoadModule.ini"; DestDir: "{app}\NLM"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\NLM\NetLoadModule2.dll"; DestDir: "{app}\NLM"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\NLM\NetLoadModule2.html"; DestDir: "{app}\NLM"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\utilities\LOEC.lua"; DestDir: "{app}\utilities"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\utilities\LOSS.lua"; DestDir: "{app}\utilities"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\utilities\lua5.1.dll"; DestDir: "{app}\utilities"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\utilities\lua51.dll"; DestDir: "{app}\utilities"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\utilities\rcparser.lua"; DestDir: "{app}\utilities"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\utilities\SLI-ModuleManager.exe"; DestDir: "{app}\utilities"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\utilities\SLI-OnlineModuleList.old"; DestDir: "{app}\utilities"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\utilities\SLI-OnlineModuleList.txt"; DestDir: "{app}\utilities"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\utilities\SLI-ThemeManager.exe"; DestDir: "{app}\utilities"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\utilities\SLI-ThemeManager.txt"; DestDir: "{app}\utilities"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\utilities\winreg.dll"; DestDir: "{app}\utilities"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\utilities\wxlua.exe"; DestDir: "{app}\utilities"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\personal\evars.rc"; DestDir: "{app}\Profiles\{username}\personal"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\personal\hotkey.rc"; DestDir: "{app}\Profiles\{username}\personal"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\personal\personal.rc"; DestDir: "{app}\Profiles\{username}\personal"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\personal\popup.rc"; DestDir: "{app}\Profiles\{username}\personal"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\personal\jkey\vk104.txt"; DestDir: "{app}\Profiles\{username}\personal\jkey"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\personal\lsxcommand\engines.list"; DestDir: "{app}\Profiles\{username}\personal\lsxcommand"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\personal\lsxcommand\history.ini"; DestDir: "{app}\Profiles\{username}\personal\lsxcommand"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\personal\lsxcommand\old.engines.list"; DestDir: "{app}\Profiles\{username}\personal\lsxcommand"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\personal\rainlendar\rainlendar.ini"; DestDir: "{app}\Profiles\{username}\personal\rainlendar"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\personal\rainlendar\languages\English.example"; DestDir: "{app}\Profiles\{username}\personal\rainlendar\languages"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\personal\rainlendar\languages\French.ini"; DestDir: "{app}\Profiles\{username}\personal\rainlendar\languages"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\personal\rainlendar\languages\German.ini"; DestDir: "{app}\Profiles\{username}\personal\rainlendar\languages"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\personal\rainlendar\languages\Russian.ini"; DestDir: "{app}\Profiles\{username}\personal\rainlendar\languages"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\themes\themeselect.rc"; DestDir: "{app}\Profiles\{username}\themes"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\themes\themeslist.rc"; DestDir: "{app}\Profiles\{username}\themes"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\themes\InstDef\theme.rc"; DestDir: "{app}\Profiles\{username}\themes\InstDef"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\ALI\gsz.ico"; DestDir: "{app}\ALI"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\ALI\GSZBox.ico"; DestDir: "{app}\ALI"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\ALI\GSZBox2.ico"; DestDir: "{app}\ALI"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\ALI\GSZDoc.ico"; DestDir: "{app}\ALI"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\ALI\GSZDoc2.ico"; DestDir: "{app}\ALI"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\ALI\LSBox.ico"; DestDir: "{app}\ALI"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\ALI\LSDoc.ico"; DestDir: "{app}\ALI"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\ALI\lsz.ico"; DestDir: "{app}\ALI"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\ALI\LSZBox.ico"; DestDir: "{app}\ALI"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\ALI\LSZDoc.ico"; DestDir: "{app}\ALI"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\ALI\rc.ico"; DestDir: "{app}\ALI"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\ALI\rc2.ico"; DestDir: "{app}\ALI"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\ALI\RCBox.ico"; DestDir: "{app}\ALI"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\ALI\RCDoc.ico"; DestDir: "{app}\ALI"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\ALI\SetShellExplorer.ico"; DestDir: "{app}\ALI"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\ALI\SetShellLS.ico"; DestDir: "{app}\ALI"; Flags: ignoreversion
Source: "C:\Users\testmad\Desktop\ALI\Installer\ALI_ls.ico"; DestDir: "{app}\ALI"; Flags: ignoreversion

[Registry]
Root: "HKLM"; Subkey: "Software\LOSI"; ValueType: none; Flags: uninsdeletekey
Root: "HKLM"; Subkey: "Software\LOSI\Installer"; ValueType: string; ValueName: "LitestepDir"; ValueData: "{app}"; Flags: uninsdeletekeyifempty uninsdeletevalue
Root: "HKCU"; Subkey: "Software\Litestep"; ValueType: none; Flags: uninsdeletekey
Root: "HKCU"; Subkey: "Software\Litestep\SLI"; ValueType: none; Flags: uninsdeletekey
Root: "HKCU"; Subkey: "Software\Litestep\SLI\ModuleManager"; ValueType: none; Flags: uninsdeletekey
Root: "HKCU"; Subkey: "Software\Litestep\SLI\ModuleManager"; ValueType: string; ValueName: "Site1"; ValueData: "LS-Universe#;#http://www.modules.ls-universe.info/modules"; Flags: uninsdeletevalue
Root: "HKCU"; Subkey: "Software\Litestep\SLI\ModuleManager"; ValueType: string; ValueName: "Site2"; ValueData: "NBI-Studio#;#http://www.modules.nbi-studio.com"; Flags: uninsdeletevalue
Root: "HKCU"; Subkey: "Software\Litestep\SLI\ModuleManager"; ValueType: string; ValueName: "Site3"; ValueData: "ShellFront#;#http://www.modules.shellfront.org"; Flags: uninsdeletevalue
Root: "HKCU"; Subkey: "Software\Litestep\SLI\ThemeManager"; ValueType: none; Flags: uninsdeletekey
Root: "HKCU"; Subkey: "Software\Litestep\SLI\ThemeManager"; ValueType: string; ValueName: "LitestepDir"; ValueData: "{app}\"; Flags: uninsdeletevalue
Root: "HKCU"; Subkey: "Software\Litestep\SLI\ThemeManager"; ValueType: dword; ValueName: "SecurityTimeout"; ValueData: "2"; Flags: uninsdeletevalue
Root: "HKCU"; Subkey: "Software\Litestep\SLI\ThemeManager"; ValueType: string; ValueName: "ThemesDir"; ValueData: "{app}\Profiles\{username}\themes\"; Flags: uninsdeletevalue

[Code]
var
  VCwarnPage: TOutputMsgWizardPage;
  
procedure InitializeWizard;
begin
  VCwarnPage:=CreateOutputMsgPage(wpWelcome,
  'LiteStep Requirements', 'Please read the following important information before continuing.',
  'LiteStep requires the following files:' + #13#13#13#13 + '          Microsoft Visual C++ 2005 Runtimes' + #13 + '          Microsoft Visual C++ 2005 SP1 Runtimes' + #13 + '          Microsoft Visual C++ 2010 SP1 Runtimes' + #13 + '          Micorsoft Visual C++ 2012 Runtimes' + #13 + '          Microsoft Visual C++ 2013 Runtimes' + #13#13#13#13 + 'They will be downloaded and installed automatically.');
              
//  idpAddFile('http://download.microsoft.com/download/d/3/4/d342efa6-3266-4157-a2ec-5174867be706/vcredist_x86.exe', ExpandConstant('{tmp}\vcredist_2005_x86.exe'));
//  idpAddFile('http://download.microsoft.com/download/e/1/c/e1c773de-73ba-494a-a5ba-f24906ecf088/vcredist_x86.exe', ExpandConstant('{tmp}\vcredist_2005sp1_x86.exe'));

//  idpAddFile('http://download.microsoft.com/download/1/1/1/1116b75a-9ec3-481a-a3c8-1777b5381140/vcredist_x86.exe', ExpandConstant('{tmp}\vcredist_2008_x86.exe'));
//  idpAddFile('http://download.microsoft.com/download/d/d/9/dd9a82d0-52ef-40db-8dab-795376989c03/vcredist_x86.exe', ExpandConstant('{tmp}\vcredist_2008sp1_x86.exe'));
  
//  idpAddFile('http://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe', ExpandConstant('{tmp}\vcredist_2010sp1_x86.exe'));
//  idpAddFile('http://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU4/vcredist_x86.exe', ExpandConstant('{tmp}\vcredist_2012_x86.exe'));
//  idpAddFile('http://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x86.exe', ExpandConstant('{tmp}\vcredist_2013_x86.exe'));
//  idpSetOption('AllowContinue',  '0');
//  idpSetOption('DetailsVisible', '1');
//  idpSetOption('DetailsButton',  '0');
//  idpSetOption('RetryButton',    '1');
//  idpDownloadAfter(wpReady);

end;

[Run]
;Filename: "{tmp}\vcredist_2005_x86.exe"; Parameters: "/q:a /c:""VCREDI~1.EXE /q:a /c:""""msiexec /i vcredist.msi /qn"""" """; Flags: runascurrentuser waituntilterminated; StatusMsg: "Installing Microsoft Visual C++ 2005 Runtimes..."
;Filename: "{tmp}\vcredist_2005sp1_x86.exe"; Parameters: "/q:a /c:""VCREDI~3.EXE /q:a /c:""""msiexec /i vcredist.msi /qn"""" """; Flags: runascurrentuser waituntilterminated; StatusMsg: "Installing Microsoft Visual C++ 2005 SP1 Runtimes..."

;Filename: "{tmp}\vcredist_2008_x86.exe"; Parameters: "/q"; Flags: runascurrentuser waituntilterminated; StatusMsg: "Installing Microsoft Visual C++ 2008 Runtimes..."
;Filename: "{tmp}\vcredist_2008sp1_x86.exe"; Parameters: "/q"; Flags: runascurrentuser waituntilterminated; StatusMsg: "Installing Microsoft Visual C++ 2008 SP1 Runtimes..."

;Filename: "{tmp}\vcredist_2010sp1_x86.exe"; Parameters: "/q"; Flags: runascurrentuser waituntilterminated; StatusMsg: "Installing Microsoft Visual C++ 2010 SP1 Runtimes..."
;Filename: "{tmp}\vcredist_2012_x86.exe"; Parameters: "/q"; Flags: runascurrentuser waituntilterminated; StatusMsg: "Installing Microsoft Visual C++ 2012 Runtimes..."
;Filename: "{tmp}\vcredist_2013_x86.exe"; Parameters: "/q"; Flags: runascurrentuser waituntilterminated; StatusMsg: "Installing Microsoft Visual C++ 2013 Runtimes..."

Filename: "{app}\changes.txt"; Flags: postinstall shellexec skipifsilent; Description: "View readme.txt"
Filename: "{app}\utilities\wxlua.exe"; Parameters: "LOSS.lua litestep"; Flags: postinstall skipifsilent runascurrentuser; Description: "Set LiteStep as Shell."
