import datetime

class Person:
    def __init__(self, name, dob, friends):
        self.name = name
        self.date_of_birth = self.isoFormat(str(dob))
        self.friends = friends

    
    def isoFormat(self, dob):
        year = dob[:4]
        month = dob[4:6]
        day = dob[6:8]
        self.date_of_birth = f'{year}/{month}/{day}'
        return str(self.date_of_birth)
    
    def __gt__(self, other):
        today = datetime.date.today()
        currentYear = today.year
        you = currentYear - int(other.date_of_birth[:4])
        me = currentYear - int(self.date_of_birth[:4])
        return int(me) > int(you)
        

    def __str__(self):
        return (f'Name: {self.name}\nDOB: {self.date_of_birth}\nFriends: {self.friends}')
    
    def add_friends(self, other):
        self.friends.append(other.name)
        other.friends.append(self.name)
        
    
    
jun = Person('jun', 20011002, ['nad','abz','oli'])
bill = Person('bill', 20001201, ['sam', 'tam', 'steve'])
print(jun.__str__())

jun.add_friends(bill)
print(bill.friends, jun.friends)
if jun > bill:
    print(True)
else:
    print(False)