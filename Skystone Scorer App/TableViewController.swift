//
//  TableViewController.swift
//  Rover Ruckus Scoring App
//
//  Created by Mihir Chauhan on 8/27/19.
//  Copyright © 2019 Mihir Chauhan. All rights reserved.
//

import UIKit
import AudioToolbox.AudioServices

class TableViewController: UITableViewController {

    var repositioningScore : Int = 0
    var autoStonesDelivered : Int = 0
    var autoSkystonesDelivered : Int = 0
    var navigationScore : Int = 0
    var placingScore : Int = 0
    var deliveringScore : Int = 0
    var telePlacingScore : Int = 0
    var skyscraperScore : Int = 0
    var capStoneScore : Int = 0
    var numberofCSScore : Int = 0
    var endFoundationMovedScore : Int = 0
    var endParkingScore : Int = 0

    @IBOutlet weak var placingOutlet: UIStepper!
    @IBOutlet weak var heightOutlet: UIStepper!
    @IBOutlet weak var teleDeliveredOutlet: UIStepper!
    @IBOutlet weak var supportingLevels1: UIStepper!
    @IBOutlet weak var supportingLevels2: UIStepper!
    
    
    @IBOutlet weak var autoDeliveryOutlet: UIStepper!
    @IBOutlet weak var autoPlacingOutlet: UIStepper!
    

    
    var teleOpScore : Int = 0
    var autoScore : Int = 0
    var endGameScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if skyStoneDeliveredStepper.value == 0 {
//            initalBlocksSegControl.selectedSegmentIndex = 0
//            initalBlocksSegControl.setEnabled(true, forSegmentAt: 2)
//            initalBlocksSegControl.isEnabled = false
//        } else if skyStoneDeliveredStepper.value == 1 {
//            initalBlocksSegControl.isEnabled = true
//            initalBlocksSegControl.setEnabled(false, forSegmentAt: 2)
//        } else {
//            initalBlocksSegControl.isEnabled = true
//            initalBlocksSegControl.setEnabled(true, forSegmentAt: 2)
//        }
        // Uncomment the following line to preserve selection between presentations
        
         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var returnNumber: Int = 0
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            returnNumber = 5
        } else if section == 1 {
            returnNumber = 3
        } else if section == 2 {
            returnNumber = 5
        } else if section == 3 {
            returnNumber = 4
        }
        return returnNumber
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = .darkGray
            headerView.backgroundView?.backgroundColor = .black
            headerView.textLabel?.textColor = .white
        }
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    let pop = SystemSoundID(1520)

    
    @IBAction func landingSegControl(_ sender: UISegmentedControl) {
        //AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        AudioServicesPlaySystemSound(pop)
        
        if sender.selectedSegmentIndex == 0 {
            repositioningScore = 10
        } else {
            repositioningScore = 0
        }
        autoScore = repositioningScore+autoStonesDelivered+autoSkystonesDelivered+navigationScore+placingScore
        autoScoreLabel.text = "\(autoScore)"
        totalScoreLabel.text = "\(autoScore + teleOpScore + endGameScore)"
    }
    
    @IBAction func autoStonesStepper(_ sender: UIStepper) {
        AudioServicesPlaySystemSound(pop)

        if autoDeliveryOutlet.value >= autoPlacingOutlet.value {
            autoPlacingOutlet.isEnabled = true
            autoPlacingOutlet.maximumValue = sender.value
        } else if autoDeliveryOutlet.value < autoPlacingOutlet.value {
            autoPlacingOutlet.value = sender.value
            placingScore = Int(sender.value)*4
            autoPlacingLabel.text = "\(placingScore/4)"
            autoPlacingOutlet.maximumValue = sender.value
        }else {
            autoPlacingOutlet.maximumValue = sender.value
        }
        
        autoStonesDelivered = Int(sender.value*2)
        
        autoStonesDeliveredLabel.text = "\(autoStonesDelivered/2)"
        
        autoScore = repositioningScore+autoStonesDelivered+autoSkystonesDelivered+navigationScore+placingScore
        autoScoreLabel.text = "\(autoScore)"
        totalScoreLabel.text = "\(autoScore + teleOpScore + endGameScore)"
    }
    
