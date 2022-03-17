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
    var note: NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Primeiras  config
        //config do teclado para o textfield  abrir o teclado
        self.newNoteText.becomeFirstResponder()
        if note != nil {
            //atualizar
            self.newNoteText.text = note.value(forKey: "text") as? String
        }
        else{
            //criar um novo
            self.newNoteText.text = ""
        }
       
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
        
        
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        if note != nil{
            //atualiza
            self.updateNote()
        }
        else{
            self.saveNote()
        }

        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func updateNote(){
        
        note.setValue( self.newNoteText.text , forKey: "text")
        note.setValue( Date(), forKey: "date")
        
        do {
            try context.save()
            print("parabéns ta atualizado")
            
        } catch let erro {
            print("deu esse ERRO aqui: \(erro.localizedDescription)")
        }
    }
    func saveNote(){
        //Cria uma nova note
        let newNote = NSEntityDescription.insertNewObject(forEntityName: "Note", into: context)
        
        //Configura a note
        newNote.setValue( self.newNoteText.text, forKey: "text")
        newNote.setValue( Date() , forKey: "date")
       
        
        do {
            try context.save()
            print("parabéns ta safe")
            
        } catch let erro {
            print("deu esse ERRO aqui: \(erro.localizedDescription)")
        }
    }

}
