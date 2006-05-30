{
 *****************************************************************************
 *                            WinCEWSComCtrls.pp                             *
 *                            ------------------                             * 
 *                                                                           *
 *                                                                           *
 *****************************************************************************

 *****************************************************************************
 *                                                                           *
 *  This file is part of the Lazarus Component Library (LCL)                 *
 *                                                                           *
 *  See the file COPYING.LCL, included in this distribution,                 *
 *  for details about the copyright.                                         *
 *                                                                           *
 *  This program is distributed in the hope that it will be useful,          *
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of           *
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                     *
 *                                                                           *
 *****************************************************************************
}
unit WinCEWSComCtrls;

{$mode objfpc}{$H+}
interface

uses
  // FCL
  Windows, Classes, SysUtils, {WinExt,}
  // LCL
  ComCtrls, LCLType, Controls, Graphics,
  ImgList, StdCtrls,
  LCLProc, InterfaceBase,
  // widgetset
  WSComCtrls, WSLCLClasses, WSProc,
  // wince widgetset
   WinCEInt, WinCEProc, WinCEWSControls,WinCEWinAPIEmu;

type

  { TWinCEWSStatusBar }

  TWinCEWSStatusBar = class(TWSStatusBar)
  private
  protected
  public
    class function  CreateHandle(const AWinControl: TWinControl;
          const AParams: TCreateParams): HWND; override;
    class procedure Update(const AStatusBar: TStatusBar); override;
    class procedure PanelUpdate(const AStatusBar: TStatusBar; PanelIndex: integer); override;
    class procedure SetPanelText(const AStatusBar: TStatusBar; PanelIndex: integer); override;
    class procedure SetText(const AWinControl: TWinControl; const AText: string); override;
    class procedure SetBounds(const AWinControl: TWinControl; const ALeft, ATop, 
      AWidth, AHeight: integer); override;
    class procedure GetPreferredSize(const AWinControl: TWinControl;
                        var PreferredWidth, PreferredHeight: integer;
                        WithThemeSpace: Boolean); override;
  end;

  { TWinCEWSTabSheet }

  TWinCEWSTabSheet = class(TWSTabSheet)
  private
  protected
  public
  end;

  { TWinCEWSPageControl }

  TWinCEWSPageControl = class(TWSPageControl)
  private
  protected
  public
  end;

  { TWinCEWSCustomListView }

  TWinCEWSCustomListView = class(TWSCustomListView)
  private
    class function  GetHeader(const AHandle: THandle): THandle;
    class procedure PositionHeader(const AHandle: THandle);
    class procedure UpdateStyle(const AHandle: THandle; const AMask, AStyle: Integer);
    class procedure UpdateExStyle(const AHandle: THandle; const AMask, AStyle: Integer);
  protected
  public
    // columns
    class procedure ColumnDelete(const ALV: TCustomListView; const AIndex: Integer); override;
    class function  ColumnGetWidth(const ALV: TCustomListView; const AIndex: Integer; const AColumn: TListColumn): Integer; override;
    class procedure ColumnInsert(const ALV: TCustomListView; const AIndex: Integer; const AColumn: TListColumn); override;
    class procedure ColumnMove(const ALV: TCustomListView; const AOldIndex, ANewIndex: Integer; const AColumn: TListColumn); override;
    class procedure ColumnSetAlignment(const ALV: TCustomListView; const AIndex: Integer; const AColumn: TListColumn; const AAlignment: TAlignment); override;
    class procedure ColumnSetAutoSize(const ALV: TCustomListView; const AIndex: Integer; const AColumn: TListColumn; const AAutoSize: Boolean); override;
    class procedure ColumnSetCaption(const ALV: TCustomListView; const AIndex: Integer; const AColumn: TListColumn; const ACaption: String); override;
    class procedure ColumnSetImage(const ALV: TCustomListView; const AIndex: Integer; const AColumn: TListColumn; const AImageIndex: Integer); override;
    class procedure ColumnSetMaxWidth(const ALV: TCustomListView; const AIndex: Integer; const AColumn: TListColumn; const AMaxWidth: Integer); override;
    class procedure ColumnSetMinWidth(const ALV: TCustomListView; const AIndex: Integer; const AColumn: TListColumn; const AMinWidth: integer); override;
    class procedure ColumnSetWidth(const ALV: TCustomListView; const AIndex: Integer; const AColumn: TListColumn; const AWidth: Integer); override;
    class procedure ColumnSetVisible(const ALV: TCustomListView; const AIndex: Integer; const AColumn: TListColumn; const AVisible: Boolean); override;

    // items
    class procedure ItemDelete(const ALV: TCustomListView; const AIndex: Integer); override;
    class function  ItemGetState(const ALV: TCustomListView; const AIndex: Integer; const AItem: TListItem; const AState: TListItemState; out AIsSet: Boolean): Boolean; override; // returns True if supported
    class procedure ItemInsert(const ALV: TCustomListView; const AIndex: Integer; const AItem: TListItem); override;
    class procedure ItemSetImage(const ALV: TCustomListView; const AIndex: Integer; const AItem: TListItem; const ASubIndex, AImageIndex: Integer); override;
    class procedure ItemSetState(const ALV: TCustomListView; const AIndex: Integer; const AItem: TListItem; const AState: TListItemState; const AIsSet: Boolean); override;
    class procedure ItemSetText(const ALV: TCustomListView; const AIndex: Integer; const AItem: TListItem; const ASubIndex: Integer; const AText: String); override;
    class procedure ItemShow(const ALV: TCustomListView; const AIndex: Integer; const AItem: TListItem; const PartialOK: Boolean); override;
  
    // lv
    class function  CreateHandle(const AWinControl: TWinControl; const AParams: TCreateParams): HWND; override;

    class procedure BeginUpdate(const ALV: TCustomListView); override;
    class procedure EndUpdate(const ALV: TCustomListView); override;

    class function GetBoundingRect(const ALV: TCustomListView): TRect; override;
    class function GetDropTarget(const ALV: TCustomListView): Integer; override;
    class function GetFocused(const ALV: TCustomListView): Integer; override;
    class function GetHoverTime(const ALV: TCustomListView): Integer; override;
    class function GetSelCount(const ALV: TCustomListView): Integer; override;
    class function GetSelection(const ALV: TCustomListView): Integer; override;
    class function GetTopItem(const ALV: TCustomListView): Integer; override;
    class function GetVisibleRowCount(const ALV: TCustomListView): Integer; override;

    class procedure SetAllocBy(const ALV: TCustomListView; const AValue: Integer); override;
    class procedure SetDefaultItemHeight(const ALV: TCustomListView; const AValue: Integer); override;
    class procedure SetHotTrackStyles(const ALV: TCustomListView; const AValue: TListHotTrackStyles); override;
    class procedure SetHoverTime(const ALV: TCustomListView; const AValue: Integer); override;
