using System;
using Business;
using Data.Domain.Intefaces;
using Data.Persistence;
using FluentValidation.AspNetCore;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Swashbuckle.AspNetCore.Swagger;
using WebApp.Filters;

namespace WebApp
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddTransient<IDatabaseContext, DatabaseContext>();
            services.AddTransient<IUsersRepository, UsersRepository>();
            services.AddTransient<IForumCategoryRepository, ForumCategoryRepository>();
            services.AddTransient<IForumThreadRepository, ForumThreadRepository>();
            services.AddTransient<IFridgeRepository, FridgeRepository>();
            services.AddTransient<IIngredientsCategoryRepository, IngredientsCategoryRepository>();
            services.AddTransient<IIngredientsRepository, IngredientsRepository>();
            services.AddTransient<IRecipesRepository, RecipesRepository>();
            services.AddDbContext<DatabaseContext>(options => options.UseSqlServer(Configuration.GetConnectionString("DefaultConnection")));

            services.AddMvc(options =>
                {
                    options.Filters.Add(typeof(DefaultControllerFilter));
                }
            ).AddFluentValidation(fvc => fvc.RegisterValidatorsFromAssemblyContaining<Startup>()).AddSessionStateTempDataProvider();
            // Register the Swagger generator, defining one or more Swagger documents

            // Adds a default in-memory implementation of IDistributedCache.
            services.AddDistributedMemoryCache();

            services.AddSession(options =>
            {
                // Set a short timeout for easy testing.
                options.Cookie.Name = ".KunFooD.Session";
                options.IdleTimeout = TimeSpan.MaxValue;
                options.Cookie.HttpOnly = true; 
            });

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new Info { Title = "KunFooD API", Version = "v1" });
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            // Enable middleware to serve generated Swagger as a JSON endpoint.
            app.UseSwagger();

            // Enable middleware to serve swagger-ui (HTML, JS, CSS, etc.), specifying the Swagger JSON endpoint.
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "KunFooD V1");
            });

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseBrowserLink();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }

            app.UseStaticFiles();
            app.UseSession();

            app.UseMvc(routes =>
            {
                routes.MapRoute(
                    name: "default",
                    template: "{controller=Home}/{action=Index}/{id?}");
            });
        }
    }
}
