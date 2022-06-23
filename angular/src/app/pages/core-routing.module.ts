import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { LoginComponent } from "./components/conta/login/login.component";

const contaRouterConfig: Routes = [
  {
    path: '', component: LoginComponent,
    children: [
     //{ path: 'cadastro', component: CadastroComponent,canActivate:[ContaGuard],canDeactivate:[ContaGuard] },
     // { path: 'login', component: LoginComponent,canActivate: [ContaGuard] }
      { path: 'login', component: LoginComponent }
    ]
  }
];


@NgModule({
  imports: [
      RouterModule.forChild(contaRouterConfig)
  ],
  exports: [RouterModule]
})
export class ContaRoutingModule { }
