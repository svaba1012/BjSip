.import QtQuick.LocalStorage 2.0 as Sql

let getDb = () => Sql.LocalStorage.openDatabaseSync("bjDatabase", "1.0", "Bj Database", 1000000);

let initDb = () => {
    let db = getDb();
    db.transaction(
        function(tx) {
            // Create the database if it doesn't already exist
            tx.executeSql('CREATE TABLE IF NOT EXISTS Users( \
                user_id INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
                username TEXT NOT NULL UNIQUE,
                password TEXT NOT NULL,
                extension INTEGER NOT NULL,
                is_used_last INTEGER NOT NULL)'
            );
            tx.executeSql('CREATE TABLE IF NOT EXISTS Contacts( \
                contact_id INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
                contact_name TEXT NOT NULL,
                extension INTEGER NOT NULL,
                creator_user_id INTEGER NOT NULL,
                FOREIGN KEY (creator_user_id)
                REFERENCES Users (user_id)
                )'
            );
            tx.executeSql('CREATE TABLE IF NOT EXISTS Call_history( \
                call_history_id INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
                buddy_extension INTEGER NOT NULL,
                user_id INTEGER NOT NULL,
                media_type INTEGER NOT NULL,
                type INTEGER NOT NULL,
                length INTEGER NOT NULL,
                time INTEGER NOT NULL,
                FOREIGN KEY (user_id) REFERENCES Users (user_id)
                )'
            );
        }
    )
}
