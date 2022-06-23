using Core.DomainObjects;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;


namespace Core.Data
{
    public abstract class EntityMapping<TEntity> : IEntityTypeConfiguration<TEntity> where TEntity : Entity
    {
        private readonly string _tableName;

        protected EntityMapping(string tableName = "") => _tableName = tableName;

        public virtual void Configure(EntityTypeBuilder<TEntity> builder)
        {
            if (!string.IsNullOrEmpty(_tableName))
                builder.ToTable(_tableName);

        }
    }
}