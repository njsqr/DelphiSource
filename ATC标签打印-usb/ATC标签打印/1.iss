; 脚本由 Inno Setup 脚本向导 生成！
; 有关创建 Inno Setup 脚本文件的详细资料请查阅帮助文档！

#define MyAppName "ATC标签打印"
#define MyAppVersion "1.5"
#define MyAppPublisher "沈庆仁"
#define MyAppURL "http://www.example.com/"
#define MyAppExeName "atc标签打印.exe"

[Setup]
; 注: AppId的值为单独标识该应用程序。
; 不要为其他安装程序使用相同的AppId值。
; (生成新的GUID，点击 工具|在IDE中生成GUID。)
AppId={{37EA9F42-CAEB-4C93-85D6-0D6E4FAD818E}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DisableProgramGroupPage=yes
OutputDir=C:\Users\申请人\Desktop
OutputBaseFilename=setup-atc
Compression=lzma
SolidCompression=yes

[Languages]
Name: "chinesesimp"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
Source: "D:\sqr\delphi\ATC标签打印-usb\ATC标签打印\atc标签打印.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\sqr\delphi\ATC标签打印-usb\ATC标签打印\atc标签打印.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\sqr\delphi\ATC标签打印-usb\ATC标签打印\Fnthex32.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\sqr\delphi\ATC标签打印-usb\ATC标签打印\HELP.HLP"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\sqr\delphi\ATC标签打印-usb\ATC标签打印\TXM.mdb"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\sqr\delphi\ATC标签打印-usb\help\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; 注意: 不要在任何共享系统文件上使用“Flags: ignoreversion”

[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

