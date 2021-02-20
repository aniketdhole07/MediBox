# MediBox
## For RaspBerry Pi Code and CAD Files GO TO https://github.com/aniketdhole07/MediBox-RaspberryPi
## Inspiration
Forgetting to take a medication is a common problem in older people and is especially likely when an older patient takes several drugs simultaneously. Around 40% of Patients forget to take medicines and most of them have difficulty to differentiate between multiple medications.

1. Patients forgets to take medication
2. Patients get confused in taking multiple medications as they look similar.
3. Patients don't take medications at correct time

Such thing leads to bad health and now-a-days these cases are increasing day by day and most people think that skipping medications is normal thing, which is bad for their health.

To avoid this I wanted to make a device which automatically gives medicines to the patients.

## What it does
It is a 3D printed Vending Box actuated by using servo motor and controlled using Raspberry Pi 4 and Mobile App. The Box will automatically sort out medicine according to Time and Schedule and Vend it using Servo Motor from the Box, the App will be connected via Firebase to Store, Add and Modify the Medicine Schedule and Raspberry Pi will collect that data from Firebase and Actuate the Servos Accordingly.

1. Doctors/Care Takers Can Add Medicine Schedule via the Mobile App.
2. The Patient will hear a Buzzer and Sound Details about Medicine and how much Doses he must take of that medicine.
3. The Box will automatically rotate via servo and Drop Off the Scheduled Medicine off the Box . 

## How we built it
I bought Raspberry Pi and Servos at start of Hackathon, and Started Development of App until the Hardware got Shipped.
Timeline
* Day 1-2  : Planning of Idea and Hardware Ordering
* Day 3-4 : Research Work and Planning
* Day4 -6: App Development from Flutter + Firebase
* Day 7-9: CAD Design and started 3D Printing(took 13 Hours to print)
* Day 10: Hardware Arrived and Tested
* Day 10 -Day 12 Integrated 3D Printed Parts and Motors and Done with Project
* Day 13: Video Editing, Devpost Documentation , Code Uploading
* Day 14: Minor Video Edits and Documentation

## Challenges we ran into
* 3D Printing Failed and took lot of time
* Late Shipment of Hardware
* Servo Motor Gear Issues

## Accomplishments that we're proud of
1. New to 3d Printing and Printed such Big Project for First Time
2. Used Rpi for First Time

## What we learned
* CAD Design
* Flutter
* Raspberry Pi

## What's next for MediBox
1. Creating 2 Level Box,for more medicine capacity using same amount of motors. [image]
2. Add good UI to App
3. Adding Medicine Recognition and automatically ordering .
