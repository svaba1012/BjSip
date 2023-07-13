.import "./local-storage.js" as Db


const registerUser = (username, password, extension) => {
    let db = Db.getDb();

    db.transaction(function(tx) {
        tx.executeSql('INSERT INTO Users(username, password, extension, is_used_last) VALUES(?,?,?,0)', [username, password, extension]);
    });
}

const loginUser = (username, password) => {
    let db = Db.getDb()


    var records = [];

    db.readTransaction(function(tx) {
        var result = tx.executeSql('SELECT * FROM Users WHERE username = ? AND password = ? ', [username, password]);
        for (var i = 0; i < result.rows.length; i++) {
            var record = result.rows.item(i);
            records.push(record);
        }
    });
    return records[0];
}

