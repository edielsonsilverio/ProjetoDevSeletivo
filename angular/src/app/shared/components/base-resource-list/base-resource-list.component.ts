import { Directive, Injector, OnInit } from "@angular/core";
import { FormBuilder, FormGroup } from "@angular/forms";

import { NgxSpinnerService } from "ngx-spinner";
import { SortEvent } from "primeng/api";
import { Table } from "primeng/table";

import { BaseResourceModel } from "../../models/base-resource.model";
import { BaseResourceService } from "../../services/base-resources.service";

import { SweetAlertToast } from "../sweet-alert-toast/sweet-alert-toast/sweet-alert-toast";


@Directive()
export abstract class BaseResourceListComponent<T extends BaseResourceModel> implements OnInit {

    resourceForm: FormGroup;
    resources: T[] = [];
    message: string = `Deseja realmente excluir`;
    cols: any[];
    registroSelecionado: T = null;
    loading: boolean = true;
    exportColumns: any[];
    filterColumns: string[];
    displayModal: boolean = false;

    //protected formBuilder: FormBuilder;
    protected spinner: NgxSpinnerService;

    constructor(protected injector: Injector,
        protected resourceService: BaseResourceService<T>,
        protected jsonDataToResouceFn: (jsonData) => T //Criando um parametro passando uma função
    ) {
        this.spinner = this.injector.get(NgxSpinnerService);
    }

    ngOnInit(): void {
        this.setShowSpinner();

        this.resourceService.getAll().subscribe( {
            next:(success) => this.resources = success,
            error:(error)=>this.actionsForError(error)
        });

        // this.resourceService.getAll().subscribe(
        //     resources => this.resources = resources,
        //     error => (error)=>this.actionsForError(error)
        // );
        this.setTimeSpinner();

        this.exportColumns = this.cols.map(col => ({ title: col.header, dataKey: col.field }));
        this.filterColumns = this.cols.map(col => (col.field.toString()));

        this.buildResourceForm();

       
    }

    protected abstract buildResourceForm(): void;

    excluir(resource: T, message: string = '') {

        if (message.length == 0)
            this.message = `${this.message} este item?`;
        else
            this.message = `${this.message} ${message} ?`;

        SweetAlertToast.messageAlertConfirmQuestion('Excluir Registro?', this.message).then((result) => {
            if (result) {
                this.resourceService.delete(resource.id).subscribe(
                    () => this.resources = this.resources.filter(element => element != resource),
                    () => alert("Erro ao tentar excluir.")
                );

                SweetAlertToast.alertMessageSuccess('Registro excluído!', 'Registro excluído com sucesso!');
            } else {
                SweetAlertToast.toastMessageQuestion('Cancelado!', 'Operação foi cancelada!');
                SweetAlertToast.alertMessageWarning('Cancelado!', 'Operação foi cancelada!');
            }
        }).catch(console.error);
    }


    showDialog(resource: T) {
       // this.obterSelecionado( resource);
        this.displayModal = true;
    }

    closeDialog() {
        this.displayModal = false;
    }

    protected setTimeSpinner() {
        setTimeout(() => {
            this.spinner.hide();
        }, 1000);
    }

    protected setShowSpinner() {
        this.spinner.show();
    }

    onRowSelect(event: any) {
        this.obterSelecionado( event.data)
    }

    onRowUnselect(event: any) {
        let select = event.data;
    }

    isRowSelectable(event: any) {
        return !this.isOutOfStock(event.data);
    }

    isOutOfStock(data: any) {
        return data.descricao === 'OUTOFSTOCK';
    }

    clear(table: Table) {
        table.clear();
    }

    exportPdf() {


    }

    exportExcel() {

    }

    saveAsExcelFile(buffer: any, fileName: string): void {

    }

    protected obterSelecionado(data:any):T{
        const resource: T = this.jsonDataToResouceFn(data);
        //console.log(resource);
        
        this.registroSelecionado = resource;
        this.resourceForm.patchValue(this.registroSelecionado);
        return resource;
    }

    protected actionsForError(fail) {

        const errors = fail.error.errors;
        console.log(errors);
        
        errors.forEach(element => {
            SweetAlertToast.alertMessageError('Erro',element);
        });;
       
        //SweetAlertToast.alertMessageToastError('Ocorreu um erro ao processar a sua solicitação!');
    }

    customSort(event: SortEvent) {
        event.data.sort((data1, data2) => {
            let value1 = data1[event.field];
            let value2 = data2[event.field];
            let result = null;

            if (value1 == null && value2 != null)
                result = -1;
            else if (value1 != null && value2 == null)
                result = 1;
            else if (value1 == null && value2 == null)
                result = 0;
            else if (typeof value1 === 'string' && typeof value2 === 'string')
                result = value1.localeCompare(value2);
            else
                result = (value1 < value2) ? -1 : (value1 > value2) ? 1 : 0;

            return (event.order * result);
        });
    }

}