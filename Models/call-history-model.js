.import "./local-storage.js" as Db

const addCallHistory = (buddyExtension, userId, mediaType, type, length, time) => {
    let db = Db.getDb();
    db.transaction(function(tx) {
        tx.executeSql('INSERT INTO Call_history \
                    (buddy_extension, user_id, media_type, type, length, time)
                     VALUES(?,?,?,?,?)', [buddyExtension, userId, mediaType, type, length, time]);

    });
}

const getCallHistory = (userId) => {
    let db = Db.getDb();
    let records = [];
    db.readTransaction(function(tx) {
        let result = tx.executeSql('SELECT * FROM Call_history WHERE user_id = ?', [userId]);
        for (var i = 0; i < result.rows.length; i++) {
            var record = result.rows.item(i);
            records.push(record);
        }
    });
    return records;
}
