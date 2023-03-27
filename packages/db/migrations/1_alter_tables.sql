ALTER TABLE "db_users"
  ADD PRIMARY KEY ( "id" );

ALTER TABLE "db_purchases"
  ADD PRIMARY KEY ( "id" );

ALTER TABLE "db_progresses"
  ADD PRIMARY KEY ( "id" );

ALTER TABLE "db_courses"
  ADD PRIMARY KEY ( "id" );

ALTER TABLE "db_modules"
  ADD PRIMARY KEY ( "id" );

ALTER TABLE "db_chapters"
  ADD PRIMARY KEY ( "id" );

ALTER TABLE "db_purchases"
  ADD FOREIGN KEY ( "db_user_id" ) REFERENCES "db_users" ( "id" ) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "db_progresses"
  ADD FOREIGN KEY ( "course_id" ) REFERENCES "db_courses" ( "id" ) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD FOREIGN KEY ( "db_user_id" ) REFERENCES "db_users" ( "id" ) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "db_modules"
  ADD FOREIGN KEY ( "db_course_id" ) REFERENCES "db_courses" ( "id" ) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "db_chapters"
  ADD FOREIGN KEY ( "db_module_id" ) REFERENCES "db_modules" ( "id" ) ON DELETE SET NULL ON UPDATE CASCADE;