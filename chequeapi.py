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
import cv2
from skimage.segmentation import clear_border
from imutils import contours
import imutils
from azure.core.credentials import AzureKeyCredential
from azure.ai.formrecognizer import DocumentAnalysisClient
import re
import json
from word2number import w2n


app = FastAPI()
charNames = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0","T", "U", "A", "D"]


def extract_digits_and_symbols(image, charCnts, minW=5, minH=15):

	charIter = charCnts.__iter__()
	rois = []
	locs = []
	while True:
		try:
			c = next(charIter)
			(cX, cY, cW, cH) = cv2.boundingRect(c)
			roi = None

			if cW >= minW and cH >= minH:
				
				roi = image[cY:cY + cH, cX:cX + cW]
				rois.append(roi)
				locs.append((cX, cY, cX + cW, cY + cH))

			else:

				parts = [c, next(charIter), next(charIter)]
				(sXA, sYA, sXB, sYB) = (np.inf, np.inf, -np.inf,
					-np.inf)

				for p in parts:
					(pX, pY, pW, pH) = cv2.boundingRect(p)
					sXA = min(sXA, pX)
					sYA = min(sYA, pY)
					sXB = max(sXB, pX + pW)
					sYB = max(sYB, pY + pH)

				
				roi = image[sYA:sYB, sXA:sXB]
				rois.append(roi)
				locs.append((sXA, sYA, sXB, sYB))


		except StopIteration:
			break
	return (rois, locs)


class Item(BaseModel):
    url: str

class kycItem(BaseModel):
    newurl: str
    kyc : str

def url_image(url):
    resp = urllib.request.urlopen(url)
    image = np.asarray(bytearray(resp.read()), dtype="uint8")
    image = cv2.imdecode(image, cv2.IMREAD_COLOR)
    return image

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
    key = "<API-KEY>"
    try:
        document_analysis_client = DocumentAnalysisClient(
                endpoint=endpoint, credential=AzureKeyCredential(key)
            )
            
        poller = document_analysis_client.begin_analyze_document_from_url("prebuilt-document", formUrl)
        result = poller.result()

        cimage = url_image(formUrl)
        ref = cv2.imread('micr.png')
        micr_code = micr(cimage,ref)
        print(micr_code)
        micr_str = ""
        for code in micr_code:
            micr_str+=code
        out = result.to_dict()['content']
        print(out)
        x = re.findall('[0-9]+', out)
        x = sorted(x, key=len)
        idx = out.find(x[-1])
        fin_out = out[0:idx+len(x[-1])]
        try:
            ifsidx = out.lower().find("pay")
            ifsc_patt = out[0:ifsidx]
            ifs_match = re.search('([A-Za-z0]{4})(0\d{6})$', ifsc_patt)
            ifsc_code = ifs_match.group(0)
            print(ifsc_code)
            bnk = out.lower().find("bank")
            pcode = re.findall(r'(\d{6})', out)
            output = {"Bank":out[0:bnk+4],"Account No":x[-1],"Pincode":pcode[0], "MICR Code":micr_str,"IFSC Code":ifsc_code,"Name":out[ifsidx+3:ifsidx+20].replace('\n','')}
        except:
            pass
        try:
            URL = "https://ifsc.razorpay.com/"
            
            data = requests.get(URL+ifsc_code).json()
            
            data["MICR Code"] = micr_str
            data["Account No"] = x[-1]
            data["Name"] = out[ifsidx+3:ifsidx+20].replace('\n','')
        except:
            return output

        try:
            ruidx = out.find('₹')
            print(ruidx)
            newr = out[ruidx:ruidx+12]
            newrr = newr.find('\n')
            print("newr")
            print(newr)
            xx = re.findall('[0-9]+', newr)
            print("X")
            print(xx)
            amttt=""
            for a in xx:
                amttt +=a
            data["Amount"]=amttt
            return data
        except:
            try:
                amt =  w2n.word_to_num(out)
                data["Amount"] = amt
                return data
            except:
                return output

    except:
        return "Error in Uploaded Image"

