namespace Core.DomainObjects;

public class Notificacao : INotificacao
{
    private List<NotificacaoMensagem> _notificacoes;
    public Notificacao() => _notificacoes = new List<NotificacaoMensagem>();
    public void Manipualador(NotificacaoMensagem notificacao) => _notificacoes.Add(notificacao);
    public List<NotificacaoMensagem> ObterNotificacao() => _notificacoes;
    public bool TemNotificacao() => _notificacoes.Any();
}

public class NotificacaoMensagem
{
    public NotificacaoMensagem(string mensagem) => Mensagem = mensagem;
    public string Mensagem { get; }
}
