defmodule FinancialappWeb.Router do
  use FinancialappWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {FinancialappWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug FinancialappWeb.Auth.Pipeline
  end

  scope "/", FinancialappWeb do
    pipe_through :browser

    get "/", PageController, :home
  end
  ## 🔓 Rotas públicas (não precisam de autenticação)
  scope "/api", FinancialappWeb do
    pipe_through :api

    post "/login", SessionController, :login
    post "/users", UserController, :create

    # (Se quiser, pode adicionar GET users para listar usuários públicos, mas geralmente é privado)
  end

    ## 🔒 Rotas protegidas (precisam de token JWT válido)
  scope "/api", FinancialappWeb do
    pipe_through [:api, :auth]

        # Usuário
    get "/users/:id", UserController, :show
    put "/users/:id", UserController, :update
    delete "/users/:id", UserController, :delete
    get "/users", UserController, :index

        # Transações (receitas e despesas)
    resources "/transactions", TransactionController, except: [:new, :edit]

        # Categorias (tags)
    resources "/tags", TagController, except: [:new, :edit]
  end


  # Other scopes may use custom stacks.
  # scope "/api", FinancialappWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:financialapp, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: FinancialappWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
