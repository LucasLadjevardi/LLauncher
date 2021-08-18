import sys
import os
import Toolbox
import MainView

from PySide6.QtGui import *
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import *
from PySide6.QtWidgets import *

class LoginModel(QObject):
    def __init__(self):
        QObject.__init__(self)
    
    toolBox = Toolbox.apiBox()
    # Signals

    ##########################

    # Definitions

    @Slot(str, str)
    def onLogin(self, user, passw):
        self.toolBox.postLogin(user, passw)
        # Window change if callback returns token
        if self.toolBox.token != "0" and self.toolBox.token != "" and self.toolBox.token != None:
            MainView.onChangeProp()
