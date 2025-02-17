CREATE TABLE public.fruits (
	id int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	"name" text NULL,
	flavor text NULL,
	CONSTRAINT fruits_pkey PRIMARY KEY (id)
);

CREATE TABLE public.nutrition_info (
	fruit_id int4 NOT NULL,
	calories int4 NULL,
	protein int4 NULL,
	carbs int4 NULL,
	fat int4 NULL,
	CONSTRAINT nutrition_info_pkey PRIMARY KEY (fruit_id),
	CONSTRAINT nutrition_info_fruit_id_fkey FOREIGN KEY (fruit_id) REFERENCES public.fruits(id)
);

insert into fruits (name,flavor) values
('orange', 'citrussy'),
('mango', 'squishy');

select * from fruits;