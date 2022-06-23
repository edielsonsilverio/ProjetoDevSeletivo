namespace Core.DomainObjects
{
    public interface INotificacao
    {
        bool TemNotificacao();
        List<NotificacaoMensagem> ObterNotificacao();
        void Manipualador(NotificacaoMensagem notifier);
    }
}