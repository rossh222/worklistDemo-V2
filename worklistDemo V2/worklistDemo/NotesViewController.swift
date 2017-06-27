//
//  NotesViewController.swift
//  worklistDemo
//
//  Created by Ross Higgins on 6/16/17.
//  Copyright © 2017 Ross Higgins. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {
    
    var worklist:Worklist?
    @IBOutlet weak var notesTextView: UITextView!
    
    // ---------------
    // let defaults = UserDefaults.standardUserDefaults
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItemStyle.plain, target: self, action: #selector(save))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let notes: String? = (UserDefaults.standard.object(forKey: "notes") as? String)
        if let noteToSave = notes {
            notesTextView.text = noteToSave
        }
    }
    
    func save() {
        UserDefaults.standard.set(notesTextView.text, forKey: "notes")
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
