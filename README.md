# Carvice

A new Flutter project, This application is made to streamline the process of car servicing and maintanence.

## Application Owner

Name : Shailesh Das

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## About the Project

This application is made to streamline the process of car servicing and maintanence.
Service manager of that area or that workshop. He/she will assign the pickup or service request to the pickup executive.
Once the vehicle pickup is done, it is handed over to the service executive based on available service spots in the service station.
A job card is prepared based on the inputs from the customer if required they can connect over a call and get a better understanding.
Once the vehicle service is done further communication is given on when the vehicle can be delivered back or if they want to take the car on their own.
The app and portal will play a key role in organizing and scheduling vehicle service.

Key Features:

- User-friendly interface for car owners to schedule services.
- A database to store vehicle information and service history.
- Integration with payment gateways.
- Real-time notifications for service updates.
- A portal for mechanics to manage appointments.
- Seamless communication between car owners and mechanics.

Customer journey:

- The customer uses the app to schedule service
- Service request and a job card is created
- The service manager assigned this to the pickup team
- The pickup team gets the vehicle to the workshop and hands over the vehicle to the service manager
- Service managers based on available service stations assigned work to the executive
- Once the job is done the team contacts the customer to schedule vehicle pick-up or walk-in
  \*if there are any changes in the scope of service the customer is contacted by the internal team to confirm if they wish to go with the changes
  \*\* Pick-up service is optional and can be added to the app

Who can use the backed CRM portal

- Service Manager
- Service Executive
- Customer relation executive

### Table of contents

- [System requirements](#system-requirements)
- [Figma design guidelines for better UI accuracy](#figma-design-guideline-for-better-accuracy)
- [Check the UI of the entire app](#app-navigations)
- [Application structure](#project-structure)
- [How to format your code?](#how-you-can-do-code-formatting)
- [How you can improve code readability?](#how-you-can-improve-the-readability-of-code)
- [Libraries and tools used](#libraries-and-tools-used)
- [Support](#support)

### System requirements

Dart SDK Version 2.18.0 or greater.
Flutter SDK Version 3.3.0 or greater.

### Figma design guidelines for better UI accuracy

Read our guidelines to increase the accuracy of design-to-code conversion by optimizing Figma designs.
https://docs.dhiwise.com/docs/Designguidelines/intro

### Check the UI of the entire app

Check the UI of all the app screens from a single place by setting up the 'initialRoute' to AppNavigation in the AppRoutes.dart file.

### Application structure

After successful build, your application structure should look like this:

```
.
├── android                         - It contains files required to run the application on an Android platform.
├── assets                          - It contains all images and fonts of your application.
├── ios                             - It contains files required to run the application on an iOS platform.
├── lib                             - Most important folder in the application, used to write most of the Dart code..
    ├── main.dart                   - Starting point of the application
    ├── core
    │   ├── app_export.dart         - It contains commonly used file imports
    │   ├── constants               - It contains static constant class file
    │   └── utils                   - It contains common files and utilities of the application
    ├── presentation                - It contains widgets of the screens
    ├── routes                      - It contains all the routes of the application
    └── theme                       - It contains app theme and decoration classes
    └── widgets                     - It contains all custom widget classes
```

### How to format your code?

- if your code is not formatted then run following command in your terminal to format code
  ```
  dart format .
  ```

### How you can improve code readability?

Resolve the errors and warnings that are shown in the application.

### Libraries and tools used

- BLoC - State management
  https://bloclibrary.dev
- cached_network_image - For storing internet image into cache
  https://pub.dev/packages/cached_network_image
