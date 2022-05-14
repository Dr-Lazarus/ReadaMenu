# Aural Delicacy
<div id="top"></div>

<!-- PROJECT LOGO -->
<br />
<div align="center">

![Aural Delicacy Logo](https://github.com/ShiHui21/ReadaMenu/blob/main/ReadaMenu/Assets.xcassets/Read%20a%20menu.imageset/Read%20a%20menu.jpg)
</div>

<!-- ABOUT THE PROJECT -->
## About The Project

Aural Delicacy is an app that that aims to provide visually impaired diners with an enjoyable outdoor dining experience by providing restaurant menus that are accessible to the visually impaired. Visually impaired diners can make use of iPhone's VoiceOver functionality to intuitively browse through the menu items from different restaurants and add them to selection if they are interested in ordering the menu item. 

Our app uses crowd-sourcing to increase our collection of accessible menus available to our visually impaired users. Volunteers can snap a photo of a restaurant's menu and submit it together with the restaurant's information, to help us add the restaurant to our app and build a more inclusive dining experience for the visually impaired.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- PROJECT BACKGROUND-->
## Project Background

A visually-impaired person faces many challenges when dining out and one of the biggest obstacles is being able to read the menu. According to an [blogpost written by a vision-impaired writer](https://www.johnbaileyspeaker.com/how-do-blind-people-read-a-menu/), visually-impaired diners usually depend on the friends they are dining with or the waiters at the restaurants to help them read the menu. However, many visually-impaired diners would be afraid of inconveniencing their friends and the waiters into reading the entire menu to them and would compromise by ordering items that are recommended instead of items that they truly want. Newer technological solutions such as using Optical Character Recognition (OCR) also has its drawbacks as visually-impaired diners are not able to skip food sections that they are not interested in and have to spend the time listening to everything on the menu.

We believe that we can build a pleasant dining experience for our visually-impaired companions such that they are able to dine independently and conveniently. 

Hence, the objective of our app is to convert restaurant menus into a digital menu that is supported by iPhone's VoiceOver functionality to allow visually impaired users to browse through a menu like how a normal diner would. Information are categorised and organised together to provide visually impaired users with the neccessary information to make their decisions swiftly and conveniently.

<p align="right">(<a href="#top">back to top</a>)</p>

## Built With

* [Swift](https://developer.apple.com/swift/)
* [SwiftUI](https://developer.apple.com/xcode/swiftui/)
* [Firebase Cloud Firestore](https://firebase.google.com/docs/firestore)
* [Firebase Cloud Storage](https://firebase.google.com/docs/storage)
* [Nanonets Menu Recognition API](https://nanonets.com/)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Setting Up

To set up the project locally and get it running on your iPhone, follow these few simple steps. While our app can be runned on the iOS simulator on xCode, we recommend running it on your personal iPhone device for you to be able to access the Camera function.

1) Clone the GitHub repository
   ```sh
   git clone https://github.com/ShiHui21/ReadaMenu.git
   ```
2) Open up the project in xCode
3) Compile and run the app

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->
## Features and User Journey

## 1) Visually-impaired User

[![Browse Restaurants with Voiceover](https://img.youtube.com/vi/27C9skqdx4k/0.jpg )](https://www.youtube.com/watch?v=27C9skqdx4k)

<div align="center">
      <a href="https://www.youtube.com/watch?v=27C9skqdx4k">
         <img src="https://img.youtube.com/vi/5yLzZikS15k/0.jpg" style="width:100%;">
      </a>
</div>

### Browse Restaurants and Search for Restaurants
<div align="center">
   <img src="https://github.com/ShiHui21/ReadaMenu/blob/main/App%20Screens/Browse%20Restaurant%20Screen.png" width="376" height="710">
</div>
<div align="center">
   <img src="https://github.com/ShiHui21/ReadaMenu/blob/main/App%20Screens/Restaurant%20Search%20Screen.png" width="376" height="710">
</div>

### Browse through Menu Categories
<div align="center">
   <img src="https://github.com/ShiHui21/ReadaMenu/blob/main/App%20Screens/Browse%20Menu%20Categories%20Screen.png" width="376" height="710">
</div>

### Browse through Food Items
<div align="center">
   <img src="https://github.com/ShiHui21/ReadaMenu/blob/main/App%20Screens/Browse%20Food%20Item%20Screen.png" width="376" height="710">
</div>

### Review all Food Items added to Selection
<div align="center">
   <img src="https://github.com/ShiHui21/ReadaMenu/blob/main/App%20Screens/Food%20Selection%20Screen.pngg" width="376" height="710">
</div>

## 2) Menu Submission Volunteers

[![Menu Submission](https://img.youtube.com/vi/FF1F5tVsN2w/0.jpg )](https://www.youtube.com/watch?v=FF1F5tVsN2w)

### Restaurant Details 
<div align="center">
   <img src="https://github.com/ShiHui21/ReadaMenu/blob/main/App%20Screens/Restaurant%20Details%20Screen.png" width="376" height="710">
</div>

### Restaurant Menu (Camera or Photo from Gallery)
<div align="center">
   <img src="https://github.com/ShiHui21/ReadaMenu/blob/main/App%20Screens/Menu%20Submission%20Screen.png" width="376" height="710">
</div>
<div align="center">
   <img src="https://github.com/ShiHui21/ReadaMenu/blob/main/App%20Screens/Gallery%20Picker%20Screen.png" width="376" height="710">
</div>

### Upload Successful
<div align="center">
   <img src="https://github.com/ShiHui21/ReadaMenu/blob/main/App%20Screens/Successful%20Upload%20Screen.png" width="376" height="710">
</div>

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->
## Contributors

* Ryan Pan Tang Kai (https://www.linkedin.com/in/ryan-pan-27533517a/)
* Luah Shihui (https://www.linkedin.com/in/shihuicsd/)
* Visshal Natarajan (https://www.linkedin.com/in/visshal-natarajan/)
* Keshav Natarajan (https://www.linkedin.com/in/keshavnatarajan/)

Project Link: [https://github.com/ShiHui21/ReadaMenu](https://github.com/ShiHui21/ReadaMenu)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

We would like to extend our deepest gratitude to Qi Yan, Nicole and Riley from SUTD Swift Coding Club's ExCo for their invaluable guidance throughout the development of our project. 

We would also like to like to thank Kwek Bin from Singapore Association of the Visually Handicapped and Christian from Apple, who put aside their valuable time to provide insightful feedbacks to our idea and prototype during our consultation sessions.

<p align="right">(<a href="#top">back to top</a>)</p>
