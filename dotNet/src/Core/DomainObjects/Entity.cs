namespace Core.DomainObjects
{
    public abstract class Entity
    {
        public virtual bool EhValido()
        {
            throw new NotImplementedException();
        }

        #region Comparações

        //Configura o operador == para fazer compração de instância
        public static bool operator ==(Entity a, Entity b)
        {
            if (ReferenceEquals(a, null) && ReferenceEquals(b, null))
                return true;

            if (ReferenceEquals(a, null) || ReferenceEquals(b, null))
                return false;

            return a.Equals(b);
        }

        //Configura o operador != para fazer compração de instância
        public static bool operator !=(Entity a, Entity b)
        {
            return !(a == b);
        }

        #endregion
    }
}