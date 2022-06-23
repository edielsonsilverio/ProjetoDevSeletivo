using WebApi.Configuration;

namespace WebApi;
public class Startup : Core.WebAPI.IStartup
{
    public IConfiguration Configuration { get; }
    public Startup(IHostEnvironment hostEnvironment)
    {
        var builder = new ConfigurationBuilder()
            .SetBasePath(hostEnvironment.ContentRootPath)
            .AddJsonFile("appsettings", true, true)
            .AddJsonFile($"appsettings.{hostEnvironment.EnvironmentName}.json", true, true)
            .AddEnvironmentVariables();

        //if (hostEnvironment.IsDevelopment())
        //    builder.AddUserSecrets<Startup>();

        Configuration = builder.Build();
    }

    public void ConfigureServices(IServiceCollection services)
    {
        services.AddIdentityConfiguration(Configuration);

        services.AddAutoMapper(typeof(Startup));

        services.AddApiConfiguration();

        services.AddSwaggerConfiguration();

        services.AddDependencyInjection(Configuration);
    }

    public void Configure(WebApplication app, IWebHostEnvironment env/*, IApiVersionDescriptionProvider provider*/)
    {
        //app.UseSwaggerConfiguration(provider);
        app.UseSwaggerConfiguration();
        app.UseApiConfiguration(env);
    }
}
 
