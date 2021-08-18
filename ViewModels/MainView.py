import sys
import os
import Login

# Modules
from PySide6.QtGui import *
from PySide6.QtQml import *
from PySide6.QtCore import Signal

# Signal
onChangeWindow = Signal(bool)


def onChangeProp(closeWindow):
    engine.load(os.path.join(os.path.dirname(__file__), "../QML/Main.qml"))
    onChangeWindow.emit(closeWindow)


# Instance Class
if __name__ =="__main__":
    
    loginModel = Login.LoginModel()
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    engine.load(os.path.join(os.path.dirname(__file__), "../QML/Login.qml"))

    #Connection to QML
    engine.rootContext().setContextProperty("ModelLogin", loginModel)

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())