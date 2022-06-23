import { BaseResourceModel } from "src/app/shared/models/base-resource.model";

export class Usuario extends BaseResourceModel {

    constructor(
        public nome?: string,
        public celular?: string,
        public email?: string,
        public password?: string,
        public confirmPassword?: string,
    ) {
        super();
    }

  public  static fromJson(jsonData: any): Usuario {
        return Object.assign(new Usuario(), jsonData);
    }
}
