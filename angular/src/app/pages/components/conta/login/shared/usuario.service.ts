import { Injectable, Injector } from "@angular/core";
import { catchError, map, Observable } from "rxjs";
import { BaseResourceService } from "src/app/shared/services/base-resources.service";
import { Usuario } from "./usuario.model";

@Injectable({
  providedIn: 'root'
})
export class UsuarioService extends BaseResourceService<Usuario> {

  constructor(protected injector: Injector) {
    super("", injector, Usuario.fromJson)
  }

  public login(usuario: Usuario): Observable<Usuario> {

    let response = this.post(usuario,false).pipe(
      map(this.extractData),
      catchError(this.serviceError)
    );

    return response;
  }
}