# TestQonto

Test environement : iOS 10, Xcode 8, swift 3

Third part tools :
- Carthage
- swiftlyJson


## UserListViewController
The main View Controller contains a tableView.

- User Model


## AlbumListViewController

This controller contains also a tableView, list all albums of slected user.

- Album Model


## GalleryViewController
This controller contains a collectionView that shows user's photos

- GalleryPhoto Model


## Libraries
- use swiftlyJson for reading JSON data, because it's easy to use. (I was blocked here about 1hour for cocoapod updating, some problem...)

## Difficult part
- Read JSON and check every data is good to read
- time limit, doesn't really have time to write document, but the code is really clear enough.

# TODO:
- Make collectionView in GalleryViewController
- Check all nil option value, error handler
- Document all class and functions
- reload tableView data and collectionView data smoothly

# Problem

### problem 1

**I am blocked here I think I forget to configurate plist file for Internet and I got error as:**

      https://jsonplaceholder.typicode.com/users/1/albums
      Error Domain=NSURLErrorDomain Code=-1100 "The requested URL was not found on this server." UserInfo={NSUnderlyingError=0x6080002411a0 {Error Domain=kCFErrorDomainCFNetwork Code=-1100 "(null)"}, NSErrorFailingURLStringKey=file:///https:/jsonplaceholder.typicode.com/users/1/albums, NSErrorFailingURLKey=file:///https:/jsonplaceholder.typicode.com/users/1/albums, NSLocalizedDescription=The requested URL was not found on this server.}


**problem fixex**

    // before
    let url = URL(fileURLWithString:urlString)
    // after
    let url = URL(string:urlString)



### problem 2
The "lat" and "lng" value under "geo" in JSON data could not be read as double, Need time to look into it.

### problem 3
Cause of Apple ATS(App Transport Security), the url for photos (http but not https) didn't pass. need to configure info.plist :

      <key>NSAppTransportSecurity</key>
      <dict>
          <key>NSAllowsArbitraryLoads</key>
          <true/>
      </dict>

### problem 4
I didn't add any custom Cell in the application, but the cell is reusable, it's better to create custom cell class and check the image(return from server) is the right image for Cell!!

### problem 5
Lots of option variables I do cast with ! operation, but really it needs to be check.
