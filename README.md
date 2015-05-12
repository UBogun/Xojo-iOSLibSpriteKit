# Xojo-iOSLibSpriteKit
An extension to iOSLib: iOSLibSpriteKit.  
This is a library for using SpriteKit on iOS with Xojo. iOSLibSpriteKit needs iOSLib to run but can be removed from source without breaking iOSLib (which is included here). Always tested on the current version of Xojo.

By now, there's almost everything in except for SK3DNodes (don't make sense until there's a SceneKit too) and SKKeyFrameSequence (need to understand it first) and a handful of special constructors.  
The documentation is up to date and I will refine the demo views and add remarks for easier understanding.  
Not all of the classes are tested, and none of them to the full extent. There will surely be bugs and a lot of things that could be simplified. I will try to add and fix but depend on your help. 
Therefore please make use of the feedback features GitHub offers or simply send me a mail. And if you explore other features of SpriteKit not included in the demo views: I would love to add them!

Please see the [Wiki](https://github.com/UBogun/Xojo-iOSLibSpriteKit/wiki) for documentation and examples.

##Important announcement
I hope you won't hit me, but please don't get too used to the names of iOSLib. It occured to me that with 64bit Desktop ante portas and iOS and OS X sharing a lot of frameworks and classes (and not to forget Xojo being a xplatform IDE), it would be a nice feature if you would be able to say, copy your iOS SpriteKit game to a OS X desktop project, make only a handful of adjustments and have it running on OS X too.   
So currently I am in the process of unifying my iOS and (still private) OS X library to have them both available after Xojo 2015r3 is released. Of course, names like "iOSLibColor" wouldn't be adequate for a OS X project. But you should later be able to convert existing projects by replacing "iOSLib" by something like "Apple" …
