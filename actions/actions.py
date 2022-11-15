# This files contains your custom actions which can be used to run
# custom Python code.
#
# See this guide on how to implement these action:
# https://rasa.com/docs/rasa/custom-actions


# This is a simple example for a custom action which utters "Hello World!"

from typing import Any, Text, Dict, List

from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
import requests
import nltk
import re
# nltk.download('punkt')
# nltk.download('averaged_perceptron_tagger')
account_id = ""
basic = 0
extra = 0
sal = 0

class ActionSalary(Action):
    
    def name(self) -> Text:
        return "actionsalary"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        global sal
        sall = tracker.latest_message.get('text')
        ee = re.findall(r'\d+', sall) 
        sal_str = ""
        for e in ee:
            sal_str+=e 
        sal =  int(sal_str)  
        print("Salary",sal)  

        return []

class ActionBasic(Action):
    
    def name(self) -> Text:
        return "actionbasic"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        global basic
        basicc = tracker.latest_message.get('text')
        print(basicc)
        ee = re.findall(r'\d+', basicc) 
        basic_str = ""
        for e in ee:
            basic_str+=e 
        basic =  int(basic_str)
        print("Basic",basic)  

        return []

class ActionExtra(Action):
    
    def name(self) -> Text:
        return "actionextra"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        global extra
        extraa = tracker.latest_message.get('text')
        print(extraa)
        ee = re.findall(r'\d+', extraa)
        extra_str = ""
        for e in ee:
            extra_str+=e
        extra =  int(extra_str) 
        print("Extra",extra)  

        return []

class ActionPortfolio(Action):
    
    def name(self) -> Text:
        return "actionportfolio"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        print("Here")
        base_url = "https://tokenbalance-production.up.railway.app/api/labels/"
        final_url = base_url + str(account_id)
        print(final_url)
        
        r = requests.get(url = final_url)
        response = r.json()
        print(response)
        balance = response['labelData'][0]['labelAmt']
        print(balance)
        ideal_bal = 6*sal
        print("Ideal bal",ideal_bal)
        if balance<ideal_bal:
            dispatcher.utter_message(response = "utter_idealfund", bal = balance, ib = ideal_bal)
        else:
            dispatcher.utter_message(text = "Great! you already have sufficent emergency fund.")
            dispatcher.utter_message(text="You could also check out by investing your extra lumpsum amount in our FDs/Gold/Bonds")
            fdideal = balance + (balance*6)//100
            gbideal = balance + (balance*9)//100
            dispatcher.utter_message(text="Current FD's interest is 6%, your lumpsump will become:Rs.{fdideal}".format(fdideal=fdideal))
            dispatcher.utter_message(text="If you choose to invest in our Gold or our bonds, considering current interest rate(9%) your lumpsump will become Rs.:{gbideal}".format(gbideal=gbideal))

        invbal = sal-basic-extra
        ideal_savings = (sal*20)//100
        A = (invbal*50)//100 
        YR = 12
        Y = 25

        MR = YR/12/100
        M = Y * 12

        FV = A * ((((1 + MR)**(M))-1) * (1 + MR))/MR
        FV = round(FV)
        print("The expected amount you will get is:",FV)
        dispatcher.utter_message(text="If you wish to start SIP of 50% of your monthly savings i.e., Rs.{A} in our Mututal Fund SIP Plan, considering annual return of 12% from past years(varies), by the end of 25 years you will have Rs.{FV}".format(A=A,FV=FV))
        dispatcher.utter_message(text = "Rest of the savings amount can be used for acheiving your small financial goals.")
        if invbal<ideal_savings:
            dispatcher.utter_message(text="Your Income to Expense and Savings ratio is not good.")
            ideal_basic = (sal*50)//100
            ideal_extra = (sal*30)//100
            dispatcher.utter_message(response = "utter_idealratio", ideal_basic = ideal_basic, ideal_extra = ideal_extra,ideal_savings=ideal_savings)
        



        return []

