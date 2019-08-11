# paging-collection-view-layout
custom collection view layout that allows you to page by cell, not screen

![](Media/example.gif)
## installation

add `PagingCollectionViewLayout.swift` to your project

## usage

instantiate a layout property

```swift
let layout = PagingCollectionViewLayout()
```
set the following properties
```swift
layout.itemSize = 
layout.minimumLineSpacing = 
layout.scrollDirection = .horizontal
```
instantiate a collection view using the layout property
```swift
let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
```
#### note:
~~collectionView.isPagingEnabled = true~~
## optional customization
### vertical scrolling
```swift
layout.scrollDirection = .vertical
```
### section spacing
- center the item in focus
- allow the previous item to be visible

![](Media/spacing.png)

set the following property
```swift
layout.sectionInset = 
```
- **horizontal collection view -** set left and right insets
- **vertical collection view -** set top and bottom insets
