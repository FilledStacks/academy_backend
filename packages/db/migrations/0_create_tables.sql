CREATE TABLE IF NOT EXISTS "db_users" (
  "id" serial NOT NULL,
  "auth_id" text NULL,
  "email" text NOT NULL,
  "name" text NOT NULL,
  "payment_id" text NOT NULL
);

CREATE TABLE IF NOT EXISTS "db_purchases" (
  "id" serial NOT NULL,
  "item_id" text NOT NULL,
  "date" timestamp NOT NULL,
  "course_price" int8 NOT NULL,
  "purchase_price" int8 NOT NULL,
  "purchase_ref" text NOT NULL,
  "type" int8 NOT NULL,
  "db_user_id" int8 NULL
);

CREATE TABLE IF NOT EXISTS "db_progresses" (
  "id" serial NOT NULL,
  "course_id" int8 NOT NULL,
  "db_user_id" int8 NULL
);

CREATE TABLE IF NOT EXISTS "db_courses" (
  "id" serial NOT NULL,
  "title" text NOT NULL,
  "description" text NOT NULL,
  "price" int8 NOT NULL,
  "benefits" _text NOT NULL
);

CREATE TABLE IF NOT EXISTS "db_modules" (
  "id" serial NOT NULL,
  "title" text NOT NULL,
  "price" int8 NOT NULL,
  "db_course_id" int8 NULL
);

CREATE TABLE IF NOT EXISTS "db_chapters" (
  "id" serial NOT NULL,
  "title" text NOT NULL,
  "description" text NOT NULL,
  "video_id" text NOT NULL,
  "price" int8 NOT NULL,
  "db_module_id" int8 NULL
);