import Swal, { SweetAlertIcon } from 'sweetalert2';

import toastr from 'toastr';


export class SweetAlertToast {

  //Sweet como toast

  public static alertMessageSuccess(title: string, message: string) {
    this.alertMessageView(title, message, 'success');
  }

  public static alertMessageError(title: string, message: string) {
    this.alertMessageView(title, message, 'error');
  }

  public static alertMessageWarning(title: string, message: string) {
    this.alertMessageView(title, message, 'warning');
  }

  public static alertMessageInfo(title: string, message: string) {
    this.alertMessageView(title, message, 'info');
  }

  public static alertMessageQuestion(title: string, message: string) {
    this.alertMessageView(title, message, 'question');
  }


  //Mensagem de Confirmação com interação
  public static alertMessageToastSuccess(title: string) {
    this.alertMessageResultText('success', title);
  }

  public static alertMessageToastError(title: string) {
    this.alertMessageResultText('error', title);
  }

  public static alertMessageToastWarning(title: string) {
    this.alertMessageResultText('warning', title);
  }

  public static alertMessageToastInfo(title: string) {
    this.alertMessageResultText('info', title);
  }

  public static alertMessageToastQuestion(title: string) {
    this.alertMessageResultText('question', title);
  }

  //Mensagem de Confirmação com interação
  public static messageAlertConfirmSuccess(title: string, message: string): Promise<any> {
    return this.messageAlertConfirm(title, message, 'success');
  }

  public static messageAlertConfirmError(title: string, message: string): Promise<any> {
    return this.messageAlertConfirm(title, message, 'error');
  }

  public static messageAlertConfirmWarning(title: string, message: string): Promise<any> {
    return this.messageAlertConfirm(title, message, 'warning');
  }

  public static messageAlertConfirmInfo(title: string, message: string): Promise<any> {
    return this.messageAlertConfirm(title, message, 'info');
  }

  public static messageAlertConfirmQuestion(title: string, message: string): Promise<any> {
    return this.messageAlertConfirm(title, message, 'question');
  }


  //Sweet como toast

  public static toastMessageSuccess(title: string, message: string) {
    this.toastMessage(title, message, 'success');
  }

  public static toastMessageError(title: string, message: string) {
    this.toastMessage(title, message, 'error');
  }

  public static toastMessageWarning(title: string, message: string) {
    this.toastMessage(title, message, 'warning');
  }

  public static toastMessageInfo(title: string, message: string) {
    this.toastMessage(title, message, 'info');
  }

  public static toastMessageQuestion(title: string, message: string) {
    this.toastMessage(title, message, 'question');
  }



  //MÉTODOS PRIVADOS
  private static alertMessageView(title: string, message: string, icon: SweetAlertIcon) {
    Swal.fire(
      title,
      message,
      icon
    )
  }

  private static alertMessageResultText(icon: SweetAlertIcon, title: string) {
    Swal.fire({
      position: 'top-end',
      icon: icon,
      text: title,
      showConfirmButton: false,
      timer: 1500,
      confirmButtonColor: '#8CD4F5'
    });
  }

  private static messageAlertConfirm(title: string, message: string, icon: SweetAlertIcon) {
    return Swal.fire({
      title: title,
      text: message,
      icon: icon,
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Sim',
      cancelButtonText: 'Não'
    }).then((result) => {

      if (result.isConfirmed)
        return true;
      else
        return false;
    });
  }

  private static toastMessage(title: string, message: string, type: string) {
    toastr.options = {
      "closeButton": true,
      "debug": false,
      "newestOnTop": true,
      "progressBar": true,
      "positionClass": "toast-top-right",
      "preventDuplicates": false,
      "onclick": null,
      "showDuration": "300",
      "hideDuration": "1000",
      "timeOut": "1500",
      "extendedTimeOut": "1000",
      "showEasing": "swing",
      "hideEasing": "linear",
      "showMethod": "fadeIn",
      "hideMethod": "fadeOut"
    }
    switch (type) {
      case 'success':
        toastr.success( message,title);
        break;
      case 'error':
        toastr.success( message,title);
        break;
      case 'warning':
        toastr.warning( message,title);
        break;
      case 'info':
        toastr.info( message,title);
        break;
      default:
        toastr.success( message,title);
    }

  }

}
/*
    new Toast('error', 'toast-bottom-full-width', 'This is positioned in the bottom full width. You can also style the icon any way you like.'),
    new Toast('info', 'toast-top-full-width', 'top full width'),
    new Toast('warning', 'toast-top-left', 'This is positioned in the top left. You can also style the icon any way you like.'),
    new Toast('success', 'toast-top-right', 'top right'),
    new Toast('warning', 'toast-bottom-right', 'bottom right'),
    new Toast('error', 'toast-bottom-left', 'bottom left')


#toast-container > .toast {
    background-image: none !important;
}

    #toast-container > .toast:before {
        position: fixed;
        font-family: FontAwesome;
        font-size: 24px;
        line-height: 18px;
        float: left;
        color: #FFF;
        padding-right: 0.5em;
        margin: auto 0.5em auto -1.5em;
    }        
    #toast-container > .toast-warning:before {
        content: "\f003";
    }
    #toast-container > .toast-error:before {
        content: "\f001";
    }
    #toast-container > .toast-info:before {
        content: "\f005";
    }
    #toast-container > .toast-success:before {
        content: "\f002";
}
*/