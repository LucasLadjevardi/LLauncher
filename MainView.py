import sys
import os

# Modules
from Models import Login
from PySide6.QtGui import *
from PySide6.QtQml import *
from PySide6.QtCore import *


class mainView():

    def main(nr):

        if nr == 0:
            app = QGuiApplication(sys.argv)
            nr = 1

        engine = QQmlApplicationEngine()
        loginModel = Login.LoginModel()
        engine.rootContext().setContextProperty("mlogin", loginModel)

        def runningCode():
            #Connection to QML
            engine.load(os.path.join(os.path.dirname(__file__), "QML/Login.qml"))

        def onChanged():
            engine.load(os.path.join(os.path.dirname(__file__), "QML/Home.qml"))
        if nr == 1:
            runningCode()
        if nr == 2:
            onChanged()
        
        if not engine.rootObjects():
                sys.exit(-1)
        sys.exit(app.exec_())
        
        
        
# Instance Class
if __name__ == "__main__":
    mainView.main(0)