import sys
import os

# Modules
from Models import Login,Main
from PySide6.QtGui import *
from PySide6.QtQml import *
from PySide6.QtCore import *


class mainView():

    def main(nr):

        if nr == 0:
            nr = 1

        engine = QQmlApplicationEngine()
        loginModel = Login.LoginModel()
        mainModel = Main.LoginModel()
        engine.rootContext().setContextProperty("mlogin", loginModel)
        engine.rootContext().setContextProperty("mmain", mainModel)

        def runningCode():
            #Connection to QML
            engine.load(os.path.join(os.path.dirname(__file__), "QML/Login.qml"))

        def onChanged():
            engine.load(os.path.join(os.path.dirname(__file__), "QML/Main.qml"))
        if nr == 1:
            runningCode()
        if nr == 2:
            onChanged()
        
        if not engine.rootObjects():
                sys.exit(-1)
        sys.exit(app.exec_())
        
        
        
# Instance Class
if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    mainView.main(0)