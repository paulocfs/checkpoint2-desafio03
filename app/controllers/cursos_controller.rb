class CursosController < ApplicationController

    def index

      @alunos = Aluno.get_alunos()    
      @total_matriculas = Matricula.get_total_matriculas()
      @total_disciplinas = Disciplina.get_total_discipinas()
      @total_cursos = Curso.get_total_cursos()
      @total_notas = Nota.get_total_notas()
      @total_semestres= Semestre.get_total_semestres()

    end

    def show

        #codigo do curso passado pela url
        @codigo  = params[:codigo]

        #busca todos os dados referente ao codigo do curso passado pela url
        @curso = Curso.getcurso_by_codigo(@codigo)


        @total_carga_horaria_do_curso = Curso.get_total_carga_horaria_do_curso(@curso)
  
       
  
    end

    def show_media

        #codigo do curso passado pela url
        @codigo_do_curso  = params[:codigo]

        #matricula do aluno passado pela url
        @matricula  = params[:matricula]

        #busca os dados do aluno pra aquele curso especifico
        @aluno_pelo_codigo_do_curso  = Aluno.get_aluno_pelo_codigo_do_curso(@codigo_do_curso, @matricula)

        #busca o total de disciplinas do aluno considerandoo curso
        @total_de_disciplinas_do_aluno_pelo_codigo_do_curso  = Disciplina.get_total_de_disciplinas_do_aluno_pelo_codigo_do_curso(@matricula, @codigo_do_curso)

        #busca o total de notas do aluno considerandoo curso
        @total_de_notas_do_aluno_pelo_codigo_do_curso  = Nota.get_total_de_notas_do_aluno_pelo_codigo_do_curso(@matricula, @codigo_do_curso)

        #busca o total de cargas horarias do aluno considerandoo curso
        @total_de_cargas_horarias_do_aluno_pelo_codigo_do_curso  = Curso.get_total_de_cargas_horarias_do_aluno_pelo_codigo_do_curso(@matricula, @codigo_do_curso)


        #soma a nota do aluno com base no curso
        @soma_das_notas_do_aluno_pelo_curso = Nota.get_soma_das_notas_pelo_curso(@matricula, @codigo_do_curso)

        #soma a carga horaria do aluno com base no curso
        @soma_das_cargas_horarias_do_aluno_pelo_curso = Nota.get_soma_das_cargas_horarias_do_aluno_pelo_curso(@matricula, @codigo_do_curso)
        
        
       
        




    


    end



end