//    class procedure SetIconOptions(const ALV: TCustomListView; const AValue: TIconOptions); override;
    class procedure SetImageList(const ALV: TCustomListView; const AList: TListViewImageList; const AValue: TCustomImageList); override;
    class procedure SetProperty(const ALV: TCustomListView; const AProp: TListViewProperty; const AIsSet: Boolean); override;
    class procedure SetProperties(const ALV: TCustomListView; const AProps: TListViewProperties); override;
    class procedure SetScrollBars(const ALV: TCustomListView; const AValue: TScrollStyle); override;
    class procedure SetScrolledLeft(const ALV: TCustomListView; const AValue: Integer); override;
    class procedure SetScrolledTop(const ALV: TCustomListView; const AValue: Integer); override;
    class procedure SetSort(const ALV: TCustomListView; const AType: TSortType; const AColumn: Integer); override;
    class procedure SetViewStyle(const ALV: TCustomListView; const Avalue: TViewStyle); override;
  end;

  { TWinCEWSListView }

  TWinCEWSListView = class(TWSListView)
  private
  protected
  public
  end;

  { TWinCEWSProgressBar }

  TWinCEWSProgressBar = class(TWSProgressBar)
  private
  protected
  public
    class function  CreateHandle(const AWinControl: TWinControl;
          const AParams: TCreateParams): HWND; override;
    class procedure ApplyChanges(const AProgressBar: TCustomProgressBar); override;
    class procedure SetPosition(const AProgressBar: TCustomProgressBar; const NewPosition: integer); override;
  end;

  { TWinCEWSCustomUpDown }

  TWinCEWSCustomUpDown = class(TWSCustomUpDown)
  private
  protected
  public
  end;

  { TWinCEWSUpDown }

  TWinCEWSUpDown = class(TWSUpDown)
  private
  protected
  public
  end;

  { TWinCEWSToolButton }

  TWinCEWSToolButton = class(TWSToolButton)
  private
  protected
  public
  end;

  { TWinCEWSToolBar }

  TWinCEWSToolBar = class(TWSToolBar)
  private
  protected
  public
{$ifdef OldToolbar}
    class function  CreateHandle(const AWinControl: TWinControl;
          const AParams: TCreateParams): HWND; override;
    class function  GetButtonCount(const AToolBar: TToolBar): integer; override;
    class procedure InsertToolButton(const AToolBar: TToolbar; const AControl: TControl); override;
    class procedure DeleteToolButton(const AToolBar: TToolbar; const AControl: TControl); override;
{$endif}
  end;

  { TWinCEWSTrackBar }

  TWinCEWSTrackBar = class(TWSTrackBar)
  private
  protected
  public
    class function  CreateHandle(const AWinControl: TWinControl;
          const AParams: TCreateParams): HWND; override;
    class procedure ApplyChanges(const ATrackBar: TCustomTrackBar); override;
    class function  GetPosition(const ATrackBar: TCustomTrackBar): integer; override;
    class procedure SetPosition(const ATrackBar: TCustomTrackBar; const NewPosition: integer); override;
  end;

  { TWinCEWSCustomTreeView }

  TWinCEWSCustomTreeView = class(TWSCustomTreeView)
  private
  protected
  public
  end;

  { TWinCEWSTreeView }

  TWinCEWSTreeView = class(TWSTreeView)
  private
  protected
  public
  end;


