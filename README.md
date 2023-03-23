# Academy Backend

## Setup

1. [Install mongoDb](https://www.mongodb.com/docs/manual/installation/)
2. Run `mongosh` in your terminal
3. Run `use academy-local`
4. Import data into your local db. In the root you'll find a file called `seed-data.json` which you can use to populate your database. Run `mongoimport --jsonArray -d academy-local -c courses --file seed-data.json` 

