import json

from Classes import Toolbox
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
    
            