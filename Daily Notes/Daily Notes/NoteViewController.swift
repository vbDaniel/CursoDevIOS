//
//  NoteViewController.swift
//  Daily Notes
//
//  Created by Rethink on 15/03/22.
//

import UIKit
import CoreData

class NoteViewController: UIViewController {

    @IBOutlet weak var newNoteText: UITextView!
    var context: NSManagedObjectContext!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Primeiras  config
        //config do teclado para o textfield  abrir o teclado
        self.newNoteText.becomeFirstResponder()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
        
        
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        
        self.saveNote()
        
    }
    
    func saveNote(){
        //Cria uma nova note
        let newNote = NSEntityDescription.insertNewObject(forEntityName: "Note", into: context)
        
        //Configura a note
        newNote.setValue( self.newNoteText.text, forKey: "text")
        newNote.setValue( Date() , forKey: "date")
        
        do {
            try context.save()
            print("Mano deu certin, parabéns ta safe")
        } catch let erro as Error {
            print("Mano sorry ai deu esse ERRO aqui: \(erro.localizedDescription)")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
