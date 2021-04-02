

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

INSERT INTO public.retros (id, created_at, updated_at, title) VALUES ('ef5f1324-d5db-46ee-a787-d0878bca0585', '2021-04-01 11:03:03.685919-04', '2021-04-01 11:03:03.685919-04', 'jason''s retro');
INSERT INTO public.retros (id, created_at, updated_at, title) VALUES ('74c64289-9838-4c7f-9e58-5e7264554e0f', '2021-03-31 13:51:02.031623-04', '2021-03-31 13:51:02.031623-04', 'Unity Game Growth Retro 4');


ALTER TABLE public.retros ENABLE TRIGGER ALL;


ALTER TABLE public.columns DISABLE TRIGGER ALL;

INSERT INTO public.columns (id, title, retro_id, sort_order, created_at, updated_at) VALUES ('86d13426-dc2a-46b3-bfa6-7fbffa422e76', 'Needs to change', '74c64289-9838-4c7f-9e58-5e7264554e0f', 1, '2021-03-31 14:14:11.260913-04', '2021-03-31 14:14:11.260913-04');
INSERT INTO public.columns (id, title, retro_id, sort_order, created_at, updated_at) VALUES ('6c66a454-84ca-4bbb-a74b-f3738ef8a988', 'What can we do better?', '74c64289-9838-4c7f-9e58-5e7264554e0f', 2, '2021-03-31 14:58:14.769011-04', '2021-03-31 14:58:14.769011-04');
INSERT INTO public.columns (id, title, retro_id, sort_order, created_at, updated_at) VALUES ('6544c4ae-5b59-4e89-953a-454d2567bf4b', 'Flowers', '74c64289-9838-4c7f-9e58-5e7264554e0f', 3, '2021-03-31 14:58:19.041368-04', '2021-03-31 14:58:19.041368-04');
INSERT INTO public.columns (id, title, retro_id, sort_order, created_at, updated_at) VALUES ('232aab29-3e40-47d2-9ba7-14ca855a4d92', 'Action Items', '74c64289-9838-4c7f-9e58-5e7264554e0f', 5, '2021-03-31 14:58:22.887956-04', '2021-03-31 14:58:22.887956-04');
INSERT INTO public.columns (id, title, retro_id, sort_order, created_at, updated_at) VALUES ('867b0cb4-019f-4e24-95e7-a4b8f4da69f2', 'Went Well ❤️‍🔥', '74c64289-9838-4c7f-9e58-5e7264554e0f', 0, '2021-03-31 14:13:01.769953-04', '2021-03-31 14:13:01.769953-04');
INSERT INTO public.columns (id, title, retro_id, sort_order, created_at, updated_at) VALUES ('757b6734-52b8-490c-8557-a0e5d0fab3b1', 'sdfsdf', 'ef5f1324-d5db-46ee-a787-d0878bca0585', 0, '2021-04-02 15:53:23.686517-04', '2021-04-02 15:53:23.686517-04');


ALTER TABLE public.columns ENABLE TRIGGER ALL;


ALTER TABLE public.items DISABLE TRIGGER ALL;

INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('8226965b-c20b-4f29-a470-083b40a18797', '867b0cb4-019f-4e24-95e7-a4b8f4da69f2', 'item 1', '', '2021-03-31 14:14:47.687065-04', '2021-03-31 14:14:47.687065-04', 0, '74c64289-9838-4c7f-9e58-5e7264554e0f');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('626cc006-816b-4700-ad52-40174243c1b5', '867b0cb4-019f-4e24-95e7-a4b8f4da69f2', 'y', '', '2021-03-31 15:46:04.187006-04', '2021-03-31 15:46:04.187006-04', 2, '74c64289-9838-4c7f-9e58-5e7264554e0f');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('a8e71d38-755c-464c-b151-fb1ec29d55e7', '867b0cb4-019f-4e24-95e7-a4b8f4da69f2', 'yutu', '', '2021-03-31 15:46:06.686044-04', '2021-03-31 15:46:06.686044-04', 3, '74c64289-9838-4c7f-9e58-5e7264554e0f');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('59529be5-f58a-4b2e-986e-0b2b545375be', '867b0cb4-019f-4e24-95e7-a4b8f4da69f2', '678', '', '2021-03-31 15:46:14.19419-04', '2021-03-31 15:46:14.19419-04', 5, '74c64289-9838-4c7f-9e58-5e7264554e0f');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('c3946b3b-67d4-42ad-b986-e939a4628853', '867b0cb4-019f-4e24-95e7-a4b8f4da69f2', '67u67u', '', '2021-03-31 15:46:27.652628-04', '2021-03-31 15:46:27.652628-04', 8, '74c64289-9838-4c7f-9e58-5e7264554e0f');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('7abed79f-50df-4341-a485-f9967008717f', '867b0cb4-019f-4e24-95e7-a4b8f4da69f2', '67u67u', '', '2021-03-31 15:46:30.591186-04', '2021-03-31 15:46:30.591186-04', 9, '74c64289-9838-4c7f-9e58-5e7264554e0f');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('56c9543e-62f8-439a-ae6b-5c83699662eb', '867b0cb4-019f-4e24-95e7-a4b8f4da69f2', 'hjkhjk', '', '2021-03-31 15:46:33.612492-04', '2021-03-31 15:46:33.612492-04', 10, '74c64289-9838-4c7f-9e58-5e7264554e0f');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('bb9682e2-082c-4201-9a77-03089449e3e4', '867b0cb4-019f-4e24-95e7-a4b8f4da69f2', 'uik', '', '2021-03-31 15:46:39.747579-04', '2021-03-31 15:46:39.747579-04', 12, '74c64289-9838-4c7f-9e58-5e7264554e0f');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('6654f454-d60a-4cbf-a61f-bc293fa12c82', '867b0cb4-019f-4e24-95e7-a4b8f4da69f2', 'uikuik', '', '2021-03-31 15:46:42.571381-04', '2021-03-31 15:46:42.571381-04', 13, '74c64289-9838-4c7f-9e58-5e7264554e0f');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('eecd3f7b-89fa-4282-9cbd-ff0cf916db0a', '867b0cb4-019f-4e24-95e7-a4b8f4da69f2', 'uik', '', '2021-03-31 15:46:44.72862-04', '2021-03-31 15:46:44.72862-04', 14, '74c64289-9838-4c7f-9e58-5e7264554e0f');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('216771e2-bd38-4e48-a4d8-0df32588a76c', '867b0cb4-019f-4e24-95e7-a4b8f4da69f2', 'uikuik', '', '2021-03-31 15:46:48.22414-04', '2021-03-31 15:46:48.22414-04', 15, '74c64289-9838-4c7f-9e58-5e7264554e0f');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('e34f2923-3f5e-4700-ac8e-9faa8f2239e1', '867b0cb4-019f-4e24-95e7-a4b8f4da69f2', 'sdfsdf', '', '2021-03-31 15:48:46.676458-04', '2021-03-31 15:48:46.676458-04', 17, '74c64289-9838-4c7f-9e58-5e7264554e0f');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('f667887a-5089-48bf-b9d3-26ea83904129', '867b0cb4-019f-4e24-95e7-a4b8f4da69f2', 'rtgrtg', '', '2021-03-31 15:52:29.812957-04', '2021-03-31 15:52:29.812957-04', 17, '74c64289-9838-4c7f-9e58-5e7264554e0f');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('4501c989-ac04-49e6-b73b-0382e87dc9ac', '867b0cb4-019f-4e24-95e7-a4b8f4da69f2', 'my title', '', '2021-03-31 15:46:22.326152-04', '2021-03-31 15:46:22.326152-04', 7, '74c64289-9838-4c7f-9e58-5e7264554e0f');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('e797521c-29b2-4499-991c-5b3673da150a', '867b0cb4-019f-4e24-95e7-a4b8f4da69f2', 'hjkhjkdsfs', '', '2021-03-31 15:46:36.838842-04', '2021-03-31 15:46:36.838842-04', 11, '74c64289-9838-4c7f-9e58-5e7264554e0f');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('3490974c-2590-451c-adf4-d5e6a5dcd781', '867b0cb4-019f-4e24-95e7-a4b8f4da69f2', 'uikuikerf', '', '2021-03-31 15:46:51.377163-04', '2021-03-31 15:46:51.377163-04', 16, '74c64289-9838-4c7f-9e58-5e7264554e0f');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('0d8a58df-f358-49f4-9f33-82d7ad863467', '6c66a454-84ca-4bbb-a74b-f3738ef8a988', 'erferfghjghj', '', '2021-03-31 16:47:52.099652-04', '2021-03-31 16:47:52.099652-04', 0, '74c64289-9838-4c7f-9e58-5e7264554e0f');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('9900fd38-bbd3-40d8-a08b-23d75a51ef43', '6544c4ae-5b59-4e89-953a-454d2567bf4b', 'erferfwed', '', '2021-03-31 15:45:22.054864-04', '2021-03-31 15:45:22.054864-04', 0, '74c64289-9838-4c7f-9e58-5e7264554e0f');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('dc407ad2-eca1-4d4d-b6aa-0ed737a77be2', '86d13426-dc2a-46b3-bfa6-7fbffa422e76', 'fghfhgfgh', '', '2021-03-31 15:03:08.004433-04', '2021-03-31 15:03:08.004433-04', 0, '74c64289-9838-4c7f-9e58-5e7264554e0f');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('bfbe0ebf-515a-4887-b064-b9828517a224', '757b6734-52b8-490c-8557-a0e5d0fab3b1', 'qwqwe', '', '2021-04-02 15:55:03.995659-04', '2021-04-02 15:55:03.995659-04', 0, 'ef5f1324-d5db-46ee-a787-d0878bca0585');


ALTER TABLE public.items ENABLE TRIGGER ALL;


ALTER TABLE public.comments DISABLE TRIGGER ALL;



ALTER TABLE public.comments ENABLE TRIGGER ALL;


