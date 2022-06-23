import { Injectable, Injector } from '@angular/core';

import { MovimentacaoManual } from "../../../models/movimentacao-manual";
import { BaseResourceService } from 'src/app/shared/services/base-resources.service';
import { Observable, map, catchError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})

export class MovimentacaoManualService extends BaseResourceService<MovimentacaoManual> {

  constructor(protected injector: Injector) {
    super("movimentacao-manual", injector,MovimentacaoManual.fromJson)
  }

}