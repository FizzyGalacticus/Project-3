#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include "mediaplayertabwidget.h"
#include "controlpanel.h"
#include "lyricbox.h"
#include "progressbar.h"
#include <QIcon>
#include "videowidget.h"
#include <QMenuBar>
#include "user.h"

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private:
    Ui::MainWindow *ui;
    mediaPlayerTabWidget * _player;
    videoWidget * _videoWidget;
    controlPanel * _controlPanel;
    lyricBox * _lyricsBox;
    progressBar * _progressBar;
    QMenuBar * _menu;
    User * _user;

    //Icons
    QIcon _mainWindowIcon, _previousButtonIcon, _nextButtonIcon, _playButtonIcon,
            _pauseButtonIcon;

    void setupPlayer();
    void setupLyricsAndControlPanel();
    void setWidgetPositions();
    void setupMenuBar();
};

#endif // MAINWINDOW_H
