from inspect import signature
import requests
import base64
from fastapi import FastAPI
from typing import List, Optional
import uvicorn
from pydantic import BaseModel
import urllib
import base64
from skimage.metrics import structural_similarity as ssim
import numpy as np

from azure.core.credentials import AzureKeyCredential
from azure.ai.formrecognizer import DocumentAnalysisClient


app = FastAPI()

class Item(BaseModel):
    url: str
    kyc: str

def removeWhiteSpace(img):
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    gray = 255*(gray < 128).astype(np.uint8) 
    coords = cv2.findNonZero(gray)
    x, y, w, h = cv2.boundingRect(coords)
    rect = img[y:y+h, x:x+w]
    return rect
    
def match(img1, img2):
    img1 = removeWhiteSpace(img1)
    img2 = removeWhiteSpace(img2)
    
    img1 = cv2.cvtColor(img1, cv2.COLOR_BGR2GRAY)
    img2 = cv2.cvtColor(img2, cv2.COLOR_BGR2GRAY)
    
    img1 = cv2.resize(img1, (300, 300))
    img2 = cv2.resize(img2, (300, 300))
    similarity_value = "{:.2f}".format(ssim(img1, img2,gaussian_weights = True,sigma= 1.2,use_sample_covariance = False)*100)
    return float(similarity_value)

def cheque(formUrl):

    endpoint = "https://wellsforgot123.cognitiveservices.azure.com/"
    key = ""

    # sample document
    #formUrl = """https://www.elearnmarkets.com/blog/wp-content/uploads/2016/01/bearer-cheque.jpg"""

    document_analysis_client = DocumentAnalysisClient(
            endpoint=endpoint, credential=AzureKeyCredential(key)
        )
        
    poller = document_analysis_client.begin_analyze_document_from_url("prebuilt-document", formUrl)
    result = poller.result()

    print("----Key-value pairs found in document----")
    for kv_pair in result.key_value_pairs:
        if kv_pair.key and kv_pair.value:
            print("Key '{}': Value: '{}'".format(kv_pair.key.content, kv_pair.value.content))
        else:

            print("Key '{}': Value:".format(kv_pair.key.content))
    return result

def signverification(imgurl,formUrl):
    img1 = base64.b64decode(formUrl)
    img2 = base64.b64decode(imgurl)
    crop_img = img1[200:280,595:800]
    similarity_value = match(img1,img2)
    if similarity_value > 65:
        return {"signature":1}
    else:
        return {"signature":0}


@app.get("/")
async def hey():
    return "test" 

@app.post("/chequeanalytics/")
async def create_items(item:Item):
    return cheque(item.url)

@app.post("/kycverification/")
async def create_items(item:Item):
    return signverification(item.url, item.kyc)