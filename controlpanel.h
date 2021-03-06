#ifndef CONTROLPANEL_H
#define CONTROLPANEL_H

#include <QWidget>
#include <QPushButton>
#include <QSlider>
#include <QIcon>

class controlPanel : public QWidget
{
    Q_OBJECT
public:
    enum Widget{ PreviousButton, PlayPauseButton, NextButton};
    enum PlayPauseButtonState{Playing, Paused};
    explicit controlPanel(QWidget *parent = 0);

    const QObject * widget(controlPanel::Widget widget);

    void setPlayButtonIcon(const QIcon &);
    void setPauseButtonIcon(const QIcon &);
    void setNextButtonIcon(const QIcon &);
    void setPreviousButtonIcon(const QIcon &);

    void setState(controlPanel::PlayPauseButtonState);

signals:
    void volumeSliderValueChanged(int value);

public slots:
    void togglePlayPauseState();
    void recieveNewVolumeSliderValue(int value);

private:
    QPushButton * _playPauseButton;
    QPushButton * _nextButton;
    QPushButton * _previousButton;

    QSlider * _volumeSlider;
    QIcon _playButtonIcon, _pauseButtonIcon;
    PlayPauseButtonState _currentState;
};

#endif // CONTROLPANEL_H
