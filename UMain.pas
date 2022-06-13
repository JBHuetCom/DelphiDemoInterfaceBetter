unit UMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, UICalcul;

type
  TFormMain = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    edtVal1: TEdit;
    edtVal2: TEdit;
    lblResultat: TLabel;
    jbhBtnAddition: TButton;
    jbhBtnMultiplication: TButton;
    procedure ExecuteCalcul(CalculChoisi: ICalcul);
    procedure ExecuteAddition(Sender: TObject);
    procedure ExecuteMultiplication(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormMain: TFormMain;

implementation

uses
  UTAddition,
  UTMultiplication
  //  UTMultiplicationParAddition
  ;

{$R *.fmx}

procedure TFormMain.ExecuteCalcul(CalculChoisi: ICalcul);
  begin
    if not Assigned(CalculChoisi) then
      raise Exception.Create('La méthode de calcul n''est pas définie');
    lblResultat.Text := CalculChoisi.Calcul(edtVal1.Text.ToInteger, edtVal2.Text.ToInteger).ToString;
  end;

procedure TFormMain.ExecuteAddition(Sender: TObject);
  var
    Calcul : TAddition;
  begin
    Calcul := TAddition.Create;
    ExecuteCalcul(Calcul);
  end;

procedure TFormMain.ExecuteMultiplication(Sender: TObject);
  var
    Calcul : TMultiplication;
    // Calcul : TMultiplicationParAddition;
  begin
    Calcul := TMultiplication.Create;
    // Calcul := TMultiplicationParAddition.Create;
    ExecuteCalcul(Calcul);
  end;

end.
