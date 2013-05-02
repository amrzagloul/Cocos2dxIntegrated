// Default empty project template
#include "applicationui.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include "AppDelegate.h"
#include "cocos2d.h"

using namespace bb::cascades;
USING_NS_CC;

ApplicationUI::ApplicationUI() {
	// create scene document from main.qml asset
	// set parent to created document to ensure it exists for the whole application lifetime
	QmlDocument *qml = QmlDocument::create("asset:///main.qml");

	if (!qml->hasErrors()) {

		qml->setContextProperty("_app", this);

		// create root object for the UI
		_page = qml->createRootObject<Page>();

		if (_page) {
			// set created root object as a scene
			Application::instance()->setScene(_page);

			runcocos2dx();
		}
	}
}

void ApplicationUI::runcocos2dx() {
	_fwcontrol = _page->findChild<ForeignWindowControl*>("myForeignWindow");
	_fwcontrol->setUpdatedProperties(WindowProperty::None);
	this->start();
}

void ApplicationUI::run() {
	// create the application instance
	AppDelegate app;

	int width, height;
	const char *width_str, *height_str;
	width_str = getenv("WIDTH");
	height_str = getenv("HEIGHT");
	if (width_str && height_str) {
		width = atoi(width_str);
		height = atoi(height_str);
	} else {
		width = 1024;
		height = 600;
	}

	QString _id = _fwcontrol->windowId();
	QString _group = _fwcontrol->windowGroup();

	CCEGLView* eglView = CCEGLView::sharedOpenGLView(
			_group.toAscii().constData(), _id.toAscii().constData());
	eglView->setFrameSize(width, height);

	CCApplication::sharedApplication()->run();
}

void ApplicationUI::onWindowAttached(screen_window_t handle,
		const QString &group, const QString &id) {
	// This signal will only be emitted when window with
	// specified handle is attached;
	// application change attached window's properties;
	// no need to call bindToWindow() because it will be done
	// automatically in this case

	qDebug() << "Window handle is " << handle << "  group id is " << group
			<< " and attached window id is " << id;
}

