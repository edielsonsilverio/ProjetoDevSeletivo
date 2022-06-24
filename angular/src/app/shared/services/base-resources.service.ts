import {
  HttpClient,
  HttpErrorResponse,
  HttpHeaders,
} from '@angular/common/http';
import { Injector } from '@angular/core';

import { Observable, throwError } from 'rxjs';
import { map, catchError, flatMap } from 'rxjs/operators';
import { environment } from 'src/environments/environment';

import { BaseResourceModel } from '../models/base-resource.model';
import { LocalStorageUtils } from './localstorage';

export abstract class BaseResourceService<T extends BaseResourceModel> {
  protected http: HttpClient;
  public LocalStorage = new LocalStorageUtils();

  //Url global do servidor externo, está declarada no arquivo environments.ts .
  protected UrlServiceV1 = environment.apiUrlv1;

  constructor(
    protected apiPath: string,
    protected injector: Injector,
    protected jsonDataToResourceFn: (jsonData: any) => T
  ) {
    this.http = injector.get(HttpClient);
  }

  getAll(token: boolean = false): Observable<T[]> {
    const url = `${this.UrlServiceV1}${this.apiPath}`;

    return this.http
      .get(url, token ? this.ObterAuthHeaderJson() : this.ObterHeaderJson())
      .pipe(
        map(this.jsonDataToResources.bind(this)),
        catchError(this.handleError)
      );
  }

  getById(
    id: number,
    token: boolean = false,
    pathRouter: string = ''
  ): Observable<T> {
    let url = '';
    if (pathRouter === '') url = `${this.UrlServiceV1}${this.apiPath}/${id}`;
    else url = `${this.UrlServiceV1}${this.apiPath}/${pathRouter}/${id}`;

    return this.http
      .get(url, token ? this.ObterAuthHeaderJson() : this.ObterHeaderJson())
      .pipe(
        map(this.jsonDataToResource.bind(this)),
        catchError(this.handleError)
      );
  }

  getAllById(
    id: number,
    token: boolean = false,
    pathRouter: string = ''
  ): Observable<T[]> {
    let url = '';
    if (pathRouter === '') url = `${this.UrlServiceV1}${this.apiPath}/${id}`;
    else url = `${this.UrlServiceV1}${this.apiPath}/${pathRouter}/${id}`;

    return this.http
      .get(url, token ? this.ObterAuthHeaderJson() : this.ObterHeaderJson())
      .pipe(
        map(this.jsonDataToResource.bind(this)),
        catchError(this.handleError)
      );
  }

  post(resource: T, token: boolean = false): Observable<T> {
    const url = `${this.UrlServiceV1}${this.apiPath}/`;
    
    console.log('teste ' +resource);
    
    return this.http
      .post(url, token ? this.ObterAuthHeaderJson() : this.ObterHeaderJson())
      .pipe(
        map(this.jsonDataToResource.bind(this)),
         //map(() => resource),
        catchError(this.handleError)
      );
  }

  put(resource: T, token: boolean = false): Observable<T> {
    const url = `${this.UrlServiceV1}${this.apiPath}/${resource.id}`;

    return this.http
      .put(url, token ? this.ObterAuthHeaderJson() : this.ObterHeaderJson())
      .pipe(
        map(() => resource),
        catchError(this.handleError)
      );
  }

  delete(id: number, token: boolean = false): Observable<any> {
    const url = `${this.UrlServiceV1}${this.apiPath}/${id}`;

    return this.http
      .delete(url, token ? this.ObterAuthHeaderJson() : this.ObterHeaderJson())
      .pipe(
        map(() => null),
        catchError(this.handleError)
      );
  }

  // PROTECTED METHODS

  protected jsonDataToResources(jsonData: any[]): T[] {
    const resources: T[] = [];
    jsonData.forEach((element) =>
      resources.push(this.jsonDataToResourceFn(element))
    );
    return resources;
  }

  protected jsonDataToResource(jsonData: any): T {
    return this.jsonDataToResourceFn(jsonData);
  }

  protected handleError(response: Response | any): Observable<any> {
    let customError: string[] = [];

    if (response instanceof HttpErrorResponse) {
      if (response.statusText === 'Unknown Error') {
        customError.push('Ocorreu um erro desconhecido');
        response.error.errors = customError;
      }
    }
    return throwError(response);
  }

  //Método para configura o cabeçalho para o httpClient
  protected ObterHeaderJson() {
    return {
      headers: new HttpHeaders({
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
      }),
    };
  }

  //Método para configura o cabeçalho para o httpClient enviando o token junto
  protected ObterAuthHeaderJson() {
    return {
      headers: new HttpHeaders({
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': '*',
        Authorization: `Bearer ${this.LocalStorage.obterTokenUsuario()}`,
      }),
    };
  }

  //Método para extair o retorno de sucesso
  protected extractData(response: Response | any) {
    return response.data || {};
  }

  //Método para extair o erros encontrados do retorno do servidor
  protected serviceError(response: Response | any) {
    let customError: string[] = [];

    if (response instanceof HttpErrorResponse) {
      if (response.statusText === 'Unknown Error') {
        customError.push('Ocorreu um erro desconhecido');
        response.error.errors = customError;
      }
    }
    return throwError(response);
  }
}
