//
//  PDFTableViewController.swift
//  pdfkit-test
//
//  Created by Zachary Sumner on 11/15/17.
//  Copyright © 2017 Zachary Sumner. All rights reserved.
//

import UIKit
import PDFKit

class PDFTableViewController: UITableViewController {
	let fileDir = "Users/zacharysumner/pdfkit-test/pdfkit-test/pdfkit-test/PDFs/"
	
	var pdfToView: String?
	

    override func viewDidLoad() {
        super.viewDidLoad()
		//setupFileNames()
		

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func loadFileNames() -> [String] {
		var fileList: [String] = []
		let fm = FileManager.default
		let path = fileDir
		
		do {
		let files = try fm.contentsOfDirectory(atPath: path)
			
		for file in files {
			fileList.append(file)
		}
		} catch {
			
		}
		return fileList
	}

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
		return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return loadFileNames().count
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellIdentifier = "PDFTableViewCell"
		guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PDFTableViewCell else {
			fatalError("The dequeued cell is not an instance of MealTableViewCell.")
		}
        // Configure the cell...
		let fileList = loadFileNames()
		let file = fileList[indexPath.row]
		cell.PDFNameLabel.text = file

		return cell
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
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let indexPath = tableView.indexPathForSelectedRow
		let currentCell = tableView.cellForRow(at: indexPath!) as! UITableViewCell
		pdfToView = currentCell.textLabel?.text
		
		
		
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if (segue.identifier == "PDFViewController"){
			var viewController = segue.destination as PDFViewController
			viewController.pdfToViewk
		}
	}

}
