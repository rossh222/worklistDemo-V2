//
//  WorklistTableViewController.swift
//  worklistDemo
//
//  Created by Ross Higgins on 6/14/17.
//  Copyright © 2017 Ross Higgins. All rights reserved.
//

import UIKit

class WorklistTableViewController: UITableViewController {
    
    // worklist object, contains all the studies
    var list = [Worklist]()
    
    // main, runs loadSampleWorklist()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleWorklist()
    }
    
    /* method loadSampleWorklist(): initializes the studies, will soon be able to accept data from an external source (csv.) static app only uses a preset set of data to generate the data/images. then adds the study objects to the worklist object.
    */
    private func loadSampleWorklist() {
        
        let photo1 = UIImage(named: "study1img")
        let photo2 = UIImage(named: "study2img")
        let photoInfo1 = UIImage(named: "patientXinfo")
        let photoInfo2 = UIImage(named: "patientYinfo")
        
        guard let study1 = Worklist(accessionNo: "49985484", examDate: "5/29/17", exam: "Chst Abd Aorta, Chst Angio", photo: photo1!, photo2: photoInfo1!, localizer: #imageLiteral(resourceName: "localizer1")) else { fatalError("cannot instantiate study1") }
        guard let study2 = Worklist(accessionNo: "4977619", examDate: "4/30/17", exam: "Abd Pelvis WO IVCon", photo: photo2!, photo2: photoInfo2!, localizer: #imageLiteral(resourceName: "localizer2")) else { fatalError("cannot instantiate study1") }
        list += [study1, study2]
    }
 
    

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    /* method tableView: configures the cell according to the given information. sets the accession number, exam date, exam type, and image to the initilized images.
    */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // table view cells are reused and should be dequeued using a cell identifier
        let cellIdentifier = "WorklistTableViewCell"
        //*** this line is giving me the NSInternalInconsistencyException
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? WorklistTableViewCell else {
            fatalError("The dequeued cell is not an instance of WorklistTableViewCell.")
        }
        let worklist = list[indexPath.row]
        cell.accessionNo1.text = worklist.accessionNo_
        cell.examDate1.text = worklist.examDate_
        cell.exam1.text = worklist.exam_
        cell.imgView1.image = worklist.photo_
        
        // Configure the cell...
        return cell
    }

    // deselects row when selected
    // guard - makes sure there is a list item at index path, crash otheriwse
    // passing 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard indexPath.row < list.count else {
            return
        }
        let worklist = list[indexPath.row]
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        // create patient view controller, do same with notes
        if let patientViewController = storyboard.instantiateViewController(withIdentifier: "PatientViewController") as? PatientViewController{
            patientViewController.worklist = worklist
        self.navigationController!.pushViewController(patientViewController, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
