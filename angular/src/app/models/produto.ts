import { BaseResourceModel } from "../shared/models/base-resource.model";

export class Produto extends BaseResourceModel {

    constructor(
        public codProduto?: number,
        public descricao?: string,
        public status?: boolean,
    ) {
        super();
     }


    static fromJson(jsonData:any):Produto{
        return Object.assign(new Produto(),jsonData);
    }
}