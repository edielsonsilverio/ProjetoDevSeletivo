import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-form-dialog',
  templateUrl: './form-dialog.component.html',
  styles: [
  ]
})
export class FormDialogComponent implements OnInit {

  @Input('dialog-title') dialogTitle: string;
  @Input('button-text') buttonText: string = 'Voltar';

  @Input('dialog-visible') displayModal: boolean = false;
  @Input('dialog-closable') closable: boolean = true;
  @Input('dialog-maximizable') maximizable: boolean = true;
  @Input('dialog-resizable') resizable: boolean = true;
  @Input('dialog-draggable') draggable: boolean = true;
 

  
  //displayModal: boolean = false;

  constructor() { }

  ngOnInit(): void {
    console.log(this.displayModal);
    
  }

  closeDialog() {
    this.displayModal = false;
  }
}