class ActionHelloWorld(Action):

    def name(self) -> Text:
        return "action_hello_world"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        global account_id
        account_id = tracker.latest_message.get("entities")
        print(account_id)
        account_id =  account_id[0]["value"]     
        print(account_id)  

        return []

class AccountBalance(Action):

    def name(self) -> Text:
        return "accountbalance"

    async def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

                                                               
        base_url = "https://tokenbalance-production.up.railway.app/api/labels/"
        final_url = base_url + str(account_id)
        try:
            r = requests.get(url = final_url)
            response = r.json()
            print(response)
            balance = response['labelData'][0]['labelAmt']
            dispatcher.utter_message(response = "utter_balance", bal = balance)
        except:
            dispatcher.utter_message(f"This account id doesn't exist")

        return []

class TempFinancialGoal(Action):
    
    def name(self) -> Text:
        return "tempfinancialgoal"

    async def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        user_input = tracker.latest_message.get('text')
        print(user_input)
        sent = nltk.word_tokenize(user_input)
        sent = nltk.pos_tag(sent)
        tok_list = []
        for se in sent:
            if se[1]=='NN' or se[1]=='NNP':
                tok_list.append(se[0])

        print(tok_list)
        goal=""
        if(len(tok_list)==0):
            up = user_input.split(' ')
            goal = up[-1]
        else:
            for tok in tok_list:
                goal = goal + "_" + tok 
            goal = goal[1:]
        print(goal)                                                       
        base_url = "https://tokenbalance-production.up.railway.app/api/labels/"
        body_data = {"_acctn":account_id,"label_name":goal,"labelAmt": 0,"currentAmt":0,"label_type": "goal","transaction_labels":[],"visibility":0}
        print(body_data)
        try:
            r = requests.post(url = base_url,json=body_data)
            print(r)
        except:
            dispatcher.utter_message(f"This account id doesn't exist")

        return []

class FinancialGoal(Action):
    
    def name(self) -> Text:
        return "financialgoal"

    async def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        user_input = tracker.latest_message.get('text')
        print(user_input)
        sent = nltk.word_tokenize(user_input)
        sent = nltk.pos_tag(sent)
        tok_list = []
        for se in sent:
            if se[1]=='NN' or se[1]=='NNP':
                tok_list.append(se[0])

        print(tok_list)
        goal=""
        if(len(tok_list)==0):
            up = user_input.split(' ')
            goal = up[-1]
        else:
            for tok in tok_list:
                goal = goal + "_" + tok 
            goal = goal[1:]
        print(goal)                                                       
        base_url = "https://tokenbalance-production.up.railway.app/api/labels/"
        body_data = {"_acctn":account_id,"label_name":goal,"labelAmt": 0,"currentAmt":0,"label_type": "goal","transaction_labels":[],"visibility":1}
        print(body_data)
        try:
            r = requests.post(url = base_url,json=body_data)
            print(r)
            if r.status_code ==200:
                dispatcher.utter_message("Financial goal created")
            else:
                dispatcher.utter_message("There is some error in the data you have provided :(")
        except:
            dispatcher.utter_message(f"This account id doesn't exist")

        return []

class ListFinancialGoal(Action):
    
    def name(self) -> Text:
        return "listfinancialgoal"

    async def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        print(account_id) 
                                                   
        base_url = "https://tokenbalance-production.up.railway.app/api/labels/"
        final_url = base_url + str(account_id)
        
        r = requests.get(url = final_url)
        response = r.json()['labelData']
        print(response)
        label_name=[]

        # for r in response:
        try:
            dispatcher.utter_message("Your Financial Goals are:\n")
            for r in response:
                label_name = r['label_name']
                labelAmt = r['labelAmt']
                currentAmt = r['currentAmt']
                dispatcher.utter_message(response = "utter_listlabel", goal = label_name, tg = labelAmt, ca= currentAmt)

        except:
            dispatcher.utter_message(f"This account id doesn't exist")

        return []

