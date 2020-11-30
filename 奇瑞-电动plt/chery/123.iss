; 脚本由 Inno Setup 脚本向导 生成！
; 有关创建 Inno Setup 脚本文件的详细资料请查阅帮助文档！

#define MyAppName "奇瑞条形码打印"
#define MyAppVersion "1.5.0023"
#define MyAppPublisher "沈庆仁"
#define MyAppURL "http://www.baidu.com/"
#define MyAppExeName "Print_code.exe"

[Setup]
; 注: AppId的值为单独标识该应用程序。
; 不要为其他安装程序使用相同的AppId值。
; (生成新的GUID，点击 工具|在IDE中生成GUID。)
AppId={{28F53D6E-3E66-4271-9D69-7B74A68AEC0E}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DisableProgramGroupPage=yes
InfoBeforeFile=D:\sqr\delphi\奇瑞-电动plt\chery\安装说明.txt
OutputBaseFilename=setup
Compression=lzma
SolidCompression=yes

[Languages]
Name: "chinesesimp"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
Source: "D:\sqr\delphi\奇瑞-电动plt\chery\Print_code.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\sqr\delphi\奇瑞-电动plt\chery\Fnthex32.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\sqr\delphi\奇瑞-电动plt\chery\Print_code.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\sqr\delphi\奇瑞-电动plt\chery\安装说明.txt"; DestDir: "{app}"; Flags: ignoreversion
; 注意: 不要在任何共享系统文件上使用“Flags: ignoreversion”

[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

