import json

from Classes import Toolbox
from PySide6.QtGui import *
from PySide6.QtCore import *
from PySide6.QtWidgets import *


class MainModel(QObject):
    def __init__(self):
        QObject.__init__(self)
        #print("Du er her " + str(usertoken))
    toolBox = Toolbox.apiBox()
    friendsList = []
    
    # Signals
    listSignal = Signal(str)
    ##########################
    
    # Definitions
    def callApi(self,token):        
        self.toolBox.token = token
        print("du er nu her " + str(self.toolBox.token))
        self.toolBox.getFriends()
        self.getfriendsList(self.toolBox.fList)

    @Slot()
    def getfriendsList(self,fList):
        self.friendsList = fList
        self.getusername()

    @Slot()
    def getusername(self):
        for elem in self.friendsList:
            for user in elem:
                self.name = user
                self.listSignal.emit(str(self.name['username']))
            