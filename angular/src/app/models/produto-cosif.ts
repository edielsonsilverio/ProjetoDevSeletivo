import { BaseResourceModel } from '../shared/models/base-resource.model';

export class ProdutoCosif extends BaseResourceModel {
  constructor(
    public codProduto?: number,
    public codCosif?: number,
    public codClassificacao?: string,
    public status?: boolean,
    public produto?: string,
    public codCosifClassificacao?: string
  ) {
    super();
  }

  static fromJson(jsonData: any): ProdutoCosif {
    return Object.assign(new ProdutoCosif(), jsonData);
  }
}
