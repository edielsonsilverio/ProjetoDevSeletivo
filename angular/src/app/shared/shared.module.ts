import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from "@angular/forms";
import { BreadCrumbComponent } from './components/bread-crumb/bread-crumb.component';
import { RouterModule } from '@angular/router';

import { PageHeaderComponent } from './components/page-header/page-header.component';
import { FormFieldErrorComponent } from './components/form-field-error/form-field-error.component';
import { ServerErrorMessagesComponent } from './components/server-error-messages/server-error-messages.component';
import { ToolbarFromListComponent } from './components/toolbar-from-list/toolbar-from-list.component';
import { SppinerTimeComponent } from './components/sppiner-time/sppiner-time.component';

import { NgxSpinnerModule } from 'ngx-spinner';
import { ButtonModule } from 'primeng/button';
import { TableModule } from 'primeng/table';
import { InputTextModule } from 'primeng/inputtext';
import { ToolbarModule } from 'primeng/toolbar';
import { FileUploadModule } from 'primeng/fileupload';
import { TooltipModule } from 'primeng/tooltip';
import {DialogModule} from 'primeng/dialog';
import {DynamicDialogModule} from 'primeng/dynamicdialog';
import { FormDialogComponent } from './components/form-dialog/form-dialog.component';
import { InputNumberModule } from 'primeng/inputnumber';

@NgModule({
  declarations: [
    BreadCrumbComponent,
    PageHeaderComponent,
    FormFieldErrorComponent,
    ServerErrorMessagesComponent,
    SppinerTimeComponent,
    ToolbarFromListComponent,
    FormDialogComponent
  ],
  imports: [
    CommonModule,
    ReactiveFormsModule,
    RouterModule,
    NgxSpinnerModule,
    TableModule,
    ButtonModule,
    InputTextModule,
    ToolbarModule,
    FileUploadModule,
    TooltipModule,
    DialogModule,
    DynamicDialogModule,
    InputNumberModule,
  ],
  exports: [
    //Módulo Compartilhados
    CommonModule,
    ReactiveFormsModule,
    RouterModule,
    TableModule,
    ButtonModule,
    InputTextModule,
    ToolbarModule,
    FileUploadModule,
    TooltipModule,
    DialogModule,
    DynamicDialogModule,
    InputNumberModule,
    
    //Componente Compartilhados
    BreadCrumbComponent,
    PageHeaderComponent,
    FormFieldErrorComponent,
    ServerErrorMessagesComponent,
    SppinerTimeComponent,
    ToolbarFromListComponent,
    FormDialogComponent
  ]
})
export class SharedModule { }
