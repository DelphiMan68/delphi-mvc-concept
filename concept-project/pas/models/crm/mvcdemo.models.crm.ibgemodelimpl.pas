unit MVCDemo.Models.CRM.IBGEModelImpl;

interface

uses
  MVCDemo.Models.CRM.IBGEModelPKImpl,
  MVCDemo.Models.CRM.IBGEModel,
  Spring.Persistence.Mapping.Attributes,
  Framework.Libraries.Validation.ValidatorImpl;

type
  TIBGEModelImpl = class(TIBGEModelPKImpl, IIBGEModel)
  private
    FDescricao: String;
    FCodigoUsuarioAlt: Integer;
    FDataCadastro: TDateTime;
  private
    procedure SetDescricao(const Value: String);
  public
    [Column('DSC', [cpNotNull, cpRequired], 30, 0, 0, 'DESCRI��O DO MUNIC�PIO')]
    [ColumnTitle('Descri��o')]
    [Required, MinLength(3), MaxLength(40)]
    property Descricao: String read FDescricao write SetDescricao;

    [Column('DTC', [cpNotNull, cpRequired, cpDontUpdate, cpHidden], 0, 'DATA DE CADASTRO')]
    property DataCadastro: TDateTime read FDataCadastro write FDataCadastro;

    [Column('USR', [cpHidden], 0, 'USU�RIO RESPONS�VEL PELA ALTERA��O')]
    property CodigoUsuarioAlt: Integer read FCodigoUsuarioAlt write FCodigoUsuarioAlt;
  end;

implementation

uses
  DSharp.Bindings;

{ TIBGEModelImpl }



procedure TIBGEModelImpl.SetDescricao(const Value: String);
begin
  if (FDescricao <> Value) then
  begin
    FDescricao := Value;
    NotifyPropertyChanged(Self, 'Descricao');
  end;
end;

end.