def micr(image,ref):    
    ref = cv2.cvtColor(ref, cv2.COLOR_BGR2GRAY)
    ref = imutils.resize(ref, width=400)
    ref = cv2.threshold(ref, 0, 255, cv2.THRESH_BINARY_INV |
        cv2.THRESH_OTSU)[1]
    refCnts = cv2.findContours(ref.copy(), cv2.RETR_EXTERNAL,
	cv2.CHAIN_APPROX_SIMPLE)
    refCnts = imutils.grab_contours(refCnts)
    refCnts = contours.sort_contours(refCnts, method="left-to-right")[0]
    refROIs = extract_digits_and_symbols(ref, refCnts,
        minW=10, minH=20)[0]
    chars = {}

    for (name, roi) in zip(charNames, refROIs):
        roi = cv2.resize(roi, (36, 36)) 
        chars[name] = roi
    rectKernel = cv2.getStructuringElement(cv2.MORPH_RECT, (17, 7))
    output = []
    (h, w,) = image.shape[:2]
    delta = int(h - (h * 0.2))
    bottom = image[delta:h, 0:w]
    gray = cv2.cvtColor(bottom, cv2.COLOR_BGR2GRAY)
    blackhat = cv2.morphologyEx(gray, cv2.MORPH_BLACKHAT, rectKernel)
    gradX = cv2.Sobel(blackhat, ddepth=cv2.CV_32F, dx=1, dy=0,
        ksize=-1)
    gradX = np.absolute(gradX)
    (minVal, maxVal) = (np.min(gradX), np.max(gradX))
    gradX = (255 * ((gradX - minVal) / (maxVal - minVal)))
    gradX = gradX.astype("uint8")
    gradX = cv2.morphologyEx(gradX, cv2.MORPH_CLOSE, rectKernel)
    thresh = cv2.threshold(gradX, 0, 255,
        cv2.THRESH_BINARY | cv2.THRESH_OTSU)[1]
    thresh = clear_border(thresh)

    groupCnts = cv2.findContours(thresh.copy(), cv2.RETR_EXTERNAL,
        cv2.CHAIN_APPROX_SIMPLE)
    groupCnts = imutils.grab_contours(groupCnts)
    groupLocs = []
    for (i, c) in enumerate(groupCnts):
        (x, y, w, h) = cv2.boundingRect(c)
        if w > 50 and h > 15:
            groupLocs.append((x, y, w, h))
    # sort the digit locations from left-to-right
    groupLocs = sorted(groupLocs, key=lambda x:x[0])

    for (gX, gY, gW, gH) in groupLocs:
            # initialize the group output of characters
        groupOutput = []
        group = gray[gY - 5:gY + gH + 5, gX - 5:gX + gW + 5]
        group = cv2.threshold(group, 0, 255,
            cv2.THRESH_BINARY_INV | cv2.THRESH_OTSU)[1]
        charCnts = cv2.findContours(group.copy(), cv2.RETR_EXTERNAL,
            cv2.CHAIN_APPROX_SIMPLE)
        charCnts = imutils.grab_contours(charCnts)
        charCnts = contours.sort_contours(charCnts,
            method="left-to-right")[0]
        (rois, locs) = extract_digits_and_symbols(group, charCnts)
        for roi in rois:
            scores = []
            roi = cv2.resize(roi, (36, 36))

            for charName in charNames:

                result = cv2.matchTemplate(roi, chars[charName],
                    cv2.TM_CCOEFF)
                (_, score, _, _) = cv2.minMaxLoc(result)
                scores.append(score)
            print(np.argmax(scores))
            groupOutput.append(charNames[np.argmax(scores)])
        cv2.rectangle(image, (gX - 10, gY + delta - 10),
            (gX + gW + 10, gY + gY + delta), (0, 0, 255), 2)
        cv2.putText(image, "".join(groupOutput),
            (gX - 10, gY + delta - 25), cv2.FONT_HERSHEY_SIMPLEX,
            0.95, (0, 0, 255), 3)
        
        output.append("".join(groupOutput))
    return output


def signverification(imgurl,kycUrl):
    img1 = url_image(imgurl)
    img2 = url_image(kycUrl)
    #print(img1)
    print(img2)
    #img1 = base64.b64decode(formUrl)
    #img2 = base64.b64decode(imgurl)
    crop_img = img1[200:280,595:800]
    print(crop_img)
    try:
        similarity_value = match(img1,crop_img)
        print("similarity_value")
        print(similarity_value)
        if similarity_value > 40:
            return {"signature":1}
        else:
            return {"signature":0}
    except:
        return {"signature":0}


@app.get("/")
async def hey():
    return "test" 

@app.post("/chequeanalytics/")
async def create_items(item:Item):
    return cheque(item.url)

@app.post("/kycverification/")
async def create_items(item2: kycItem):
    return signverification(item2.newurl, item2.kyc)
