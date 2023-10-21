# LockNRoll
A mobile app to control a custom-built smart door lock [^1].
[^1]: Developed for Bachelor's final year project and was exhibited during the MSU iRex 15.0 event.

## Mobile App
Flutter for the frontend and Firebase services for the backend, which are as follows:
<dl>
  <dt>Authentication</dt>
  <dd>For secure sign up, sign in, and password reset</dd>
  <dt>Cloud Firestore</dt>
  <dd>For storing user account details, device details, and event logs.</dd>
  <dt>Real-Time Database (RTDB)</dt>
  <dd>For live communication between mobile app and smart door lock.</dd>
  <dt>Storage</dt>
  <dd>For storing images captured by ESP32-CAM microcontroller.</dd>
</dl>

## Smart Door Lock
A custom smart door lock using two microcontrollers [^2], which are as follows:
[^2]: Microcontroller programs are confidential.
<dl>
  <dt>ESP32-CAM</dt>
  <dd>For capturing image using the built-in camera.</dd>
  <dt>ESP8266 (NodeMCU v1.0.0)</dt>
  <dd>For managing doorbell, alarm, and door lock.</dd>
</dl>

## Screenshots
<!-- Auth screens -->
<details>
  <summary>Authentication Screens</summary>
  <h6>Sign In</h6>
  <a href="#"><img alt="Sign In" width="211" src="https://github.com/tmthyadms/locknroll/assets/72775553/b4a3148a-3282-40a4-bb3d-e90b0e5bf524" /></a>
  <h6>Sign Up</h6>
  <a href="#"><img alt="Sign Up" width="211" src="https://github.com/tmthyadms/locknroll/assets/72775553/bb83b36e-abea-44e9-86e4-4a5577eeab74" /></a>
  <h6>Reset Password</h6>
  <a href="#"><img alt="Reset Password" width="211" src="https://github.com/tmthyadms/locknroll/assets/72775553/53347f5c-ae48-4125-a839-b0184017c125" /></a>
</details>
<!-- General screens -->
<details>
  <summary>General Screens</summary>
  <h6>Home</h6>
  <a href="#"><img alt="Home" width="211" src="https://github.com/tmthyadms/locknroll/assets/72775553/26eff3aa-b3b6-4bd8-a3e8-afd37650d85b" /></a>
  <h6>User Account</h6>
  <a href="#"><img alt="User Account" width="211" src="https://github.com/tmthyadms/locknroll/assets/72775553/28fe7f24-e153-4229-b9ee-410950d789c8" /></a>
  <h6>Settings</h6>
  <a href="#"><img alt="Settings" width="211" src="https://github.com/tmthyadms/locknroll/assets/72775553/e5d8c622-94e5-496f-9afc-e380ac4ba71a" /></a>
</details>
<!-- Smart door lock screens -->
<details>
  <summary>Smart Door Lock Screens</summary>
  <h6>All Controls</h6>
  <a href="#"><img alt="All Controls" width="211" src="https://github.com/tmthyadms/locknroll/assets/72775553/88a8067a-7c7c-4cb3-8f4c-8107862fde5b" /></a>
  <h6>Locked Door State</h6>
  <a href="#"><img alt="Locked Door State" width="211" src="https://github.com/tmthyadms/locknroll/assets/72775553/eef81934-f308-41d4-a700-797b90acca71" /></a>
  <h6>Activated Alarm State</h6>
  <a href="#"><img alt="Activated Alarm State" width="211" src="https://github.com/tmthyadms/locknroll/assets/72775553/44ebf094-ed9f-4c8e-a1d4-22644f09af3e" /></a>
  <h6>Pop-Up Notification</h6>
  <a href="#"><img alt="Pop-Up Notification" width="211" src="https://github.com/tmthyadms/locknroll/assets/72775553/d08904c8-1671-4f9b-987e-8c2a262244cb" /></a>
  <h6>Captured Image Modal</h6>
  <a href="#"><img alt="Captured Image Modal" width="211" src="https://github.com/tmthyadms/locknroll/assets/72775553/7dfacb3f-f3bd-4d29-9865-c8b2f1a1efeb" /></a>
  <h6>Event Log</h6>
  <a href="#"><img alt="Event Log" width="211" src="https://github.com/tmthyadms/locknroll/assets/72775553/b176cfa5-ca85-4301-8cdc-79e591dcf327" /></a>
</details>

