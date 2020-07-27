#  File Organization

Here is a recommended file organization structure in (especially larger) Xcode projects:

```
├── App Lifecycle
│   ├── AppDelegate.swift
│   ├── LaunchScreen.storyboard
│   └── SceneDelegate.swift
├── Feed
│   ├── Feed.storyboard
│   └── FeedViewController.swift
├── Login and Signup
│   ├── LoginSignup.storyboard
│   ├── LoginViewController.swift
│   └── SignupViewController.swift
├── Model
│   ├── Bearer.swift
│   └── Post.swift
├── Model Controller
│   ├── BearerController.swift
│   └── PostController.swift
└── Views
│   └── FeedCollectionViewCell.swift
├── Info.plist
├── Assets.xcassets
```

This follows MVC and breaks down its individual components into their own group (as well as "Resources" for the more generic app files. In a larger project such as one made in Labs, this can very quickly become almost as disorganized as not having any groups at all. Organization like this can have you potentially scrolling through dozens if not hundreds of files. Instead, formatting your project with another layer on top of this can help immensely. Consider having groups for your features, or sections of your app. From there, you can follow this same model inside of that. For example, if we had two main features called "Feed" and "Login and Signup", our file structure could look something like this:

This allows you to close the groups you don't care to look at. Say you were working on the "Feed" feature. For the most part you will be using the files in the "Feed" feature group and will rarely have to open other groups as they will generally unrelated to the feature you are working on. This isn't always the case but it makes navigating between different files you _do_ care about much more simple. Taking a little time up front to organize your files will save you a lot of time during the development process.

> Note:
> Git doesn't play well with moving files around, as the Xcode project itself tracks the location and position of its files. To prevent merge conflicts with your teammates, don't move files around once they've been organized if you can help it. Merge conflicts caused by this should largely be a non-issue assuming you're all working on separate features (thus not working in the same files) but it can still happen.
>
> As a team, decide how you would like the project's files organized so you or your teammates don't move files to suit personal preferences. Compromise is key in working in teams. 
