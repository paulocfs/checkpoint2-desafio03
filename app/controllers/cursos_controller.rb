class CursosController < ApplicationController

  before_action :set_page_active

  def index
      #busca todos os cursos
      @cursos = Csv.getColuna('COD_CURSO')

      #faz a contagem de todos os cursos
      @total_de_cursos = Csv.getTotalColuna('COD_CURSO')
  end

  def show

      #codigo do curso passado pela url
      @codigo  = params[:codigo]

      #busca todos os dados do curso a partir do codigo do curso passado pela url
      @curso = Csv.getDadosPelaCondicao('COD_CURSO', @codigo)

      #busca o total de matriculas a partir do codigo curso informado
      #@total_de_matriculas_pelo_codigo_do_curso = Aluno.get_total_de_todas_matriculas_pelo_codigo_do_curso(@codigo)
      @total_de_matriculas_pelo_codigo_do_curso = Csv.getTotalColunaByCondition('MATRICULA', @codigo, 'COD_CURSO')

      #busca o total de disciplinas a partir do codigo curso informado
      #@total_de_disciplinas_pelo_codigo_do_curso = Disciplina.get_total_de_todas_disciplinas_pelo_codigo_do_curso(@codigo)
      @total_de_disciplinas_pelo_codigo_do_curso = Csv.getTotalColunaByCondition('COD_DISCIPLINA', @codigo, 'COD_CURSO')
      
      #busca o total de notas a partir do codigo curso informado
      #@total_de_notas_pelo_codigo_do_curso = Nota.get_total_de_todas_notas_pelo_codigo_do_curso(@codigo) 
      @total_de_notas_pelo_codigo_do_curso = Csv.getTotalColunaByCondition('NOTA', @codigo, 'COD_CURSO')
      
      #busca o total de semestres a partir do codigo curso informado
      #@total_de_semestres_pelo_codigo_do_curso = Semestre.get_total_de_todos_semestres_pelo_codigo_do_curso(@codigo)
      @total_de_semestres_pelo_codigo_do_curso = Csv.getTotalColunaByCondition('ANO_SEMESTRE', @codigo, 'COD_CURSO')

      #busca a soma de todas as cargas horarias a partir do codigo curso informado
      #@soma_das_cargas_horarias_pelo_codigo_do_curso = Curso.get_soma_das_cargas_horarias_pelo_codigo_do_curso(@codigo)
      @soma_das_cargas_horarias_pelo_codigo_do_curso = Csv.getSomaColunaPelaCondicao('CARGA_HORARIA', @codigo, 'COD_CURSO' )

      #busca a soma de todas os pchs a partir do codigo curso informado
      @soma_dos_pchs_pelo_codigo_do_curso = Curso.get_soma_dos_pchs_pelo_codigo_do_curso(@codigo)
    

      

  end

  def show_curso_aluno

    #codigo do curso passado pela url
    @codigo_do_curso  = params[:codigo]

    #matricula do aluno passado pela url
    @matricula  = params[:matricula]

    #busca todos os dados de 1 aluno a partir do codigo de curso 
    @aluno_pelo_codigo_do_curso  = Aluno.get_aluno_pelo_codigo_do_curso(@codigo_do_curso, @matricula)

    #busca o total de disciplinas de 1 aluno a partir do codigo de curso 
    @total_de_disciplinas_do_aluno_pelo_codigo_do_curso  = Disciplina.get_total_de_disciplinas_do_aluno_pelo_codigo_do_curso(@matricula, @codigo_do_curso)

    #busca o total de notas de 1 aluno a partir do codigo de curso
    @total_de_notas_do_aluno_pelo_codigo_do_curso  = Nota.get_total_de_notas_do_aluno_pelo_codigo_do_curso(@matricula, @codigo_do_curso)

    #busca o total de cargas horarias de 1 aluno a partir do codigo de curso
    @total_de_cargas_horarias_do_aluno_pelo_codigo_do_curso  = Curso.get_total_de_cargas_horarias_do_aluno_pelo_codigo_do_curso(@matricula, @codigo_do_curso)

    #soma as notas de 1 aluno a partir do codigo de curso
    @soma_das_notas_do_aluno_pelo_curso = Nota.get_soma_das_notas_do_aluno_pelo_curso(@matricula, @codigo_do_curso)

    #soma as cargas horarias de 1 aluno a partir do codigo de curso
    @soma_das_cargas_horarias_do_aluno_pelo_curso = Curso.get_soma_das_cargas_horarias_do_aluno_pelo_curso(@matricula, @codigo_do_curso)

     #soma das pchs de 1 aluno a partir do codigo de curso
     @soma_das_pchs_do_aluno_pelo_curso = Curso.get_soma_das_pchs_do_aluno_pelo_curso(@matricula, @codigo_do_curso)
    
  end


  def set_page_active
      @page_active = "cursos"
      return @page_active
  end


end
