

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

INSERT INTO public.retros (id, created_at, updated_at, title) VALUES ('74c64289-9838-4c7f-9e58-5e7264554e0f', '2021-03-31 13:51:02.031623-04', '2021-03-31 13:51:02.031623-04', 'Unity Game Growth Retro 4');
INSERT INTO public.retros (id, created_at, updated_at, title) VALUES ('8aa1c0eb-e0db-47e0-a69f-e2700746786a', '2021-04-02 17:02:42.527014-04', '2021-04-02 17:02:42.527014-04', 'asjdasd');
INSERT INTO public.retros (id, created_at, updated_at, title) VALUES ('9451012f-7680-46f6-a09e-f8c44d2a2c95', '2021-04-02 16:10:25.354931-04', '2021-04-02 16:10:25.354931-04', 'Super Awesome Team Retro');
INSERT INTO public.retros (id, created_at, updated_at, title) VALUES ('df6707fb-8bdc-417b-86f8-2056bb9d6abd', '2021-04-03 10:33:54.493603-04', '2021-04-03 10:33:54.493603-04', 'ytj');


ALTER TABLE public.retros ENABLE TRIGGER ALL;


ALTER TABLE public.columns DISABLE TRIGGER ALL;

INSERT INTO public.columns (id, title, retro_id, sort_order, created_at, updated_at) VALUES ('86d13426-dc2a-46b3-bfa6-7fbffa422e76', 'Needs to change', '74c64289-9838-4c7f-9e58-5e7264554e0f', 1, '2021-03-31 14:14:11.260913-04', '2021-03-31 14:14:11.260913-04');
INSERT INTO public.columns (id, title, retro_id, sort_order, created_at, updated_at) VALUES ('6c66a454-84ca-4bbb-a74b-f3738ef8a988', 'What can we do better?', '74c64289-9838-4c7f-9e58-5e7264554e0f', 2, '2021-03-31 14:58:14.769011-04', '2021-03-31 14:58:14.769011-04');
INSERT INTO public.columns (id, title, retro_id, sort_order, created_at, updated_at) VALUES ('6544c4ae-5b59-4e89-953a-454d2567bf4b', 'Flowers', '74c64289-9838-4c7f-9e58-5e7264554e0f', 3, '2021-03-31 14:58:19.041368-04', '2021-03-31 14:58:19.041368-04');
INSERT INTO public.columns (id, title, retro_id, sort_order, created_at, updated_at) VALUES ('232aab29-3e40-47d2-9ba7-14ca855a4d92', 'Action Items', '74c64289-9838-4c7f-9e58-5e7264554e0f', 5, '2021-03-31 14:58:22.887956-04', '2021-03-31 14:58:22.887956-04');
INSERT INTO public.columns (id, title, retro_id, sort_order, created_at, updated_at) VALUES ('867b0cb4-019f-4e24-95e7-a4b8f4da69f2', 'Went Well ❤️‍🔥', '74c64289-9838-4c7f-9e58-5e7264554e0f', 0, '2021-03-31 14:13:01.769953-04', '2021-03-31 14:13:01.769953-04');
INSERT INTO public.columns (id, title, retro_id, sort_order, created_at, updated_at) VALUES ('5f5a5576-0838-4a19-9554-069073396c6e', 'Went Well ❤️‍🔥', '9451012f-7680-46f6-a09e-f8c44d2a2c95', 0, '2021-04-02 16:10:36.311863-04', '2021-04-02 16:10:36.311863-04');
INSERT INTO public.columns (id, title, retro_id, sort_order, created_at, updated_at) VALUES ('cc513208-599c-4be0-bc1e-d5790875902c', 'Could be better', '9451012f-7680-46f6-a09e-f8c44d2a2c95', 1, '2021-04-02 16:10:45.509625-04', '2021-04-02 16:10:45.509625-04');
INSERT INTO public.columns (id, title, retro_id, sort_order, created_at, updated_at) VALUES ('9d9f3543-d6d2-4d57-868a-b6877ecddb33', 'Flowers 🌺', '9451012f-7680-46f6-a09e-f8c44d2a2c95', 2, '2021-04-02 16:11:23.365522-04', '2021-04-02 16:11:23.365522-04');
INSERT INTO public.columns (id, title, retro_id, sort_order, created_at, updated_at) VALUES ('92e0d894-0503-43aa-b010-58aa659aa79c', 'wed', '8aa1c0eb-e0db-47e0-a69f-e2700746786a', 0, '2021-04-02 17:02:45.27955-04', '2021-04-02 17:02:45.27955-04');
INSERT INTO public.columns (id, title, retro_id, sort_order, created_at, updated_at) VALUES ('d698e4d7-e610-4042-9091-42304ace7a5a', 'Action Items', '9451012f-7680-46f6-a09e-f8c44d2a2c95', 3, '2021-04-02 16:11:56.802625-04', '2021-04-02 16:11:56.802625-04');
INSERT INTO public.columns (id, title, retro_id, sort_order, created_at, updated_at) VALUES ('0c486392-35a0-4fdd-99fb-73ce820a6943', 'tyjytj', 'df6707fb-8bdc-417b-86f8-2056bb9d6abd', 0, '2021-04-03 10:33:59.016919-04', '2021-04-03 10:33:59.016919-04');


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
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('89ddf3b4-a24a-4aa0-84cf-d848a5d6fdf8', '5f5a5576-0838-4a19-9554-069073396c6e', 'Jason made this cool retro board in Haskell', '', '2021-04-02 16:12:34.362357-04', '2021-04-02 16:12:34.362357-04', 1, '9451012f-7680-46f6-a09e-f8c44d2a2c95');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('6b0f609a-8037-4230-9695-c3da3d59497d', '5f5a5576-0838-4a19-9554-069073396c6e', 'Coffee was really good on Thursday', '', '2021-04-02 16:12:52.488836-04', '2021-04-02 16:12:52.488836-04', 2, '9451012f-7680-46f6-a09e-f8c44d2a2c95');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('ef37afb2-f2ed-4e3f-8f24-338d8796b943', '5f5a5576-0838-4a19-9554-069073396c6e', 'This board works with websockets!', '', '2021-04-02 16:13:31.844567-04', '2021-04-02 16:13:31.844567-04', 4, '9451012f-7680-46f6-a09e-f8c44d2a2c95');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('b1cd20bb-98c5-4e3d-b24d-41bc6bdc90a2', '5f5a5576-0838-4a19-9554-069073396c6e', 'There''s no client-side JS for these pages', '', '2021-04-02 16:13:47.711695-04', '2021-04-02 16:13:47.711695-04', 5, '9451012f-7680-46f6-a09e-f8c44d2a2c95');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('ec0f1760-e914-45b3-a726-c900d3ebe238', 'cc513208-599c-4be0-bc1e-d5790875902c', 'Cat could sleep on lap more often', '', '2021-04-02 16:15:26.922106-04', '2021-04-02 16:15:26.922106-04', 0, '9451012f-7680-46f6-a09e-f8c44d2a2c95');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('2d5fe4cb-1824-4ee0-ba55-a8193339f04a', '9d9f3543-d6d2-4d57-868a-b6877ecddb33', 'Easter bunny for long weekend', '', '2021-04-02 16:16:13.434952-04', '2021-04-02 16:16:13.434952-04', 0, '9451012f-7680-46f6-a09e-f8c44d2a2c95');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('eb51ee10-8a80-4305-a2ec-71d3098f2fc8', 'd698e4d7-e610-4042-9091-42304ace7a5a', 'Add authentication', '', '2021-04-02 16:17:57.125966-04', '2021-04-02 16:17:57.125966-04', 1, '9451012f-7680-46f6-a09e-f8c44d2a2c95');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('a8c16faf-1813-4e17-bb07-64cf3df935b3', '92e0d894-0503-43aa-b010-58aa659aa79c', '\wed', '', '2021-04-02 17:02:47.734393-04', '2021-04-02 17:02:47.734393-04', 0, '8aa1c0eb-e0db-47e0-a69f-e2700746786a');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('e491f92b-1aa8-42e7-a902-34ac4546aa6d', '5f5a5576-0838-4a19-9554-069073396c6e', 'Shipped that awesome new feature everybody wanted!erf', '', '2021-04-02 16:12:12.618691-04', '2021-04-02 16:12:12.618691-04', 0, '9451012f-7680-46f6-a09e-f8c44d2a2c95');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('b82092ed-7251-4bbc-8ed8-c68e4125349d', '5f5a5576-0838-4a19-9554-069073396c6e', 'Live updates from postgres streamed to clients with websockets', '', '2021-04-02 16:14:34.800805-04', '2021-04-02 16:14:34.800805-04', 6, '9451012f-7680-46f6-a09e-f8c44d2a2c95');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('d975e66d-e0ed-4805-acc4-3d889a9ef463', 'd698e4d7-e610-4042-9091-42304ace7a5a', 'Add authorization', '', '2021-04-03 11:32:26.833082-04', '2021-04-03 11:32:26.833082-04', 1, '9451012f-7680-46f6-a09e-f8c44d2a2c95');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('158bfc94-fac6-400b-9c1c-d5770402dd0e', '5f5a5576-0838-4a19-9554-069073396c6e', 'Modals are awesine', '', '2021-04-03 10:26:44.758428-04', '2021-04-03 10:26:44.758428-04', 6, '9451012f-7680-46f6-a09e-f8c44d2a2c95');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('7af6e5f6-0767-4c90-8d90-71b438226069', '9d9f3543-d6d2-4d57-868a-b6877ecddb33', 'Awesome color theme', '', '2021-04-03 11:33:13.194766-04', '2021-04-03 11:33:13.194766-04', 1, '9451012f-7680-46f6-a09e-f8c44d2a2c95');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('855c04c0-f21e-44fd-b8d2-de6adcb2830a', 'd698e4d7-e610-4042-9091-42304ace7a5a', 'Add login and signup pages', '', '2021-04-03 11:33:24.33765-04', '2021-04-03 11:33:24.33765-04', 2, '9451012f-7680-46f6-a09e-f8c44d2a2c95');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('fe895eec-2b48-43c9-a433-fbc3db70c1cb', 'd698e4d7-e610-4042-9091-42304ace7a5a', 'Add welcome page', '', '2021-04-03 11:33:29.154936-04', '2021-04-03 11:33:29.154936-04', 3, '9451012f-7680-46f6-a09e-f8c44d2a2c95');
INSERT INTO public.items (id, column_id, title, description, created_at, updated_at, sort_order, retro_id) VALUES ('fa60cbdc-7df2-4627-b4a0-3fb1896c090d', 'd698e4d7-e610-4042-9091-42304ace7a5a', 'Add teams support', '', '2021-04-03 11:33:57.01878-04', '2021-04-03 11:33:57.01878-04', 4, '9451012f-7680-46f6-a09e-f8c44d2a2c95');


ALTER TABLE public.items ENABLE TRIGGER ALL;


ALTER TABLE public.comments DISABLE TRIGGER ALL;



ALTER TABLE public.comments ENABLE TRIGGER ALL;