//    @IBAction func autoSkyStonesStepper(_ sender: UIStepper) {
////        if skyStoneDeliveredStepper.value == 0 {
////            initalBlocksSegControl.selectedSegmentIndex = 0
////            initalBlocksSegControl.setEnabled(true, forSegmentAt: 2)
////            initalBlocksSegControl.isEnabled = false
////        } else if skyStoneDeliveredStepper.value == 1 {
////            initalBlocksSegControl.isEnabled = true
////            initalBlocksSegControl.setEnabled(false, forSegmentAt: 2)
////        } else {
////            initalBlocksSegControl.isEnabled = true
////            initalBlocksSegControl.setEnabled(true, forSegmentAt: 2)
////        }
//        autoSkystonesDelivered = Int(sender.value)
//
//        autoSkystonesDeliveredLabel.text = "\(autoSkystonesDelivered)"
//
//        autoScore = repositioningScore+autoStonesDelivered+autoSkystonesDelivered
//        autoScoreLabel.text = "\(autoScore)"
//        totalScoreLabel.text = "\(autoScore + endGameScore)"
//    }
    
//    @IBAction func initalBlocks(_ sender: UISegmentedControl) {
//        if skyStoneDeliveredStepper.value == 0 {
//            initalBlocksSegControl.selectedSegmentIndex = 0
//            initalBlocksSegControl.setEnabled(true, forSegmentAt: 2)
//            initalBlocksSegControl.isEnabled = false
//        } else if skyStoneDeliveredStepper.value == 1 {
//            initalBlocksSegControl.isEnabled = true
//            initalBlocksSegControl.setEnabled(false, forSegmentAt: 2)
//        } else {
//            initalBlocksSegControl.isEnabled = true
//            initalBlocksSegControl.setEnabled(true, forSegmentAt: 2)
//        }
//
//        if sender.selectedSegmentIndex == 0 {
//            skyStoneMultplier = 10
//            autoSkystonesDelivered = autoSkystonesDelivered * skyStoneMultplier
//        } else if sender.selectedSegmentIndex == 1 {
//            skyStoneMultplier = 2
//            autoSkystonesDelivered = autoSkystonesDelivered * skyStoneMultplier
//        } else if sender.selectedSegmentIndex == 2 {
//            skyStoneMultplier = 10
//            autoSkystonesDelivered = autoSkystonesDelivered * skyStoneMultplier
//        }
//
//        autoScore = repositioningScore+autoStonesDelivered+autoSkystonesDelivered
//        autoScoreLabel.text = "\(autoScore)"
//        totalScoreLabel.text = "\(autoScore + endGameScore)"
//    }
    
    @IBAction func skystoneBonus(_ sender: UISegmentedControl) {
        AudioServicesPlaySystemSound(pop)

        if sender.selectedSegmentIndex == 0 {
            autoSkystonesDelivered = 0
        } else if sender.selectedSegmentIndex == 1 {
            autoSkystonesDelivered = 10
        } else if sender.selectedSegmentIndex == 2 {
            autoSkystonesDelivered = 20
        }
        
        autoScore = repositioningScore+autoStonesDelivered+autoSkystonesDelivered+navigationScore+placingScore
        autoScoreLabel.text = "\(autoScore)"
        totalScoreLabel.text = "\(autoScore + teleOpScore + endGameScore)"
    }
    
    
    @IBAction func navigationSegControl(_ sender: UISegmentedControl) {
        AudioServicesPlaySystemSound(pop)

        if sender.selectedSegmentIndex == 0 {
            navigationScore = 0
        } else if sender.selectedSegmentIndex == 1 {
            navigationScore = 5
        } else if sender.selectedSegmentIndex == 2 {
            navigationScore = 10
        }
        autoScore = repositioningScore+autoStonesDelivered+autoSkystonesDelivered+navigationScore+placingScore
        autoScoreLabel.text = "\(autoScore)"
        totalScoreLabel.text = "\(autoScore + teleOpScore + endGameScore)"
    }
    
    @IBAction func placingStepperAuto(_ sender: UIStepper) {
        AudioServicesPlaySystemSound(pop)

        if autoDeliveryOutlet.value >= sender.value {
            placingScore = Int(sender.value)*2
            autoPlacingLabel.text = "\(placingScore/2)"
        }
        
        placingScore = Int(sender.value*4)
        
        autoPlacingLabel.text = "\(placingScore/4)"
        
        autoScore = repositioningScore+autoStonesDelivered+autoSkystonesDelivered+navigationScore+placingScore
        autoScoreLabel.text = "\(autoScore)"
        totalScoreLabel.text = "\(autoScore + teleOpScore + endGameScore)"
    }
    
    @IBOutlet weak var autoScoreLabel: UILabel!
    @IBOutlet weak var teleOpScoreLabel: UILabel!
    @IBOutlet weak var totalScoreLabel: UILabel!
    @IBOutlet weak var endGameScoreLabel: UILabel!
    @IBOutlet weak var autoStonesDeliveredLabel: UILabel!
    @IBOutlet weak var autoPlacingLabel: UILabel!
    @IBOutlet weak var stonesDelivered: UILabel!
    @IBOutlet weak var stonesPlaced: UILabel!
    @IBOutlet weak var skyscraperHeight: UILabel!
    
    @IBOutlet weak var supportingLevelsCS1: UILabel!
    
    
    @IBAction func stonesDeliveredTeleOP(_ sender: UIStepper) {
        AudioServicesPlaySystemSound(pop)

//        if teleDeliveredOutlet.value >= placingOutlet.value {
//            placingOutlet.isEnabled = true
//            placingOutlet.maximumValue = sender.value
//        } else if teleDeliveredOutlet.value < placingOutlet.value {
//            placingOutlet.value = sender.value
//            telePlacingScore = Int(sender.value)*2
//            stonesPlaced.text = "\(telePlacingScore/2)"
//            placingOutlet.maximumValue = sender.value
//            if placingOutlet.value >= heightOutlet.value {
//                heightOutlet.isEnabled = true
//                heightOutlet.maximumValue = sender.value
//            } else if placingOutlet.value < heightOutlet.value {
//                heightOutlet.value = sender.value
//                skyscraperScore = Int(sender.value)*2
//                skyscraperHeight.text = "\(skyscraperScore/2)"
//                heightOutlet.maximumValue = sender.value
//            }else {
//                heightOutlet.maximumValue = sender.value
//            }
//        }else {
//            placingOutlet.maximumValue = sender.value
//        }
        

        deliveringScore = Int(sender.value)
        
        stonesDelivered.text = "\(deliveringScore)"
        
        teleOpScore = deliveringScore + telePlacingScore + skyscraperScore
        teleOpScoreLabel.text = "\(teleOpScore)"
        totalScoreLabel.text = "\(autoScore + teleOpScore + endGameScore)"
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        view.endEditing(true)
//        super.touchesBegan(touches, with: event)
//        cStoneOutlet.resignFirstResponder()
//    }
    
    @IBAction func stonesPlacedTeleOP(_ sender: UIStepper) {
        AudioServicesPlaySystemSound(pop)

        if placingOutlet.value >= heightOutlet.value {
            heightOutlet.isEnabled = true
            heightOutlet.maximumValue = sender.value
        } else if placingOutlet.value < heightOutlet.value {
            heightOutlet.value = sender.value
            skyscraperScore = Int(sender.value)*2
            skyscraperHeight.text = "\(skyscraperScore/2)"
            heightOutlet.maximumValue = sender.value
        }else {
            heightOutlet.maximumValue = sender.value
        }
        telePlacingScore = Int(sender.value)
        
        stonesPlaced.text = "\(telePlacingScore)"
        
        teleOpScore = deliveringScore + telePlacingScore + skyscraperScore
        teleOpScoreLabel.text = "\(teleOpScore)"
        totalScoreLabel.text = "\(autoScore + teleOpScore + endGameScore)"
    }
    
    @IBAction func skyScraperHeight(_ sender: UIStepper) {
        AudioServicesPlaySystemSound(pop)

        if placingOutlet.value >= sender.value {
            skyscraperScore = Int(sender.value)*2
            skyscraperHeight.text = "\(skyscraperScore/2)"
        }
        teleOpScore = deliveringScore + telePlacingScore + skyscraperScore
        teleOpScoreLabel.text = "\(teleOpScore)"
        totalScoreLabel.text = "\(autoScore + teleOpScore + endGameScore)"
    }
    
    @IBAction func capStones(_ sender: UISegmentedControl) {
        AudioServicesPlaySystemSound(pop)

        if sender.selectedSegmentIndex == 0 {
            supportingLevels1.isEnabled = false
            supportingLevels2.isEnabled = false
            levelsBelowCS1 = 0
            levelsBelowCS2 = 0
            supportingLevels1.value = 0
            supportingLevels2.value = 0
            supportingLevelsCS1.text = "\(0)"
            supportingLevelsCS2.text = "\(0)"
            numberofCSScore = 0
        } else if sender.selectedSegmentIndex == 1 {
            supportingLevels1.isEnabled = true
            supportingLevels2.isEnabled = false
            levelsBelowCS2 = 0
            supportingLevels2.value = 0
            supportingLevelsCS2.text = "\(0)"
            numberofCSScore = 5
        } else if sender.selectedSegmentIndex == 2 {
            supportingLevels1.isEnabled = true
            supportingLevels2.isEnabled = true
            numberofCSScore = 10
        }
        endGameScore = numberofCSScore + endFoundationMovedScore + endParkingScore + levelsBelowCS1 + levelsBelowCS2
        endGameScoreLabel.text = "\(endGameScore)"
        totalScoreLabel.text = "\(autoScore + teleOpScore + endGameScore)"
    }
    
    var levelsBelowCS1 : Int = 0
    var levelsBelowCS2 : Int = 0

    
    @IBAction func capstoneCount1(_ sender: UIStepper) {
        AudioServicesPlaySystemSound(pop)

        levelsBelowCS1 = Int(sender.value)
        supportingLevelsCS1.text = "\(levelsBelowCS1)"
        endGameScore = numberofCSScore + endFoundationMovedScore + endParkingScore + levelsBelowCS1 + levelsBelowCS2
        endGameScoreLabel.text = "\(endGameScore)"
        totalScoreLabel.text = "\(autoScore + teleOpScore + endGameScore)"
    }
    
    @IBOutlet weak var supportingLevelsCS2: UILabel!
    
    @IBAction func capstoneCount2(_ sender: UIStepper) {
        AudioServicesPlaySystemSound(pop)

        levelsBelowCS2 = Int(sender.value)
        supportingLevelsCS2.text = "\(levelsBelowCS2)"
        endGameScore = numberofCSScore + endFoundationMovedScore + endParkingScore + levelsBelowCS1 + levelsBelowCS2
        endGameScoreLabel.text = "\(endGameScore)"
        totalScoreLabel.text = "\(autoScore + teleOpScore + endGameScore)"
    }
    

    
    @IBAction func foundationEndGame(_ sender: UISegmentedControl) {
        AudioServicesPlaySystemSound(pop)

        if sender.selectedSegmentIndex == 1 {
            endFoundationMovedScore = 0
        } else if sender.selectedSegmentIndex == 0 {
            endFoundationMovedScore = 15
        }
        endGameScore = numberofCSScore + endFoundationMovedScore + endParkingScore + levelsBelowCS1 + levelsBelowCS2
        endGameScoreLabel.text = "\(endGameScore)"
        totalScoreLabel.text = "\(autoScore + teleOpScore + endGameScore)"
    }
    
    
    
    
    @IBAction func endParking(_ sender: UISegmentedControl) {
        AudioServicesPlaySystemSound(pop)

        if sender.selectedSegmentIndex == 0 {
            endParkingScore = 0
        } else if sender.selectedSegmentIndex == 1 {
            endParkingScore = 5
        } else if sender.selectedSegmentIndex == 2 {
            endParkingScore = 10
        }
        endGameScore = numberofCSScore + endFoundationMovedScore + endParkingScore// + levelsBelowCS1 + levelsBelowCS2
        endGameScoreLabel.text = "\(endGameScore)"
        totalScoreLabel.text = "\(autoScore + teleOpScore + endGameScore)"
    }
    

    
}
