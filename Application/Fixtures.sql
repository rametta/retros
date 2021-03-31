

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.retros DISABLE TRIGGER ALL;

INSERT INTO public.retros (id, created_at, updated_at, title) VALUES ('993c42d1-adbd-4211-be42-8d1ec0c604df', '2021-03-30 16:55:33.411714-04', '2021-03-30 16:55:33.411714-04', 'My first retro!');


ALTER TABLE public.retros ENABLE TRIGGER ALL;


ALTER TABLE public.columns DISABLE TRIGGER ALL;

INSERT INTO public.columns (id, title, retro_id, sort_order, created_at, updated_at) VALUES ('f3912fa5-b8e5-4086-90e9-f050d4da684d', 'Needs to change', '993c42d1-adbd-4211-be42-8d1ec0c604df', 1, '2021-03-30 16:57:44.799121-04', '2021-03-30 16:57:44.799121-04');
INSERT INTO public.columns (id, title, retro_id, sort_order, created_at, updated_at) VALUES ('0d9d7f65-ff7a-4697-a142-0c58176e2dd6', 'Went Well 2', '993c42d1-adbd-4211-be42-8d1ec0c604df', 0, '2021-03-30 16:57:22.751845-04', '2021-03-30 16:57:22.751845-04');
INSERT INTO public.columns (id, title, retro_id, sort_order, created_at, updated_at) VALUES ('4e3737b9-1d5f-4781-b390-24106e7f032c', 'Can do better2222', '993c42d1-adbd-4211-be42-8d1ec0c604df', 2, '2021-03-30 16:57:54.781579-04', '2021-03-30 16:57:54.781579-04');


ALTER TABLE public.columns ENABLE TRIGGER ALL;


ALTER TABLE public.items DISABLE TRIGGER ALL;



ALTER TABLE public.items ENABLE TRIGGER ALL;


ALTER TABLE public.comments DISABLE TRIGGER ALL;



ALTER TABLE public.comments ENABLE TRIGGER ALL;


