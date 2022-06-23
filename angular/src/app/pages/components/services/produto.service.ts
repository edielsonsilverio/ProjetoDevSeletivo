import { Injectable,Injector } from '@angular/core';
import { Produto } from 'src/app/models/produto';
import { BaseResourceService } from 'src/app/shared/services/base-resources.service';



@Injectable({
  providedIn: 'root'
})
export class ProdutoService extends BaseResourceService<Produto> {

   constructor(protected injector: Injector) {
    super("produto", injector,Produto.fromJson)
  }
}
