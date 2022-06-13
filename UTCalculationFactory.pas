unit UTCalculationFactory;

interface

  uses
    UICalculation;

  type
    TCalculationType = (cAdd, cMulti, cMultiPerAdd);

    TCalculationFactory = class
      class function CalculationMethod(CalculationType: TCalculationType): ICalculation;
    end;

implementation

  uses
    UCalculationMethods, System.SysUtils;

  class function TCalculationFactory.CalculationMethod(CalculationType: TCalculationType): ICalculation;
    begin
      case CalculationType of
        cAdd : Result := TAddition.Create;
        cMulti : Result := TMultiplication.Create;
        CMultiPerAdd : Result := TMultiplicationPerAddition.Create;
        else raise Exception.Create('Unkonwn TCalculType value');
      end;
    end;

end.
