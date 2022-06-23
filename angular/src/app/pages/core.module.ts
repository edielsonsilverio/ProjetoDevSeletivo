import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';

import { RouterModule } from '@angular/router';
import { NotFoundComponent } from './components/not-found/not-found.component';
import { MenuComponent } from './components/menu/menu.component';
import { FooterComponent } from './components/footer/footer.component';
import { AcessoNegadoComponent } from './components/acesso-negado/acesso-negado.component';
import { HomeComponent } from './components/home/home.component';
import { MenuLoginComponent } from './components/menu-login/menu-login.component';
 
export const httpInterceptorProviders = [
  { provide: HTTP_INTERCEPTORS, useClass: ErrorInterceptor, multi: true },
];

import { registerLocaleData } from '@angular/common';
import localePt from '@angular/common/locales/pt';
import { ErrorInterceptor } from './services/error.handler.service';
import { LoginComponent } from './components/conta/login/login.component';

import { SharedModule } from '../shared/shared.module';
import { ContaRoutingModule } from './core-routing.module';
import { CoreAppComponent } from './core.app.component';
registerLocaleData(localePt);


@NgModule({
  declarations: [
    NotFoundComponent,
    MenuComponent,
    FooterComponent,
    AcessoNegadoComponent,
    HomeComponent,
    MenuLoginComponent,
    LoginComponent,
    CoreAppComponent
  ],
  imports: [
    CommonModule,
    BrowserModule,
    BrowserAnimationsModule,
    HttpClientModule,
    RouterModule,
    SharedModule,
    ContaRoutingModule
  ],
  exports:[
    //Modulos que são compartilhados.
    BrowserModule,
    BrowserAnimationsModule,
    HttpClientModule,

    //Componentes que são compartilhados
    NotFoundComponent,
    MenuComponent,
    FooterComponent,
    AcessoNegadoComponent,
    HomeComponent,
    MenuLoginComponent ,
    CoreAppComponent
  ],
  providers: [
    httpInterceptorProviders
  ]
})
export class CoreModule { }
