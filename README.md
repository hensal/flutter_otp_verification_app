# flutter_mobile_otp_verify_app
This is the flutter application that send the otp code during log in.

Step-1: Install Required Node.js Packages:
        #Create a Node.js project folder
        
          mkdir my-node-backend
          cd my-node-backend
          npm init -y

   #Install required packages:
   
        npm install express twilio body-parser
        npm install -g nodemon
        npm install cors

To run server:Run the command

        nodemon server.js

   NOTE:The server folder is created inside the flutter project for Node JS.

 Step-2: Create the flutter project:
 
         flutter --version
         Flutter 3.26.0-0.1.pre • channel beta • https://github.com/flutter/flutter.git
         Framework • revision ee624bc4fd (5 months ago) • 2024-09-10 17:41:06 -0500
         Engine • revision 059e4e6d8f
         Tools • Dart 3.6.0 (build 3.6.0-216.1.beta) • DevTools 2.39.0

Step-3: Install the packages:

       intl_phone_field: ^3.2.0
       http: ^0.13.4

Step-4: Create the .env file inside the server folder of Node JS

      TWILIO_ACCOUNT_SID = "ACd391778b6b2cc1"
       TWILIO_AUTH_TOKEN = "a87309c65aa7c2f"

UI :

![otp1](https://github.com/user-attachments/assets/88babce6-abdd-40b6-a168-b8b79a29fed5)]

![otp2](https://github.com/user-attachments/assets/66f2538d-f38d-4d9a-9e31-35c02f5e495f)

![otp3](https://github.com/user-attachments/assets/559ef31b-a39a-4f34-89f9-7c93e4f0af7f)


![twilio](https://github.com/user-attachments/assets/0c22ab14-5384-4ad6-b4b1-75ac350abaea)


