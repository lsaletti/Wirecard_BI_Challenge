--- Criando banco de dados, tabelas e usuário que será owner do projeto 

CREATE USER wirecard WITH PASSWORD 'wirecard' ;
CREATE SCHEMA IF NOT EXISTS wirecard AUTHORIZATION postgres;
ALTER DEFAULT PRIVILEGES IN SCHEMA wirecard GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE ON TABLES TO wirecard;
ALTER DEFAULT PRIVILEGES IN SCHEMA wirecard GRANT USAGE, SELECT ON SEQUENCES  TO wirecard;

CREATE TABLE  wirecard.payment_status (
                payment_status_id NUMERIC NOT NULL,
                description VARCHAR(45),
                CONSTRAINT payment_status_id PRIMARY KEY (payment_status_id)
);

-- COPY wirecard.payment_status from '/src/raw/payment_status.csv' with delimiter ';' csv header encoding 'windows-1251';

CREATE TABLE wirecard.payment (
                payment_id NUMERIC NOT NULL,
                payment_form NUMERIC NOT NULL,
                payment_value FLOAT,  
                payment_fee FLOAT,
                payment_status NUMERIC(1),
                created_date VARCHAR (500),
                CONSTRAINT payment_id PRIMARY KEY (payment_id)

);

-- COPY  wirecard.payment from '/src/raw/payment.csv' with delimiter ';' csv header encoding 'windows-1251';


CREATE TABLE wirecard.brand (
                brand_id NUMERIC NOT NULL,
                brand VARCHAR (45),
                CONSTRAINT brand_id PRIMARY KEY (brand_id)
);

-- COPY  wirecard.brand from '/src/raw/brand.csv' with delimiter ';' csv header encoding 'windows-1251';


CREATE TABLE wirecard.returned_code (
                returned_code_id NUMERIC NOT NULL,
                returned_code VARCHAR (45),
                message VARCHAR (500),
                CONSTRAINT returned_code_id PRIMARY KEY (returned_code_id)
);

-- COPY  wirecard.returned_code from '/src/raw/returned_code.csv' with delimiter ';' csv header encoding 'windows-1251';


CREATE TABLE wirecard.acquirers (
                acquirer_id NUMERIC NOT NULL,
                acquirer VARCHAR (45),
                CONSTRAINT acquirer_id PRIMARY KEY (acquirer_id)
);

-- COPY wirecard.acquirers from '/src/raw/acquirers.csv' with delimiter ';' csv header encoding 'windows-1251';


CREATE TABLE wirecard.acquirer_responses (
                acquirer_responses_id NUMERIC NOT NULL,
                payment_id NUMERIC NOT NULL,
                acquirer_id NUMERIC NOT NULL,
                brand_id NUMERIC NOT NULL,
                acquirer_transaction_id NUMERIC NOT NULL,
                returned_code_id NUMERIC NOT NULL,
                transaction_datetime VARCHAR(500),
                amount FLOAT,
                CONSTRAINT acquirer_responses_id PRIMARY KEY (acquirer_responses_id,returned_code_id),
                FOREIGN KEY (payment_id) REFERENCES wirecard.payment (payment_id),
                FOREIGN KEY (acquirer_id) REFERENCES wirecard.acquirers (acquirer_id),
                FOREIGN KEY (brand_id) REFERENCES wirecard.brand (brand_id)
); 

-- COPY  wirecard.acquirer_responses from '/src/raw/acquirer_responses.csv' with delimiter ';' csv header encoding 'windows-1251';


-- TOTAL PAYMENT Volume (TPV)

CREATE OR REPLACE VIEW wirecard.tpv AS (
select sum(payment_value) as tpv, count(*) as tpv_count from wirecard.payment where payment_form = 1 and payment_status=1
);

-- Overall conversion rate
CREATE OR REPLACE VIEW wirecard.overall_conversion_rate AS (
select sum(payment_value) / sum(payment_fee)  as overall_conversion_rate from wirecard.payment where 
payment_form = 1 and 
payment_status=1
);

-- Acquirer Efficiency
CREATE OR REPLACE VIEW wirecard.acquirer_efficiency AS (
select 
	  a.acquirer,
	  SUM(c.payment_value) as payment_value_total,
	  SUM(c.payment_fee) payment_fee_total,
 	  sum(b.amount) as amount
from wirecard.acquirers a
inner join wirecard.acquirer_responses b on (a.acquirer_id=b.acquirer_id)
inner join wirecard.payment c on (b.payment_id=c.payment_id)
group by a.acquirer order by a.acquirer
);