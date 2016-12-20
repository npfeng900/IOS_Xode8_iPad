
var target = UIATarget.localTarget();

target.setDeviceOrientation(UIA_DEVICE_ORIENTATION_PORTRAIT);
target.frontMostApp().mainWindow().buttons()["Add"].tap();
target.frontMostApp().mainWindow().buttons()["Switch"].tap();
target.frontMostApp().mainWindow().buttons()["Remove"].tap();
target.frontMostApp().mainWindow().buttons()["Add"].tap();
target.frontMostApp().mainWindow().buttons()["Switch"].tap();
target.frontMostApp().mainWindow().buttons()["Remove"].tap();
target.frontMostApp().mainWindow().buttons()["Add"].tap();
target.frontMostApp().mainWindow().buttons()["Remove"].tap();
