class AlunosController < ApplicationController

    def index
           
      @alunos = Aluno.get_alunos()    
      
      @total_matriculas = Matricula.get_total_matriculas()
      @total_disciplinas = Disciplina.get_total_discipinas()
      @total_cursos = Curso.get_total_cursos()
      @total_notas = Nota.get_total_notas()
      @total_semestres= Semestre.get_total_semestres()
    

    end


    def show


      
      @matricula  = params[:matricula]
      
      @total_disciplina_por_aluno = Disciplina.get_total_disciplina_por_matricula(@matricula)
      @total_curso_por_aluno = Curso.get_total_curso_por_matricula(@matricula)
      @total_notas_por_aluno = Nota.get_total_notas_por_matricula(@matricula)
      @total_semestres_por_aluno = Semestre.get_total_semestres_por_matricula(@matricula)

      @soma_das_notas_da_matricula = Nota.get_soma_das_notas_pela_matricula(@matricula)
      @soma_das_cargas_horarias_da_matricula = Nota.get_soma_das_cargas_horarias_pela_matricula(@matricula)
      @soma_dos_pchs_da_matricula = Nota.get_soma_dos_pchs_da_matricula(@matricula)

      @media_aritmetica_notas_da_matricula = Nota.get_media_aritmetica_notas_da_matricula(@matricula)
      
      @crfinal_da_matricula = Nota.get_crfinal_da_matricula(@matricula)


      @aluno = Aluno.getnotas_by_matricula(@matricula)

      @soma_carga_horaria = 0

      @aluno.each do |aluno|
        @soma_carga_horaria+= aluno['CARGA_HORARIA'].to_i
      end

      
     

    end

    



    def index02
       
        path_to_csv = Rails.root.join('app', 'models', 'alunos.csv')

        #@cr = nota * carga_horaria / total_carga_horaria

        @dados_matricula_101 = []
        @dados_matricula = []
        @total_carga_horaria = 0
       
        
        CSV.foreach(path_to_csv, headers: true) do |row|
            
            @dados_matricula_101 << row.to_hash if row['MATRICULA'] == '101'
         
            @dados_matricula_101.each do |dado|
               @ab =  dado['NOTA']
            end
        
          if row['MATRICULA'] == '101'
            @total_carga_horaria += row['CARGA_HORARIA'].to_i
          
          end


        end
       
        

    end


    def search
        
        path_to_csv = Rails.root.join('app', 'models', 'alunos.csv')
        @input_matricula = params[:matricula]
        @dados_matricula_101 = []
        @total_carga_horaria = 0


        @notas = []

        CSV.foreach(path_to_csv, headers: true) do |row|
          @dados_matricula_101 << row.to_hash if row['MATRICULA'] == @input_matricula
        

          #descobre o total da carga horaria
          if row['MATRICULA'] == @input_matricula
            @total_carga_horaria += row['CARGA_HORARIA'].to_i
            @notas =  row['NOTA']

          end



        end

        render :index
    end




end
