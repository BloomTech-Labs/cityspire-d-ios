# Development Description

The app is a storyboard-based app, based in `Main.storyboard`. The `Profiles.storyboard` has extra screens from the starter project we were given, and is not used, as far as I know.

The Okta signup is weird, but you don't have to do much with it. For development, we were dragging the initial view controller arrow to the Tab Bar Controller, as shown here:

<img width="819" alt="screenshot of Xcode storyboard" src="https://user-images.githubusercontent.com/438307/109599975-23a98d80-7ad1-11eb-9af8-04690bc2018e.png">

## Search / Map

The DS api didn't give us lat/lon coordinates for the cities, and we wanted to show all available cities that had data, so we batch-geocoded all 100 cities that DS was working with, and we add the coordinates from a .json file in the app bundle when we get all the cities from the api.

We tried reusing the detail view in multiple View Controllers, and it's mostly working, but needs some tweaks, like not showing the X button when presented from the Favorites screen.

When the detail view is shown (animation would be nice), the map should probably re-center the tapped annotation in the smaller visible map space.

There is a bug where the detail view won't show again after closing with the X button.

## Favorites

## Profile

## Remote APIs

## Core Data






--

Please give us a description for the next team that will inherit your project that provides the developers with guidance on how to jump in. 

Describe all the elements of your project that deviate from our Engineering Standards. Example: did you write components outside of the provided patterns 'pages/common'? Did you include any frameworks, libraries, or NPM packages etc. that deviate from our standards or instruction? 
