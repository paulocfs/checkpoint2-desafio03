Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
   root "home#index"


  get "/alunos" => "alunos#index", as: :alunos
  get "/alunos/:matricula" => "alunos#show", as: :aluno
  post "/alunos/pesquisar" => "alunos#search", as: :alunos_pesquisar


  get "/matriculas" => "matriculas#index", as: :matriculas


  get "/disciplinas" => "disciplinas#index", as: :disciplinas


  get "/cursos" => "cursos#index", as: :cursos
  get "/cursos/:codigo" => "cursos#show", as: :curso
  get "/cursos/:codigo/aluno/:matricula" => "cursos#show_curso_aluno", as: :curso_aluno

end
