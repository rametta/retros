-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE retros (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    title TEXT NOT NULL
);
CREATE TABLE columns (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    title TEXT NOT NULL,
    retro_id UUID NOT NULL,
    sort_order INT DEFAULT 0 NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);
CREATE TABLE items (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    column_id UUID NOT NULL,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    sort_order INT DEFAULT 0 NOT NULL,
    retro_id UUID NOT NULL
);
CREATE TABLE comments (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    item_id UUID NOT NULL,
    title TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    retro_id UUID NOT NULL
);
CREATE TABLE users (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    fullname TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    locked_at TIMESTAMP WITH TIME ZONE DEFAULT NULL,
    failed_login_attempts INT DEFAULT 0 NOT NULL
);
CREATE TABLE teams (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    title TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    owner_id UUID DEFAULT uuid_generate_v4() NOT NULL
);
CREATE TABLE team_members (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    team_id UUID NOT NULL,
    user_id UUID NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);
ALTER TABLE columns ADD CONSTRAINT columns_ref_retro_id FOREIGN KEY (retro_id) REFERENCES retros (id) ON DELETE CASCADE;
ALTER TABLE comments ADD CONSTRAINT comments_ref_item_id FOREIGN KEY (item_id) REFERENCES items (id) ON DELETE CASCADE;
ALTER TABLE comments ADD CONSTRAINT comments_ref_retro_id FOREIGN KEY (retro_id) REFERENCES retros (id) ON DELETE CASCADE;
ALTER TABLE items ADD CONSTRAINT items_ref_column_id FOREIGN KEY (column_id) REFERENCES columns (id) ON DELETE CASCADE;
ALTER TABLE items ADD CONSTRAINT items_ref_retro_id FOREIGN KEY (retro_id) REFERENCES retros (id) ON DELETE CASCADE;
ALTER TABLE team_members ADD CONSTRAINT team_members_ref_team_id FOREIGN KEY (team_id) REFERENCES teams (id) ON DELETE CASCADE;
ALTER TABLE team_members ADD CONSTRAINT team_members_ref_user_id FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE;
ALTER TABLE teams ADD CONSTRAINT teams_ref_user_id FOREIGN KEY (owner_id) REFERENCES users (id) ON DELETE CASCADE;
