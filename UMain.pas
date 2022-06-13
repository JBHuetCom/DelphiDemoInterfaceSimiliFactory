unit UMain;

interface

  uses
    System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
    FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
    FMX.Edit, FMX.Controls.Presentation, UICalculation;

  type
    TfrmMain = class(TForm)
      lbl1: TLabel;
      lbl2: TLabel;
      lbl3: TLabel;
      lbl4: TLabel;
      lblResult: TLabel;
      edtVal1: TEdit;
      edtVal2: TEdit;
      swtchMultiplicationType: TSwitch;
      btnAddition: TButton;
      btnMultiplication: TButton;
      procedure ExecuteAddition(aCaller: TObject);
      procedure ExecuteMultiplication(aCaller: TObject);
    private
      procedure DisplayResult(aCalculation: ICalculation);
    end;

  var
    frmMain: TfrmMain;

implementation

uses
  UTCalculationFactory;

{$R *.fmx}

procedure TfrmMain.DisplayResult(aCalculation: ICalculation);
  begin
    if not Assigned(aCalculation) then
      raise Exception.Create('Undefined calculation method');
    lblResult.Text := aCalculation.Calculation(edtVal1.Text.ToInteger, edtVal2.Text.ToInteger).ToString;
  end;

procedure TfrmMain.ExecuteAddition(aCaller: TObject);
  begin
    DisplayResult(TCalculationFactory.CalculationMethod(cAdd));
  end;

procedure TfrmMain.ExecuteMultiplication(aCaller: TObject);
  var
    CalcType: TCalculationType;
  begin
    CalcType := cMulti;
    if swtchMultiplicationType.IsChecked then
      CalcType := cMultiPerAdd;
    DisplayResult(TCalculationFactory.CalculationMethod(CalcType));
  end;

end.
