//  CoreDataHelper.swift
//  MakeSchoolNotes
//
//  Created by Nikhil 7/7/17.
//


import UIKit

class DisplayNoteViewController: UIViewController {
    
    @IBOutlet weak var noteTitleTextField: UITextField!
    @IBOutlet weak var noteContentTextView: UITextView!
    
    var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let note = note {
            navigationItem.title = note.title
            noteTitleTextField.text = note.title
            noteContentTextView.text = note.content
        } else {
            noteTitleTextField.text = ""
            noteContentTextView.text = ""
        }
        
        //or
        //noteTitleTextField.text = note?.title ?? ""
        //noteContentTextView.text = note?.content ?? ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                
        if segue.identifier == "save" {
            
            // if note exists, update title and content
            let note = self.note ?? CoreDataHelper.crateNote()
            note.title = noteTitleTextField.text ?? ""
            note.content = noteContentTextView.text ?? ""
            note.modificationTime = Date() as NSDate
            CoreDataHelper.saveNote()
            
        }
    }
}
