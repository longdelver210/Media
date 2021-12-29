#ifndef TRANSLATION_H
#define TRANSLATION_H
#include <QObject>
#include <QTranslator>
#include <QGuiApplication>

class Translation : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString up READ getEmptyString NOTIFY currentLanguageChanged)
public:
    Translation( QObject *parent = nullptr);
    QString getEmptyString();
    void setCurrentLanguage(QString language);
    Q_INVOKABLE void selectLanguage(QString language);

signals:
    void languageChanged();
    void currentLanguageChanged();
private:
    QTranslator translator1;
    QTranslator translator2;
    QGuiApplication *m_app;

};

#endif // TRANSLATION_H
