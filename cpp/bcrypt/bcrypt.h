#ifndef BCRYPT_H
#define BCRYPT_H

#include <QObject>
#include <QString>

class Bcrypt : public QObject
{
    Q_OBJECT
public:
    explicit Bcrypt(QObject *parent = nullptr);

public slots:
    QString generateSalt();
    QString hashPassword(QString& password, QString& salt);

signals:

};

#endif // BCRYPT_H
