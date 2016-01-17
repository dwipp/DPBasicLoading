# DPBasicLoading

It's a very basic loading in iOS. And absolutely it's a very lightweight library.
Inspired from progress loading in App Store.

## Usage

``` swift
// Initialize a progress loading for UITableView.
let loading = DPBasicLoading(table: table_view)

// Initialize a progress loading for UICollectionView.
let loading = DPBasicLoading(collection: collection_view)

// start the progress loading by putting loading message.
loading.startLoading("Loading...")

// end the progress loading.
loading.endLoading()
```

## Sample

![Screenshot](http://s9.postimg.org/vt58qhjzz/i_OSdwipp01172016152524.png)
![Screenshot](http://s15.postimg.org/imyobac8b/i_OSdwipp01172016152451.png)
![gif](http://i.giphy.com/3o7rbUkqcG4xLKwnqo.gif)

## Installation

Manual installation. Just copy DPBasicLoading folder to your project.
Will be available on cocoapods soon.

## Thanks To

App Store --> inspiring me a lot !!!

## License

DPBasicLoading is released under the MIT license. See LICENSE for details.
