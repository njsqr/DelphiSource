; �ű��� Inno Setup �ű��� ���ɣ�
; �йش��� Inno Setup �ű��ļ�����ϸ��������İ����ĵ���

#define MyAppName "�����������ӡ"
#define MyAppVersion "1.5.002"
#define MyAppPublisher "������"
#define MyAppURL "http://www.baidu.com/"
#define MyAppExeName "Print_code.exe"

[Setup]
; ע: AppId��ֵΪ������ʶ��Ӧ�ó���
; ��ҪΪ������װ����ʹ����ͬ��AppIdֵ��
; (�����µ�GUID����� ����|��IDE������GUID��)
AppId={{F66DC013-2498-4551-8214-E122E0660D78}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DisableProgramGroupPage=yes
InfoBeforeFile=D:\sqr\delphi\����-�綯usb\chery\��װ˵��.txt
InfoAfterFile=D:\sqr\delphi\����-�綯usb\chery\��ӡ������.rtf
OutputDir=C:\Users\������\Desktop
OutputBaseFilename=setup-chery
Compression=lzma
SolidCompression=yes

[Languages]
Name: "chinesesimp"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
Source: "D:\sqr\delphi\����-�綯usb\chery\Print_code.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\sqr\delphi\����-�綯usb\chery\Fnthex32.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\sqr\delphi\����-�綯usb\chery\Print_code.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\sqr\delphi\����-�綯usb\chery\��װ˵��.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\sqr\delphi\����-�綯usb\chery\��ӡ������.rtf"; DestDir: "{app}"; Flags: ignoreversion
; ע��: ��Ҫ���κι���ϵͳ�ļ���ʹ�á�Flags: ignoreversion��

[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

