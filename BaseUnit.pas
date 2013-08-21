unit BaseUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TMainForm = class(TForm)
    CreationDate: TDateTimePicker;
    OpenDialog: TOpenDialog;
    FileNameField: TEdit;
    OpenFileButton: TButton;
    Label1: TLabel;
    CreationTime: TDateTimePicker;
    Label2: TLabel;
    ChangeDate: TDateTimePicker;
    ChangeTime: TDateTimePicker;
    SaveButton: TButton;
    Label3: TLabel;
    LastAccessDate: TDateTimePicker;
    LastAccessTime: TDateTimePicker;
    procedure OpenFileButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FileNameFieldDblClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure GetFileInfo(const FileName: String; out CreationTime,
  ModificationTime, LastAccesTime: TDateTime);
var
  FileAttributeData: TWin32FileAttributeData;
  SystemTime: TSystemTime;
begin
  ZeroMemory(@FileAttributeData, SizeOf(TWin32FileAttributeData));
  GetFileAttributesEx(PAnsiChar(FileName), GetFileExInfoStandard, @FileAttributeData);

  FileTimeToLocalFileTime(FileAttributeData.ftCreationTime, FileAttributeData.ftCreationTime);
  FileTimeToSystemTime(FileAttributeData.ftCreationTime, SystemTime);
  CreationTime := SystemTimeToDateTime(SystemTime);

  FileTimeToLocalFileTime(FileAttributeData.ftLastWriteTime, FileAttributeData.ftLastWriteTime);
  FileTimeToSystemTime(FileAttributeData.ftLastWriteTime, SystemTime);
  ModificationTime := SystemTimeToDateTime(SystemTime);

  FileTimeToLocalFileTime(FileAttributeData.ftLastAccessTime, FileAttributeData.ftLastAccessTime);
  FileTimeToSystemTime(FileAttributeData.ftLastAccessTime, SystemTime);
  LastAccesTime := SystemTimeToDateTime(SystemTime);
end;

function GetFileTime(DateTime: TDateTime): TFileTime;
var
  SystemTime: TSystemTime;
  LocalFileTime, FileTime: TFileTime;
begin
   DateTimeToSystemTime(DateTime, SystemTime);
   SystemTimeToFileTime(SystemTime, LocalFileTime);
   LocalFileTimeToFileTime(LocalFileTime, FileTime);

   Result := FileTime;
end;

procedure SetFileInfo(const FileName: String; CreationTime, ModificationTime, LastAccesTime: TDateTime);
var
  FileHandle: integer;
  CreationFileTime, ModificationFileTime, LastAccessFileTime: TFileTime;
begin
  FileHandle := CreateFile(PChar(FileName), GENERIC_WRITE, FILE_SHARE_READ, nil,
     OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);

   try
     CreationFileTime := GetFileTime(CreationTime);
     ModificationFileTime := GetFileTime(ModificationTime);
     LastAccessFileTime := GetFileTime(LastAccesTime);

     SetFileTime(FileHandle, @CreationFileTime, @LastAccessFileTime, @ModificationFileTime);
   finally
     CloseHandle(FileHandle);
   end;
end;

procedure TMainForm.OpenFileButtonClick(Sender: TObject);
var creationDateTime, modificationDateTime, lastAccessDateTime: TDateTime;
begin
  if (OpenDialog.Execute) then begin
    FileNameField.Text := OpenDialog.FileName;

    ChangeDate.Enabled := true;
    ChangeTime.Enabled := true;
    CreationDate.Enabled := true;
    CreationTime.Enabled := true;
    LastAccessDate.Enabled := true;
    LastAccessTime.Enabled := true;
    SaveButton.Enabled := true;

    ChangeDate.Format := 'dd MMMM yyyy';
    ChangeTime.Format := 'HH:mm:ss';
    CreationDate.Format := 'dd MMMM yyyy';
    CreationTime.Format := 'HH:mm:ss';
    LastAccessDate.Format := 'dd MMMM yyyy';
    LastAccessTime.Format := 'HH:mm:ss';

    GetFileInfo(OpenDialog.FileName, creationDateTime, modificationDateTime, lastAccessDateTime);
    CreationDate.DateTime := creationDateTime;
    CreationTime.DateTime := creationDateTime;
    ChangeDate.DateTime := modificationDateTime;
    ChangeTime.DateTime := modificationDateTime;
    LastAccessDate.DateTime := lastAccessDateTime;
    LastAccessTime.DateTime := lastAccessDateTime;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  ChangeDate.Format := '''''';
  ChangeTime.Format := '''''';
  CreationDate.Format := '''''';
  CreationTime.Format := '''''';
  LastAccessDate.Format := '''''';
  LastAccessTime.Format := '''''';
end;

procedure TMainForm.FileNameFieldDblClick(Sender: TObject);
begin
  OpenFileButtonClick(Sender);
end;

procedure TMainForm.SaveButtonClick(Sender: TObject);
begin
  CreationDate.Time := CreationTime.Time;
  ChangeDate.Time := ChangeTime.Time;
  LastAccessDate.Time := LastAccessTime.Time;

  SetFileInfo(OpenDialog.FileName, CreationDate.DateTime, ChangeDate.Time, LastAccessDate.DateTime);

  ShowMessage('Настройки успешно сохранены');
end;

end.
