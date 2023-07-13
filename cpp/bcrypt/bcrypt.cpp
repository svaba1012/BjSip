#include "bcrypt.h"
#include "qtbcrypt.h"

Bcrypt::Bcrypt(QObject *parent)
    : QObject{parent}
{

}

QString Bcrypt::generateSalt(){
    return QtBCrypt::generateSalt();
}

QString Bcrypt::hashPassword(QString& password, QString& salt){
    return QtBCrypt::hashPassword(password, salt);
}
