# LockNRoll
LockNRoll is a mobile app designed to provide remote control capabilities for smart door locks. With LockNRoll, users can easily lock or unlock their door, capture images, trigger alarms, and receive doorbell notifications, all from the convenience of their smartphone.

LockNRoll was developed as a part of my Bachelor's degree in Computer Science final year project and was exhibited during the MSU iRex 15.0 event.

## Mobile Application
This app is built using _Flutter_ and integrates four essential _Firebase_ services to enhance its functionality:
1. **Authentication**: To securely sign in, sign up, and reset passwords to ensure only authorized users can access the app.
2. **Cloud Firestore**: To store users' information, activity logs, and device details to maintain a seamless experience across multiple devices.
3. **Real-time Database (RTDB)**: Enable real-time communication between microcontrollers, specifically the ESP32-CAM and ESP8266, facilitating the exchange of data and instructions.
4. **Storage**: Store images captured by the ESP32-CAM when triggered, ensuring you have a visual record of who accessed your door.

## Smart Door Lock
A smart door lock was developed for the project consists of two key microcontrollers:
1. **ESP32-CAM**: Responsible for capturing images using the built-in camera, providing visual verification when necessary.
2. **ESP8266 (NodeMCU 1.0)**: To manage the door lock mechanism (solenoid door lock), the buzzer (for alarms), and the push button for the doorbell function.

Please note that due to privacy concerns, the programs for each microcontroller will not be shared.

## Screenshots
### Sign In Screen
<img alt="Sign In Screen" src="https://github.com/tmthyadms/locknroll/assets/72775553/b4a3148a-3282-40a4-bb3d-e90b0e5bf524" width="211" />

### Sign Up Screen
<img alt="Sign In Screen" src="https://github.com/tmthyadms/locknroll/assets/72775553/bb83b36e-abea-44e9-86e4-4a5577eeab74" width="211" />

### Reset Password Screen
<img alt="Reset Password Screen" src="https://github.com/tmthyadms/locknroll/assets/72775553/53347f5c-ae48-4125-a839-b0184017c125" width="211" />

### Home Screen
<img alt="Home Screen" src="https://github.com/tmthyadms/locknroll/assets/72775553/26eff3aa-b3b6-4bd8-a3e8-afd37650d85b" width="211" />

### Status & Control Screen
<img alt="Status & Control Screen" src="https://github.com/tmthyadms/locknroll/assets/72775553/88a8067a-7c7c-4cb3-8f4c-8107862fde5b" width="211" />

### Pop-Up Notification
<img alt="Pop-Up Notificationn" src="https://github.com/tmthyadms/locknroll/assets/72775553/d08904c8-1671-4f9b-987e-8c2a262244cb" width="211" />

### Smart Door Lock - Locked State
<img alt="Smart Door Lock - Locked State" src="https://github.com/tmthyadms/locknroll/assets/72775553/eef81934-f308-41d4-a700-797b90acca71" width="211" />

### Smart Door Lock - Alarm Activated
<img alt="Smart Door Lock - Alarm Activated" src="https://github.com/tmthyadms/locknroll/assets/72775553/44ebf094-ed9f-4c8e-a1d4-22644f09af3e" width="211"/>

### Captured Photo Modal
<img alt="Captured Photo Modal" src="https://github.com/tmthyadms/locknroll/assets/72775553/7dfacb3f-f3bd-4d29-9865-c8b2f1a1efeb" width="211"/>

### Activity Log Screen
<img alt="Activity Log Screen" src="https://github.com/tmthyadms/locknroll/assets/72775553/b176cfa5-ca85-4301-8cdc-79e591dcf327" width="211"/>

### Account Screen
<img alt="Account Screen" src="https://github.com/tmthyadms/locknroll/assets/72775553/28fe7f24-e153-4229-b9ee-410950d789c8" width="211"/>

### Settings Screen
<img alt="Settings Screen" src="https://github.com/tmthyadms/locknroll/assets/72775553/e5d8c622-94e5-496f-9afc-e380ac4ba71a" width="211"/>
