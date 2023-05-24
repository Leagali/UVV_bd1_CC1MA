--Criar usuário no postgres--

CREATE USER luiz_lessa;

--Criar banco de dados da loja uvv--

CREATE DATABASE loja_uvv;

--Usar o banco de dados la loja uvv--

USE loja_uvv;

--Criar tabela de produtos da loja uvv em que a primary key é 'produto_id'--

CREATE TABLE lojas.produtos (
                produto_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                preco_unitario NUMERIC(10,2),
                detalhes BYTEA,
                imagem BYTEA,
                imagem_mime_type VARCHAR(255),
                imagem_arquivo VARCHAR(255),
                imagem_charset VARCHAR(255),
                imagem_ultima_atualizacao DATE,
                CONSTRAINT produto_id PRIMARY KEY (produto_id)
);

--Comentar tabela e colunas na tabela de produtos da loja uvv--

COMMENT ON TABLE lojas.produtos IS 'Tabela de produtos';
COMMENT ON COLUMN lojas.produtos.produto_id IS 'id do produto';
COMMENT ON COLUMN lojas.produtos.nome IS 'nome do produto';
COMMENT ON COLUMN lojas.produtos.preco_unitario IS 'preco unitario do produto';
COMMENT ON COLUMN lojas.produtos.detalhes IS 'detalhes do produto';
COMMENT ON COLUMN lojas.produtos.imagem IS 'imagem do produto';
COMMENT ON COLUMN lojas.produtos.imagem_mime_type IS 'tipo de mime do produto';
COMMENT ON COLUMN lojas.produtos.imagem_arquivo IS 'arquivo de imagem do produto';
COMMENT ON COLUMN lojas.produtos.imagem_charset IS 'charset da imagem do produto';
COMMENT ON COLUMN lojas.produtos.imagem_ultima_atualizacao IS 'data da ultima atualizacao da imagem do produto';

--Criar tabela de lojas da loja uvv em que a primary key é 'loja_id'--

CREATE TABLE lojas.lojas (
                loja_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                endereco_web VARCHAR(100),
                endereco_fisico VARCHAR(512),
                latitude NUMERIC,
                longitude NUMERIC,
                logo BYTEA,
                logo_mime_type VARCHAR(512),
                logo_arquivo VARCHAR(512),
                logo_charset VARCHAR(512),
                logo_ultima_atualizacao DATE,
                CONSTRAINT loja_id PRIMARY KEY (loja_id)
);

--Comentar tabela e colunas na tabela de lojas da loja uvv--

COMMENT ON TABLE lojas.lojas IS 'Tabela de lojas';
COMMENT ON COLUMN lojas.lojas.loja_id IS 'id da loja';
COMMENT ON COLUMN lojas.lojas.nome IS 'nome da loja';
COMMENT ON COLUMN lojas.lojas.endereco_web IS 'endereco web da loja';
COMMENT ON COLUMN lojas.lojas.endereco_fisico IS 'endereco fisico da loja';
COMMENT ON COLUMN lojas.lojas.latitude IS 'latitude da loja';
COMMENT ON COLUMN lojas.lojas.longitude IS 'longitude da loja';
COMMENT ON COLUMN lojas.lojas.logo IS 'logo da loja';
COMMENT ON COLUMN lojas.lojas.logo_mime_type IS 'tipo de mime da logo';
COMMENT ON COLUMN lojas.lojas.logo_arquivo IS 'arquivo da logo da loja';
COMMENT ON COLUMN lojas.lojas.logo_charset IS 'charset da logo da loja';
COMMENT ON COLUMN lojas.lojas.logo_ultima_atualizacao IS 'data da ultima atualizacao';

--Criar tabela de estoques da loja uvv em que a primary key é 'estoque_id'--

CREATE TABLE lojas.estoques (
                estoque_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                CONSTRAINT estoque_id PRIMARY KEY (estoque_id)
);

--Comentar tabela e colunas na tabela de estoques da loja uvv--

COMMENT ON TABLE lojas.estoques IS 'Tabela de estoques';
COMMENT ON COLUMN lojas.estoques.estoque_id IS 'id do estoque';
COMMENT ON COLUMN lojas.estoques.loja_id IS 'id da loja';
COMMENT ON COLUMN lojas.estoques.produto_id IS 'id do produto';
COMMENT ON COLUMN lojas.estoques.quantidade IS 'quantidade no estoque';

--Criar tabela de clientes da loja uvv em que a primary key é 'cliente_id'--

CREATE TABLE lojas.clientes (
                cliente_id NUMERIC(38) NOT NULL,
                email VARCHAR(255) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                telefone1 VARCHAR(20),
                telefone2 VARCHAR(20),
                telefone3 VARCHAR(20),
                CONSTRAINT cliente_id PRIMARY KEY (cliente_id)
);

--Comentar tabela e colunas na tabela de clientes da loja uvv--

COMMENT ON TABLE lojas.clientes IS 'Tabela de clientes';
COMMENT ON COLUMN lojas.clientes.cliente_id IS 'id do cliente';
COMMENT ON COLUMN lojas.clientes.email IS 'email do cliente';
COMMENT ON COLUMN lojas.clientes.nome IS 'nome do cliente';
COMMENT ON COLUMN lojas.clientes.telefone1 IS 'primeiro telefone do cliente';
COMMENT ON COLUMN lojas.clientes.telefone2 IS 'segundo telefone do cliente';
COMMENT ON COLUMN lojas.clientes.telefone3 IS 'terceiro telefone do cliente';

