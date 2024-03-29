//
//  CollectionViewController.swift
//  ACollectionOfDogs
//
//  Created by Mckenna Brewer on 2/28/21.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    
    var tuckerImages = [String]()
    var dukeImages = [String]()
    var mooseImages = [String]()
    
    var dogDescription:  String?
    var imageArray: String?
    
    var dogImageArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
    

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        if(imageArray == "tuckerImages"){
            for i in 1...6{
                tuckerImages.append("tucker" + String(i))
            }
            dogImageArray = tuckerImages
        }
        else if (imageArray == "dukeImages"){
            for i in 1...6{
                dukeImages.append("duke" + String(i))
            }
            dogImageArray = dukeImages
        }
        else if(imageArray == "mooseImages"){
            for i in 1...6{
                mooseImages.append("moose" + String(i))
            }
            dogImageArray = mooseImages
        }
        
        collectionView.collectionViewLayout = generateLayout()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return dogImageArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
    
        // Configure the cell
        let image = UIImage(named: dogImageArray[indexPath.row])
        cell.imageView.image = image
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var header = SupplementaryView()
        if kind == UICollectionView.elementKindSectionHeader{
            header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerIdentifier", for: indexPath) as! SupplementaryView
            header.headerLabel.text = dogDescription
        }
        return header
    }
    
    func generateLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        // create an item layout
        let photoItem = NSCollectionLayoutItem(layoutSize: itemSize)
        // item spacing
        photoItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        // create group size
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.25))
        // create a group arranged horizontally
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: photoItem, count: 1)
        // create a section with one group
        let section = NSCollectionLayoutSection(group: group)
        
        // create a header
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        // add the header to the section
        section.boundarySupplementaryItems = [sectionHeader]
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            let indexPath = collectionView?.indexPath(for: sender as! CollectionViewCell)
            let detailVC = segue.destination as! DetailViewController
            detailVC.imageName = dogImageArray[(indexPath?.row)!]
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
