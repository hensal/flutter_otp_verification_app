const express = require('express');
const twilio = require('twilio');
const cors = require('cors');
const app = express();
const bodyParser = require('body-parser');
require('dotenv').config(); 

// Use CORS middleware
app.use(cors());
// Twilio credentials (replace with your own)
const accountSid = process.env.TWILIO_ACCOUNT_SID;  
const authToken = process.env.TWILIO_AUTH_TOKEN;   

const client = twilio(accountSid, authToken);

app.use(bodyParser.json()); 

// Endpoint to send OTP
app.post('/send-otp', (req, res) => {
  const { phoneNumber } = req.body;

  // Generate a random 6-digit OTP
  const otp = Math.floor(100000 + Math.random() * 900000);

  // Send OTP using Twilio
  client.messages
    .create({
      body: `Your OTP is: ${otp}`,
      from: '+18312630311', // Your Twilio number
      to: phoneNumber,
    })
    .then((message) => {
      res.status(200).json({ success: true, otp: otp });
    })
    .catch((error) => {
      console.error(error);
      res.status(500).json({ success: false, message: 'Failed to send OTP' });
    });
});      

// Start the server
const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