--Criar tabela de envios da loja uvv em que a primary key é 'envio_id'--

CREATE TABLE lojas.envios (
                envio_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                endereco_entrega VARCHAR(512) NOT NULL,
                status VARCHAR(15) NOT NULL,
                CONSTRAINT envio_id PRIMARY KEY (envio_id)
);

--Comentar tabela e colunas na tabela de envios da loja uvv--

COMMENT ON TABLE lojas.envios IS 'Tabela de envios';
COMMENT ON COLUMN lojas.envios.envio_id IS 'id do envio';
COMMENT ON COLUMN lojas.envios.loja_id IS 'id da loja';
COMMENT ON COLUMN lojas.envios.cliente_id IS 'id do cliente';
COMMENT ON COLUMN lojas.envios.endereco_entrega IS 'endereco da entrega do envio';
COMMENT ON COLUMN lojas.envios.status IS 'status do envio';

--Criar tabela de pedidos da loja uvv em que a primary key é 'pedido_id'--

CREATE TABLE lojas.pedidos (
                pedido_id NUMERIC(38) NOT NULL,
                data_hora TIMESTAMP NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                status VARCHAR(15) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                CONSTRAINT pedido_id PRIMARY KEY (pedido_id)
);

--Comentar tabela e colunas na tabela de pedidos da loja uvv--

COMMENT ON TABLE lojas.pedidos IS 'Tabela de pedidos';
COMMENT ON COLUMN lojas.pedidos.pedido_id IS 'id do pedido';
COMMENT ON COLUMN lojas.pedidos.data_hora IS 'data e hora do pedido';
COMMENT ON COLUMN lojas.pedidos.cliente_id IS 'id do cliente';
COMMENT ON COLUMN lojas.pedidos.status IS 'status do pedido';
COMMENT ON COLUMN lojas.pedidos.loja_id IS 'id da loja';

--Criar tabela de pedidos_itens da loja uvv--

CREATE TABLE lojas.pedidos_itens (
                pedido_id NUMERIC(38) NOT NULL,
			produto_id NUMERIC(38) NOT NULL,
                numero_da_linha NUMERIC(38) NOT NULL,
                preco_unitario NUMERIC(10,2) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                envio_id NUMERIC(38),
                CONSTRAINT fk_pedidos_itens PRIMARY KEY (produto_id, pedido_id)
);

--Comentar tabela e colunas na tabela de pedidos_itens da loja uvv--

COMMENT ON TABLE lojas.pedidos_itens IS 'Tabela de itens pedidos';
COMMENT ON COLUMN lojas.pedidos_itens.produto_id IS 'id do produto';
COMMENT ON COLUMN lojas.pedidos_itens.pedido_id IS 'id do pedido';
COMMENT ON COLUMN lojas.pedidos_itens.numero_da_linha IS 'numero da linha do item pedido';
COMMENT ON COLUMN lojas.pedidos_itens.preco_unitario IS 'preco unitario do item pedido';
COMMENT ON COLUMN lojas.pedidos_itens.quantidade IS 'quantidade de itens pedidos';
COMMENT ON COLUMN lojas.pedidos_itens.envio_id IS 'id do envio';

--Criação da relação entre a tabela produtos e a tabela estoques--

ALTER TABLE lojas.estoques ADD CONSTRAINT produtos_estoques_fk
FOREIGN KEY (produto_id)
REFERENCES lojas.produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Criação da relação entre a tabela produtos e a tabela pedidos_itens--

ALTER TABLE lojas.pedidos_itens ADD CONSTRAINT produtos_pedidos_itens_fk
FOREIGN KEY (produto_id)
REFERENCES lojas.produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Criação da relação entre a tabela lojas e a tabela pedidos--

ALTER TABLE lojas.pedidos ADD CONSTRAINT lojas_pedidos_fk
FOREIGN KEY (loja_id)
REFERENCES lojas.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Criação da relação entre a tabela lojas e a tabela envios--

ALTER TABLE lojas.envios ADD CONSTRAINT lojas_envios_fk
FOREIGN KEY (loja_id)
REFERENCES lojas.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Criação da relação entre a tabela lojas e a tabela estoques--

ALTER TABLE lojas.estoques ADD CONSTRAINT lojas_estoques_fk
FOREIGN KEY (loja_id)
REFERENCES lojas.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Criação da relação entre a tabela clientes e a tabela pedidos--

ALTER TABLE lojas.pedidos ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY (cliente_id)
REFERENCES lojas.clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Criação da relação entre a tabela clientes e a tabela envios--

ALTER TABLE lojas.envios ADD CONSTRAINT clientes_envios_fk
FOREIGN KEY (cliente_id)
REFERENCES lojas.clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Criação da relação entre a tabela envios e a tabela pedidos_itens--

ALTER TABLE lojas.pedidos_itens ADD CONSTRAINT envios_pedidos_itens_fk
FOREIGN KEY (envio_id)
REFERENCES lojas.envios (envio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Criação da relação entre a tabela pedidos e a tabela pedidos_itens--

ALTER TABLE lojas.pedidos_itens ADD CONSTRAINT pedidos_pedidos_itens_fk
FOREIGN KEY (pedido_id)
REFERENCES lojas.pedidos (pedido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
