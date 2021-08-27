import sys
import os

# Modules
from Models import Login,Main
from PySide6.QtGui import *
from PySide6.QtQml import *
from PySide6.QtCore import *


usertoken = int
class mainView():

    
    def main(nr):

        engine = QQmlApplicationEngine()        
        loginModel = Login.LoginModel()
       

        def loadLogin():
            #Connection to QML
            
            engine.rootContext().setContextProperty("mlogin", loginModel)
            engine.load(os.path.join(os.path.dirname(__file__), "QML/Login.qml"))

        def loadMain():
            mainModel = Main.MainModel()
            engine.rootContext().setContextProperty("mmain", mainModel)
            engine.load(os.path.join(os.path.dirname(__file__), "QML/Main.qml"))
            mainModel.callApi(usertoken)
        if nr == 1:
            loadLogin()
        if nr == 2:
            loadMain()
        
        if not engine.rootObjects():
                sys.exit(-1)
        sys.exit(app.exec())
        
        
        
# Instance Class
if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    mainView.main(1)