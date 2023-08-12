.import "./local-storage.js" as Db

const addContact = (contactName, extension, creatorId) => {
    let db = Db.getDb();
    db.transaction(function(tx) {
        tx.executeSql('INSERT INTO Contacts(contact_name, extension, creator_user_id) VALUES(?,?,?)', [contactName, extension, creatorId]);
    });
}

const getContacts = (creatorId) => {
    let db = Db.getDb();
    let records = [];
    db.readTransaction(function(tx) {
        let result = tx.executeSql('SELECT * FROM Contacts WHERE creator_user_id = ? ORDER BY contact_name', [creatorId]);
        for (var i = 0; i < result.rows.length; i++) {
            var record = result.rows.item(i);
            records.push(record);
        }
    });
    return records;
}

const removeContact = (contactId) => {
    console.log("Implement later");
}

const editContact = (contactId) => {
    console.log("Implement later");
}
