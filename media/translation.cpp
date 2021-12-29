#include "translation.h"
#include <QDebug>
Translation::Translation( QObject *parent)
    : QObject(parent)
{
    translator1.load(":/translator/string_us.qm");
    translator2.load(":/translator/string_vn.qm");
    m_app->installTranslator(&translator2);
}

QString Translation::getEmptyString()
{
    return "";
}


void Translation::setCurrentLanguage(QString language)
{
    if ( language.compare("us") == 0){
        m_app->installTranslator(&translator1);

        emit currentLanguageChanged();
    }else{
        m_app->installTranslator(&translator2);

        emit currentLanguageChanged();
    }
}

void Translation::selectLanguage(QString language)
{
    setCurrentLanguage(language);
}
