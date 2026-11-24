| Esquerda | Centro | Direita |
|:---------|:------:|--------:|
| A        | B      | C       |


# Funcionário 


|Campo	|Tipo	|Observações|
|:------|:-----:|-----------|
|FCN_Id	|PK	|                |
|FCN_FRQ_Id |FK |→ franqueado	quem cadastrou esse funcionário|
|FCN_EST_Id|	FK |→ estacionamento	onde o funcionario vai trabalhar|
|FCN_Matricula| | |		
|FCN_Nome|	VARCHAR	|   |
|FCN_CPF|	VARCHAR(11 - UNIQUE)| |	
|FCN_RG|	VARCHAR	| |
|FCN_Data_Nascimento|	DATE|   |	
|FCN_Email|	VARCHAR(unique)|	login|
|FCN_Celular|	VARCHAR	|
|FCN_Senha_Hash|	VARCHAR|	
|FCN_Ativo|	BOOLEAN	default true: o dono desativa o acesso quando quiser, sem precisar apagar o cadastro




# estacionamento 


|Campo|	Tipo|	Observações|
|:----|:---:|-------------:|
|EST_Id|	PK|	
|EST_FRQ_Id	FK| → franqueado|	
|EST_Nome|	VARCHAR	|
|EST_CEP|	VARCHAR|	o franqueado digita só isso — preenche rua, bairro, cidade e estado automaticamente via API do ViaCEP|
|EST_Endereco|	VARCHAR|	rua e bairro vêm do ViaCEP a partir do CEP; número e complemento o franqueado digita à mão|
|EST_Cidade|	VARCHAR|	também vem do ViaCEP — separado desde já, prepara terreno pro dashboard por cidade/estado sem precisar migrar depois|
|EST_Estado|	VARCHAR	|também vem do ViaCEP — mesmo motivo da cidade|
|EST_Imagem_1|	VARCHAR	|
|EST_imagem_2|	VARCHAR	|
|EST_imagem_3|	VARCHAR	|
|EST_Latitude|	DECIMAL	|preenchida automaticamente por geocodificação do endereço no momento do cadastro — é o que posiciona o pin no mapa de busca do cliente|
|EST_Longitude|	DECIMA	|mesma origem e mesmo motivo da latitude|
|EST_Horario_Abertura|	TIME|	
|EST_Horario_Fechamento|	TIME	|
|EST_Coberto|	BOOLEAN	comodidade|
|EST_Segurança_24h|	BOOLEAN	comodidade|
|EST_Status|	ENUM|	aguardando_aprovacao · ativo · inativo — default
aguardando_aprovacao; só aparece na busca do cliente quando ativo|
|EST_Aprovado_Em|	TIMESTAMP|	nullable|