namespace Core.Comunication
{
    //public class ResponseResult
    //{
    //    public ResponseResult()
    //    {
    //        Errors = new ResponseErrorMessages();
    //    }

    //    public string Title { get; set; }
    //    public int Status { get; set; }
    //    public ResponseErrorMessages Errors { get; set; }
    //}

    public class ResponseResult
    {
        public bool Success { get; set; }
        public List<string> Errors { get; set; }
        public dynamic Data { get; set; }
    }


    public class UsuarioRespostaResult
    {
        public string AccessToken { get; set; }
        public int ExpiresIn { get; set; }
        public string RefreshToken { get; set; }
        public DataUsuarioToken UsuarioToken { get; set; }
    }
    public class DataUsuarioToken
    {
        public string Id { get; set; }
        public string Email { get; set; }
        public IEnumerable<DataUsuarioClaim> Claims { get; set; }
    }

    public class DataUsuarioClaim
    {
        public string Value { get; set; }
        public string Type { get; set; }
    }


    public class ResponseResultOld
    {
        public ResponseResultOld()
        {
            Errors = new ResponseErrorMessages();
        }

        public string Title { get; set; }
        public int Status { get; set; }
        public ResponseErrorMessages Errors { get; set; }
    }

    public class ResponseErrorMessages
    {
        public ResponseErrorMessages()
        {
            Mensagens = new List<string>();
        }

        public List<string> Mensagens { get; set; }
    }
}