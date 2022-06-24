import { Component, Injector, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
// import { FormBuilder, FormGroup, Validantors } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { NgxSpinnerService } from 'ngx-spinner';
import { switchMap } from 'rxjs';
import { Produto } from 'src/app/models/produto';
import { ProdutoCosif } from 'src/app/models/produto-cosif';

import { BaseResourceListComponent } from 'src/app/shared/components/base-resource-list/base-resource-list.component';
import { SweetAlertToast } from 'src/app/shared/components/sweet-alert-toast/sweet-alert-toast/sweet-alert-toast';
import { StringUtils } from 'src/app/shared/services/string-utils';
import { MovimentacaoManual } from '../../../models/movimentacao-manual';
import { MovimentacaoManualService } from '../services/movimentacao-manual.service';
import { ProdutoCosifService } from '../services/produto-cosif.service.service';
import { ProdutoService } from '../services/produto.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styles: [],
})
export class HomeComponent
  extends BaseResourceListComponent<MovimentacaoManual>
  implements OnInit
{
  currentAction: string;
  // resourceForm: FormGroup;
  pageTitle: string;
  serverErrorMessages: string[] = null;
  submittingForm: boolean = false;
  isNovo: boolean = true;
  protected route: ActivatedRoute;
  protected router: Router;
  protected formBuilder: FormBuilder;
  protected spinner: NgxSpinnerService;
  produtoService: ProdutoService;
  produtoCosifService: ProdutoCosifService;

  produtos!: Produto[];
  produtoCosifs!: any[];

  resource: MovimentacaoManual;

    //Constrói as validações do formulário
    imaskConfig = StringUtils.configuraCasasDecimais();

  constructor(
    protected injector: Injector,
    protected movimentacaoService: MovimentacaoManualService
  ) {
    super(injector, movimentacaoService, MovimentacaoManual.fromJson);

    this.route = this.injector.get(ActivatedRoute);
    this.router = this.injector.get(Router);
    this.formBuilder = this.injector.get(FormBuilder);
    this.spinner = this.injector.get(NgxSpinnerService);
    this.produtoService = this.injector.get(ProdutoService);
    this.produtoCosifService = this.injector.get(ProdutoCosifService);
  }

  ngOnInit(): void {
    this.cols = [
      { field: 'dataMes', header: 'Mês' },
      { field: 'dataAno', header: 'Ano' },
      { field: 'codProduto', header: 'Código do Produto' },
      { field: 'produto', header: 'Descrição do Produto' },
      { field: 'numeroLancamento', header: 'NR Lançamento' },
      { field: 'descricao', header: 'Descrição' },
      { field: 'valor', header: 'Valor' },
    ];
    super.ngOnInit();
    this.carregaProduto();

    this.setCurrentAction();
    this.buildResourceForm();
    this.currentAction == 'new';
  }

  showDialog(model: MovimentacaoManual) {
    this.preencherForm(model);
    this.displayModal = true;
  }

  protected preencherForm(model: MovimentacaoManual) {
    this.resourceForm.patchValue({
      id: model.id,
      dataMes: model.dataMes,
      dataAno: model.dataAno,
      descricao: model.descricao,
      codProduto: model.codProduto,
      codCosif: model.codCosif,
      valor: model.valor,
    });
  }

  protected buildResourceForm() {
    //Constrói as validações do formulário
    this.resourceForm = this.formBuilder.group({
      id: [0],
      dataMes: [0, [Validators.required, Validators.minLength(2), Validators.maxLength(2)]],
      dataAno: [0, [Validators.required, Validators.minLength(4), Validators.maxLength(4)]],
      descricao: ['', [Validators.required]],
      codProduto: [0, [Validators.required]],
      codCosif: [0, [Validators.required]],
      valor: [0, [Validators.required]],
      numeroLancamento: [0],
      produto: [''],
      produtoConsif: [''],
      
    });
  }

  public limpar(): void {
    console.log('LIMPANDO');
    
  }

  // PRIVATE METHODS

  public setViewDisableForm(): boolean {
    if (this.getCurrentAction('new') || this.getCurrentAction('edit'))
      return false;

    return true;
  }

  submitForm() {
    this.submittingForm = true;
    this.createResource();
  }

  protected setCurrentAction() {
    this.currentAction = 'new';
  }

  public createResource() {
    const resource: MovimentacaoManual = this.jsonDataToResouceFn(
      this.resourceForm.value
    );
    
    console.log(resource);
    
    this.movimentacaoService.salvar(resource).subscribe({
      next: (success) => this.actionsForSuccess(success),
      error: (error) => this.actionsForError(error),
    });

    this.isNovo = true;
    super.ngOnInit();
  }

  protected actionsForSuccess(resource: MovimentacaoManual) {
    SweetAlertToast.alertMessageToastSuccess(
      'Solicitação processada com sucesso!'
    );
    const baseComponentPath: string = this.route.snapshot.parent.url[0].path;

    setTimeout(() => {
      // redirect/reload component page
      this.router
        .navigateByUrl(baseComponentPath, { skipLocationChange: true })
        .then(
          () => this.router.navigate([baseComponentPath])
          //() => this.router.navigate([baseComponentPath, resource.id, "edit"])
        );
    }, 1500);
  }

  protected actionsForError(fail) {
    this.serverErrorMessages = fail.error.errors;

    SweetAlertToast.alertMessageToastError(
      'Ocorreu um erro ao processar a sua solicitação!'
    );
  }

  onChange(event) {
    this.carregaProdutoCosif(event);
  }

  protected getRoutePath(): string {
    return this.route.snapshot.url[0].path;
  }

  protected getCurrentAction(action: string): boolean {
    if (this.getRoutePath() == action) return true;

    return false;
  }

  private carregaProduto(): void {
    this.produtoService
      .getAll()
      .subscribe((success) => (this.produtos = success));
  }

  private carregaProdutoCosif(id: number): void {
    this.produtoCosifService.getAllProduto(id).subscribe(
      (success) => {
        this.produtoCosifs = success;
      },
      (error) => console.log(error)
    );
  }

  novo() {
    this.isNovo = false;
    this.limparCampo();
    this.currentAction == 'new';
  }

  limparCampo() {
    var camposInput = document.querySelectorAll('input');
    var camposSelect = document.querySelectorAll('select');
    var campoTextArea = document.querySelector('textarea');

    campoTextArea.value = '';
    camposInput.forEach((campo) => {
      campo.value = '';
    });

    camposSelect.forEach((campo) => {
      campo.value = '';
    });
  }
}
