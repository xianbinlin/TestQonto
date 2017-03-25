# TestQonto

## UserListViewController
the main View Controller contains a tableView.

- User Model

Done!

## AlbumListViewController

this controller contains also a tableView, list all albums of slected user

**I am blocked here I think I forget to configurate plist file for Internet and I got error as:**

      https://jsonplaceholder.typicode.com/users/1/albums
      Error Domain=NSURLErrorDomain Code=-1100 "The requested URL was not found on this server." UserInfo={NSUnderlyingError=0x6080002411a0 {Error Domain=kCFErrorDomainCFNetwork Code=-1100 "(null)"}, NSErrorFailingURLStringKey=file:///https:/jsonplaceholder.typicode.com/users/1/albums, NSErrorFailingURLKey=file:///https:/jsonplaceholder.typicode.com/users/1/albums, NSLocalizedDescription=The requested URL was not found on this server.}



## GalleryViewController

plan to make a collectionView

## Libraries
- use swiftlyJson for reading JSON data, because it's easy to use. (I was blocked here about 1hour for cocoapod updating, some problem...)

## Difficult part
- Read JSON and check every data is good to read

# TODO:
- Make collectionView in GalleryViewController
- Check all nil option value, error handler
- Document all class and functions
- reload tableView data and collectionView data smoothly

# Problem
- geo data could not be read, need to check
