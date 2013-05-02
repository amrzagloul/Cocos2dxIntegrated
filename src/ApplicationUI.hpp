// Default empty project template
#ifndef ApplicationUI_HPP_
#define ApplicationUI_HPP_

#include <QObject>
#include <QThread>
#include <bb/cascades/Page>
#include <bb/cascades/ForeignWindowControl>

using namespace bb::cascades;

/*!
 * @brief Application pane object
 *
 *Use this object to create and init app UI, to create context objects, to register the new meta types etc.
 */
class ApplicationUI : public QThread
{
    Q_OBJECT
public:
    ApplicationUI();
    virtual ~ApplicationUI() {}
    void run();

public slots:
    void onWindowAttached(screen_window_t handle, const QString &group, const QString &id);

private:
    void runcocos2dx();
    Page* _page;
    ForeignWindowControl* _fwcontrol;

};


#endif /* ApplicationUI_HPP_ */
