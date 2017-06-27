//
//  PatientViewController.swift
//  worklistDemo
//
//  Created by Joren Winge on 6/15/17.
//  Copyright © 2017 Ross Higgins. All rights reserved.
//

import UIKit

class PatientViewController: UIViewController {
    
    var worklist: Worklist?
    var acquisition: Acquisition?
    var list = [Acquisition]()
    private let cellId = "cellId"
    
    var acquisitionImages: [UIImage] = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3")]
    
    
    @IBOutlet fileprivate var patientInformationImageView: UIImageView!
    @IBOutlet fileprivate var localizerImageView: UIImageView!
    @IBOutlet weak var acquisitionCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewImage: UIImageView!
           
    
    // main - calls displayPatient() method as well as creates a notes button for the navig ation bar.
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Notes", style: UIBarButtonItemStyle.plain, target: self, action: #selector(notes))
        navigationItem.title = "Patient"
        displayPatient()
        setupCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    
    //--------collection view
    func setupCollectionView() {
        //acquisitionCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        guard let acquisition1 = Acquisition(image: acquisitionImages) else { fatalError("cannot instantiate acquisition1") }
        //list += [acquisition1]
 
        collectionViewImage.image = acquisition?.image_
    }
    
        
    // number of images in horizontal view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectionViewCell
    }
    

}




