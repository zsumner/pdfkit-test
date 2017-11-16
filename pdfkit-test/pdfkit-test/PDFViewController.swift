//
//  PDFViewController.swift
//  pdfkit-test
//
//  Created by Zachary Sumner on 11/15/17.
//  Copyright © 2017 Zachary Sumner. All rights reserved.
//

import UIKit
import PDFKit

class PDFViewController: UIViewController {
	
	var pdfDocument: PDFDocument?
	var pdfView: PDFView!
	

    override func viewDidLoad() {
        super.viewDidLoad()
		pdfView = PDFView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
		
		let url = Bundle.main.url(forResource: "sample", withExtension: "pdf")
		pdfDocument = PDFDocument(url: url!)
		
		pdfView.document = pdfDocument
		pdfView.displayMode = PDFDisplayMode.singlePageContinuous
		pdfView.autoScales = true
		
		self.view.addSubview(pdfView)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