implementation


{$I wincewscustomlistview.inc }


{ --- Helper routines for TWinCEWSStatusBar --- }

{------------------------------------------------------------------------------
  Method: UpdateStatusBarPanel
  Params: StatusPanel - StatusPanel which needs to be update
  Returns: Nothing

  Called by StatusBarPanelUpdate and StatusBarSetText
  Everything is updated except the panel width
 ------------------------------------------------------------------------------}
procedure UpdateStatusBarPanel(const StatusPanel: TStatusPanel);
var
  BevelType: integer;
  Text: string;
  pwText : PWideChar;
begin
  Text := StatusPanel.Text;
  case StatusPanel.Alignment of
    taCenter: Text := #9 + Text;
    taRightJustify: Text := #9#9 + Text;
  end;
  case StatusPanel.Bevel of
    pbNone: BevelType := Windows.SBT_NOBORDERS;
    pbLowered: BevelType := 0;
    pbRaised: BevelType := Windows.SBT_POPOUT;
  end;
  pwText := CreatePWideCharFromString(Text);
  Windows.SendMessage(StatusPanel.StatusBar.Handle, SB_SETTEXT, StatusPanel.Index or BevelType, LPARAM(pwText));
  DisposePWideChar(pwText);
end;

procedure UpdateStatusBarPanelWidths(const StatusBar: TStatusBar);
var
  Rights: PInteger;
  PanelIndex: integer;
  CurrentRight: integer;
begin
  if StatusBar.Panels.Count=0 then begin
    // SETPARTS 0,0 does not work :S
    Windows.SendMessage(StatusBar.Handle, SB_SIMPLE, 1, 0);
    Windows.SendMessage(StatusBar.Handle, SB_SETTEXT, 255, WPARAM(PWideChar('')));
    exit;
  end;
  Getmem(Rights, StatusBar.Panels.Count * sizeof(integer));
  try
    CurrentRight := 0;
    for PanelIndex := 0 to StatusBar.Panels.Count-2 do begin
      CurrentRight := CurrentRight + StatusBar.Panels[PanelIndex].Width;
      Rights[PanelIndex] := CurrentRight;
    end;
    Rights[StatusBar.Panels.Count-1] := -1; //Last extends to end;
    Windows.SendMessage(StatusBar.Handle, SB_SETPARTS, StatusBar.Panels.Count, LPARAM(Rights));
  finally
    Freemem(Rights);
  end;
end;

{ TWinCEWSStatusBar }


class function TWinCEWSStatusBar.CreateHandle(const AWinControl: TWinControl;
  const AParams: TCreateParams): HWND;
var
  Params: TCreateWindowExParams;
  init : TINITCOMMONCONTROLSEX;
