; �ű��� Inno Setup �ű��� ���ɣ�
; �йش��� Inno Setup �ű��ļ�����ϸ��������İ����ĵ���

#define MyAppName "ATC��ǩ��ӡ"
#define MyAppVersion "1.5"
#define MyAppPublisher "������"
#define MyAppURL "http://www.example.com/"
#define MyAppExeName "atc��ǩ��ӡ.exe"

[Setup]
; ע: AppId��ֵΪ������ʶ��Ӧ�ó���
; ��ҪΪ������װ����ʹ����ͬ��AppIdֵ��
; (�����µ�GUID����� ����|��IDE������GUID��)
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
OutputDir=C:\Users\������\Desktop
OutputBaseFilename=setup-atc
Compression=lzma
SolidCompression=yes

[Languages]
Name: "chinesesimp"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
Source: "D:\sqr\delphi\ATC��ǩ��ӡ-usb\ATC��ǩ��ӡ\atc��ǩ��ӡ.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\sqr\delphi\ATC��ǩ��ӡ-usb\ATC��ǩ��ӡ\atc��ǩ��ӡ.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\sqr\delphi\ATC��ǩ��ӡ-usb\ATC��ǩ��ӡ\Fnthex32.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\sqr\delphi\ATC��ǩ��ӡ-usb\ATC��ǩ��ӡ\HELP.HLP"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\sqr\delphi\ATC��ǩ��ӡ-usb\ATC��ǩ��ӡ\TXM.mdb"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\sqr\delphi\ATC��ǩ��ӡ-usb\help\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; ע��: ��Ҫ���κι���ϵͳ�ļ���ʹ�á�Flags: ignoreversion��

[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

