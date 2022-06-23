import { Injectable, Injector } from '@angular/core';
import { catchError, map, Observable } from 'rxjs';
import { ProdutoCosif } from 'src/app/models/produto-cosif';
import { BaseResourceService } from 'src/app/shared/services/base-resources.service';

@Injectable({
  providedIn: 'root',
})
export class ProdutoCosifService extends BaseResourceService<ProdutoCosif> {
  constructor(protected injector: Injector) {
    super('produtocosif', injector, ProdutoCosif.fromJson);
  }

  getAllProduto(id: number): Observable<ProdutoCosif[]> {
    const apiUrl = `${this.UrlServiceV1}produtocosif/consultar-produtoid/${id}`;
    console.log(apiUrl);

    return this.http.get<ProdutoCosif[]>(apiUrl);
  }
}
