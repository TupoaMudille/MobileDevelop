-- Table: public.notes

-- DROP TABLE IF EXISTS public.notes;

CREATE TABLE IF NOT EXISTS public.notes
(
id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
note character varying COLLATE pg_catalog."default" NOT NULL,
CONSTRAINT notes_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.notes
OWNER to postgres;
