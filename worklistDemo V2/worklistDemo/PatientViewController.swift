//
//  PatientViewController.swift
//  worklistDemo
//
//  Created by Joren Winge on 6/15/17.
//  Copyright © 2017 Ross Higgins. All rights reserved.
//

import UIKit

class PatientViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate {
    
    var worklist: Worklist?
    var acquisition: Acquisition?
    private let cellId = "cellId"
    
    var acquisitionImages: [Acquisition] = []
    
    
    @IBOutlet fileprivate var patientInformationImageView: UIImageView!
    @IBOutlet fileprivate var localizerImageView: UIImageView!
    @IBOutlet weak var acquisitionCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewImage: UIImageView!
           
    
    // main - calls displayPatient() method as well as creates a notes button for the navig ation bar.
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Notes", style: UIBarButtonItemStyle.plain, target: self, action: #selector(notes))
        navigationItem.title = "Patient"
        loadCollectionView()
        displayPatient()
        acquisitionCollectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadCollectionView(){
        for i in 1..<4 {
            let string = "acquisition"+String(i)
            if let image = UIImage.init(named:string){
                if let acquisition = Acquisition.init(image: image){
                    acquisitionImages.append(acquisition)
                }
            }
        }
    }

    // notes() method switches to the notes view controller
    func notes() {
        if let notesViewController = storyboard?.instantiateViewController(withIdentifier: "NotesViewController") as? NotesViewController {
            notesViewController.worklist = worklist
            self.navigationController!.pushViewController(notesViewController, animated: true)
        }
    }
    
    // displays the patient information, and localizer imagesa
    func displayPatient(){
        patientInformationImageView.image = worklist?.photo2_
        localizerImageView.image = worklist?.localizer_
    }

        
    // number of images in horizontal view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return acquisitionImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell
            else {
                assertionFailure()
                return UICollectionViewCell()
        }
        let acquisition = acquisitionImages[indexPath.row]
        cell.collectionViewImage.image = acquisition.image_
        return cell

    }
    

}




