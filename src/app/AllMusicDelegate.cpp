#include "AllMusicDelegate.h"

#include <QDebug>

#include "qslistmodel.h"
#include "qsdiffrunner.h"

#include "libphoenixplayer_global.h"
#include "LibPhoenixPlayerMain.h"
#include "AudioMetaObject.h"

#include "MusicLibrary/MusicLibraryManager.h"

using namespace PhoenixPlayer;
using namespace PhoenixPlayer::MusicLibrary;

AllMusicDelegate::AllMusicDelegate(QObject *parent)
    : QSListModel(parent)
    , m_keyFiled(AudioMetaObject::keyHash ())
{
    m_libraryMgr = phoenixPlayerLib->libraryMgr ();
    refresh();
}

AllMusicDelegate::~AllMusicDelegate()
{

}

void AllMusicDelegate::refresh()
{
    m_dataList.clear ();
    m_dataList = m_libraryMgr->allTracks ();
    sync ();
}

void AllMusicDelegate::sync()
{
    QSDiffRunner runner;
    runner.setKeyField (m_keyFiled);
    QVariantList list;
    foreach (AudioMetaObject o, m_dataList) {
        list.append (o.toMap ());
    }
    QList<QSPatch> patches = runner.compare (this->storage (), list);
    runner.patch (this, patches);
}