begin
  init.dwSize := Sizeof(TINITCOMMONCONTROLSEX);
  init.dwICC := ICC_BAR_CLASSES;
  InitCommonControlsEx(@init);
  // general initialization of Params
  PrepareCreateWindow(AWinControl, Params);

  // customization of Params
  with Params do
  begin
    pClassName := STATUSCLASSNAME;
    WindowTitle := StrCaption;
    Left := LongInt(CW_USEDEFAULT);
    Top := LongInt(CW_USEDEFAULT);
    Width := LongInt(CW_USEDEFAULT);
    Height := LongInt(CW_USEDEFAULT);
  end;
  // create window
  FinishCreateWindow(AWinControl, Params, false);
  // need to set handle for Update method
  AWinControl.Handle := Params.Window;
  Update(TStatusBar(AWinControl));
  Result := Params.Window;
end;

class procedure TWinCEWSStatusBar.PanelUpdate(const AStatusBar: TStatusBar; PanelIndex: integer);
begin
  UpdateStatusBarPanelWidths(AStatusBar);
  UpdateStatusBarPanel(AStatusBar.Panels[PanelIndex]);
end;

class procedure TWinCEWSStatusBar.SetBounds(const AWinControl: TWinControl;
  const ALeft, ATop, AWidth, AHeight: integer);
begin
  // statusbars do their own resizing, post a size message to it's queue
  Windows.PostMessage(AWinControl.Handle, WM_SIZE, 0, 0);
end;

class procedure TWinCEWSStatusBar.GetPreferredSize(const AWinControl: TWinControl;
  var PreferredWidth, PreferredHeight: integer; WithThemeSpace: Boolean);
var
  R: TRect;
begin
  // statusbars cannot be resized by the LCL, so actual size is preferred size
  if Windows.GetWindowRect(AWinControl.Handle, @R) then begin
    PreferredHeight:= R.Bottom - R.Top;
    PreferredWidth:= R.Right - R.Left;
  end;
end;

class procedure TWinCEWSStatusBar.SetPanelText(const AStatusBar: TStatusBar; PanelIndex: integer);
var
tmpSimpleText : PWideChar;
begin
  if AStatusBar.SimplePanel then
    begin
      tmpSimpleText := CreatePWideCharFromString(AStatusBar.SimpleText);
      Windows.SendMessage(AStatusBar.Handle, SB_SETTEXT, 255, LPARAM(PWideChar(tmpSimpleText)));
      DisposePWideChar(tmpSimpleText);
    end
  else
    UpdateStatusBarPanel(AStatusBar.Panels[PanelIndex]);
end;

class procedure TWinCEWSStatusBar.SetText(const AWinControl: TWinControl;
  const AText: string);
begin
  // inhibit. StatusBars do not have a caption, simpletext is set by SetPanelText
end;

class procedure TWinCEWSStatusBar.Update(const AStatusBar: TStatusBar);
var
  PanelIndex: integer;
begin
  Windows.SendMessage(AStatusBar.Handle, SB_SIMPLE, WPARAM(AStatusBar.SimplePanel), 0);
  if AStatusBar.SimplePanel then
    SetPanelText(AStatusBar, 0)
  else begin
    UpdateStatusBarPanelWidths(AStatusBar);
    for PanelIndex := 0 to AStatusBar.Panels.Count-1 do
      UpdateStatusBarPanel(AStatusBar.Panels[PanelIndex]);
  end;
end;

{ TWinCEWSProgressBar }

class function TWinCEWSProgressBar.CreateHandle(const AWinControl: TWinControl;
  const AParams: TCreateParams): HWND;
var
  Params: TCreateWindowExParams;
  init : TINITCOMMONCONTROLSEX;
begin
  init.dwSize := Sizeof(TINITCOMMONCONTROLSEX);
  init.dwICC := ICC_PROGRESS_CLASS;
  InitCommonControlsEx(@init);
  // general initialization of Params
  PrepareCreateWindow(AWinControl, Params);
  // customization of Params
  with Params do
  begin
    with TCustomProgressBar(AWinControl) do
    begin
      if Smooth then
        Flags := Flags or PBS_SMOOTH;
      if (Orientation = pbVertical) or (Orientation = pbTopDown) then
        Flags := Flags or PBS_VERTICAL;
    end;
    pClassName := PROGRESS_CLASS;
  end;
  // create window
  FinishCreateWindow(AWinControl, Params, false);
  Result := Params.Window;
end;

class procedure TWinCEWSProgressBar.ApplyChanges(
  const AProgressBar: TCustomProgressBar);
