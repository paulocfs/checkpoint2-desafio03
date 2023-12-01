class AlunosController < ApplicationController

  before_action :set_page_active

    def index

      #busca todos os alunos 
      @alunos = Csv.getAll()    
    
      # -- busca pelo total de registros individualizdos na coluna do csv --
      @total_de_matriculas = Csv.getTotalColuna('MATRICULA')
      @total_de_disciplinas = Csv.getTotalColuna('COD_DISCIPLINA')
      @total_de_cursos = Csv.getTotalColuna('COD_CURSO')
      @total_de_notas = Csv.getTotalColuna('NOTA')
      @total_de_cargas_horarias = Csv.getTotalColuna('CARGA_HORARIA')
      @total_de_anos_semestres = Csv.getTotalColuna('ANO_SEMESTRE')

      # -- busca pelo somatorios de registros individualizdos na coluna do csv --
      @soma_das_notas = Csv.getSomaColuna('NOTA')
      @soma_das_cargas_horarias = Csv.getSomaColuna('CARGA_HORARIA')

      
    end


    def show

      #matricula do aluno passado pela url
      @matricula  = params[:matricula]
      
      #busca todos os dados de um aluno com base na matricula informada
      @aluno = Csv.getDadosPelaCondicao('MATRICULA', @matricula)

      #busca o total de disciplinas de 1 aluno a partir da matricula do aluno
      @total_disciplinas_por_aluno = Csv.getTotalColunaByCondition('COD_DISCIPLINA', @matricula, 'MATRICULA')

      #busca o total de disciplinas de 1 aluno a partir da matricula do aluno
      @total_cursos_por_aluno = Csv.getTotalColunaByCondition('COD_CURSO', @matricula, 'MATRICULA')

      #busca o total de notas de 1 aluno a partir da matricula do aluno
      @total_notas_por_aluno = Csv.getTotalColunaByCondition('NOTA', @matricula, 'MATRICULA')

      #busca o total de semestres de 1 aluno a partir da matricula do aluno      
      @total_semestres_por_aluno = Csv.getTotalColunaByCondition('ANO_SEMESTRE', @matricula, 'MATRICULA')





      #faz a soma de todas as notas de 1 aluno a partir da matricula do aluno 
      @soma_das_notas_da_matricula = Csv.getSomaColunaPelaCondicao('NOTA', @matricula, 'MATRICULA')
     
      #faz a soma de todas as cargas horarias de 1 aluno a partir da matricula do aluno 
      @soma_das_cargas_horarias_da_matricula = Csv.getSomaColunaPelaCondicao('CARGA_HORARIA', @matricula, 'MATRICULA')

      #faz a soma de todas as pchs de 1 aluno a partir da matricula do aluno 
      @soma_dos_pchs_da_matricula = Csv.get_soma_dos_pchs_da_matricula(@matricula)

      #faz amedia aritmetica das notas de 1 aluno a partir da matricula do aluno 
      @media_aritmetica_notas_da_matricula = Csv.get_media_aritmetica_notas_da_matricula(@matricula)
      
      #@crfinal_da_matricula = Csv.get_crfinal_da_matricula(@matricula)
     

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



    def set_page_active
      @page_active = "alunos"
      return @page_active
    end


end
