import sys
import os

# Modules
from PySide6.QtGui import *
from PySide6.QtQml import *

# Instance Class
if __name__ =="__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    engine.load(os.path.join(os.path.dirname(__file__), "../QML/Login.qml"))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())