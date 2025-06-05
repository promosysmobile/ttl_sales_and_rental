# Mobile App TTL API

1) Login
   - URL:https://stage.ttl.ciot.my/api/auth/login
   - Method:POST
   - Request Json:
  
     <img width="283" alt="Screenshot 2025-06-05 at 9 04 16 AM" src="https://github.com/user-attachments/assets/0384a6d5-a3ab-4afd-8ce5-a46e8169d8f1" />


   - Result Json:
  
     <img width="692" alt="Screenshot 2025-06-05 at 9 03 40 AM" src="https://github.com/user-attachments/assets/308c066d-a9d3-48bc-b746-97ad2f325e73" />


   - Access token needed to request other api calls.
   - The access token for other api calls is passed in Headers, under the Authorization field.
   - Bearer {access_token}

2) Get SWO
   - Display list of SWO
   - Use SWO api
   - URL: https://dev.ttl.ciot.my/api/swo
   - Method: GET

3) Update IQC Checklist