begin
  with AProgressBar do
  begin
    { smooth and vertical need window recreation }
    if ((GetWindowLong(Handle, GWL_STYLE) and PBS_SMOOTH  ) <>
         Integer(Smooth) * PBS_SMOOTH) or
       ((GetWindowLong(Handle, GWL_STYLE) and PBS_VERTICAL) <>
         Integer((Orientation = pbVertical) or (Orientation = pbTopDown)) * PBS_VERTICAL) then
      RecreateWnd(AProgressBar);

    SendMessage(Handle, PBM_SETRANGE32, Min, Max);
    SendMessage(Handle, PBM_SETPOS, Position, 0);

{ TODO: Implementable?
    If BarShowText Then
    Begin
      SetWindowText(Handle, StrToPChar((Sender As TControl).Caption));
    End
    Else
      SetWindowText(Handle, Nil);
}
  end;
end;

class procedure TWinCEWSProgressBar.SetPosition(
  const AProgressBar: TCustomProgressBar; const NewPosition: integer);
begin
  Windows.SendMessage(AProgressBar.Handle, PBM_SETPOS, Windows.WPARAM(NewPosition), 0);
end;

{ TWinCEWSToolbar}

{$IFDEF OldToolbar}
class function TWinCEWSToolBar.CreateHandle(const AWinControl: TWinControl;
  const AParams: TCreateParams): HWND;
var
  Params: TCreateWindowExParams;
  init : TINITCOMMONCONTROLSEX;
begin
  init.dwSize := Sizeof(TINITCOMMONCONTROLSEX);
  init.dwICC := ICC_BAR_CLASSES;
  InitCommonControlsEx(@init);
  // general initialization of Params
  PrepareCreateWindow(AWinControl, Params);
  // customization of Params
  with Params do
  begin
    FlagsEx := WS_EX_TOPMOST;
    pClassName := TOOLBARCLASSNAME;
    Flags := WS_CHILD or TBSTYLE_FLAT or TBSTYLE_LIST or WS_VISIBLE or TBS_HORZ or TBS_BOTH or TBS_NOTICKS or TBS_FIXEDLENGTH;//Flags {or CCS_ADJUSTABLE};
  end;
  // create window
  FinishCreateWindow(AWinControl, Params, false);
  Result := Params.Window;
end;

class function  TWinCEWSToolbar.GetButtonCount(const AToolBar: TToolBar): integer;
begin
  Result := SendMessage(AToolbar.Handle, TB_BUTTONCOUNT, 0, 0)
end;

class procedure TWinCEWSToolbar.InsertToolButton(const AToolBar: TToolbar; const AControl: TControl);
var
  PStr, PStr2: PWideChar;
  Num: Integer;
  TBB: TBBUTTON;
begin
  // TODO: check correctness / clean up
  Assert(False, 'Trace:!!!!!!!!!!!!!!!!!!!!!!!!!');
  Assert(False, 'Trace:Toolbutton being inserted');
  Assert(False, 'Trace:!!!!!!!!!!!!!!!!!!!!!!!!!');
  If (AControl is TWinControl) Then
  Begin
    PStr := CreatePWideCharFromString(TToolButton(AControl).Caption);
  End
  Else
  Begin
    Raise Exception.Create('Can not assign this control to the toolbar');
    Exit;
  End;

  Num := TToolbar(TWinControl(AControl).Parent).Buttonlist.IndexOf(TControl(AControl));
  If Num < 0 Then
    Num := TToolbar(TWinControl(AControl).Parent).Buttonlist.Count + 1;
  Assert(False, Format('Trace:Num = %d in LM_INSERTTOOLBUTTON', [Num]));

  With tbb Do
  Begin
    iBitmap := Num;
    idCommand := Num;
    fsState := TBSTATE_ENABLED;
    fsStyle := TBSTYLE_BUTTON;
    iString := Integer(PStr);
  End;

  SendMessage(TWinControl(AControl).Parent.Handle, TB_BUTTONSTRUCTSIZE, SizeOf(TBBUTTON), 0);
  SendMessage(TWinControl(AControl).Parent.Handle, TB_ADDBUTTONS, 1, LParam(LPTBButton(@tbb)));
  DisposePWideChar(PStr);
  Assert(False, 'Trace:!!!!!!!!!!!!!!!!!!!!!!!!!');
end;

class procedure TWinCEWSToolbar.DeleteToolButton(const AToolBar: TToolbar; const AControl: TControl);
begin
  // TODO: code buggy, Index of button to delete ?!
  SendMessage(AToolBar.Handle, TB_DELETEBUTTON, 0, 0);
