import json
import requests

# Modules
from PySide6.QtCore import QObject

class apiBox(QObject):
    def __init__(self):
        QObject.__init__(self)
    
    def postLogin(self):
        pass

    def getFriends(self):
        pass

    def getPendigRequest(self):
        pass

    def postAcceptedRequest(self):
        pass

    def getIncomingMessage(self):
        pass

    def postOutgoingMessage(self):
        pass
