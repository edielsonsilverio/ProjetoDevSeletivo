import { Component, Input, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';

@Component({
  selector: 'app-form-field-error',
  template: `
   <p class="text-danger">
    <i *ngIf="errorMessage" class="fa fa-exclamation-circle" aria-hidden="true">&nbsp;{{errorMessage}}</i>
    </p>
  `
})
export class FormFieldErrorComponent implements OnInit {

  @Input('form-control') formControl?: FormControl;

  constructor() { }

  ngOnInit() {
  }

  public get errorMessage(): string | null {
    if (this.mustShowErrorMessage())
      return this.getErrorMessage();

    return null;
  }


  private mustShowErrorMessage(): boolean {
    return this.formControl.invalid && this.formControl.touched
  }

  private getErrorMessage(): string | null {
    if (this.formControl.errors['required'])
      return "dado obrigatório";

    else if (this.formControl.errors['email'])
      return "formato de email inválido"

    else if (this.formControl.errors['minlength']) {
      const requiredLength = this.formControl.errors['minlength'].requiredLength;
      return `deve ter no mínimo ${requiredLength} caracteres`;
    }

    else if (this.formControl.errors['maxlength']) {
      const requiredLength = this.formControl.errors['maxlength'].requiredLength;
      return `deve ter no máximo ${requiredLength} caracteres`;
    }

    return null;
  }
}
