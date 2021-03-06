public class DependencyInjection
    {
        public static void ConfigureServices(IServiceCollection services, IConfiguration configuration)
        {

            if (configuration is IConfigurationRoot)
            {
                services.AddSingleton<IConfigurationRoot>(configuration as IConfigurationRoot);   // IConfigurationRoot
            }

            services.AddSingleton<IConfiguration>(configuration);   // IConfiguration explicitly

            string connString = configuration.GetConnectionString("Default");
            // https://docs.microsoft.com/en-us/aspnet/core/fundamentals/dependency-injection?view=aspnetcore-2.2
            // The are a number of differe Add* methods you can use. Please verify which one you
            // should be using services.AddScoped<IMyDependency, MyDependency>();

            // services.AddTransient<IOperationTransient, Operation>();

            // services.AddScoped<IOperationScoped, Operation>();

            // services.AddSingleton<IOperationSingleton, Operation>();

            services.AddSingleton<IAuthenticationService<int>, WebAuthenticationService>();

            services.AddSingleton<ICartItemService, CartItemService>();

            services.AddSingleton<ICartService, CartService>();

            services.AddSingleton<Sabio.Data.Providers.IDataProvider, SqlDataProvider>(delegate (IServiceProvider provider)
            {
                return new SqlDataProvider(connString);
            }
            );

            services.AddSingleton<IFavoriteWorkshopService, FavoriteWorkshopsService>();

            services.AddSingleton<IIdentityProvider<int>, WebAuthenticationService>();

            services.AddSingleton<IInventoryService, InventoryService>();

            services.AddSingleton<IOrderService, OrderService>();

            services.AddSingleton<IPaymentsService, PaymentService>();

            services.AddSingleton<IShoppingCartsService, ShoppingCartsService>();

            services.AddSingleton<IUserMapper, UserMapperService>();

            services.AddSingleton<IUserProfileService, UserProfileService>();

            services.AddSingleton<IUserService, UserService>();

            services.AddSingleton<IWorkShopService, WorkShopService>();

            services.AddSingleton<IWorkShopRequest, WorkShopRequestService>();

           

            

            GetAllEntities().ForEach(tt =>
            {
                IConfigureDependencyInjection idi = Activator.CreateInstance(tt) as IConfigureDependencyInjection;

                //This will not error by way of being null. BUT if the code within the method does
                // then we would rather have the error loadly on startup then worry about debuging the issues as it runs
                idi.ConfigureServices(services, configuration);
            });
        }

        public static List<Type> GetAllEntities()
        {
            return AppDomain.CurrentDomain.GetAssemblies().SelectMany(x => x.GetTypes())
                 .Where(x => typeof(IConfigureDependencyInjection).IsAssignableFrom(x) && !x.IsInterface && !x.IsAbstract)
                 .ToList();
        }

        public static void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
        }
    }
