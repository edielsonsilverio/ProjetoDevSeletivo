import { BaseResourceModel } from 'src/app/shared/models/base-resource.model';
import { ProdutoCosif } from './produto-cosif';

 

export class MovimentacaoManual extends BaseResourceModel {

    constructor(
        public dataMes?: number,
        public dataAno?: number,
        public numeroLancamento?: number,
        public descricao?: string,
        public valor?: number,
        public codProduto?: number,
        public produto?: number,
        public codCosif?: number,
        //public produtoConsif?: ProdutoCosif
    ) {
        super();
     }


    static fromJson(jsonData:any):MovimentacaoManual{
       
        return Object.assign(new MovimentacaoManual(),jsonData);
    }
}