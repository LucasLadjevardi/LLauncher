import MainView

from PySide6.QtGui import *
from PySide6.QtCore import *
from PySide6.QtWidgets import *
from Classes import Toolbox

class LoginModel(QObject):
    def __init__(self):
        QObject.__init__(self)
    
    toolBox = Toolbox.apiBox()
    # Signals
    changeWindow = Signal(bool)
    ##########################

    # Definitions
    @Slot(str, str, bool)
    def onLogin(self, user, passw, closeWindow):
        self.toolBox.postLogin(user, passw)
        # Window change if callback returns token
        if self.toolBox.token != "0" and self.toolBox.token != "" and self.toolBox.token != None:
            self.changeWindow.emit(closeWindow)
            MainView.mainView.main(2)
            
            
