import json
import requests

# Modules
from PySide6.QtCore import QObject

class apiBox(QObject):
    def __init__(self):
        QObject.__init__(self)
    
    def postLogin(self, user, passw):
        #API URL
        url = 'http://192.168.4.231:48935/api/Users/Login'
        #HEADERS
        headers = {'content-type':'application/json'}
        #BODY TO POST
        body = {
            'Username': user,
            'Password': passw
        }
        #STRINGIFY JSON BODY FOR API
        data=json.dumps(body, separators=(',',':'))
        #REQUEST POST FOR LOGIN
        r=requests.post(url=url, data=data, headers=headers)
        #SAVE TOKEN
        self.token = int(r.text)
        print(self.token) # USED FOR CHECKING # SAVE FOR LATER

    def getFriends(self):
        tknId = self.token
        print("nu er vi i api " + str(tknId))
        self.fList=[]
        #API URL
        url = 'http://192.168.4.231:48935/api/FriendsList/Friends/'+str(tknId)
        #HEADERS
        headers = {'content-type':'application/json'}
        #REQUEST GET FOR FRIENDSLIST
        r=requests.get(url=url, headers=headers)
        r=json.loads(r.text)
        #print(r)
        self.fList.clear()
        self.fList.append(r)
        #print(self.fList)

    def getPendigRequest(self):
        pass

    def postAcceptedRequest(self):
        pass

    def getIncomingMessage(self):
        pass

    def postOutgoingMessage(self):
        pass
