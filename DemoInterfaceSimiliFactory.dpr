program DemoInterfaceSimiliFactory;

uses
  System.StartUpCopy,
  FMX.Forms,
  UICalculation in 'UICalculation.pas',
  UMain in 'UMain.pas' {frmMain},
  UTCalculationFactory in 'UTCalculationFactory.pas',
  UCalculationMethods in 'UCalculationMethods.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
