import { OnInit, AfterContentChecked, Injector, Directive } from '@angular/core';
import { FormBuilder, FormGroup } from "@angular/forms";
import { ActivatedRoute, Router } from "@angular/router";
import { NgxSpinnerService } from 'ngx-spinner';

import { switchMap } from "rxjs/operators";

import { BaseResourceModel } from '../../models/base-resource.model';
import { BaseResourceService } from '../../services/base-resources.service';
import { SweetAlertToast } from '../sweet-alert-toast/sweet-alert-toast/sweet-alert-toast';

@Directive()
export abstract class BaseResourceFormComponent<T extends BaseResourceModel> implements OnInit, AfterContentChecked {

    currentAction: string;
    resourceForm: FormGroup;
    pageTitle: string;
    serverErrorMessages: string[] = null;
    submittingForm: boolean = false;
    cols: any[];

    protected route: ActivatedRoute;
    protected router: Router;
    protected formBuilder: FormBuilder;
    protected spinner: NgxSpinnerService;

    constructor(
        protected injector: Injector,
        public resource: T,
        protected resourceService: BaseResourceService<T>,
        protected jsonDataToResouceFn: (jsonData) => T //Criando um parametro passando uma função
    ) {
        this.route = this.injector.get(ActivatedRoute);
        this.router = this.injector.get(Router);
        this.formBuilder = this.injector.get(FormBuilder);
        this.spinner = this.injector.get(NgxSpinnerService);
    }

    ngOnInit(): void {
        this.setCurrentAction();
        this.buildResourceForm();
        this.loadResource();
    }

    ngAfterContentChecked() {
        //Interface dispara depois que todos os componentes foram carregados.
        this.setPageTitle();
    }

    submitForm() {
        this.submittingForm = true;

        if (this.currentAction == 'new')
            this.createResource();
        else
            this.updateResource();
    }

    // PRIVATE METHODS

    public setViewDisableForm(): boolean {
        //Obtêm a rota corrente na url
        if (this.getCurrentAction('new') || this.getCurrentAction('edit'))
            return false;

        return true;
    }

    protected setCurrentAction() {
        //Obtêm a rota corrente na url
        if (this.getCurrentAction('new'))
            this.currentAction = 'new';
        else if (this.getCurrentAction('view'))
            this.currentAction = 'view';
        else
            this.currentAction = 'edit';
    }

    protected loadResource() {
        //Carrega os dados de acordo com o parâmetro informado.
        if (this.currentAction == 'edit' || this.currentAction == 'view') {

            this.route.paramMap.pipe(
                switchMap(params => this.resourceService.getById(+params.get('id')))
            )
                .subscribe(
                    (resource) => {
                        this.resource = resource;
                        this.resourceForm.patchValue(resource) // binds loaded resource data to ResourceForm
                    },
                    (error) => (error) => this.actionsForError(error)
                )
        }
 
    }

    protected setPageTitle() {
        //Definie o titulo de acordo com o parâmetro da url
        if (this.getCurrentAction('new'))
            this.pageTitle = this.creationPageTitle();
        else if (this.getCurrentAction('view'))
            this.pageTitle = this.viewPageTitle();
        else {
            this.pageTitle = this.editionPageTitle();
        }
    }

    protected creationPageTitle(): string {
        return 'novo';
    }
    protected editionPageTitle(): string {
        return 'Edição';
    }

    protected viewPageTitle(): string {
        return 'Visualizar';
    }

    protected createResource() {
        const resource: T = this.jsonDataToResouceFn(this.resourceForm.value);

        this.resourceService.post(resource)
            .subscribe({
                next: (success) => this.actionsForSuccess(success),
                error: (error) => this.actionsForError(error),
            });
    }

    protected updateResource() {
        const resource: T = this.jsonDataToResouceFn(this.resourceForm.value);

        this.resourceService.put(resource)
            .subscribe({
                next: (success) => this.actionsForSuccess(success),
                error: (error) => this.actionsForError(error),
            });
    }

    protected actionsForSuccess(resource: T) {
        SweetAlertToast.alertMessageToastSuccess('Solicitação processada com sucesso!');
        //toastr.success("Solicitação processada com sucesso!");

        //Obtem a url pai.
        const baseComponentPath: string = this.route.snapshot.parent.url[0].path;

        setTimeout(() => {
            // redirect/reload component page
            this.router.navigateByUrl(baseComponentPath, { skipLocationChange: true }).then(
                () => this.router.navigate([baseComponentPath])
                //() => this.router.navigate([baseComponentPath, resource.id, "edit"])
            )
        }, 1500);
    }

    protected actionsForError(fail) {

        this.serverErrorMessages = fail.error.errors;

        SweetAlertToast.alertMessageToastError('Ocorreu um erro ao processar a sua solicitação!');
    }

    protected setTimeSpinner() {
        setTimeout(() => {
            this.spinner.hide();
        }, 1000);
    }

    protected setShowSpinner() {
        this.spinner.show();
    }

    protected abstract buildResourceForm(): void;

    protected getRoutePath(): string {
        return this.route.snapshot.url[0].path;
    }

    protected getCurrentAction(action: string): boolean {
        if (this.getRoutePath() == action)
            return true;

        return false;
    }
}
