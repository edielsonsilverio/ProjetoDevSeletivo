import {Component,  ElementRef,  Injector,  OnInit  } from '@angular/core';
import { Validators,} from '@angular/forms';
import { BaseResourceFormComponent } from 'src/app/shared/components/base-resource-form/base-resource-form.component';
import { ValidationMessages } from 'src/app/shared/services/generic-form-validation';
import { Usuario } from './shared/usuario.model';
import { UsuarioService } from './shared/usuario.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls : ['./login.component.css']
})

export class LoginComponent extends BaseResourceFormComponent<Usuario> implements OnInit {
  
  resource : Usuario = new Usuario();
  validationMessages: ValidationMessages;
  formInputElements: ElementRef[];
  errors = [];
  usuario: Usuario;

  returnUrl: string;

  constructor(
    protected loginService: UsuarioService,
    protected injector: Injector
  ) {
    super(injector, new Usuario(), loginService, Usuario.fromJson);

    
    this.validationMessages = {
      email: {
        required: 'Informe o e-mail',
        email: 'Email inválido',
      },
      password: {
        required: 'Informe a senha',
        rangeLength: 'A senha deve possuir entre 6 e 15 caracteres',
      },
    };
  }
  
  protected buildResourceForm() {
    //Constrói as validações do formulário
    this.resourceForm = this.formBuilder.group({
      email: [null, [Validators.required, Validators.minLength(6), Validators.maxLength(15)]],
      password: [null]
    });

  }



  login() {
    console.log('Chegou aqui.');
    
  }
} 