end;
{$ENDIF}

{ TWinCEWSTrackBar }

class function TWinCEWSTrackBar.CreateHandle(const AWinControl: TWinControl;
  const AParams: TCreateParams): HWND;
var
  Params: TCreateWindowExParams;
  init : TINITCOMMONCONTROLSEX;
begin
  init.dwSize := Sizeof(TINITCOMMONCONTROLSEX);
  init.dwICC := ICC_BAR_CLASSES;
  InitCommonControlsEx(@init);
  // general initialization of Params
  PrepareCreateWindow(AWinControl, Params);
  // customization of Params
  with Params do
  begin
    pClassName := TRACKBAR_CLASS;
    WindowTitle := StrCaption;
  end;
  // create window
  FinishCreateWindow(AWinControl, Params, false);
  Result := Params.Window;
end;

class procedure TWinCEWSTrackBar.ApplyChanges(const ATrackBar: TCustomTrackBar);
var
  wHandle: HWND;
  NewStyle: integer;
const
  StyleMask = TBS_AUTOTICKS or TBS_NOTICKS or TBS_VERT or TBS_TOP or TBS_BOTH;
  TickStyleStyle : array[TTickStyle] of integer =
    (TBS_NOTICKS, TBS_AUTOTICKS, 0);
  OrientationStyle : array[TTrackBarOrientation] of integer =
    (TBS_HORZ, TBS_VERT);
  TickMarksStyle : array[TTickMark] of integer =
    (TBS_BOTTOM, TBS_TOP, TBS_BOTH);
begin
  with ATrackBar do
  begin
    { cache handle }
    wHandle := Handle;
    NewStyle := TickStyleStyle[TickStyle] or OrientationStyle[Orientation] or
                TickMarksStyle[TickMarks];
    UpdateWindowStyle(wHandle, NewStyle, StyleMask);
    Windows.SendMessage(wHandle, TBM_SETRANGEMAX, Windows.WPARAM(true), Max);
    Windows.SendMessage(wHandle, TBM_SETRANGEMIN, Windows.WPARAM(true), Min);
    Windows.SendMessage(wHandle, TBM_SETPOS, Windows.WPARAM(true), Position);
    Windows.SendMessage(wHandle, TBM_SETLINESIZE, 0, LineSize);
    Windows.SendMessage(wHandle, TBM_SETPAGESIZE, 0, PageSize);
    Windows.SendMessage(wHandle, TBM_SETTICFREQ, Frequency, 0);
  end;
end;

class function  TWinCEWSTrackBar.GetPosition(const ATrackBar: TCustomTrackBar): integer;
begin
  Result := SendMessage(ATrackBar.Handle, TBM_GETPOS, 0, 0)
end;

class procedure TWinCEWSTrackBar.SetPosition(const ATrackBar: TCustomTrackBar; const NewPosition: integer);
begin
  Windows.SendMessage(ATrackBar.Handle, TBM_SETPOS, Windows.WPARAM(true), Windows.LPARAM(NewPosition));
end;

initialization

////////////////////////////////////////////////////
// I M P O R T A N T
////////////////////////////////////////////////////
// To improve speed, register only classes
// which actually implement something
////////////////////////////////////////////////////
  RegisterWSComponent(TStatusBar, TWinCEWSStatusBar);
//  RegisterWSComponent(TCustomTabSheet, TWinCEWSTabSheet);
//  RegisterWSComponent(TCustomPageControl, TWinCEWSPageControl);
  RegisterWSComponent(TCustomListView, TWinCEWSCustomListView);
//  RegisterWSComponent(TCustomListView, TWinCEWSListView);
  RegisterWSComponent(TCustomProgressBar, TWinCEWSProgressBar);
//  RegisterWSComponent(TCustomUpDown, TWinCEWSCustomUpDown);
//  RegisterWSComponent(TCustomUpDown, TWinCEWSUpDown);
//  RegisterWSComponent(TCustomToolButton, TWinCEWSToolButton);
{$ifdef OldToolbar}
  RegisterWSComponent(TToolBar, TWinCEWSToolBar);
{$endif}
  RegisterWSComponent(TCustomTrackBar, TWinCEWSTrackBar);
//  RegisterWSComponent(TCustomTreeView, TWinCEWSCustomTreeView);
//  RegisterWSComponent(TCustomTreeView, TWinCEWSTreeView);
////////////////////////////////////////////////////
end.
